---
title: ComfyUI (Inference UI)
type: entity
tags: [ui, inference-frontend, comfyui, node-graph, open-source, extensible, stable-diffusion, flux, hunyuan, video]
keywords: [ComfyUI, node graph, inference UI, SDXL, FLUX, Hunyuan, custom nodes, extensible, open-source, workflow, Draw Things, MLX, Apple Silicon]
related:
  - entities/models/flux-1-dev.md
  - concepts/two-pass-generation-workflow.md
  - entities/models/flux-2-klein.md
  - entities/models/pony-v6.md
  - entities/models/flux.md
  - entities/adapters/pulid.md
  - entities/adapters/ip-adapter.md
  - entities/adapters/flux-kontext.md
  - entities/adapters/flux-redux.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/onetrainer.md
  - entities/training-tools/fluxgym.md
  - entities/hardware/mac-studio.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/persona-consistency-methods.md
  - concepts/multi-angle-dataset-prep.md
  - concepts/video-identity-inheritance.md
  - concepts/seam-stitching-strategies.md
  - concepts/de-censoring-techniques.md
  - concepts/persona-ops-stack.md
  - concepts/persona-ops-workflow.md
  - entities/persona-ops/sillytavern.md
  - entities/persona-ops/n8n.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/cogvideox-1-5.md
  - entities/models/anima.md
  - entities/models/z-image-turbo.md
  - entities/models/playground-v3.md
  - entities/models/sd3-deprecated.md
  - entities/models/qwen-image-2512.md
  - entities/models/kwai-kolors.md
  - entities/models/ernie-image.md
  - entities/models/pixart-sigma.md
  - entities/uis/fooocus.md
  - entities/models/ltx-2.md
  - entities/models/mochi-1.md
  - entities/models/seedance-2.md
  - entities/persona-ops/postiz.md
  - sources/ai-creator-operations-blueprint.md
  - sources/ai-content-factory-workflow-design.md
  - sources/ai-persona-launch-strategy-analysis.md
  - sources/uncensored-image-generation-survey.md
  - sources/mac-studio-ai-content-factory-design.md
  - sources/synthetic-character-consistency-survey.md
  - sources/video-generation-survey-2026.md
  - concepts/model-selection-workflow.md
  - entities/uis/automatic1111.md
  - entities/uis/forge.md
  - entities/uis/invokeai.md
  - entities/uis/swarmui.md
  - entities/open-generative-ai.md
  - runbooks/zimage-setup-runbook.md
  - runbooks/runpod-comfyui-setup.md
  - concepts/persona-audio-stack.md
  - entities/custom-nodes/impact-pack.md
  - entities/custom-nodes/bmab.md
  - entities/custom-nodes/ai-infra-guard.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/musetalk.md
  - entities/lipsync/wav2lip.md
maturity: validated
created: 2026-05-08
updated: 2026-05-15
read_status: deep-read
provenance:
  stub: false
---

## Relations

@sources/ai-creator-operations-blueprint.md
@sources/ai-persona-launch-strategy-analysis.md
@sources/ai-content-factory-workflow-design.md
@sources/mac-studio-ai-content-factory-design.md
@sources/virtual-persona-narrative-development-strategy.md
@sources/uncensored-image-generation-survey.md
@entities/models/flux-1-dev.md
@entities/models/z-image-turbo.md
@runbooks/zimage-setup-runbook.md
@runbooks/runpod-comfyui-setup.md
@concepts/persona-ops-workflow.md
@concepts/video-identity-inheritance.md
@concepts/model-selection-workflow.md
@concepts/two-pass-generation-workflow.md
@entities/models/pony-v6.md
@entities/uis/automatic1111.md
@entities/uis/forge.md
@entities/uis/invokeai.md
@entities/uis/swarmui.md
@entities/open-generative-ai.md — alternative all-in-one generative-media frontend (sd.cpp / Wan2GP backends)
@entities/custom-nodes/impact-pack.md @entities/custom-nodes/bmab.md
@entities/custom-nodes/ai-infra-guard.md — ComfyUI vulnerability-detection signatures (defensive ops)

@concepts/persona-audio-stack.md
@entities/lipsync/latentsync.md @entities/lipsync/musetalk.md @entities/lipsync/wav2lip.md

## Raw Concept

