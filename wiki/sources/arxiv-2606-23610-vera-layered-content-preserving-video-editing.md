---
title: "Vera — layered diffusion for content-preserving video editing (arXiv:2606.23610)"
type: source
tags: [paper, video-editing, layered-diffusion, compositing, netflix]
keywords: [Vera, edit layer, alpha matte, Mixture-of-Transformers, MoT, content preservation, VFX, Netflix]
related:
  - concepts/layered-diffusion-content-preserving-video-editing.md
  - entities/models/vera.md
  - sources/arxiv-2606-01362-albedoedit-video-editing.md
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - sources/arxiv-2606-23254-steervte-video-text-editing.md
  - concepts/disentangled-context-memory-video-edits.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - sweeps/2026-06-26-daily.md
maturity: draft
read_status: read
created: 2026-06-26
updated: 2026-06-26
---

## Relations

@concepts/layered-diffusion-content-preserving-video-editing.md @entities/models/vera.md @sources/arxiv-2606-08260-tide-unified-video-editing.md

## Raw Concept

- **Title**: Vera: A Layered Diffusion Model for Content-Preserving Video Editing
- **Authors**: Hongkai Zheng, Ta-Ying Cheng, Benjamin Klein, Yisong Yue, Zhuoning Yuan (Caltech + Netflix)
- **Type**: arXiv:2606.23610
- **Location**: `raw-sources/arxiv-2606.23610-vera-a-layered-diffusion-model-for-content-prese.pdf`
- **URL**: https://arxiv.org/abs/2606.23610 · https://vera-layered-diffusion.github.io/
- **Retrieved**: 2026-06-26
- **Read status**: read (abstract + layered architecture)

## Narrative

**Vera** — **layered diffusion** for **content-preserving video editing**: generates **edit layer + alpha matte** composited over source video instead of full regeneration.

**Architecture:** extend text-to-video DiT to **Mixture-of-Transformers (MoT)** — separate DiTs per layer with **joint self-attention** for coherent composition.

**Training:** 486K-frame layered dataset with accurate mattes, diverse dynamics, VFX.

Tasks: object addition (with shadows), background replacement, relighting — preserves non-edit regions by design vs mask-conditioned end-to-end editors.

### Workspace relevance

Production-grade **region-preserving** persona clip edits (outfit swap, background change) without identity drift on preserved pixels. No public weights at ingest — watch Netflix release.

## Snippets

> "Separating creative editing from content preservation by design."

## Dead Ends

Netflix proprietary — no open repo/weights at ingest.
