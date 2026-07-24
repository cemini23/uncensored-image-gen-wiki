---
title: Progressive Seed Pruning (Caltech — inference-time diffusion scaling)
type: entity
tags: [model, technique, diffusion, inference-scaling, mit]
keywords: [PSP, Best-of-N, seed-search, GenEval]
related:
  - sources/arxiv-2607-21591-progressive-seed-pruning.md
  - concepts/budget-aware-diffusion-caching.md
  - concepts/ditango-parallel-diffusion-attention.md
  - sweeps/2026-07-24-daily.md
maturity: draft
created: 2026-07-24
updated: 2026-07-24
---

## Relations

@sources/arxiv-2607-21591-progressive-seed-pruning.md @concepts/budget-aware-diffusion-caching.md

## Raw Concept

Entity from 2026-07-24 Phase-0 of arXiv:2607.21591 / github.com/rogerioagjr/PSP.

## Narrative

| Field | Value |
|-------|--------|
| Paper | arXiv:2607.21591 |
| Code | `github.com/rogerioagjr/PSP` — **MIT** |
| Local clone | `~/Desktop/projects/PSP` (~260 MB, 2026-07-24) |

### Phase-0

**CONDITIONAL-GO** — `run_psp.py` quickstart under `Fk-Diffusion-Steering/text_to_image/`. Uses operator SDXL/SD3.5 weights; CUDA preferred.
