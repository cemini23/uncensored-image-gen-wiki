---
title: "Video representation regularization vs compounding error (arXiv:2607.27036)"
type: source
tags: [paper, video-generation, world-model, autoregressive, regularization]
keywords: [compounding-error, erank, dimensional-collapse, Diffusion-Forcing, VBench]
related:
  - concepts/video-representation-regularization.md
  - concepts/causal-clip-attention-long-video.md
  - concepts/world-models-video-generation.md
  - entities/models/wan-2-2.md
  - sources/arxiv-2607-27110-freqforcing.md
  - sweeps/2026-07-31-daily.md
maturity: draft
read_status: read
created: 2026-07-31
updated: 2026-07-31
---

## Relations

@concepts/video-representation-regularization.md @concepts/causal-clip-attention-long-video.md @sources/arxiv-2607-27110-freqforcing.md @sweeps/2026-07-31-daily.md

## Raw Concept

- **Title**: Mitigating Compounding Error via Video Representation Regularization
- **Authors**: Taiye Chen, Qi Zhang, Yisen Wang (Peking University)
- **Type**: arXiv:2607.27036
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.27036-mitigating-compounding-error-via-video-represent.pdf`
- **URL**: https://arxiv.org/abs/2607.27036
- **Code**: none public at ingest
- **Retrieved**: 2026-07-31

## Narrative

Links AR video drift to **dimensional collapse** (effective rank drop) of hidden states. Pure data scaling fails to resist drift. Lightweight representation regularization beats Diffusion Forcing on VBench Aesthetic (38.65→55.56) and Imaging Quality (44.37→72.08).

**Phase-0: WATCH** — method paper; TipDrop when training code ships for Wan/Self-Forcing students.

## Snippets

_(none)_
