---
title: "LiteVSR — frozen DiT video super-resolution (arXiv:2606.09250)"
type: source
tags: [paper, video-generation, super-resolution, vsr, diffusion-transformer, icml]
keywords: [LiteVSR, frozen DiT, State-Aware Adapter, flow matching VSR, 11.25% trainable, FlashVSR, SeedVR, one-step VSR, REDS]
related:
  - concepts/frozen-dit-video-super-resolution.md
  - concepts/cascaded-streaming-high-resolution-video.md
  - sources/arxiv-2606-09150-ultra-flash-streaming-hr-video.md
  - concepts/two-pass-generation-workflow.md
  - entities/models/wan-2-2.md
  - entities/models/ltx-2.md
  - sweeps/2026-06-11-daily.md
  - sources/video-generation-survey-2026.md
maturity: draft
read_status: read
created: 2026-06-11
updated: 2026-06-11
---

## Relations

@concepts/frozen-dit-video-super-resolution.md @entities/models/wan-2-2.md @concepts/two-pass-generation-workflow.md

## Raw Concept

- **Title**: LiteVSR: Lightweight Adaptation of Frozen Diffusion Transformers for Video Super-Resolution
- **Authors**: Yu Cao, Ziquan Liu, Zhensong Zhang, Jiankang Deng, Shaogang Gong, Jifei Song (QMUL, Huawei Darwin, Imperial)
- **Type**: arXiv:2606.09250 (ICML 2026)
- **Location**: `raw-sources/arxiv-2606.09250-litevsr-lightweight-adaptation-of-frozen-diffusi.pdf`
- **URL**: https://arxiv.org/abs/2606.09250
- **Retrieved**: 2026-06-11
- **Read status**: read (abstract + method + efficiency table)

## Narrative

**LiteVSR** — **frozen DiT backbone** + lightweight **State-Aware Adapter** for video super-resolution. Only **11.25%** trainable params; **~12 GPU-hours** on 1× A100 (REDS 266 clips). Compatible with **1-step** sampling.

### vs full fine-tune VSR (FlashVSR, SeedVR, DiffVSR)

| Method | Trainable backbone | Training cost (paper) |
|--------|-------------------|----------------------|
| FlashVSR | 100% + decoder | 32× A100 |
| SeedVR | 100% + VAE | 32× H100, 115K iter |
| LiteVSR | **11.25%** adapter only | **1× A100, ~6K iter** |

**Mechanism:** Flow matching's constant velocity field → conditioning reduces to fixed injection pattern per DiT block. Dual-stream adapter: **structural stream** (LQ latent, static layout) + **refinement stream** (current clean estimate ẑ₀,t) fused via time-modulated cross-attention — early steps anchor structure, late steps add texture.

**Zero-init linear injection** into frozen DiT blocks preserves pretrained generation dynamics (vs ControlNet full-backbone duplicate on DiT).

### Persona workflow fit

Post-process upscaler for Wan/LTX persona clips in @concepts/two-pass-generation-workflow.md — low-cost domain adaptation if operator has degraded reference footage (UAV, old phone). Not streaming (contrast @concepts/cascaded-streaming-high-resolution-video.md).

## Snippets

> "LiteVSR achieves competitive restoration quality with only 11.25% trainable parameters and 12 GPU-hours of training on a single A100, while maintaining fast sampling (down to a single step) compatibility."

> "By predicting a constant velocity field across all timesteps, the adaptation task reduces to learning a fixed injection pattern rather than time-varying transformations."

## Dead Ends

REDS-scale training (266 clips) — generalization to heavy diffusion-generated persona video unverified. Base DiT checkpoint not specified in skim — Wan vs CogVideoX adapter compatibility `[NEEDS VERIFICATION 2026-06-11]`.
