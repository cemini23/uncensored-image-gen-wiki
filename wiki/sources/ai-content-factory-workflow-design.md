---
title: AI Content Factory Workflow Design (Windows Multi-GPU)
type: source
tags: [source, document, docx, content-factory, windows, multi-gpu, inference-pipeline, vr-optimization, tensorrt, persona-consistency, rag, metadata-scrubbing]
keywords: [content factory, Windows, multi-GPU, VRAM isolation, TensorRT, IP-Adapter, PuLID, ControlNet, RAG, ExifTool, watermarking]
related:
  - entities/hardware/gpu-guide.md
  - entities/uis/comfyui.md
  - entities/adapters/ip-adapter.md
  - entities/adapters/pulid.md
  - concepts/persona-consistency-methods.md
  - concepts/persona-ops-workflow.md
  - concepts/geo-vs-seo.md
maturity: draft
created: 2026-05-08
updated: 2026-05-08
read_status: deep-read
provenance:
  file: "AI Content Factory Workflow Design.docx"
  author: Unknown (research report)
  retrieved: 2026-05-08
  location: research to be indexed/AI Content Factory Workflow Design.docx
  size: "3,046,843 bytes"
  type: docx
  topics: "Windows multi-GPU inference factory, VRAM optimization, character consistency, RAG memory, post-processing"
  sources_cited: 86
---

## Relations

@entities/hardware/gpu-guide.md @entities/uis/comfyui.md @entities/adapters/ip-adapter.md @entities/adapters/pulid.md @concepts/persona-consistency-methods.md @concepts/persona-ops-workflow.md @concepts/geo-vs-seo.md

## Raw Concept

Comprehensive architectural report on building a high-yield, Windows-based AI content factory using multi-GPU NVIDIA hardware. Covers OS-level VRAM reclamation, deterministic character consistency via tri-layered injection (IP-Adapter + PuLID/FaceID + ControlNet), dual-layer RAG agentic memory, and automated post-processing pipeline for metadata scrubbing and watermarking. 86 sources cited.

## Narrative

### Hardware & VRAM Optimization

**Windows 11 Memory Overhead**: The OS silently runs AI workloads via `WorkloadsSessionHost.exe` (tied to Recall and semantic search indexing), consuming 2+ GB RAM. Standard Task Manager cannot kill these — they respawn via SystemEventsBroker. Fix: registry-based Image File Execution Options hijack (`HKLM:\...\Image File Execution Options\WorkloadsSessionHost.exe` → `Debugger = systray.exe`) plus Group Policy keys at `HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI` (DisableAIDataAnalysis=1, TurnOffSavingSnapshots=1, AllowRecallEnablement=0). A scheduled task + 10-minute watchdog daemon re-applies blocks after reboots. Recovers ~2.4 GB idle RAM.

**CUDA System Memory Fallback**: Starting with drivers 531–536, Nvidia introduced automatic offload to CPU RAM when VRAM is exhausted. This causes 250%+ latency spikes — catastrophic for synchronized pipelines. Fix: In Nvidia Control Panel, set "CUDA - Sysmem Fallback Policy" to "Prefer No Sysmem Fallback" for the Python executable. This forces strict OOM failures, enabling error-handling scripts to retry or reroute.

**Multi-GPU Isolation**: Default PyTorch enumerates all CUDA devices, causing race conditions. Solution: `CUDA_VISIBLE_DEVICES=0` for ComfyUI (diffusion models, VAE, CLIP), `CUDA_VISIBLE_DEVICES=1` for LLM server (Ollama/TensorRT-LLM). Use `nvidia-smi -L` UUIDs for fault-tolerant device identification. ComfyUI-MultiGPU custom node enables inter-device routing (UNet on one GPU, CLIP+VAE on another).

**TensorRT Acceleration**: Compile models into TensorRT engines (3–10 min for standard diffusion, up to 1 hour for SVD with 24+ GB VRAM). Static engines: max throughput for fixed resolution. Dynamic engines: flexible dimensions at higher memory cost. NVFP4 and FP8 quantization deliver 60% and 40% memory reduction respectively on RTX 5090 (Ada Lovelace/Blackwell Tensor Cores).

