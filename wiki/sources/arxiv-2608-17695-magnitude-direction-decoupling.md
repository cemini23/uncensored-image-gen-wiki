---
title: "Magnitude-Direction Decoupling for fast video FM (arXiv:2608.17695)"
type: source
tags: [paper, video, flow-matching, caching, acceleration, huawei, watch]
keywords: [MDD, Magnitude-Direction Decoupling, flow matching, CFG magnitude reuse, lightweight substitute]
related:
  - concepts/magnitude-direction-decoupling.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/squad.md
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

@concepts/magnitude-direction-decoupling.md @concepts/budget-aware-diffusion-caching.md @entities/models/squad.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-19-daily.md

## Raw Concept

- **Title**: Magnitude-Direction Decoupling for Fast Video Generation with Flow Matching Models
- **Authors**: Haonan Xu, Feiyang Chen, Songkui Chen, Hongpeng Pan, Zhefeng Wang, Xinyu Duan, Baoxing Huai, Yang Yang (NJUST / Huawei)
- **Type**: arXiv:2608.17695 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.17695-magnitude-direction-decoupling-for-fast-video-ge.pdf`
- **URL**: https://arxiv.org/abs/2608.17695
- **Retrieved**: 2026-08-19
- **Code**: none in PDF. GitHub search negative. No SPDX.

## Narrative

Huawei/NJUST training-time-optional? inference recipe for **flow-matching video**: not every denoising step needs the full teacher. Naive cache or a cheap student drifts off the teacher trajectory. Empirical split: a lightweight model tracks **magnitude** of the teacher output; a cache tracks **direction**. MDD substitutes a direction-calibrated lightweight model on selected steps and reuses magnitude under CFG to cut a second full forward.

Different axis from SQuad (attention-kernel + step distill on Wan 2.2 5B) and from ReCache/LinCa (feature reuse). Persona video: possible Wan/Hunyuan sampler plugin if code ever ships. **WATCH.** No GitHub. `wire_status: deferred`. No Image-gen Phase-1.

## Snippets

> "Through empirical analysis, we find that lightweight models can robustly capture the magnitude components of the original model's output, while caching provides reliable directional guidance."

[Source: arxiv-2608.17695, abstract]
