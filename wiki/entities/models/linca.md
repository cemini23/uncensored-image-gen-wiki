---
title: LinCa — learnable decomposed feature caching
type: entity
tags: [model, caching, diffusion, flux, qwen-image, watch]
keywords: [LinCa, invertible cache, Decompose-Predict-Reconstruct]
related:
  - sources/arxiv-2608-17973-linca.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/qwen-image-2512.md
  - entities/models/sparsepr.md
  - sources/arxiv-2608-18484-sparsepr.md
  - sweeps/2026-08-19-daily.md
maturity: draft
created: 2026-08-19
updated: 2026-08-20
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-17973-linca.md @concepts/budget-aware-diffusion-caching.md @entities/models/qwen-image-2512.md @sweeps/2026-08-19-daily.md

## Raw Concept

Entity from 2026-08-19 ingest. `QHR69/LinCa` README stub, **no SPDX** — do not clone.

## Narrative

Learnable invertible cache for FLUX / Qwen-Image / HunyuanVideo. Claimed 5–7× (6.95× on Qwen-Image in Fig. 1) with tiny extra params. Sibling of ReCache/BudCache/NaviCache (schedules) not SQuad (attention distill).

**WATCH** until code+LICENSE land. `wire_status: deferred`.

## Snippets

_(see source page)_
