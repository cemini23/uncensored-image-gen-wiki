---
title: EfficientSync — real-time lipsync via reference texture mixing
type: entity
tags: [lipsync, talking-head, real-time, deformation, watch]
keywords: [EfficientSync, Dynamic Texture Mixer, STAM, STAR Sampling, 166 FPS]
related:
  - concepts/persona-audio-stack.md
  - entities/lipsync/dynaforcing.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/musetalk.md
  - entities/persona-ops/personalive.md
  - sources/arxiv-2608-18832-efficientsync.md
  - sweeps/2026-08-20-daily.md
maturity: draft
created: 2026-08-20
updated: 2026-08-20
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-18832-efficientsync.md @entities/lipsync/latentsync.md @entities/lipsync/dynaforcing.md @entities/persona-ops/personalive.md @entities/lipsync/musetalk.md @concepts/persona-audio-stack.md @sweeps/2026-08-20-daily.md

## Raw Concept

Entity from 2026-08-20 ingest. Project page only — no GitHub. Highest-leverage **2D mouth-edit** paper this batch.

## Narrative

Deformation-based lipsync: warp a diverse reference pool, mix with Dynamic Texture Mixer, composite via STAM. 166 FPS claimed. Goal is keep real teeth/lip texture instead of GAN/diffusion redraw.

| Stack | Role |
| --- | --- |
| LatentSync | Batch 2D latent talking-head (production) |
| MuseTalk | Real-time latent inpaint (~30 FPS) |
| DynaForcing | Self-Forcing streaming *avatar* viseme fix (paper-only) |
| PersonaLive | CONDITIONAL-GO live portrait |

**WATCH HIGH.** Not a production swap. `deferred`. No Image-gen Phase-1.

## Snippets

_(see source page)_
