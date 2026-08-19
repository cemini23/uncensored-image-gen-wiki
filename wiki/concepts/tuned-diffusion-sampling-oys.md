---
title: Tuned diffusion sampling (OYS Bayesian timesteps)
type: concept
tags: [concept, sampling, diffusion, bayesian-optimization]
keywords: [OYS, Align Your Steps, timestep schedule]
related:
  - sources/arxiv-2608-18040-oys-tuned-sampling.md
  - concepts/budget-aware-diffusion-caching.md
  - sweeps/2026-08-19-daily.md
maturity: draft
created: 2026-08-19
updated: 2026-08-19
wire_status: deferred
---

## Relations

@sources/arxiv-2608-18040-oys-tuned-sampling.md @concepts/budget-aware-diffusion-caching.md @sweeps/2026-08-19-daily.md

## Raw Concept

Concept from 2026-08-19 ingest. Axis is **which times to evaluate**, not which features to cache.

## Narrative

Cornell OYS Bayesian-optimizes the sampling grid against the metric you care about, including on distilled models, without retraining weights. Complements ReCache/LinCa (features) and SQuad (architecture). **WATCH** until a schedule table or script ships.

## Snippets

_(see source page)_
