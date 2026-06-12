---
title: One-step autoregressive video distillation (AAD-1)
type: concept
tags: [concept, video-generation, autoregressive, distillation, one-step, inference-speed]
keywords: [AAD-1, asymmetric adversarial distillation, one-step AR video, bidirectional discriminator, DMD warmup, motion collapse, streaming I2V]
related:
  - sources/arxiv-2606-03972-aad-1-one-step-ar-video.md
  - concepts/autoregressive-video-foresight-training.md
  - concepts/grpo-i2v-post-training.md
  - concepts/seam-stitching-strategies.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - concepts/budget-aware-diffusion-caching.md
  - sources/arxiv-2606-06060-recache-diffusion-caching.md
  - sources/arxiv-2606-07508-streamforce-streaming-force-video.md
  - concepts/streaming-force-controlled-video-generation.md
  - sources/arxiv-2606-09150-ultra-flash-streaming-hr-video.md
  - concepts/cascaded-streaming-high-resolution-video.md
maturity: draft
created: 2026-06-06
updated: 2026-06-11
---

## Relations

@sources/arxiv-2606-03972-aad-1-one-step-ar-video.md @concepts/autoregressive-video-foresight-training.md @concepts/seam-stitching-strategies.md @entities/models/wan-2-2.md @concepts/cascaded-streaming-high-resolution-video.md

## Raw Concept

Concept from 2026-06-06 ingest — arXiv:2606.03972 AAD-1.

## Narrative

**Problem:** AR video distillation to 1 step suffers **motion collapse** (static video) because causal frame-wise discriminators miss global temporal drift; joint AR+d distillation from scratch is unstable.

**AAD-1 pattern:**

| Component | Generator | Discriminator |
|-----------|-----------|---------------|
| Attention | Causal (AR + KV cache) | **Bidirectional** full sequence |
| Score | Per-chunk denoise | **Single holistic** realism logit |
| Training | 3-stage: ODE init → DMD warmup → GAN refine | Trained only in stage 3 |

**Inference benefit:** one diffusion step per AR chunk → lower latency for chained persona I2V (@concepts/seam-stitching-strategies.md). Orthogonal to foresight training (Video-Mirai) and GRPO post-training.

Build track blocked on weight release + Wan 2.1 causal wrapper availability `[NEEDS VERIFICATION 2026-06-06]`.

## Snippets

(See @sources/arxiv-2606-03972-aad-1-one-step-ar-video.md)
