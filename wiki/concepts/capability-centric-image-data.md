---
title: Capability-centric data design for generalist image generation
type: concept
tags: [concept, dataset, curriculum, t2i]
keywords: [capability engines, curriculum scheduling, grounding, transformation, knowledge association]
related:
  - sources/arxiv-2608-18076-capability-centric-image-data.md
  - sweeps/2026-08-19-daily.md
maturity: draft
created: 2026-08-19
updated: 2026-08-19
wire_status: deferred
---

## Relations

@sources/arxiv-2608-18076-capability-centric-image-data.md @sweeps/2026-08-19-daily.md

## Raw Concept

Concept from 2026-08-19 Alibaba paper. Data-ops pattern, not a checkpoint.

## Narrative

Build three relational supervision engines (grounding / image-to-image transform / knowledge) and **curriculum-schedule** them in dependency order instead of mixing isolated task dumps. Caption experts keep T2I and edit labels aligned. For persona LoRA sets: don’t start high-res identity+style+layout in one bucket.

**WATCH.** No author code. `wire_status: deferred`.

## Snippets

_(see source page)_
