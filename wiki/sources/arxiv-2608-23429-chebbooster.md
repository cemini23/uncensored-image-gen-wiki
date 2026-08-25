---
title: "ChebBooster DiT Chebyshev extrapolation (arXiv:2608.23429)"
type: source
tags: [paper, dit, acceleration, training-free, mit, watch]
keywords: [ChebBooster, Chebyshev, barycentric, FLUX, PixArt]
related:
  - concepts/budget-aware-diffusion-caching.md
  - concepts/federated-daily-research-digest.md
  - entities/models/chebbooster.md
  - entities/models/linca.md
  - entities/models/sparsepr.md
  - entities/models/wan-2-2.md
  - sweeps/2026-08-25-daily.md
maturity: draft
read_status: read
created: 2026-08-25
updated: 2026-08-25
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/models/chebbooster.md @entities/models/sparsepr.md @entities/models/linca.md @concepts/budget-aware-diffusion-caching.md @entities/models/wan-2-2.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-25-daily.md

## Raw Concept

- **Title**: ChebBooster: A Training-Free Approach for Efficient Diffusion Transformer Inference via Chebyshev-Inspired Extrapolation
- **Authors**: Chengjie Lu, Tianchi Deng, Zhengqi He, Chengwen Luo, Xueliang Li (Shenzhen University)
- **Type**: arXiv:2608.23429 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.23429-chebbooster-a-training-free-approach-for-efficie.pdf`
- **URL**: https://arxiv.org/abs/2608.23429
- **Retrieved**: 2026-08-25
- **Code**: `Kiramei/ChebBooster` **MIT CONFIRMED**. Cloned `.local/adopts/ChebBooster` (~4.8 MB GitHub). Folders for DiT / FLUX / PixArt-Σ.

## Narrative

Training-free timestep skip via Chebyshev (barycentric) extrapolation instead of Taylor (Runge oscillations) or naïve cache reuse. Complements SparsePR (sparse *attention*) and LinCa (learnable *cache*). Image-gen Phase-1: none (`deferred`) — CUDA eval is operator-side.

## Snippets

> "We propose ChebBooster, a training-free extrapolation framework based on Chebyshev polynomial theory that achieves stable and efficient acceleration for DiTs."

[Source: arxiv-2608.23429, abstract]
