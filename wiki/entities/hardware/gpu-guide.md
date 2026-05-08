---
title: Hardware Guide (GPU & Optimization)
type: entity
tags: [hardware, gpu, vram, quantization, apple-silicon, nvidia, inference, optimization]
keywords: [hardware, GPU, VRAM, quantization, FP8, GGUF, Nunchaku, Apple Silicon, MPS, RTX, consumer, cloud fallback]
related:
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/pony-v6.md
  - entities/models/noobai-xl.md
  - entities/models/illustrious-xl.md
  - entities/models/anima.md
  - entities/models/qwen-image-2512.md
  - entities/models/flux.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/ai-toolkit.md
  - entities/training-tools/onetrainer.md
  - entities/training-tools/fluxgym.md
  - concepts/de-censoring-techniques.md
  - concepts/lora-taxonomy.md
  - concepts/reference-plus-lora-stacking.md
  - sources/uncensored-image-generation-survey.md
  - sources/synthetic-character-consistency-survey.md
maturity: validated
created: 2026-05-08
updated: 2026-05-08
---

## Relations

@sources/uncensored-image-generation-survey.md
@sources/synthetic-character-consistency-survey.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/models/pony-v6.md
@entities/models/noobai-xl.md
@entities/models/illustrious-xl.md
@entities/models/anima.md
@entities/models/qwen-image-2512.md
@entities/models/flux.md
@entities/training-tools/kohya-sd-scripts.md
@entities/training-tools/ai-toolkit.md
@entities/training-tools/onetrainer.md
@entities/training-tools/fluxgym.md
@concepts/de-censoring-techniques.md
@concepts/lora-taxonomy.md
@concepts/reference-plus-lora-stacking.md

## Raw Concept

Hardware selection and optimization guide for local uncensored image generation in May 2026. Covers GPU VRAM tiers, quantization formats, Apple Silicon viability, and cloud fallbacks. Consolidated from legacy notes/hardware-optimization.md + survey data in @sources/uncensored-image-generation-survey.md. This is a reference page — for training-specific guidance, see individual model entity pages.

## Narrative

### The three VRAM tiers

Hardware choice determines which models you can run and at what quality. The 2026 landscape splits cleanly into three tiers:

#### Tier 1: 8 GB VRAM (entry floor)

**Hardware**: RTX 3060 12GB (rare), RTX 4060 8GB, M1/M2 MacBook Pro with 16GB+ unified memory

**What runs natively (no quantization):**
- Pony V6 (SDXL, 2.6B params) in FP16 — full quality, full explicit content out of the box
- FLUX.2 Klein 4B in FP16 — sub-second, but quality and NSFW LoRA capacity are constrained
- Z-Image Turbo quantized to INT4/GGUF Q4 via Nunchaku — functional but visible degradation

**What cannot run:** FLUX.1 Dev (needs ~12 GB FP16, ~8 GB GGUF Q4 with quality loss), FLUX.2 Dev/Pro, Wan 2.2 video, HunyuanVideo

**Bottom line:** You can do SDXL-based persona work (Pony V6, Illustrious XL, NoobAI-XL) and lightweight FLUX.2 inference. This is the "starter" tier for NSFW stylized content. Not viable for video generation.

#### Tier 2: 12–16 GB VRAM (sweet spot)

**Hardware**: RTX 4060 Ti 16GB, RTX 4070 Ti, RTX 5060 Ti, M3/M4 MacBook Pro with 36-48GB unified memory

**What runs natively:**
- FLUX.2 Klein 9B in FP8 — sub-second inference, good quality
- FLUX.2 Klein 4B in FP16 — best 4B quality
- FLUX.1 Dev in FP8 or GGUF Q8 — near-reference quality
- Pony V6 / Illustrious XL / NoobAI-XL in any precision
- Z-Image Turbo in FP8 — sub-second photorealism
- CogVideoX 1.5 with INT8 quantization (torchao) — cheapest local video entry at ~7 GB

**LoRA training capacity:** 8-bit QLoRA on FLUX-class models; full LoRA on SDXL models. Not large-LoRA-friendly for FLUX.1 Dev.

**Bottom line:** The recommended hardware purchase for a serious creator. Runs the full FLUX.2 Klein pipeline, SDXL stack, and starter video work. The 12-16 GB range is where most persona operators live in 2026.

#### Tier 3: 24 GB VRAM (frontier)

**Hardware**: RTX 3090, RTX 4090, RTX 5090, M4/M5 Mac Studio with 64GB+ unified memory

**What runs natively:**
- FLUX.2 Dev (32B) in FP8 or GGUF Q4 — full frontier quality
- FLUX.1 Dev in FP16 — reference quality
- Full multi-ControlNet stacks (4+ simultaneous ControlNets)
- HunyuanVideo 1.5 at 480p/720p — the practical floor for production video
- Wan 2.2 video generation — 720p achievable at 24+ GB
- Any model with heavy post-processing (BMAB, Impact-Pack detailers)

