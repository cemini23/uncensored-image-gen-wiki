---
title: "FourTune — W4A4G4 diffusion LoRA post-training (arXiv:2607.05711)"
type: source
tags: [paper, lora-training, quantization, flux, qwen-image, efficiency]
keywords: [FourTune, W4A4G4, NVFP4, LoRA, QLoRA, SVDQuant, numerical stabilizer, FLUX.1-dev, Qwen-Image, ICML 2026]
related:
  - concepts/fourtune-w4a4g4-diffusion-lora-training.md
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
read_status: read
created: 2026-07-10
updated: 2026-07-10
---

## Relations

@concepts/fourtune-w4a4g4-diffusion-lora-training.md @concepts/lora-taxonomy.md @entities/models/flux-1-dev.md @entities/models/flux-2-klein.md @entities/models/qwen-image-2512.md @entities/training-tools/ai-toolkit.md @entities/training-tools/kohya-sd-scripts.md @entities/hardware/gpu-guide.md

## Raw Concept

- **Title**: FourTune: Towards Fully 4-Bit Efficient Post-Training for Diffusion Models
- **Authors**: Bowen Xue, Zihan Min, Xingyang Li, Zhekai Zhang, Haocheng Xi, Lvmin Zhang, Maneesh Agrawala, Jun-Yan Zhu, Song Han, Yujun Lin, Muyang Li (MIT HAN Lab et al.)
- **Type**: arXiv:2607.05711 · ICML 2026 poster
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.05711-fourtune-towards-fully-4-bit-efficient-post-trai.pdf`
- **URL**: https://arxiv.org/abs/2607.05711
- **Retrieved**: 2026-07-10
- **Read status**: read (abstract, method, FLUX/Qwen-Image customization tables)

## Narrative

**FourTune** is a post-training framework for diffusion models that quantizes **weights, activations, and gradients** to 4-bit (**W4A4G4**) end-to-end — beyond QLoRA's W4A16G16 pattern.

Architecture:

| Branch | Role |
|--------|------|
| Frozen 4-bit backbone | NVFP4 GEMM on SVD-decomposed residual weights |
| Frozen numerical stabilizer | Low-rank full-precision outlier branch from SVDQuant decomposition |
| Trainable LoRA | Standard adapter path; only branch receiving weight updates |

Reported on **FLUX.1-dev (12B)** @ 1024²: **2.25×** lower memory vs BF16 LoRA, **2.27×** higher throughput; quality matches BF16 on customization (identity/style/subject), RL, and distillation tasks. Also evaluated on **Qwen-Image**.

Builds on **SVDQuant** stabilizer logic already used in the **Nunchaku** inference stack (@entities/models/flux-1-dev.md).

### Workspace relevance

Highest-signal **persona LoRA training efficiency** paper in this sweep. If/when code ships, David could train FLUX-class character LoRAs on a **16 GB** laptop faster than BF16 Kohya/ai-toolkit paths.

Phase-0: **WATCH** — no public FourTune training repo at ingest (ICML 2026 poster; MIT HAN Lab / nunchaku ecosystem is the likely release channel).

## Snippets

> "FourTune is the first fully 4-bit post-training framework for weight, activation, and gradient for large generative models."

> "On FLUX.1-dev (12B), FourTune reduces memory overhead by 2.25× and increases end-to-end training throughput by 2.27× compared to BF16 LoRA."

## Dead Ends

- **Assuming FourTune inference** — this is a **training** framework; inference remains Nunchaku/SVDQuant territory until unified tooling lands.
- **Pony/SDXL path** — paper focuses on FLUX.1-dev and Qwen-Image; SDXL persona bases unvalidated.
