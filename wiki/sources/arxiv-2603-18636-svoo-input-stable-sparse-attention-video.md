---
title: "SVOO — input-stable sparse attention for video (arXiv:2603.18636)"
type: source
tags: [paper, video-generation, sparse-attention, inference, optimization, icml-2026]
keywords: [SVOO, input-stable sparsity, offline profiling, QK co-clustering, Wan2.1, Wan2.2, HunyuanVideo, training-free]
related:
  - concepts/input-stable-sparse-attention-video.md
  - concepts/budget-aware-diffusion-caching.md
  - concepts/navicache-navigation-guided-video-caching.md
  - sources/arxiv-2606-26795-navicache-test-time-self-calibration-caching.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - sources/video-generation-survey-2026.md
  - entities/uis/comfyui.md
  - sweeps/2026-07-01-daily.md
  - sweeps/2026-07-01-daily.md
  - concepts/persona-consistency-methods.md
  - sources/arxiv-2606-13496-budcache-diffusion-caching.md
maturity: draft
read_status: read
created: 2026-07-01
updated: 2026-07-01
---

## Relations

@concepts/input-stable-sparse-attention-video.md @entities/models/wan-2-2.md @concepts/budget-aware-diffusion-caching.md

## Raw Concept

- **Title**: Attention Sparsity is Input-Stable: Training-Free Sparse Attention for Video Generation via Offline Sparsity Profiling and Online QK Co-Clustering
- **Authors**: Jiayi Luo, Jiayu Chen, Jiankun Wang, Cong Wang, et al. (ICML 2026 Main Track)
- **Type**: arXiv:2603.18636
- **Location**: `raw-sources/arxiv-2603.18636-svoo-input-stable-sparse-attention-video.pdf`
- **URL**: https://arxiv.org/abs/2603.18636 · https://github.com/Mutual-Luo/SVOO
- **Retrieved**: 2026-07-01
- **Read status**: read (abstract + README + Phase-0)

## Narrative

**SVOO** — training-free **sparse 3D attention** for video DiTs. Key insight: per-layer attention sparsity is an **intrinsic, input-stable** property — offline layer-wise sensitivity profiling suffices; online pruning need not re-tune per prompt.

**Two-stage pipeline:**

1. **Offline** — layer-wise sparsity profiles (canonical profiles shipped in repo)
2. **Online** — block-wise sparse attention via **bidirectional QK co-clustering** (addresses query–key coupling ignored by prior training-free sparse methods)

**Evaluated on seven video models** including **Wan2.1 / Wan2.2**, HunyuanVideo — claims up to **1.93× speedup** with PSNR up to **29 dB** vs dense on Wan2.1 `[TENTATIVE]`.

### Workspace relevance

Complements **feature caching** (@concepts/budget-aware-diffusion-caching.md, @concepts/navicache-navigation-guided-video-caching.md) on a separate axis — sparsity in attention blocks vs step-level cache reuse. Persona Reel batch throughput on Wan 2.2.

Phase-0: **GO** — `Mutual-Luo/SVOO` Apache-2.0, Wan T2V/I2V + Hunyuan scripts; CUDA-only (Linux + FlashAttention/FlashInfer). 80 GB for Wan 14B; 1.3B on 40 GB. Integrated into SparseVideo framework (2026-06-09).

## Snippets

> "Attention sparsity of each layer is its intrinsic property, with minor effects across different inputs."

> "SVOO achieves a superior quality-speedup trade-off … delivering up to 1.93× speedup while maintaining a PSNR of up to 29 dB on Wan2.1."

## Dead Ends

No Apple Silicon / MPS path. No ComfyUI node at ingest — CLI inference scripts only.
