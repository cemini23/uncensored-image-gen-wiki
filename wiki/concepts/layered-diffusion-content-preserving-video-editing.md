---
title: Layered diffusion for content-preserving video editing (Vera)
type: concept
tags: [concept, video-editing, layered-diffusion, compositing, alpha-matte]
keywords: [Vera, edit layer, alpha matte, MoT, content preservation, non-destructive editing]
related:
  - sources/arxiv-2606-23610-vera-layered-content-preserving-video-editing.md
  - entities/models/vera.md
  - concepts/disentangled-context-memory-video-edits.md
  - concepts/albedo-guided-instance-video-editing.md
  - concepts/task-isolated-unified-video-editing.md
  - sources/arxiv-2606-01362-albedoedit-video-editing.md
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-26
updated: 2026-06-26
---

## Relations

@sources/arxiv-2606-23610-vera-layered-content-preserving-video-editing.md @entities/models/vera.md

## Raw Concept

Ingest 2026-06-26 from Zheng et al. (arXiv:2606.23610, Netflix) — compositing-first video edit paradigm.

## Narrative

### End-to-end diffusion failure mode

Mask-conditioned full regeneration still **re-paints preserved pixels** — unacceptable in commercial persona clips where identity/background must stay bit-stable outside edit region.

### Vera layered pattern

```
Source video (frozen)
        +
Edit layer + alpha matte (generated via MoT DiT)
        ↓
Composite final clip
```

**MoT:** separate DiTs per layer + joint self-attention → shadows/effects co-generated with edit layer (e.g. object shadow on court, smoke behind cars).

### vs related workspace concepts

| Approach | Preservation mechanism |
|----------|------------------------|
| AlbedoEdit | Intrinsic decomposition + harmonization |
| PermaVid | Disentangled edit memory |
| **Vera** | Explicit alpha compositing layers |

### Build-track note

No open weights at ingest. If Netflix releases, prioritize persona **background swap / prop add** evals against Wan img2vid full-regen baselines.

## Snippets

> "Generates an edit layer together with an alpha matte that can be directly composited with the input video."

## Dead Ends

Proprietary release uncertainty.
