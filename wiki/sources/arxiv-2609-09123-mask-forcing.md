---
title: "Mask Forcing autoregressive video diffusion (arXiv:2609.09123)"
type: source
tags: [paper, video, diffusion, autoregressive, watch]
keywords: [autoregressive video diffusion, distillation, DMD, rollout]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - entities/models/mask-forcing.md
maturity: draft
read_status: read
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @entities/models/mask-forcing.md

## Raw Concept

- **Title**: Mask Forcing: Improving Autoregressive Video Diffusion Distillation via Dual-Noise Masking Rollout
- **Type**: arXiv:2609.09123 [cs.CV]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.09123
- **Code**: none found
- **Retrieved**: 2026-09-11

## Narrative

The paper studies autoregressive (AR) video diffusion distillation. It states that self-rollout training with a Distribution Matching Distillation (DMD) loss causes over-saturated and over-smoothed videos. The authors propose Mask Forcing, a Dual-Noise Masking Rollout strategy. This strategy injects cleaner tokens into noisy rollout inputs through random masks along spatial and temporal axes. The method needs no real video data and no extra post-training stage. Image-gen Phase-1: none.

## Snippets

"we propose Mask Forcing, a Dual-Noise Masking Rollout strategy that perturbs the AR student self-rollout to mitigate mode collapse induced by reverse-KL mode seeking." [Source: arxiv-2609.09123]