**LoRA training capacity:** Full FP16 LoRA on FLUX-class models; comfortable multi-model parallel training.

**Bottom line:** Required for video generation and any workflow that combines multiple ControlNets or post-processing nodes. The RTX 4090 is the canonical "build this" GPU.

### Quantization formats

Quantization squeezes model weights into smaller representations. Each format trades quality for VRAM:

| Format | Precision | VRAM savings | Quality impact | Best for |
|--------|-----------|-------------|---------------|----------|
| **FP16 / BF16** | 16-bit | None (reference) | None | Tier 2-3 reference output |
| **FP8** | 8-bit | ~50% | Negligible | Tier 2 sweet spot; recommended default |
| **GGUF Q8_0** | 8-bit | ~20% vs FP16 | Negligible | CPU offloading, portability |
| **GGUF Q6_K** | 6-bit | ~35% | Minimal | Tier 1, acceptable quality |
| **GGUF Q4_K_S** | 4-bit | ~50% | Noticeable degradation | Tier 1 absolute floor |
| **Nunchaku/SVDQ INT4** | 4-bit | ~70% | Minimal (NVIDIA only) | **Best for Tier 2 on NVIDIA** |
| **Nunchaku NVFP4** | FP4 | ~85% | Moderate degradation | RTX 50xx Blackwell only |

**Nunchaku/SVDQ is the breakthrough of 2026.** Developed by MIT HAN Lab, it provides memory savings comparable to GGUF Q4 but runs ~2× faster than FP8 on RTX 30xx/40xx cards. For FLUX.1 Dev specifically: ~3.5 iterations/second on an RTX 4060 16GB at 1024×1024 (vs ~1.3 it/s for FP8 + TeaCache).

**Apple Silicon (MPS) caveat:** FP8 is **not supported** on MPS. Use BF16 (slower, higher VRAM) or GGUF Q5/Q4 quantization. Nunchaku is NVIDIA-only. This is a structural limitation — see below.

### Apple Silicon (M-Series) viability

**Pros:**
- Unified Memory architecture means an M5 Max MacBook with 64GB can load a 32B model entirely in fast memory — no VRAM bottleneck
- Draw Things provides native CoreML acceleration: ~3.5-5 seconds/iteration on M5 Pro — competitive with discrete GPUs, with much lower power draw (~30W vs ~250W+)
- Silent, cool, portable

**Cons:**
- **FP8 unsupported** — must use BF16 (2× memory) or quantized formats
- **Video models are CUDA-native** — Wan 2.2, HunyuanVideo, CogVideoX remain largely unusable on MPS
- **Custom node support lags** — some ComfyUI nodes assume CUDA operations; occasional breakage
- **Training is impractical** — Kohya/musubi can technically run, but iteration times are 10-30× slower than an RTX 4090
- **Nunchaku/SVDQ is NVIDIA-only**

**Recommended pattern:** Use Mac for image generation via Draw Things (portable, quiet) and a cloud GPU rental (RunPod, Vast.ai) for video generation and LoRA training.

### Cloud GPU fallbacks

When local hardware can't sustain a workload:

| Service | Typical pricing | Notes |
|---------|----------------|-------|
| **RunPod** | ~$0.20-0.50/hr for RTX 4090 | Pre-built ComfyUI Docker containers; persistent storage |
| **Vast.ai** | ~$0.10-0.30/hr for RTX 4090 | Community marketplace; variable availability |
| **Modal / Replicate** | Pay-per-second | AI-toolkit built-in bridge; good for FLUX.2 training |

**Recommended pattern:** Dataset prep and LoRA evaluation on local hardware → full training on cloud H100/A100 rental → final model served locally. See @entities/training-tools/ai-toolkit.md for the Modal/Replicate bridge pattern.

### Hardware selection decision tree

```
Starting out / budget < $500?
  └─→ 8 GB tier (RTX 4060 8GB): Pony V6 + SDXL stack. No video.
  
Want the best cost/performance?  
  └─→ 12-16 GB tier (RTX 4060 Ti 16GB / 4070 Ti): Full FLUX.2 Klein pipeline + SDXL + starter video.
  
Want frontier everything including video?
  └─→ 24 GB tier (RTX 4090): Full stack, video generation, multi-ControlNet.

Mac-only workflow?
  └─→ M3/M4 MacBook Pro (36+ GB) for image gen via Draw Things + cloud rental for video/training.
```

### Workspace TODO

- Add specific benchmark numbers per model × GPU (fill from community benchmarks)
- Document specific ComfyUI workflow JSONs tuned per hardware tier
- Track RTX 50-series compatibility as Blackwell matures in ComfyUI
- Evaluate Intel Arc GPU support for ComfyUI (experimental as of mid-2026)