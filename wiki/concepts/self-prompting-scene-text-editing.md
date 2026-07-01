---
title: Self-prompting scene text editing (MSTEdit)
type: concept
tags: [concept, image-editing, text-rendering, glyph-control, flux]
keywords: [MSTEdit, scene text editing, self-prompting, FLUX-Fill, in-context learning, style preservation]
related:
  - sources/arxiv-2605-15523-self-prompting-scene-text-editing.md
  - concepts/video-text-editing-glyph-control.md
  - sources/arxiv-2606-23254-steervte-video-text-editing.md
  - entities/models/flux-1-dev.md
  - entities/models/steervte.md
  - sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md
  - concepts/causal-multi-turn-image-editing.md
  - entities/models/steervte.md
  - sweeps/2026-07-01-daily.md
maturity: draft
created: 2026-07-01
updated: 2026-07-01
---

## Relations

@sources/arxiv-2605-15523-self-prompting-scene-text-editing.md @concepts/video-text-editing-glyph-control.md @entities/models/flux-1-dev.md

## Raw Concept

Ingest 2026-07-01 from Li et al. (arXiv:2605.15523, ICML 2026) — FLUX-Fill scene text edit via in-context style/glyph prompts from the masked region itself.

## Narrative

### Image vs video text editing split

| Modality | Representative | Conditioning trick |
|----------|----------------|-------------------|
| **Still image** | **MSTEdit** | Self-prompt from target region → FLUX-Fill MM-DiT ICL |
| Video | SteerVTE | Text Context Adapter + glyph-aware loss on frozen T2V DiT |

Both solve **style-consistent glyph swap** — not green-screen text overlay. Distinct from general inpainting (@sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md object edits).

### Failure modes MSTEdit addresses

| Naive approach | Failure |
|----------------|---------|
| Background-only conditioning | Loses original text stroke/font → becomes generic rendering |
| External glyph encoder | Limits open vocabulary / multilingual edits |
| Per-frame FLUX edit on video | N/A for MSTEdit (image-only at paper) — see SteerVTE for temporal |

### Persona ops use case

Swap promo text on a finished persona still (handle, discount code, event title) while preserving neon/signage style — 11-language coverage for international persona variants.

### Build-track note

Phase-0 **WATCH** — Meitu research; NC license; no public weights. When released, stacks on @entities/models/flux-1-dev.md Fill graphs already in ComfyUI persona workflows.

## Snippets

> "Existing methods rely solely on image background information while neglecting the visual details of target regions, which discards stylistic features in the original text."

## Dead Ends

Commercial persona monetization blocked by CC BY-NC 4.0 until license clarified.
