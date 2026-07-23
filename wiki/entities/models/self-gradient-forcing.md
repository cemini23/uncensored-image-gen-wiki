---
title: Self Gradient Forcing (JD — native long AR video extrapolation)
type: entity
tags: [model, video-generation, autoregressive, long-form, apache-2-0]
keywords: [SGF, Self-Forcing, Wan, causal-memory]
related:
  - sources/arxiv-2607-20368-self-gradient-forcing.md
  - concepts/autoregressive-video-foresight-training.md
  - concepts/world-models-video-generation.md
  - concepts/video-identity-inheritance.md
  - entities/models/wan-2-2.md
  - entities/models/tango-ar-video.md
  - sweeps/2026-07-23-daily.md
maturity: draft
created: 2026-07-23
updated: 2026-07-23
---

## Relations

@sources/arxiv-2607-20368-self-gradient-forcing.md @concepts/autoregressive-video-foresight-training.md @entities/models/wan-2-2.md @entities/models/tango-ar-video.md

## Raw Concept

Entity from 2026-07-23 Phase-0 of arXiv:2607.20368 / github.com/zhuang2002/Self_Gradient_Forcing.

## Narrative

| Field | Value |
|-------|--------|
| Paper | arXiv:2607.20368 |
| Code | `github.com/zhuang2002/Self_Gradient_Forcing` — **Apache-2.0** |
| Weights | HF `JunhaoZhuang/Self_Gradient_Forcing` |
| Local clone | `~/Desktop/projects/Self_Gradient_Forcing` (~2 MB, 2026-07-23) |

### Phase-0

**CONDITIONAL-GO (code only)** — read `inference.py` / `demo.py`; run `scripts/download_weights.sh` only on CUDA host. Do not pull weights onto laptop under 500 MB rule.

## Dead Ends

- Treating as ComfyUI drop-in — CLI/diffusers-style path for now.
