---
title: Parallel Decoding Distillation (PDD)
type: concept
tags: [concept, distillation, video-generation, acceleration, nvidia]
keywords: [PDD, parallel-decoder, NFE, FastGen, Wan, LTX]
related:
  - sources/arxiv-2607-26004-pdd.md
  - concepts/one-step-autoregressive-video-distillation.md
  - concepts/score-gradient-matching-video-distillation.md
  - entities/models/wan-2-2.md
  - entities/models/ltx-2.md
  - entities/models/qwen-image-2512.md
  - sweeps/2026-07-29-daily.md
maturity: draft
created: 2026-07-29
updated: 2026-07-29
---

## Relations

@sources/arxiv-2607-26004-pdd.md @concepts/one-step-autoregressive-video-distillation.md @entities/models/wan-2-2.md @entities/models/ltx-2.md

## Raw Concept

How to cut Wan/LTX/Qwen-Image NFE without VSD/adversarial mode collapse?

## Narrative

PDD trains a parallel decoder to emit a block of mean velocities per evaluation; fused linear at inference. Claims SOTA 4–8 NFE with better diversity than DMD2/AnyFlow-class recipes. Track NVlabs/fastgen for drop.

## Snippets

_(none)_
