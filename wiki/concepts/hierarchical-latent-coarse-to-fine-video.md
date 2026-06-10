---
title: Hierarchical latent coarse-to-fine video (MilliVid)
type: concept
tags: [video-generation, long-horizon, hierarchical-latent, coarse-to-fine, consistency]
keywords: [MilliVid, hierarchical tokenizer, coarse-to-fine rollout, long-range consistency, FramePack, token pyramid, autoregressive forgetting]
related:
  - sources/arxiv-2606-09056-millivid-hierarchical-latents.md
  - concepts/seam-stitching-strategies.md
  - concepts/long-video-rag-retrieval.md
  - concepts/world-models-video-generation.md
  - concepts/autoregressive-video-foresight-training.md
  - sources/arxiv-2606-02553-longlive-rag-long-video-generation.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-10
updated: 2026-06-10
---

## Relations

@sources/arxiv-2606-09056-millivid-hierarchical-latents.md @concepts/seam-stitching-strategies.md @concepts/long-video-rag-retrieval.md @concepts/world-models-video-generation.md

## Raw Concept

Ingest 2026-06-10 — long-video consistency via **learned multi-scale latents** + coarse-to-fine generation under fixed transformer context.

## Narrative

### The forgetting problem

AR video at full resolution: context holds ~2 frames → anything off-screen for 0.1s is lost. FramePack compresses distant frames but still generates full-res targets and fails off-screen recall (@sources/arxiv-2606-09056-millivid-hierarchical-latents.md).

### MilliVid approach

```
Coarse (4 tok/frame)  → many frames, layout locked
Medium (16 tok/frame) → refine structure  
Fine (64 tok/frame)   → texture detail on recent window
```

**Insight:** spend token budget on **semantic persistence** at coarse scales; allow fine detail to drift where humans don't notice.

### Comparison to persona long-form strategies

| Approach | Mechanism | MilliVid relation |
|----------|-----------|-------------------|
| Latent chaining / WanV2V stitcher | Overlap + velocity carry | Post-hoc assembly; MilliVid is end-to-end hierarchy |
| LongLive-RAG | Retrieve distant latents | Retrieval-augmented; MilliVid is retrieval-free |
| DecMem | Sparse global + local memory | Kling-side; closed |
| MSAVBench finding | Dub-after-stitch breaks dialogue | Orthogonal — MilliVid is visual consistency |

Research-stage — no Wan 2.2 plugin yet. Watch for FramePack successor integrations in ComfyUI ecosystem.

## Snippets

> "Coarser levels capture global structure, while finer levels add detailed appearance and texture."

## Dead Ends

Minecraft eval only. Not validated on human identity drift metrics (persona-critical).
