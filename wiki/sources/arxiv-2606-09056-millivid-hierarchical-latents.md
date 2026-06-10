---
title: "MilliVid — hierarchical latents for long video (arXiv:2606.09056)"
type: source
tags: [paper, video-generation, long-horizon, hierarchical-latent, framepack, autoregressive]
keywords: [MilliVid, hierarchical autoencoder, coarse-to-fine rollout, long-range consistency, FramePack, token hierarchy, Minecraft, TRI, MIT]
related:
  - concepts/hierarchical-latent-coarse-to-fine-video.md
  - concepts/seam-stitching-strategies.md
  - concepts/long-video-rag-retrieval.md
  - concepts/world-models-video-generation.md
  - concepts/autoregressive-video-foresight-training.md
  - sources/arxiv-2606-02553-longlive-rag-long-video-generation.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
maturity: draft
read_status: read
created: 2026-06-10
updated: 2026-06-10
---

## Relations

@concepts/hierarchical-latent-coarse-to-fine-video.md @concepts/seam-stitching-strategies.md @concepts/long-video-rag-retrieval.md @concepts/world-models-video-generation.md

## Raw Concept

- **Title**: MilliVid: Hierarchical Latents for Long-Range Consistency in Video Generation
- **Authors**: Ishaan Preetam Chandratreya, David Charatan (MIT), Basile Van Hoorick, Sergey Zakharov, Vitor Guizilini (Toyota RI), Phillip Isola, Vincent Sitzmann (MIT)
- **Type**: arXiv:2606.09056
- **Location**: `raw-sources/arxiv-2606.09056-hierarchical-latents-for-long-range-consistency.pdf`
- **URL**: https://arxiv.org/abs/2606.09056 · https://davidcharatan.com/millivid
- **Retrieved**: 2026-06-10
- **Read status**: read (abstract + method + FramePack comparison)

## Narrative

**MilliVid** attacks long-video **forgetting** under fixed transformer context without retrieval or 3D maps.

**Stage 1 — hierarchical autoencoder:** Each frame → pyramid of token grids (level ℓ has `H/2^ℓ × W/2^ℓ` tokens). Coarse levels = layout/semantics; fine = texture. Random single-level decode training.

**Stage 2 — coarse-to-fine diffusion rollout:** Generate many frames at coarsest level (4 tokens/frame), then medium (16), then fine (64) within fixed sequence budget `S`. Shared transformer weights across scales.

**vs FramePack:** FramePack downsamples past latents but still generates full-res targets and fails to recall off-screen content; MilliVid learns the scale space and allocates token budget explicitly across hierarchy `[TENTATIVE]`.

Evaluated on long **Minecraft** gameplay — recalls scene structure after 256+ frames where full-res AR rollout and FramePack fail.

### Workspace relevance

Alternative to **latent-chaining + seam-stitch** (@concepts/seam-stitching-strategies.md) and **LongLive-RAG** (@concepts/long-video-rag-retrieval.md) for persona long takes — orthogonal (learned hierarchy vs overlap dedup vs retrieval). No open Wan integration yet.

## Snippets

> "Coarse structure … must be faithfully preserved over long time spans … Fine structure … can safely be forgotten."

> "Our method produces substantially more consistent long rollouts … without relying on retrieval or explicit 3D maps."

## Dead Ends

Minecraft-only eval — human/persona video transfer unproven. Research code; no ComfyUI path.
