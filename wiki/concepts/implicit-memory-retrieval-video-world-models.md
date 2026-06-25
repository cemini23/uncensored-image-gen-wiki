---
related:
  - sources/arxiv-2606-23105-car-implicit-memory-video-world.md
  - entities/models/car.md
  - concepts/world-models-video-generation.md
  - concepts/latent-spatial-memory-video-world-models.md
  - concepts/long-video-rag-retrieval.md
  - concepts/camera-controlled-video-generation.md
  - sources/arxiv-2606-09828-mirage-latent-spatial-memory.md
  - entities/models/mirage.md
  - entities/models/wan-2-2.md
  - concepts/lightweight-video-history-embeddings.md
title: Implicit memory retrieval for video world models
type: concept
tags: [concept, world-model, video-generation, memory, camera-control]
keywords: [CaR, retrieval attention, context compression, SceneFly, hard-cut, viewpoint encoding, long-horizon memory]
maturity: draft
created: 2026-06-24
updated: 2026-06-25
---


## Relations

@sources/arxiv-2606-23105-car-implicit-memory-video-world.md @entities/models/car.md @concepts/world-models-video-generation.md @concepts/latent-spatial-memory-video-world-models.md

## Raw Concept

Ingest 2026-06-24 from Peng et al. (arXiv:2606.23105) — CaR implicit memory for camera-controllable world models.

## Narrative

### vs prior memory approaches

| Approach | Limitation | CaR response |
|----------|------------|--------------|
| Full context scaling | Quadratic cost | Lightweight **compression network** → compact tokens |
| Heuristic retrieval | Brittle across trajectories | **Retrieval Attention** with camera-pose encoding |
| Rigid revisit assumptions | Fails on hard cuts | Supports **discontinuous trajectories** |

### Dual-branch attention

- **Self-attention branch** — preserves pretrained DiT prior
- **Retrieval branch** — geometry-aware history lookup (zero-init so base model unchanged at start)

### SceneFly training signal

UE5 synthetic ~1000 min / 100 scenes with exact intrinsics/extrinsics — enables long-horizon revisit + hard-cut supervision.

### Build-track note

Code pending (`Orange-3DV-Team/CaR`). Watch for Wan-class integration — complements Mirage spatial memory and LongLive-RAG temporal retrieval on different axes.

## Snippets

> "Flexible memory retrieval through attention computation… with minimal computational overhead via context compression."

## Dead Ends

Dynamic object state memory flagged as open problem in paper.
