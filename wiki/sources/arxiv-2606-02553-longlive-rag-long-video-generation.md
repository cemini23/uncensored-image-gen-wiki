---
related:
  - concepts/long-video-rag-retrieval.md
  - concepts/seam-stitching-strategies.md
  - concepts/world-models-video-generation.md
  - concepts/persona-consistency-methods.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/decmem.md
  - sources/arxiv-2605-31336-decmem-world-generation.md
  - sources/arxiv-2606-09056-millivid-hierarchical-latents.md
  - concepts/hierarchical-latent-coarse-to-fine-video.md
  - concepts/causal-clip-attention-long-video.md
  - sources/arxiv-2606-22370-error-free-long-video-generation.md
  - sources/arxiv-2606-23105-car-implicit-memory-video-world.md
  - sources/arxiv-2512-23851-tinyhistory-lightweight-video-history.md
title: "LongLive-RAG — retrieval-augmented AR long video generation (arXiv:2606.02553)"
type: source
tags: [paper, video-generation, long-horizon, rag, autoregressive, memory, nvidia]
keywords: [LongLive-RAG, RAG, sliding window, latent retrieval, Window Temporal Delta Loss, VBench-Long, Causal-Forcing, Self-Forcing]
maturity: draft
read_status: read
created: 2026-06-04
updated: 2026-06-25
---


## Relations

@concepts/long-video-rag-retrieval.md @concepts/seam-stitching-strategies.md @concepts/world-models-video-generation.md @entities/models/decmem.md

## Raw Concept

- **Title**: LongLive-RAG: A General Retrieval-Augmented Framework for Long Video Generation
- **Authors**: Qixin Hu et al. (NVIDIA, USC, MIT)
- **Type**: arXiv:2606.02553
- **Location**: `raw-sources/arxiv-2606-02553-longlive-rag-a-general-retrieval-augmented-frame.pdf`
- **URL**: https://arxiv.org/abs/2606.02553
- **Project**: https://longlive-rag.github.io/
- **Code**: https://github.com/qixinhu11/LongLive-RAG
- **Retrieved**: 2026-06-04
- **Read status**: read (abstract + intro)

## Narrative

Formulates **open-ended AR video generation as RAG over self-generated latents**. Each new block queries compact embeddings of prior latents, retrieves top-K non-local history, and adds them to sliding-window attention context — generator backbone unchanged, lightweight retrieval overhead.

**Window Temporal Delta Loss** reduces redundant similarity between adjacent latents so retrieval picks meaningful temporal changes, not near-duplicates.

Evaluated on Causal-Forcing, Self-Forcing, LongLive backbones at 30s / 60s / 120s — claims best average VBench-Long rank and gains on subject/background consistency, motion smoothness, imaging quality `[TENTATIVE]`.

### Workspace relevance

Complements **DecMem** (@sources/arxiv-2605-31336-decmem-world-generation.md) memory architectures and post-hoc **seam stitching** (@concepts/seam-stitching-strategies.md) for persona long-form clips. First open RAG-over-own-history pattern for AR video — watch for ComfyUI node / Wan integration `[NEEDS VERIFICATION 2026-06-04]`.

## Snippets

> "We formulate long video generation as a retrieval-augmented generation (RAG) problem. Rather than relying solely on the recent window, we treat previously generated latents as a dynamic, searchable history."

## Dead Ends

None.
