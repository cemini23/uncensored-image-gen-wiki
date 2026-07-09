---
title: Input-stable sparse attention for video generation (SVOO)
type: concept
tags: [concept, video-generation, sparse-attention, inference, optimization]
keywords: [SVOO, input-stable sparsity, layer-wise profiling, QK co-clustering, training-free, Wan, HunyuanVideo]
related:
  - sources/arxiv-2603-18636-svoo-input-stable-sparse-attention-video.md
  - concepts/budget-aware-diffusion-caching.md
  - concepts/navicache-navigation-guided-video-caching.md
  - sources/arxiv-2606-26795-navicache-test-time-self-calibration-caching.md
  - sources/arxiv-2606-13496-budcache-diffusion-caching.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - sources/video-generation-survey-2026.md
  - entities/uis/comfyui.md
  - concepts/persona-consistency-methods.md
  - sweeps/2026-07-01-daily.md
  - sources/arxiv-2607-06173-mobilewan-mobile-video-diffusion.md
  - concepts/mobile-wan-chunkwise-video-distillation.md
maturity: draft
created: 2026-07-01
updated: 2026-07-01
---

## Relations

@sources/arxiv-2603-18636-svoo-input-stable-sparse-attention-video.md @concepts/budget-aware-diffusion-caching.md @entities/models/wan-2-2.md

## Raw Concept

Ingest 2026-07-01 from Luo et al. (arXiv:2603.18636, ICML 2026) — training-free sparse 3D attention via offline layer profiles + online QK co-clustering.

## Narrative

### Video inference optimization axes (workspace)

| Axis | Mechanism | Examples |
|------|-----------|----------|
| Step budget / cache schedule | Which denoise steps fully recompute | ReCache, BudCache |
| Trajectory-aware cache | Feature momentum + drift | NaviCache |
| **Attention sparsity** | **Prune dense 3D self-attention blocks** | **SVOO**, SparseVideoGen |

SVOO is **orthogonal** to caching — can theoretically stack with NaviCache/BudCache on Wan 2.2 persona batches `[NEEDS VERIFICATION 2026-07-01]`.

### Why "input-stable" matters

Prior training-free sparse attention assumed uniform per-layer sparsity and ignored Q–K coupling in block partitioning. SVOO profiles **per-layer intrinsic sparsity offline** (stable across prompts) and clusters query/key blocks bidirectionally online.

### Build-track note

Phase-0 **GO** on `Mutual-Luo/SVOO` (Apache-2.0). CUDA Linux only; Wan 14B needs 80 GB. Monitor ComfyUI port; until then CLI batch scripts for overnight Reel renders.

## Snippets

> "Attention sparsity of each layer is its intrinsic property, with minor effects across different inputs."

## Dead Ends

Apple Silicon MPS unsupported at ingest.
