---
title: ""Control-ready uncertainty for trajectory diffusion (arXiv:2610.12431) — SKIP""
type: source
tags: [paper, robotics, uncertainty-quantification, out-of-domain, skip]
keywords: [SCOPE, score curvature, precision matrix, Gaussian tubes, trajectory diffusion, Trajectron, MPPI, Franka Panda, robot motion forecasting]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-12-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-12
updated: 2026-10-12
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-12-daily.md

## Raw Concept

- **Title**: Control-Ready Uncertainty for Trajectory Diffusion
- **Type**: arXiv:2610.12431 (National University of Singapore + LAAS-CNRS; Zhiwei Xue et al.)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.12431
- **Retrieved**: 2026-10-12

## Narrative

**The diffusion model is not the contribution.** SCOPE is an uncertainty head bolted onto an existing diffusion trajectory model. It distills the score model's terminal curvature into a structured precision matrix, producing calibrated per-timestep covariance — "tubes" — without Monte Carlo sampling.

**Results.** Trajectory NLL improves over ensembles (−61.4 against −58.0 for a 256-sample ensemble). Overhead is 12.87 ms total with the precision head at 0.60 ms on an A5000, up to 7x faster than a 256-sample ensemble. Validated on a real Franka Panda arm.

**Why SKIP.** Robot, pedestrian and vehicle motion planning only. There is **no robotics sibling wiki**, and the technique does not suit game AI — it is time-series motion covariance, not behaviour synthesis. It ships no code or weights. Its tube covariance is motion uncertainty over trajectories, not a generation-quality check usable for world-gen, so no Basgiath hook either.

## Snippets

[Source: https://arxiv.org/abs/2610.12431 (retrieved 2026-10-12)]
