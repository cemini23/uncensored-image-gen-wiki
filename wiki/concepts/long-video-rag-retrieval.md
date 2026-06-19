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
  - sources/arxiv-2606-09056-millivid-hierarchical-latents.md
  - concepts/hierarchical-latent-coarse-to-fine-video.md
  - concepts/latent-spatial-memory-video-world-models.md
  - sources/arxiv-2606-09828-mirage-latent-spatial-memory.md
  - sources/arxiv-2606-14667-memento-long-video-subject-reconstruction.md
  - concepts/subject-reconstruction-long-video-memory.md
  - entities/models/memento.md
  - concepts/bidirectional-autoregressive-video-generation.md
  - sources/arxiv-2606-18702-unitemp-bidirectional-video-generation.md
maturity: draft
created: 2026-06-04
updated: 2026-06-19
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

LongLive-RAG is **plug-in RAG** on existing AR backbones (Causal-Forcing, Self-Forcing, LongLive). GitHub: https://github.com/qixinhu11/LongLive-RAG

### Phase-0 audit [CONFIRMED 2026-06-05]

| Check | Result |
|-------|--------|
| License | Apache-2.0 |
| Activity | 47★; pushed 2026-06-04; HF weights card live |
| Integration | Requires **LongLive upstream install**; no Wan/ComfyUI wrapper yet |
| Persona fit | Reduces identity drift on minute-scale AR persona clips vs seam-stitching alone |

**Verdict: CONDITIONAL-GO** — watch for ComfyUI node; test on LongLive+Wan when integration lands `[NEEDS VERIFICATION 2026-06-05]`.

## Snippets

(See @sources/arxiv-2606-02553-longlive-rag-long-video-generation.md)
