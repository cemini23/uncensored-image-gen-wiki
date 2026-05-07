---
title: HunyuanVideo 1.5 (Tencent)
type: entity
tags: [model, video, dit, hunyuanvideo, tencent, eastern-vanguard, completely-uncensored-after-lora]
keywords: [hunyuanvideo, hunyuan-1-5, tencent, ssta, selective-sliding-tile-attention, 8.3b, 3d-causal-vae, fp8-gemm, step-distilled, nsfwsks, theyurilover, 480p, 720p, 1080p]
related:
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/ltx-2.md
  - entities/training-tools/musubi-tuner.md
  - concepts/seam-stitching-strategies.md
  - concepts/video-identity-inheritance.md
  - concepts/de-censoring-techniques.md
  - concepts/censorship-tier-taxonomy.md
maturity: draft
created: 2026-05-07
updated: 2026-05-07
---

## Relations

@sources/video-generation-survey-2026.md @entities/models/wan-2-2.md @entities/models/ltx-2.md @entities/training-tools/musubi-tuner.md @concepts/seam-stitching-strategies.md @concepts/video-identity-inheritance.md @concepts/de-censoring-techniques.md @concepts/censorship-tier-taxonomy.md

## Raw Concept

Page prompted by the May 2026 video survey ingest. HunyuanVideo 1.5 is the SSTA-accelerated peer to Wan 2.2 in the local NSFW video stack — significantly faster on consumer hardware due to attention-pruning optimization, and explicitly supported in Musubi Tuner (per sub-sweep E confirmation, 2026-05-07).

Synthesized from @sources/video-generation-survey-2026.md.

## Narrative

### Architecture

- **8.3B parameter Diffusion Transformer** + 3D causal VAE [CONFIRMED]
- **Selective and Sliding Tile Attention (SSTA)** — defining 1.5 transformation: dynamically prunes redundant spatiotemporal Key-Value (KV) blocks during generation; resolves quadratic scaling on sequence lengths [CONFIRMED]
- **End-to-end speedup**: ~2× over FlashAttention-3 implementations for 10-second 720p synthesis [CONFIRMED] [Source: Video Generation Models Survey 2026.docx p.2, citing arxiv.org/html/2511.18870v1]
- **Native output resolution**: up to 1080p
- **FP8 GEMM inference**: drastically lowers VRAM thresholds [CONFIRMED]

### Step-distilled variants

Tencent shipped step-distilled checkpoints capable of generating 480p video in 8-12 steps — **75% generation-time reduction on RTX 4090** vs base. [CONFIRMED] [Source: Video Generation Models Survey 2026.docx p.2]

### Censorship tier — Strict at base → Completely Uncensored after LoRA

Base HunyuanVideo 1.5 is heavily aligned and filtered. Tencent shipped **official LoRA tuning scripts** (github.com/Tencent-Hunyuan/HunyuanVideo-1.5), catalyzing community NSFW fine-tuning. Bridging mechanism: **trigger-word injection** (e.g. `nsfwsks`) bridges aligned latent space to explicit conceptual pathways. Notable repository: `TheYuriLover/HunyuanVideo_nfsw_lora`. [CONFIRMED]

→ @concepts/de-censoring-techniques.md → @concepts/censorship-tier-taxonomy.md

### Hardware viability

| Tier | Variant | Notes |
|------|---------|-------|
| 12-16 GB | HunyuanVideo 1.5 8.3B FP8 | Min viable; 5-8s @ 720p |
| 24 GB+ | HunyuanVideo 1.5 native | But 1080p uncompressed requires multi-GPU |
| Multi-GPU | HunyuanVideo native 1080p | FSDP / DeepSpeed Ulysses |

[Source: Video Generation Models Survey 2026.docx p.4-5]

### Training and fine-tuning

- **Musubi Tuner** (kohya-ss video sibling) explicitly supports HunyuanVideo 1.5 — confirmed via `hunyuan_video_1_5` directory in repo (per training-tool sub-sweep E, 2026-05-07). 24 GB recipe needs worked example. → @entities/training-tools/musubi-tuner.md [CONFIRMED]
- Tencent's official LoRA tuning scripts are the canonical fine-tuning path; community has produced exhaustive action-specific LoRA libraries.

### Comparison to Wan 2.2

| Dimension | HunyuanVideo 1.5 | Wan 2.2 |
|-----------|-------------------|---------|
| Architecture | 8.3B dense DiT + SSTA | 27B MoE / 14B active + dual-expert SNR routing |
| Native resolution | up to 1080p | 480p / 720p |
| FP8 inference | yes | yes |
| Local NSFW path | trigger-word LoRA injection (`nsfwsks`) | abliterated text encoder + LoRA stack |
| 16 GB viability | 8.3B FP8 | 5B TI2V FP8 |
| Step-distilled | 8-12 steps for 480p | (not shipped) |

[CONFIRMED]

## Snippets

> "Tencent's HunyuanVideo 1.5 represents a masterclass in architectural optimization and inference efficiency. Building upon its predecessor, the 1.5 iteration operates with an 8.3 billion parameter Diffusion Transformer integrated with a 3D causal VAE."
[Source: Video Generation Models Survey 2026.docx p.2, citing overchat.ai/ai-hub/hunyuanvideo-1-5 (retrieved 2026-05-06)]

> "The defining transformation from the 1.0 version is the introduction of the Selective and Sliding Tile Attention (SSTA) mechanism. This novel attention algorithm dynamically prunes redundant spatiotemporal Key-Value (KV) blocks during generation."
[Source: Video Generation Models Survey 2026.docx p.2, citing arxiv.org/html/2511.18870v1]

> "Tencent's progressive open-source strategy includes the release of step-distilled models capable of generating 480p video in just 8 to 12 steps, reducing generation time on an RTX 4090 by 75%."
[Source: Video Generation Models Survey 2026.docx p.2, citing github.com/Tencent-Hunyuan/HunyuanVideo-1.5]

> "developers inject specific trigger words (e.g., nsfwsks) to bridge the aligned latent space with explicit conceptual pathways"
[Source: Video Generation Models Survey 2026.docx p.4, citing reddit.com/r/StableDiffusion/comments/1pko3l3]
