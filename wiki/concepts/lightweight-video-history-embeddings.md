---
title: Lightweight video history embeddings (TinyHistory)
type: concept
tags: [concept, video-generation, long-horizon, autoregressive, memory, compression]
keywords: [TinyHistory, history encoder, frame query, context compression, identity consistency, two-stage learning]
related:
  - sources/arxiv-2512-23851-tinyhistory-lightweight-video-history.md
  - entities/models/tinyhistory.md
  - concepts/long-video-rag-retrieval.md
  - concepts/causal-clip-attention-long-video.md
  - concepts/implicit-memory-retrieval-video-world-models.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - concepts/seam-stitching-strategies.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-25
updated: 2026-06-25
---

## Relations

@sources/arxiv-2512-23851-tinyhistory-lightweight-video-history.md @entities/models/tinyhistory.md @concepts/long-video-rag-retrieval.md @entities/models/wan-2-2.md

## Raw Concept

Ingest 2026-06-25 from Zhang et al. (arXiv:2512.23851) — compressed history representation for AR video under memory budgets.

## Narrative

### Problem

AR video needs **dense history** for identity/scene consistency, but full latent context blows VRAM — especially for **personal finetuning** and offline laptop workflows.

### TinyHistory pattern

```
Stage 1: History encoder pretrain (random frame query on large video)
Stage 2: Freeze/connect inside AR DiT — consistency fine-tune
         ↓
Lightweight tokens with full temporal coverage (not sparse keyframes)
```

### vs other long-memory approaches

| Approach | Mechanism | TinyHistory difference |
|----------|-----------|------------------------|
| Sliding window | Drop distant frames | Loses long-range identity |
| FramePack / merged tokens | Fixed pack | Detail loss at high merge rates |
| LongLive-RAG | Retrieve prior latents | Adds retrieval module; TinyHistory compresses encoder |
| CaR | Retrieval attention + compression | World-model camera memory; TinyHistory is history **embedding** |

### Build-track note

Evaluated on **Wan 2.1** — watch for open weights + ComfyUI integration. Until release, continue **seam stitching** + RAG patterns for persona long clips.

## Snippets

> "Complete, uninterrupted history coverage together with content query and interpretation capabilities is broadly desired."

## Dead Ends

None until code fails to ship.
