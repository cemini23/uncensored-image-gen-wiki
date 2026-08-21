---
title: DynaForcing — Self-Forcing distillation for streaming avatars
type: entity
tags: [lipsync, avatar, streaming, self-forcing, watch]
keywords: [DynaForcing, dynamic collapse, 45.2 FPS, USTC, audio-driven]
related:
  - sources/arxiv-2608-17707-dynaforcing.md
  - entities/persona-ops/personalive.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/efficientsync.md
  - sources/arxiv-2608-18832-efficientsync.md
  - entities/lipsync/anytalk.md
  - entities/models/self-gradient-forcing.md
  - entities/models/stream4d.md
  - sources/arxiv-2608-19556-stream4d.md
  - sweeps/2026-08-19-daily.md
  - sweeps/2026-08-21-daily.md
maturity: draft
created: 2026-08-19
updated: 2026-08-21
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-17707-dynaforcing.md @entities/persona-ops/personalive.md @entities/lipsync/latentsync.md @entities/lipsync/anytalk.md @entities/models/self-gradient-forcing.md @entities/models/stream4d.md @sources/arxiv-2608-19556-stream4d.md @sweeps/2026-08-19-daily.md @sweeps/2026-08-21-daily.md

## Raw Concept

Entity from 2026-08-19 ingest. Paper-only. Highest-leverage **live avatar** paper this batch.

## Narrative

Self-Forcing students for audio-driven streaming avatars can look good frame-wise and still **lock the mouth**. DynaForcing is the distillation countermeasure; authors show restored visemes and **45.2 FPS**.

| Stack | Role |
| --- | --- |
| PersonaLive | CONDITIONAL-GO Comfy live portrait — production candidate |
| LatentSync | Batch 2D latent lipsync (DM talking-head) |
| AnyTalk | 3D blendshape, not 2D video student |
| Self Gradient Forcing | Same Self-Forcing family, long AR video not lips |

**WATCH HIGH.** No GitHub. `wire_status: deferred`. No Image-gen Phase-1.

## Snippets

_(see source page)_
