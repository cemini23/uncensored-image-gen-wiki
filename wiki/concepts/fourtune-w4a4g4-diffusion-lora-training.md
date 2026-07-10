---
title: "FourTune W4A4G4 diffusion LoRA training"
type: concept
tags: [lora-training, quantization, flux, efficiency, post-training]
keywords: [FourTune, W4A4G4, NVFP4, LoRA, QLoRA, SVDQuant stabilizer, persona LoRA, FLUX training]
related:
  - sources/arxiv-2607-05711-fourtune-4bit-diffusion-post-training.md
  - concepts/lora-taxonomy.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/qwen-image-2512.md
  - entities/training-tools/ai-toolkit.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/hardware/gpu-guide.md
  - entities/uis/comfyui.md
  - sweeps/2026-07-10-daily.md
maturity: draft
created: 2026-07-10
updated: 2026-07-10
---

## Relations

@sources/arxiv-2607-05711-fourtune-4bit-diffusion-post-training.md @concepts/lora-taxonomy.md @entities/models/flux-1-dev.md @entities/models/flux-2-klein.md @entities/training-tools/ai-toolkit.md @entities/training-tools/kohya-sd-scripts.md @entities/hardware/gpu-guide.md

## Raw Concept

Synthesized from @sources/arxiv-2607-05711-fourtune-4bit-diffusion-post-training.md — MIT HAN Lab W4A4G4 LoRA post-training for large diffusion models.

## Narrative

### Problem

Persona LoRA training on **12B+ DiT bases** (FLUX.1 Dev, Qwen-Image) still bottlenecks on VRAM and step time even with standard LoRA. **QLoRA** cuts weight memory but keeps A16G16 compute and dequant overhead.

### FourTune approach

Native **4-bit forward + backward** on the frozen backbone, with:

1. **SVD-based stabilizer** — isolates outlier directions (same family as SVDQuant / Nunchaku)
2. **Block-wise quantization** — efficient transposed GEMM in backward pass
3. **Fused kernels** — LoRA + MLP bandwidth optimization

### Operator posture

| Verdict | Action |
|---------|--------|
| **WATCH** | Track MIT HAN Lab / nunchaku org for FourTune training release |
| **Now** | Keep BF16/FP8 LoRA via ai-toolkit or Kohya on RunPod for production persona trains |
| **When code lands** | Smoke-test identity LoRA on FLUX.2 Klein 9B if supported; compare wall-clock + identity metrics vs BF16 |

Phase-0: **WATCH** — no installable trainer at ingest.

## Snippets

> "Achieving memory usage comparable to QLoRA while surpassing the training speed of full-precision LoRA fine-tuning."

## Dead Ends

- Replacing Nunchaku inference with FourTune — different lifecycle stage (train vs deploy).