ComfyUI — open-source, node-graph-based inference frontend for Stable Diffusion, FLUX, Hunyuan, Wan, CogVideoX, and other diffusion architectures. Back-filled from legacy notes/frameworks-tools.md + survey coverage in @sources/uncensored-image-generation-survey.md, @sources/synthetic-character-consistency-survey.md, and @sources/video-generation-survey-2026.md.

## Narrative

### What it is

**ComfyUI** is a node-based graphical inference interface for diffusion models. Unlike frontend UIs like Automatic1111 (tab-based form inputs) or Forge (fork of A1111 with performance patches), ComfyUI represents every step of the generation pipeline as a **directed acyclic graph (DAG)** of nodes — model loading, conditioning, sampling, decoding, post-processing — connected by edges that carry tensors, latent tensors, conditions, or masks.

This architecture provides three properties that make it the modal UI for the uncensored local generation stack:

1. **Arbitrary routing** — outputs of any node can feed into any compatible input, enabling multi-pass workflows (e.g., generate → detect face → swap face → upscale → encode video)
2. **Model-agnostic** — every architecture following the Diffusers convention loads through the same interface: SD1.5, SDXL, FLUX, Hunyuan, Wan, CogVideoX, Mochi
3. **Workflow reproducibility** — a complete workflow is a single `.json` file. Share, version, and diff it.

### Installation and first run

```bash
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt

# For Apple Silicon (MPS) — use CPU PyTorch, MPS works automatically:
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Launch
python main.py --cpu --listen 127.0.0.1
```

### Windows Multi-GPU & TensorRT (NVIDIA Factory Setup)

For Windows multi-GPU environments (dedicated inference factory):

