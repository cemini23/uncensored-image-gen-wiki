---
related:
  - sources/arxiv-2606-22370-error-free-long-video-generation.md
  - concepts/long-video-rag-retrieval.md
  - concepts/seam-stitching-strategies.md
  - concepts/subject-reconstruction-long-video-memory.md
  - sources/arxiv-2606-02553-longlive-rag-long-video-generation.md
  - sources/arxiv-2606-14667-memento-long-video-subject-reconstruction.md
  - sources/arxiv-2606-16449-permavid-disentangled-context-memory.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - concepts/lightweight-video-history-embeddings.md
  - sources/arxiv-2512-23851-tinyhistory-lightweight-video-history.md
title: Causal clip attention for long video generation
type: concept
tags: [concept, video-generation, long-horizon, autoregressive, attention, kv-cache]
keywords: [causal clip attention, hybrid attention, error accumulation, attribute drift, T-RFlow, video extension, KV cache]
maturity: draft
created: 2026-06-24
updated: 2026-06-25
---


## Relations

@sources/arxiv-2606-22370-error-free-long-video-generation.md @concepts/long-video-rag-retrieval.md @concepts/seam-stitching-strategies.md

## Raw Concept

Ingest 2026-06-24 from Chang et al. (arXiv:2606.22370, Alibaba/ZJU) — hybrid diffusion+AR long video without abandoning short-clip DiT strengths.

## Narrative

### Problem pair

| Failure | Symptom | Root cause (paper) |
|---------|---------|-------------------|
| **Error accumulation** | Oversharpening, color/exposure drift | Rectified-flow errors in low/high-frequency phases compound across clip conditioning |
| **Attribute drift** | Identity/scene memory loss | Over-reliance on local last-frame context |

### Causal clip attention pattern

```
Clip N-1          Clip N            Clip N+1
[ bidirectional ] [ bidirectional ] [ bidirectional ]   ← within-clip: full DiT prior
       ↓ causal KV           ↓ causal KV                  ← across-clip: LLM-style memory
```

- **Stage 1:** extension fine-tune on short data (last-frame conditioning)
- **Stage 2:** long-data fine-tune with cached KV from prior clips
- **T-RFlow:** truncation-rectified flow sampling to damp error-prone frequency phases

### vs other long-horizon memory patterns

| Pattern | Mechanism | Paper |
|---------|-----------|-------|
| RAG over latents | Retrieve non-local history embeddings | LongLive-RAG |
| Disentangled context memory | Edit-time memory banks | PermaVid |
| Causal clip + KV | Unidirectional cross-clip attention | Error-free long video (this) |

### Build-track note

No local weights at ingest. Persona minute-long Reels still rely on Wan/LTX chunking + @concepts/seam-stitching-strategies.md until a port ships.

## Snippets

> "Bidirectional attention within each clip… unidirectional attention across clips."

## Dead Ends

None.
