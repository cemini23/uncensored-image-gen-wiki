---
title: "Self Gradient Forcing — native long video extrapolation (arXiv:2607.20368)"
type: source
tags: [paper, video-generation, autoregressive, long-form, apache-2-0]
keywords: [SGF, Self-Gradient-Forcing, Self-Forcing, Wan, causal-memory]
related:
  - entities/models/self-gradient-forcing.md
  - concepts/autoregressive-video-foresight-training.md
  - concepts/world-models-video-generation.md
  - concepts/video-identity-inheritance.md
  - entities/models/wan-2-2.md
  - entities/models/tango-ar-video.md
  - sweeps/2026-07-23-daily.md
maturity: draft
read_status: read
created: 2026-07-23
updated: 2026-07-23
---

## Relations

@entities/models/self-gradient-forcing.md @concepts/autoregressive-video-foresight-training.md @concepts/world-models-video-generation.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: Self Gradient Forcing: Native Long Video Extrapolation
- **Authors**: Junhao Zhuang et al. (Joy Future Academy, JD)
- **Type**: arXiv:2607.20368
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.20368-self-gradient-forcing-native-long-video-extrapol.pdf`
- **URL**: https://arxiv.org/abs/2607.20368
- **Project**: https://zhuang2002.github.io/SelfGradientForcing
- **Code**: https://github.com/zhuang2002/Self_Gradient_Forcing — **Apache-2.0**
- **Weights**: HF `JunhaoZhuang/Self_Gradient_Forcing`
- **Retrieved**: 2026-07-23

## Narrative

Closes **historical context-gradient gap** in Self Forcing AR video diffusion via two-pass SGF (no-grad rollout + parallel context-gradient reconstruction). Stronger identity/layout/temporal stability; 5s train window → minutes of extrapolation.

**Phase-0: CONDITIONAL-GO (code only)** — Apache-2.0 confirmed. Local clone `~/Desktop/projects/Self_Gradient_Forcing` (~2 MB). Weights via `scripts/download_weights.sh` (Wan-class, >>500 MB) → CUDA RunPod only. High value for long persona rollouts vs TANGO WATCH / FilmWorld WATCH.

## Snippets

> "Code and models will be released on the project page https://zhuang2002.github.io/SelfGradientForcing."

[Source: arXiv:2607.20368 abstract; repo released 2026-07-23]
