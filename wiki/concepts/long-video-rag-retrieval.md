---
title: Long-video RAG retrieval (LongLive-RAG)
type: concept
tags: [concept, video-generation, long-horizon, rag, autoregressive, memory]
keywords: [LongLive-RAG, latent RAG, sliding window, identity drift, VBench-Long, retrieval memory, AR video]
related:
  - sources/arxiv-2606-02553-longlive-rag-long-video-generation.md
  - concepts/seam-stitching-strategies.md
  - concepts/world-models-video-generation.md
  - concepts/persona-consistency-methods.md
  - entities/models/decmem.md
  - sources/arxiv-2605-31336-decmem-world-generation.md
  - sources/video-generation-survey-2026.md
  - concepts/autoregressive-video-foresight-training.md
  - entities/models/wan-2-2.md
maturity: draft
created: 2026-06-04
updated: 2026-06-04
---

## Relations

@sources/arxiv-2606-02553-longlive-rag-long-video-generation.md @concepts/seam-stitching-strategies.md @concepts/world-models-video-generation.md @entities/models/decmem.md

## Raw Concept

Concept stub from 2026-06-04 ingest — arXiv:2606.02553 LongLive-RAG (NVIDIA).

## Narrative

**Problem:** AR video with sliding-window attention creates **irreversible drift** — once the active window corrupts identity/background, later blocks only see degraded context.

**Pattern:** Treat prior generated latents as a **searchable memory**; each new block retrieves top-K relevant history embeddings and attends to them alongside the local window. Contrasts with:

- Fixed attention sinks (anchors may mismatch content)
- Positional extrapolation (∞-RoPE — doesn't fix corrupted context)
- Compressed-history tokens (detail loss)
- **DecMem** (@entities/models/decmem.md) — learned decoupled global/local memory inside the model

LongLive-RAG is **plug-in RAG** on existing AR backbones (Causal-Forcing, Self-Forcing, LongLive). GitHub: https://github.com/qixinhu11/LongLive-RAG `[TENTATIVE]` integration path for persona minute-scale Wan rolls.

## Snippets

(See @sources/arxiv-2606-02553-longlive-rag-long-video-generation.md)
