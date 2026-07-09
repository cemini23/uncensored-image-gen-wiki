---
title: "Lights, Camera, Carbon — video generation energy scaling (arXiv:2607.04553)"
type: source
tags: [paper, video-generation, sustainability, compute-economics, scaling-laws]
keywords: [energy consumption, T2V, T2VA, scaling laws, VBench, Wan, HunyuanVideo, LTX-2, sustainability, carbon]
related:
  - concepts/video-generation-energy-scaling-laws.md
  - concepts/synthetic-media-compute-economics.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/ltx-2.md
  - sweeps/2026-07-09-daily.md
maturity: draft
read_status: read
created: 2026-07-09
updated: 2026-07-09
---

## Relations

@concepts/video-generation-energy-scaling-laws.md @concepts/synthetic-media-compute-economics.md @entities/models/wan-2-2.md @entities/models/hunyuanvideo-1-5.md @entities/models/ltx-2.md

## Raw Concept

- **Title**: Lights, Camera, Carbon: Architectural Scaling Laws for Video Generation Energy Consumption
- **Authors**: Nidhal Jegham, Boris Gamazaychikov, Sasha Luccioni (Sustainable AI Group)
- **Type**: arXiv:2607.04553
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.04553-lights-camera-carbon-architectural-scaling-laws.pdf`
- **URL**: https://arxiv.org/abs/2607.04553
- **Retrieved**: 2026-07-09
- **Read status**: read (abstract, architectural decomposition, energy formula, experimental scope)

## Narrative

This paper derives **bidirectional energy scaling laws** for text-to-video (T2V) and text-to-video-audio (T2VA) diffusion from architectural first principles — resolution, duration, denoising steps, batch size — without needing model weights or implementation access.

Core claim: video diffusion is **compute-bound** during denoising, so energy decomposes into quadratic (self-attention) and linear (FFN, conv) terms whose fitted coefficients reflect each architecture's complexity. Validated on six open models (8.3B–27B) across H200/B200 configs with **<3% MAPE**. The framework also estimates proprietary-model energy from inference-time observations.

### Workspace relevance

For David's RunPod/Wan batch workflows, this is a **planning reference**, not an adoption target. Use it to sanity-check clip length × resolution × step-count tradeoffs before burning cloud GPU hours. Pairs with @concepts/synthetic-media-compute-economics.md dollar math.

Phase-0: **REFERENCE** — no repo, no operator install. Fold coefficients into batch-planning checklists when quoting persona video production cost.

## Snippets

> "We demonstrate that each model's energy profile obeys theoretically derived scaling laws, decomposing into quadratic and linear terms whose coefficients directly reflect the underlying architectural complexity."

> "Generating a single short video can consume approximately 90 Wh of energy, making it 30 times more costly than image generation and over 2,000 times more costly than text generation." [citing Delavande et al. prior work]

> "Validated across six open-source models spanning 8.3B–27B parameters and three GPU configurations, this decomposition achieves below 3% MAPE across all architectures."

## Dead Ends

- **Carbon offset / ESG reporting**: out of scope for persona-ops unless platform compliance requires it.
- **Replacing wall-clock benchmarks**: energy laws complement but do not replace VBench quality gates.
