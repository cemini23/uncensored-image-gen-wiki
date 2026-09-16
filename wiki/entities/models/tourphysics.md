---
title: TourPhysics
type: entity
tags: [video, world-model, physics, watch]
keywords: [TourPhysics, world model, physics simulation, single-image]
maturity: draft
created: 2026-09-11
updated: 2026-09-16
phase0_verdict: WATCH
wire_status: deferred
related:
  - sources/arxiv-2609-04911-tourphysics.md
  - concepts/world-models-video-generation.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - entities/models/physstream.md
  - sources/arxiv-2609-17521-physstream.md
  - sweeps/2026-09-16-daily.md
---


## Relations

@sources/arxiv-2609-04911-tourphysics.md @concepts/world-models-video-generation.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @entities/models/physstream.md @sources/arxiv-2609-17521-physstream.md @sweeps/2026-09-16-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.04911 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-04911-tourphysics.md

## Narrative

TourPhysics is an online world model that builds a persistent scene from a single image and a declarative physical configuration. The method combines deterministic simulation with video generation, and the simulator fixes each physical and camera trajectory before the generator makes the observation. A quality-gated atomic commit publishes the terminal state and the accepted appearance evidence together. Long-horizon consistency comes from a reference-anchored memory and a geometry-routed cross-view correspondence. The authors extend their earlier PhysOmni work from finite physics-grounded video synthesis to persistent exploration and manipulation. Code: none found. No clone. Image-gen Phase-1: none. wire_status: deferred.
