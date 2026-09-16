---
title: "TourPhysics physics for world models (arXiv:2609.04911)"
type: source
tags: [paper, video, world-model, physics, watch]
keywords: [world model, physical simulation, camera control, video generation]
maturity: draft
read_status: read
created: 2026-09-11
updated: 2026-09-16
phase0_verdict: WATCH
wire_status: deferred
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - concepts/world-models-video-generation.md
  - entities/models/tourphysics.md
  - entities/models/physstream.md
  - sources/arxiv-2609-17521-physstream.md
  - sweeps/2026-09-16-daily.md
---


## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @concepts/world-models-video-generation.md @entities/models/tourphysics.md @entities/models/physstream.md @sources/arxiv-2609-17521-physstream.md @sweeps/2026-09-16-daily.md

## Raw Concept

- **Title**: TourPhysics: Bringing Physics to World Models for Exploration and Manipulation from a Single Image
- **Type**: arXiv:2609.04911 [cs.CV]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.04911
- **Code**: none found
- **Retrieved**: 2026-09-11

## Narrative

The paper presents TourPhysics, an online world-model framework that starts from one image and a declarative physical configuration. The framework separates observation from physical intervention: the simulator fixes a physical and camera trajectory before the generator makes the observation. A quality gate then commits the terminal state and the accepted appearance evidence as one atomic step. A reference-anchored memory retrieves accepted static appearance through geometric cross-view correspondence. The authors report closer trajectory alignment, better input-scene preservation, and less appearance drift on long-horizon revisits than the baselines. Image-gen Phase-1: none.

## Snippets

> On simulator-defined camera tours and object manipulations, TourPhysics follows prescribed camera and object trajectories more closely than the evaluated baselines, preserves the input scene, and reduces appearance drift during long-horizon revisits. [Source: arxiv-2609.04911]
