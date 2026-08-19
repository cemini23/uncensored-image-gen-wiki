---
title: Magnitude-Direction Decoupling for flow-matching video
type: concept
tags: [concept, video, flow-matching, caching, acceleration]
keywords: [MDD, magnitude, direction, CFG reuse, Huawei]
related:
  - sources/arxiv-2608-17695-magnitude-direction-decoupling.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/squad.md
  - sweeps/2026-08-19-daily.md
maturity: draft
created: 2026-08-19
updated: 2026-08-19
wire_status: deferred
---

## Relations

@sources/arxiv-2608-17695-magnitude-direction-decoupling.md @concepts/budget-aware-diffusion-caching.md @entities/models/squad.md @sweeps/2026-08-19-daily.md

## Raw Concept

Concept from 2026-08-19 ingest. Not dumped into SQuad (kernel distill) or ReCache (step budgets).

## Narrative

Split the teacher velocity/score into **magnitude** (cheap student) and **direction** (cache), then CFG-reuse magnitude. Goal is fewer full FM forwards without walking off the teacher path. Paper-only Huawei/NJUST. Watch if a Comfy/Wan sampler plugin appears.

## Snippets

_(see source page)_
