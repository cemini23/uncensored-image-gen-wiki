---
title: "AoiZora — topology-aware auto-parallel DiT inference (arXiv:2606.17566)"
type: source
tags: [paper, inference, video-generation, dit, parallelism, tpu, serving, systems]
keywords: [AoiZora, topology-aware placement, JAX XLA, Wan 2.1, tensor parallelism, context parallelism, TPU sub-slice, video diffusion serving]
related:
  - concepts/topology-aware-dit-parallel-inference.md
  - concepts/streaming-video-generation-serving.md
  - concepts/budget-aware-diffusion-caching.md
  - concepts/synthetic-media-compute-economics.md
  - entities/models/wan-2-2.md
  - entities/models/turboserve.md
  - entities/hardware/gpu-guide.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2606-19271-turboserve-streaming-video-serving.md
  - sweeps/2026-06-23-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-06-23
updated: 2026-06-23
---

## Relations

@concepts/topology-aware-dit-parallel-inference.md @concepts/streaming-video-generation-serving.md @entities/models/wan-2-2.md @entities/models/turboserve.md @sources/video-generation-survey-2026.md

## Raw Concept

- **Title**: AoiZora: Topology-Aware Auto-Parallel Optimization for Inference of Diffusion Transformers
- **Authors**: Kaijian Wang, Yuanyuan Xu et al. (Rice University; Google)
- **Type**: arXiv:2606.17566
- **Location**: `raw-sources/arxiv-2606.17566-aoizora-topology-aware-auto-parallel-optimizatio.pdf`
- **URL**: https://arxiv.org/abs/2606.17566
- **Retrieved**: 2026-06-23
- **Read status**: read (abstract + architecture)

## Narrative

**AoiZora** — compiler-mediated **topology planner** for low-latency **video DiT** inference on **TPU sub-slices**. Bridges logical sharding search with **physical chip placement** on nearest-neighbor ICI meshes.

**Problem:** Auto-parallel systems optimize logical device meshes but bind placement before compiled collective graphs are known. Same logical sharding → up to **16.6%** per-step latency swing on Wan 2.1 v5e-8 from placement alone (shared-link contention).

**Method (two-stage):**

1. **Logical pruning** — cheap StableHLO / Shardy IR filters weak shardings
2. **Placement ranking** — compiled HLO + topology-aware comm model picks physical layout

Applies via standard JAX/XLA path — no model / kernel / routing changes.

**Results:** Up to **1.42×** one-step Wan 2.1 denoising speedup vs existing auto-parallel on TPU v5e sub-slices.

### Workspace relevance

- Complements **TurboServe** (@concepts/streaming-video-generation-serving.md) on the **serving** axis — AoiZora is datacenter TPU placement, not laptop ComfyUI
- Informs why Wan-class video DiT needs **sequence + tensor + FSDP** hybrids at scale
- **No public repo** at ingest `[NEEDS VERIFICATION 2026-06-23]`

## Snippets

> "A denoising step is therefore typically distributed across multiple accelerators."

> "The denoiser runs at every diffusion step and therefore dominates latency; denoising accounts for 97.7% of end-to-end latency."

## Dead Ends

TPU/JAX-only — not actionable on local CUDA/MPS stack today.
