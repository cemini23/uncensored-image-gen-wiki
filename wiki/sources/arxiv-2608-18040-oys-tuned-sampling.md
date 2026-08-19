---
title: "OYS Bayesian-optimized diffusion timesteps (arXiv:2608.18040)"
type: source
tags: [paper, sampling, diffusion, bayesian-optimization, watch]
keywords: [OYS, Optimize Your Sampling, Align Your Steps, timestep schedule, Cornell]
related:
  - concepts/tuned-diffusion-sampling-oys.md
  - concepts/budget-aware-diffusion-caching.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-19-daily.md
maturity: draft
read_status: read
created: 2026-08-19
updated: 2026-08-19
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/tuned-diffusion-sampling-oys.md @concepts/budget-aware-diffusion-caching.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-19-daily.md

## Raw Concept

- **Title**: Optimize Your Sampling: Tuned Diffusion Sampling with Bayesian Optimization
- **Authors**: Travis Zhang, Christian Belardi, Justin Lovelace, Jin Peng Zhou, Saebyeol Shin, Carla P. Gomes, Kilian Q. Weinberger (Cornell)
- **Type**: arXiv:2608.18040 [cs.LG]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.18040-optimize-your-sampling-tuned-diffusion-sampling.pdf`
- **URL**: https://arxiv.org/abs/2608.18040
- **Retrieved**: 2026-08-19
- **Code**: none in PDF. GitHub search negative. No SPDX.

## Narrative

Most speed work changes the **solver** or **which features** to cache. OYS changes the **timestep grid**. Align Your Steps (and similar) optimize a surrogate for quality; OYS treats the schedule as a black box and Bayesian-optimizes the metric you actually score (T2I, inpainting, other image tasks). No extra training; applies to distilled models; Euler and DPM-Solver++ both claimed to improve. A 5-step OYS schedule retains **89–94%** of default-schedule quality in the paper’s numbers.

Operator angle: cheap to try if code appears — it is a schedule table, not a new backbone. **WATCH.** `wire_status: deferred`.

## Snippets

> "We propose Optimizing Your Sampling (OYS), which instead treats timestep selection as a black-box optimization problem, optimizing the target metric directly with Bayesian optimization. OYS outperforms both the default schedules and those of Align Your Steps on text-to-image generation"

[Source: arxiv-2608.18040, abstract]
