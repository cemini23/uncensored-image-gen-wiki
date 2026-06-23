---
title: Topology-aware DiT parallel inference (AoiZora)
type: concept
tags: [concept, inference, video-generation, dit, parallelism, serving, systems]
keywords: [AoiZora, logical sharding, physical placement, TPU ICI, collective contention, Wan serving]
related:
  - sources/arxiv-2606-17566-aoizora-topology-aware-dit-parallel.md
  - concepts/streaming-video-generation-serving.md
  - concepts/budget-aware-diffusion-caching.md
  - concepts/synthetic-media-compute-economics.md
  - entities/models/wan-2-2.md
  - entities/models/turboserve.md
  - entities/hardware/gpu-guide.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2606-19271-turboserve-streaming-video-serving.md
maturity: draft
created: 2026-06-23
updated: 2026-06-23
---

## Relations

@sources/arxiv-2606-17566-aoizora-topology-aware-dit-parallel.md @concepts/streaming-video-generation-serving.md @entities/models/wan-2-2.md @entities/models/turboserve.md

## Raw Concept

Ingest 2026-06-23 from AoiZora (arXiv:2606.17566) — physical topology matters for video DiT multi-device inference.

## Narrative

**Serving stack gap:** Logical parallel plans (TP / sequence / FSDP / CFG parallel) are searched in the abstract; **physical accelerator placement** is often fixed at mesh init — before compiled collective graphs exist.

**AoiZora fix:** Compiler-boundary planner — prune shardings on cheap IR, rank placements on compiled HLO + topology comm model.

**Implication for operators:** Laptop single-GPU workflows unaffected; cloud Wan/Hunyuan serving economics may depend on placement-aware compilers, not just step caching (@concepts/budget-aware-diffusion-caching.md).

## Snippets

> "Two executions can use the same model, the same logical sharding, and the same logical collective volume, yet achieve different latency."

## Dead Ends

TPU/JAX ecosystem only at paper release.
