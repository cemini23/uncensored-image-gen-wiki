---
title: One-step video object removal (D2DF)
type: concept
tags: [concept, video-editing, object-removal, distillation, one-step]
keywords: [D2DF, draft-free, PPCD, SGFP, CogVideoX erase, persona B-roll cleanup]
related:
  - sources/arxiv-2607-14976-d2df-one-step-video-object-removal.md
  - entities/models/d2df.md
  - entities/models/cogvideox-1-5.md
  - concepts/albedo-guided-instance-video-editing.md
  - concepts/task-isolated-unified-video-editing.md
  - concepts/video-identity-inheritance.md
  - entities/models/wan-2-2.md
  - sweeps/2026-07-17-daily.md
maturity: draft
created: 2026-07-17
updated: 2026-07-17
---

## Relations

@sources/arxiv-2607-14976-d2df-one-step-video-object-removal.md @entities/models/d2df.md @entities/models/cogvideox-1-5.md @concepts/video-identity-inheritance.md @concepts/albedo-guided-instance-video-editing.md @concepts/task-isolated-unified-video-editing.md @entities/models/wan-2-2.md

## Raw Concept

Synthesized from D2DF ingest 2026-07-17 — one-step erase vs multi-step ProPainter / DiffuEraser / ROSE class pipelines.

## Narrative

Traditional video object removal is fast but "drafty"; diffusion erase is high quality but multi-step and hallucination-prone. **D2DF** bridges them: distill a draft-guided teacher into a **1-step** generator, then plant pseudo-drafts so the final model needs no external draft.

### Persona ops

- Clean unwanted people/props from Wan/CogVideoX persona clips
- Prefer D2DF-DF when masks are available and draft tooling is too heavy
- Still identity-sensitive — verify face/body drift after erase

Phase-0: **CONDITIONAL-GO** on Apache code; weights deferred (CogVideoX-5B class).