### Deterministic Consistency Framework

**Why prompt engineering fails**: Diffusion models operate on vast latent spaces with concept entanglement. Adding multiple character descriptors causes "concept bleeding." LoRAs offer high fidelity but require curated datasets (dozens of images, multiple angles), and struggle with multiple distinct identities on the same canvas.

**Tri-Layered Injection Architecture** (zero-shot, no training required):
1. **IP-Adapter** (Image Prompt Adapter) — Global style/body composition via CLIP Vision encoder → cross-attention injection
2. **PuLID / FaceID** — Biometric identity enforcement via InsightFace facial embeddings (bypasses CLIP limitations for micro-facial features)
3. **ControlNet** — Anatomical/spatial guidance via OpenPose or depth estimation (prevents anatomical collapse)

**ComfyUI Execution**: Base textual prompt defines environment only (e.g., "brightly lit modern kitchen"). Reference image split into three parallel branches: OpenPose → ControlNet (spatial), CLIPVision → IP-Adapter (aesthetic), face crop → PuLID (biometric). Combined conditioning merged into K-Sampler. ACE++ Portrait LoRA and Unsampling provide further refinement.

**Control Step Optimization**:
- Low (0.3–0.4): IP-Adapter applied early in denoising → solidifies facial structure, text prompt dominates later
- High (0.6–0.8): Applied later → weaker identity lock, stronger artistic control

**Scheduler Selection**: Standard samplers (DPM++ 2M Karras) suboptimal for FaceID embeddings. DDIMScheduler or EulerDiscreteScheduler recommended for superior biometric latent representation fidelity.

### Agentic Memory (Dual-Layer RAG)

**Hot Path**: In-RAM (LangChain RunnableWithMessageHistory) for short-term conversation continuity. Aggressively truncated between sessions.

**Cold Path**: Long-term episodic/semantic memory. Facts extracted and chunked after each session, embedded (Gemini Embedding 2 / Cohere / OpenAI / local sentence-transformers like bge-small), stored in vector DB (ChromaDB, FAISS for prototyping; pgvector, Pinecone, Qdrant, Weaviate for production).

**4-Step Pipeline**: Fact extraction → Vector embedding → DB storage → Semantic retrieval (cosine similarity). **Reranking** via Cohere Rerank or Jina Reranker reduces noise. **Temporal governance** via Zep's Graphiti (timestamped validity windows, bi-temporal supersession) or Mem0 (memory compression for 80% prompt token reduction).

**Schema-Governed Memory**: PostgreSQL stores core persona traits as structured JSON (`persona_id`, `personality_matrix`, `communication_directives`, `core_immutable_memories`). Combined with vector facts in OpenRouter system prompt to prevent narrative drift.

### Post-Processing Pipeline

**Metadata Scrubbing**: ExifTool (not Pillow — Pillow recompresses and destroys quality). PowerShell batch script:
```powershell
Get-ChildItem "C:\ContentFactory\Output" -Filter *.png | ForEach-Object {
    Start-Process -NoNewWindow -FilePath "C:\Tools\exiftool.exe" -ArgumentList "-all=", "-overwrite_original", $_.FullName
}
```
Removes EXIF, PNG text chunks, XMP tags, C2PA manifests. Security note: sanitize filenames to prevent ExifTool Perl code injection via hyphen-prefixed filenames.

**Visible Watermarking**: Python/Pillow alpha compositing. Watermark PNG with alpha channel → `putalpha()` for opacity → `paste()` with watermark as mask → save as RGB JPEG at quality 95.

**Advanced**: Diffusion regeneration (re-encode to latent noise space + calibrated Gaussian noise + reverse diffusion at ~50 steps) destroys latent watermarks (SynthID, StableSignature, TreeRing) before EXIF stripping.