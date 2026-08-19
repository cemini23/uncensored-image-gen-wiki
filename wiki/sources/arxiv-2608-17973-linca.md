---
title: "LinCa learnable decomposed feature caching (arXiv:2608.17973)"
type: source
tags: [paper, caching, diffusion, flux, qwen-image, hunyuan, watch]
keywords: [LinCa, invertible network, Decompose-Predict-Reconstruct, feature caching, 6.95x]
related:
  - entities/models/linca.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/qwen-image-2512.md
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

@entities/models/linca.md @concepts/budget-aware-diffusion-caching.md @entities/models/qwen-image-2512.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-19-daily.md

## Raw Concept

- **Title**: LinCa: Accelerating Diffusion Models via Learnable Decomposed Feature Caching
- **Authors**: Jinshan Liu, Haoran Qin, Xiaobing Tu, Jiacheng Liu, et al. (SJTU / Alibaba Cloud / XJTU / SDU / SCUT / Jilin)
- **Type**: arXiv:2608.17973 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.17973-linca-accelerating-diffusion-models-via-learnabl.pdf`
- **URL**: https://arxiv.org/abs/2608.17973
- **Retrieved**: 2026-08-19
- **Code**: `QHR69/LinCa` is README-only (“release after unblinding”). **license null / no SPDX.** Do **not** clone.

## Narrative

Learnable feature cache: an invertible net splits cached activations into components with different continuity, then applies **matched prediction orders** and reconstructs (Decompose–Predict–Reconstruct). Authors argue uniform training-free predictors (TaylorSeer-class) break at high acceleration. Claims ~5–7× on FLUX, Qwen-Image (figure: 6.95×), HunyuanVideo with &lt;0.2% extra params.

Sibling to ReCache (learned *which steps* to recompute) and BudCache (search a budgeted schedule). LinCa is a *learned predictor on decomposed features*. **WATCH.** Empty GitHub → no local adopt. `wire_status: deferred`.

## Snippets

> "We propose LinCa, a feature caching framework based on learnable invertible networks. LinCa decomposes cached features into sub-components with distinct continuity properties via a lightweight invertible network and applies differentiated prediction orders matched to each component."

[Source: arxiv-2608.17973, abstract]
