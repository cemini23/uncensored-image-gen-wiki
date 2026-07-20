---
title: DiTango — selective attention state reuse for parallel DiT serving
type: concept
tags: [concept, inference, parallel, dit, caching, optimization]
keywords: [DiTango, context-parallelism, attention-state-reuse, ChituDiffusion, multi-node]
related:
  - sources/arxiv-2607-15650-ditango-chitudiffusion.md
  - entities/inference/chitu-diffusion.md
  - concepts/input-stable-sparse-attention-video.md
  - concepts/budget-aware-diffusion-caching.md
  - sources/arxiv-2607-16190-fvattn-sparse-attention-video.md
  - entities/models/wan-2-2.md
  - entities/uis/comfyui.md
  - sweeps/2026-07-20-daily.md
maturity: draft
created: 2026-07-20
updated: 2026-07-20
---

## Relations

@sources/arxiv-2607-15650-ditango-chitudiffusion.md @entities/inference/chitu-diffusion.md @concepts/input-stable-sparse-attention-video.md @concepts/budget-aware-diffusion-caching.md @sources/arxiv-2607-16190-fvattn-sparse-attention-video.md

## Raw Concept

Ingest 2026-07-20 from Chen et al. (arXiv:2607.15650) — systems paper on CP communication for DiTs.

## Narrative

### Where it sits in the workspace optimization map

| Axis | Mechanism | Examples |
|------|-----------|----------|
| Step / feature cache | Skip recomputes across timesteps | ReCache, BudCache, FlexCache (Tea/Mean/TaylorSeer) |
| Training-free sparse attn | Drop low-value QK blocks | SVOO, FVAttn |
| **CP communication** | Reuse high-contribution attention partitions across steps | **DiTango** |

DiTango maps heterogeneous spatial-partition value → hierarchical network topology so high-contribution partitions travel cheap paths, then reuses prior-step attention states selectively.

### Operator posture

Relevant only when serving FLUX/Wan/Qwen on **multi-GPU / multi-node** CUDA. Laptop ComfyUI single-GPU path unchanged. Pair with FVAttn WATCH for Wan2.2 few-step multi-GPU load balance when that code lands.
