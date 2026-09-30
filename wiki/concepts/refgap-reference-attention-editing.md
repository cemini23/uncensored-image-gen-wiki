---
title: RefGAP reference-attention correction (visual editing)
type: concept
tags: [editing, reference, diffusion]
keywords: [RefGAP, reference attention gap]
related:
  - sources/arxiv-2609-35708-refgap-visual-editing.md
  - entities/adapters/ip-adapter.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/persona-audio-stack.md
  - sweeps/2026-09-29-daily.md
maturity: draft
created: 2026-09-29
updated: 2026-09-29
---

## Relations

@sources/arxiv-2609-35708-refgap-visual-editing.md @entities/adapters/ip-adapter.md @concepts/reference-plus-lora-stacking.md

## Raw Concept

What causes reference-image drift in diffusion editing, and how RefGAP-style attention correction differs from IP-Adapter stacking alone.

## Narrative

**RefGAP** names a **reference-attention gap** in diffusion **visual editing**: the model underuses reference tokens so identity and layout drift. Mitigation is training-time or inference-time attention correction, not just higher IP-Adapter weight. Persona pipelines should compare RefGAP-style editors against Redux/Kontext for same-seed edits.

## Snippets

[Source: https://arxiv.org/abs/2609.35708 (retrieved 2026-09-29)]