- **VRAM Isolation**: Use `CUDA_VISIBLE_DEVICES=0` for ComfyUI (diffusion + VAE + CLIP), separate `CUDA_VISIBLE_DEVICES=1` for LLM server (Ollama/TensorRT-LLM). Use `nvidia-smi -L` UUIDs for fault-tolerant device IDs.
- **Disable CUDA Sysmem Fallback**: Set "Prefer No Sysmem Fallback" in Nvidia Control Panel for the Python executable to force OOM instead of silent slowdown.
- **ComfyUI-MultiGPU**: Custom node for inter-device routing — offload entire UNet to one GPU while dedicating a secondary to CLIP/VAE processing.
- **TensorRT Acceleration**: Install [ComfyUI_TensorRT](https://github.com/comfyanonymous/ComfyUI_TensorRT) for compiled engine inference. Static engines for max throughput at fixed resolution; dynamic engines for flexible dimensions. NVFP4/FP8 quantization provides 40–60% memory reduction on RTX 5090.

[CONFIRMED] Source: @sources/ai-content-factory-workflow-design.md §3–§4

### Tri-Layered Character Consistency Pipeline

The deterministic consistency framework uses three parallel injection branches from a single reference image:

1. **Spatial Branch**: Image → OpenPose node → Apply ControlNet (pose/skeleton enforcement)
2. **Aesthetic Branch**: Cropped character → Prep Image to ClipVision → IPAdapter Apply (body type, clothing, style)
3. **Biometric Branch**: Tight face crop → PuLID model (facial identity lock)

All three conditioning streams merge into the K-Sampler, completely divorcing character identity from text prompt limitations. ACE++ Portrait LoRA and Unsampling workflows provide further refinement.

[CONFIRMED] Source: @sources/ai-content-factory-workflow-design.md §5–§6

### Apple Silicon (MPS) performance note

Per the [Launch Strategy Analysis](sources/ai-persona-launch-strategy-analysis.md), ComfyUI on Apple Silicon is functional but **Draw Things is ~20% faster** via native Metal backend / MLX / CoreML acceleration. On MPS:

- FP8 inference is **not supported** — use BF16 or GGUF Q5 quantizations
- Set `PYTORCH_ENABLE_MPS_FALLBACK=1` for LayerNorm compatibility
- Video models (Wan, Hunyuan) are heavily CUDA-optimized; expect reduced performance on MPS
- **Recommended hybrid**: Draw Things for speed, ComfyUI for advanced conditioning (IP-Adapter, ControlNet, AnimateDiff)

### Essential custom nodes for uncensored workflows

| Node Pack | Purpose | Install command |
|-----------|---------|-----------------|
| **ComfyUI-GGUF** | Load GGUF quantized models (Z-Image Turbo) | `git clone https://github.com/city96/ComfyUI-GGUF.git` |
| **ComfyUI-Impact-Pack** | Face/hand detection, detailer nodes, regional KSampler | `git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git` |
| **ComfyUI-IPAdapter-Plus** | IP-Adapter image-prompt conditioning (SDXL, FLUX) | `git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git` |
| **ComfyUI-BMAB** | Grounding DINO-based post-processing for hand/limb repair | `git clone https://github.com/port090401/comfyui_bmab.git` |
| **ComfyUI-PuLID-Flux2** | PuLID identity adapter for FLUX | `git clone https://github.com/iFayens/ComfyUI-PuLID-Flux2.git` |
| **ComfyUI-Inspire-Pack** | Prompt/control routing + batch processing | `git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git` |
| **ComfyUI-VideoHelperSuite** | Video encode/decode, frame extraction, latent chaining | `git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git` |

Install all by cloning into the `custom_nodes/` directory, then restart ComfyUI. Verify via **Manager → Missing Custom Nodes**.

### Model compatibility matrix

| Model | ComfyUI native support | Custom nodes needed | Notes |
|-------|----------------------|--------------------|----|
| SD 1.5 | ✅ Built-in | None | Legacy; still used for some LoRA targets |
| SDXL | ✅ Built-in | None | Works with Pony V6, Illustrious XL, NoobAI-XL |
| Z-Image Turbo | Via GGUF node | ComfyUI-GGUF | Sub-second, 12–16 GB VRAM with quant |
| FLUX.1 Dev/Schnell | ✅ Built-in | PuLID, Redux, Kontext nodes | Primary persona host |
| FLUX.2 Dev/Klein | ✅ Built-in | PuLID-Flux2 for identity | Sub-second inference on consumer GPUs |
| HunyuanVideo 1.5 | Via custom nodes | HunyuanVideo LoRA Block Edit | 8–12 GB VRAM for 480p |
| Wan 2.2 | Via custom nodes | Wan SVI 2 Pro FLF nodes | 24+ GB VRAM recommended for 720p |
| CogVideoX 1.5/2.0 | Via custom nodes | torchao INT8 for 8 GB | Cheapest local video entry |
| Anima | Community nodes | Check ComfyUI Manager | DiT with Qwen3 encoder |

### Key workflow patterns

**Single-image generation**: Load Model → CLIP Encode → KSampler → VAEDecode → Save Image

**Dual-pass de-censoring pipeline** (per @concepts/reference-plus-lora-stacking.md):
```
[Base Model] → KSampler (strength 0.45, identity LoRA) → [Result A]
[Reference Image] → IPAdapter/PUFLID → [Identity Signal]
[Result A] + [Identity Signal] → Second KSampler (strength 0.85, NSFW LoRA) → VAEDecode
```

**Multi-pass NSFW face-swap pipeline** (per @entities/adapters/flux2-klein-9b-faceswap.md):
```
[FLUX.1 Dev + NSFW LoRA] → KSampler → [Base Image]
[Base Image] → Face Detection (Impact-Pack) → [Face Crop]
[Face Crop] + [Klein 9B] → Face Swap Node → [Face-Swapped Image]
[Face-Swapped Image] → Detailer (Impact-Pack) → [Final Output]
```

### API / Automation

ComfyUI exposes a full REST API at `http://127.0.0.1:8188` — usable for automation via n8n or scripts. See @entities/persona-ops/n8n.md and @concepts/persona-ops-workflow.md.

### Workspace TODO

- Document common workflow JSON files for the modal persona stack (FLUX.1 Dev + PuLID + Klein face-swap pipeline)
- Track ComfyUI update cadence and breaking-change history — critical for production workflows
- Verify FLUX.2 video node support maturity as of mid-2026

## Snippets

### Installation quick-start
```bash
git clone https://github.com/comfyanonymous/ComfyUI.git && cd ComfyUI
pip install -r requirements.txt
# Apple Silicon:
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
python main.py --cpu --listen 127.0.0.1
```

### Dual-pass de-censoring pipeline (conceptual)
```
[Load Model: FLUX.1 Dev] → [CLIP Text Encode] → [KSampler: steps=20, cfg=7, denoise=0.45, NSFW LoRA] → [VAEDecode] → [Preview]
                                                                                     ↓
[Load Image: Reference] → [IPAdapter/PuLID] → [Conditioning Combine] → [KSampler: steps=20, cfg=7, denoise=0.85, face-swap LoRA] → [VAEDecode] → [Save Image]
```