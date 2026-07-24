---
title: "Progressive Seed Pruning — inference-time diffusion scaling (arXiv:2607.21591)"
type: source
tags: [paper, diffusion, inference-scaling, mit]
keywords: [PSP, Progressive-Seed-Pruning, Best-of-N, FK-Steering, GenEval, SDXL]
related:
  - entities/models/progressive-seed-pruning.md
  - concepts/budget-aware-diffusion-caching.md
  - concepts/ditango-parallel-diffusion-attention.md
  - sweeps/2026-07-24-daily.md
maturity: draft
read_status: read
created: 2026-07-24
updated: 2026-07-24
---

## Relations

@entities/models/progressive-seed-pruning.md @concepts/budget-aware-diffusion-caching.md

## Raw Concept

- **Title**: Inference-Time Scaling of Diffusion Models via Progressive Seed Pruning
- **Authors**: Rogério Guimarães, Pietro Perona (Caltech)
- **Type**: arXiv:2607.21591
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.21591-inference-time-scaling-of-diffusion-models-via-p.pdf`
- **Code**: https://github.com/rogerioagjr/PSP — **MIT**
- **Retrieved**: 2026-07-24

## Narrative

Front-load seed exploration, score intermediate denoised estimates, prune trajectories under fixed model-eval budget. Beats Best-of-N / FK-Steering on GenEval (SD1.5 / SDXL / SD3.5).

**Phase-0: CONDITIONAL-GO** — MIT confirmed. Local clone `~/Desktop/projects/PSP` (~260 MB). Run on CUDA with existing SDXL/FLUX stacks; no new multi-GB weight download required beyond operator's existing backbones.

## Snippets

_(none)_
