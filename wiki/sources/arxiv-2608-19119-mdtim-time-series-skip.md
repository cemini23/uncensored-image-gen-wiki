---
title: "MDTIM masked-diffusion time-series imputation (arXiv:2608.19119) — skip scientific ML"
type: source
tags: [paper, skip, scientific-ml, time-series, diffusion]
keywords: [MDTIM, masked diffusion, time-series imputation, stochastic discretization, Seoul National University]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-20-daily.md
maturity: draft
read_status: read
created: 2026-08-20
updated: 2026-08-20
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@sweeps/2026-08-20-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: Discretizing Continuous Time Series for Imputation with Masked Diffusion Training
- **Authors**: Dongbin Kim, Seungyun Lee, Geonwoo Shin, Jaewook Lee (Seoul National University)
- **Type**: arXiv:2608.19119 [cs.LG]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608-19119-discretizing-continuous-time-series-for-imputati.pdf`
- **URL**: https://arxiv.org/abs/2608.19119
- **Retrieved**: 2026-08-20
- **Code**: none at ingest.

## Narrative

**Phase-0: SKIP scientific ML.** MDTIM recasts time-series imputation as masked diffusion: a `[MASK]` token structurally orthogonal to observed values, **Stochastic Discretization** (noise-injected tokenization preserving ordinal structure), ordinal-aware soft labeling, expectation-based unmasking, and spectral-consistency regularization. Beats CSDI/SSSD-class continuous-diffusion baselines on ETTh and friends.

Tabular forecasting/ML, not generative media — "masked diffusion" is a shared technique name, not a workflow dependency. Image-gen `wont_wire`. No sibling ROUTE.

## Snippets

> "We propose the Masked Diffusion Time-series Imputation Model (MDTIM), which leverages the training paradigm of masked diffusion model for imputation tasks."

[Source: arxiv-2608.19119, abstract]
