---
title: "UniTemp — any-direction AR video via bidirectional distillation (arXiv:2606.18702)"
type: source
tags: [paper, video-generation, autoregressive, bidirectional, distillation, adobe]
keywords: [UniTemp, blockwise anchor latents, causal 3D VAE, backward generation, inbetween, video extension, Adobe Research]
related:
  - concepts/bidirectional-autoregressive-video-generation.md
  - entities/models/unitemp.md
  - concepts/autoregressive-video-foresight-training.md
  - concepts/one-step-autoregressive-video-distillation.md
  - concepts/long-video-rag-retrieval.md
  - concepts/seam-stitching-strategies.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-19-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-06-19
updated: 2026-06-19
---

## Relations

@concepts/bidirectional-autoregressive-video-generation.md @entities/models/unitemp.md @concepts/autoregressive-video-foresight-training.md @concepts/seam-stitching-strategies.md

## Raw Concept

- **Title**: UniTemp: Unlocking Video Generation in Any Temporal Order via Bidirectional Distillation
- **Authors**: Lin Zhang, Sicheng Mo, Zefan Cai et al. (UW Madison, Adobe Research, UCLA, UC Davis)
- **Type**: arXiv:2606.18702
- **Location**: `raw-sources/arxiv-2606.18702-unitemp-unlocking-video-generation-in-any-tempor.pdf`
- **URL**: https://arxiv.org/abs/2606.18702 · https://lzhangbj.github.io/projects/unitemp/
- **Retrieved**: 2026-06-19
- **Read status**: read (abstract + anchor latent mechanism)

## Narrative

**Problem:** AR video models only generate **forward** — real editing needs backward extension, inbetween fill, loop/story workflows.

**Root cause of backward flicker:** **Causal 3D VAE** (Wan/Cosmos/Hunyuan lineage) encodes latents with past-only context — backward blocks lack expected past at boundaries.

**UniTemp fix:** **Blockwise anchor latents** — auxiliary preceding latents co-denoised under full attention to proxy missing past context. No VAE retrain required.

**Training:** Bidirectional distillation from frozen teacher → single AR student for any temporal direction. KV-cache at inference.

**Applications:** Forward/backward extension, inbetween, looping long shots, scene transitions, visual story from keyframes.

**Release:** Project page only — no public repo at ingest `[NEEDS VERIFICATION 2026-06-19]`.

### Workspace relevance

Replaces manual **seam-stitch + re-anchor** loops (@concepts/seam-stitching-strategies.md) for persona multi-clip reels if weights ship on Wan-class backbone.

## Snippets

> "We introduce blockwise anchor latents, a mechanism that restores the missing past context at block boundaries during backward generation."

> "UniTemp flexibly conditions on past context, future context, or both, enabling any-direction video generation."

## Dead Ends

Adobe Research — commercial release uncertain. Distillation requires teacher access; not plug-in for existing local Wan graphs without official release.
