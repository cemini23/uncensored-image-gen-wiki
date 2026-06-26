---
title: "SteerVTE — seamless video text editing (arXiv:2606.23254)"
type: source
tags: [paper, video-editing, text-rendering, glyph-control, bytedance]
keywords: [SteerVTE, SteerVTE-1M, Text Context Adapter, glyph-aware loss, style encoder, Seedance, video text editing]
related:
  - concepts/video-text-editing-glyph-control.md
  - entities/models/steervte.md
  - sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - sources/arxiv-2606-01362-albedoedit-video-editing.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/seedance-2.md
  - sweeps/2026-06-24-daily.md
  - sources/arxiv-2606-23610-vera-layered-content-preserving-video-editing.md
maturity: draft
read_status: read
created: 2026-06-24
updated: 2026-06-26
---

## Relations

@concepts/video-text-editing-glyph-control.md @entities/models/steervte.md @sources/video-generation-survey-2026.md

## Raw Concept

- **Title**: SteerVTE: Seamless Video Text Editing with Style and Glyph Control
- **Authors**: Kai Zeng, Moran Li, Yingchen Yu, et al. (PKU + ByteDance)
- **Type**: arXiv:2606.23254
- **Location**: `raw-sources/arxiv-2606-23254-2606-23254v1-steervte-seamless-video-text-editin.pdf`
- **URL**: https://arxiv.org/abs/2606.23254
- **Retrieved**: 2026-06-24
- **Read status**: read (abstract + intro)

## Narrative

**SteerVTE** — **video text editing** (change on-screen text while preserving background, style, temporal coherence).

**Approach:** freeze pretrained **text-to-video DiT**; attach lightweight **Text Context Adapter** with:

- **Style encoder** — original text visual attributes (font, color, size)
- **Dual-granularity glyph encoders** — line + character level for target text
- **Glyph-aware spatial-focal loss** — compensates weak text-rendering priors in video foundation models
- **Three-stage curriculum** — SynthTE-Easy (image) → RealTE (image) → SynthTE-Hard (video)

**SteerVTE-1M** — 1M auto-synthesized triplets (source / mask / target) for training.

**Claims:** beats VIVA, Kiwi-Edit, UniVideo on text accuracy + style/temporal metrics; **77% sentence accuracy vs Seedance 2.0 32%** on their eval `[TENTATIVE]`. No public repo at ingest.

### Workspace relevance

Adjacent to subtitle correction / branded text overlays in persona Reels — not yet a local ComfyUI node. Watch for Wan/LTX adapter release.

## Snippets

> "We freeze a pre-trained text-to-video DiT and, through a lightweight Text Context Adapter, enable precise Video Text Editing through style and glyph control."

## Dead Ends

ByteDance — no open weights/repo at ingest; Seedance 2.0 comparison is proprietary baseline.
