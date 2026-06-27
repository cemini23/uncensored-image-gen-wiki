---
title: Score gradient matching video distillation (SGMD)
type: concept
tags: [concept, video-generation, distillation, few-step, training]
keywords: [SGMD, DMD2, fake score, dual potentials, motion dynamics, LightX2V]
related:
  - sources/arxiv-2605-30116-sgmd-score-gradient-matching-distillation.md
  - concepts/one-step-autoregressive-video-distillation.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-27
updated: 2026-06-27
---

## Relations

@sources/arxiv-2605-30116-sgmd-score-gradient-matching-distillation.md @concepts/one-step-autoregressive-video-distillation.md @entities/models/wan-2-2.md

## Raw Concept

Ingest 2026-06-27 from arXiv:2605.30116 — DMD2 alternative for few-step video distill training.

## Narrative

### vs DMD2 failure mode

Reverse-KL DMD matching is **mode-seeking** → weak motion in 4-step Wan distills; fake-score inner loop is expensive when generator moves every step.

### SGMD pattern

```
Teacher (frozen) ← Fisher stop-grad objective
        ↑
Fake score ← RC inner tracking (1 update/iter)
        ↑
Generator ← NR outer correction
```

**Outcome:** ~3× faster training + better motion vs DMD2 on Wan2.1-T2V-14B `[TENTATIVE]`.

### vs AAD-1 (@concepts/one-step-autoregressive-video-distillation.md)

| | SGMD | AAD-1 |
|---|------|-------|
| Target | Few-step (e.g. 4) bidirectional T2V | 1-step AR I2V |
| Pain point | DMD training cost + motion | Motion collapse in 1-step AR |

Code: `ModelTC/LightX2V` — Phase-0 **CONDITIONAL-GO** (broad inference framework; SGMD is training submodule).

## Snippets

> "Negative-residual (NR) for outer-loop correction and residual-contraction (RC) for inner-loop tracking."

## Dead Ends

Training-only until pre-distilled Wan weights published for local inference.
