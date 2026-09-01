---
title: ChebBooster — training-free Chebyshev DiT extrapolation
type: entity
tags: [model, dit, acceleration, training-free, mit, watch]
keywords: [ChebBooster, Chebyshev, FLUX, PixArt, DiT]
related:
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/linca.md
  - entities/models/sparsepr.md
  - entities/models/wan-2-2.md
  - entities/models/noiseasier.md
  - sources/arxiv-2608-30194-noiseasier.md
  - sources/arxiv-2608-23429-chebbooster.md
  - sweeps/2026-08-25-daily.md
maturity: draft
created: 2026-08-25
updated: 2026-08-25
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-23429-chebbooster.md @entities/models/sparsepr.md @entities/models/linca.md @concepts/budget-aware-diffusion-caching.md @entities/models/wan-2-2.md @sweeps/2026-08-25-daily.md

## Raw Concept

Entity from 2026-08-25 ingest of arXiv:2608.23429. **GO code** MIT; no Image-gen Phase-1.

## Narrative

Chebyshev barycentric skip of DiT timesteps. Code for DiT / FLUX / PixArt-Σ.

| Check | Result |
| --- | --- |
| Code | `Kiramei/ChebBooster` MIT; `.local/adopts/ChebBooster` |
| vs SparsePR | SparsePR sparsifies *attention*; ChebBooster extrapolates *timesteps* |
| vs LinCa | LinCa is a learned cache; this is training-free polynomials |

**Phase-1:** none (`deferred`).

## Snippets

_(see source page)_
