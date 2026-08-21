---
title: Stream4D — 4D-consistency reward for streaming AR video
type: entity
tags: [model, video, streaming, autoregressive, 4d-consistency, watch]
keywords: [Stream4D, 4D reconstruction, motion prior, Wan2.1, UCLA]
related:
  - concepts/world-models-video-generation.md
  - entities/lipsync/dynaforcing.md
  - entities/models/wan-2-2.md
  - sources/arxiv-2608-19556-stream4d.md
  - sweeps/2026-08-21-daily.md
maturity: draft
created: 2026-08-21
updated: 2026-08-21
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-19556-stream4d.md @entities/models/wan-2-2.md @entities/lipsync/dynaforcing.md @concepts/world-models-video-generation.md @sweeps/2026-08-21-daily.md

## Raw Concept

Entity from 2026-08-21 ingest of arXiv:2608.19556. Project page only; no code clone. Image-gen Phase-1: none.

## Narrative

Feed-forward 4D reconstruction reward + motion prior for streaming AR diffusion. Addresses 3DGS-critic freeze-the-video shortcut. Wan2.1 mentioned as a few-step backbone.

| Check | Result |
| --- | --- |
| Code | `banyuanhao/Stream4D` = GitHub Pages. **Not cloned.** |
| Weights | None shipped with the project site |
| vs DynaForcing | DynaForcing fixes Self-Forcing viseme freeze on avatars; Stream4D is a 4D world-consistency *reward* for AR video |
| Production | Wan + DynaForcing / PersonaLive unchanged |

**Phase-1:** none (`deferred`). Re-check when training/inference code + SPDX land.

## Snippets

_(see source page)_
