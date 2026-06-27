---
title: "SGMD — score gradient matching distillation for few-step video (arXiv:2605.30116)"
type: source
tags: [paper, video-generation, distillation, few-step, dmd, wan]
keywords: [SGMD, score gradient matching, DMD2, fake score, dual potentials, NR, RC, LightX2V, motion dynamics]
related:
  - concepts/score-gradient-matching-video-distillation.md
  - concepts/one-step-autoregressive-video-distillation.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-27-daily.md
maturity: draft
read_status: read
created: 2026-06-27
updated: 2026-06-27
---

## Relations

@concepts/score-gradient-matching-video-distillation.md @concepts/one-step-autoregressive-video-distillation.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: SGMD: Score Gradient Matching Distillation for Few-Step Video Diffusion Distillation
- **Type**: arXiv:2605.30116
- **Location**: `raw-sources/arxiv-2605.30116-sgmd-score-gradient-matching-distillation.pdf`
- **URL**: https://arxiv.org/abs/2605.30116 · https://github.com/ModelTC/LightX2V
- **Retrieved**: 2026-06-27
- **Read status**: read (abstract + DMD comparison)

## Narrative

**SGMD** — alternative to **DMD2** for few-step video distillation. Optimizes fake score toward teacher with stop-gradient Fisher objective; **dual potentials** — negative-residual (NR) outer correction + residual-contraction (RC) inner tracking.

Claims **~3× training speedup** vs DMD2 and **better motion dynamics** on 4-step Wan2.1-T2V-14B distill while preserving temporal consistency `[TENTATIVE]`.

Code in **LightX2V** framework. Phase-0: **CONDITIONAL-GO** — `ModelTC/LightX2V` Apache-2.0 — `briefs/2026-06-27_phase-0-navicache-lora-optimizer-confucius4.md`.

## Snippets

> "Compared to DMD2, SGMD achieves an approximately ~3× training speedup and substantially improves motion dynamics."

## Dead Ends

Distillation training stack — not inference-only persona path unless distilled weights ship for Wan 2.2.
