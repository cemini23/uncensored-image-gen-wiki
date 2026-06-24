---
title: Video text editing with glyph and style control
type: concept
tags: [concept, video-editing, text-rendering, glyph-control]
keywords: [video text editing, SteerVTE, glyph encoder, style encoder, temporal coherence, text context adapter]
related:
  - sources/arxiv-2606-23254-steervte-video-text-editing.md
  - entities/models/steervte.md
  - sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - sources/arxiv-2606-01362-albedoedit-video-editing.md
  - entities/models/wan-2-2.md
  - entities/models/seedance-2.md
maturity: draft
created: 2026-06-24
updated: 2026-06-24
---

## Relations

@sources/arxiv-2606-23254-steervte-video-text-editing.md @entities/models/steervte.md

## Raw Concept

Ingest 2026-06-24 from Zeng et al. (arXiv:2606.23254, ByteDance) — specialized VTE beyond object-level video editors.

## Narrative

### Failure modes of naive VTE pipelines

| Approach | Failure |
|----------|---------|
| Per-frame image edit | Temporal flicker, style drift |
| First-frame edit + I2V | Motion hallucination, content drift |
| General V2V (Wan/LTX/Hunyuan) | Garbled glyphs — weak text priors |

### SteerVTE control surface

- **Style encoder** — preserve original text appearance
- **Line + character glyph encoders** — target string precision
- **Glyph-aware spatial-focal loss** — stroke-level supervision
- **3-stage curriculum** — image easy → real image → hard video triplets (SteerVTE-1M)

### Persona ops use case

Subtitle fixes, on-screen promo text swaps in Reels without re-shooting — requires temporal coherence absent from FLUX/Qwen-Image frame loops.

### Build-track note

No open weights at ingest. Distinct from @sources/arxiv-2606-08260-tide-unified-video-editing.md (general instruction editing) and @sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md (multi-turn object edits).

## Snippets

> "Pre-trained video foundation models are optimized primarily for general scene generation rather than fine-grained text rendering."

## Dead Ends

ByteDance proprietary stack at ingest — no ComfyUI node.
