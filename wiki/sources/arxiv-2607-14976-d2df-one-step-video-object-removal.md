---
title: "D2DF — one-step draft-free video object removal (arXiv:2607.14976)"
type: source
tags: [paper, video-editing, object-removal, distillation, cogvideox]
keywords: [D2DF, PPCD, SGFP, draft-free, video object removal, CogVideoX-5B-I2V, BigD233]
related:
  - entities/models/d2df.md
  - concepts/one-step-video-object-removal.md
  - entities/models/cogvideox-1-5.md
  - entities/models/wan-2-2.md
  - concepts/video-identity-inheritance.md
  - concepts/albedo-guided-instance-video-editing.md
  - concepts/task-isolated-unified-video-editing.md
  - sweeps/2026-07-17-daily.md
maturity: draft
read_status: read
created: 2026-07-17
updated: 2026-07-17
---

## Relations

@entities/models/d2df.md @concepts/one-step-video-object-removal.md @entities/models/cogvideox-1-5.md @entities/models/wan-2-2.md @concepts/video-identity-inheritance.md @concepts/albedo-guided-instance-video-editing.md @concepts/task-isolated-unified-video-editing.md

## Raw Concept

- **Title**: From Draft to Draft-Free: One-Step Video Object Removal via Privileged Distillation and Fast Planting
- **Authors**: Zizhao Chen et al. (XJTU / SGIT / ZJUT / Baidu)
- **Type**: arXiv:2607.14976
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.14976-from-draft-to-draft-free-one-step-video-object-r.pdf`
- **URL**: https://arxiv.org/abs/2607.14976
- **Code**: https://github.com/bigD233/D2DF (Apache-2.0)
- **Weights**: https://huggingface.co/BigD233333/D2DF (+ CogVideoX-5B-I2V base)
- **Retrieved**: 2026-07-17

## Narrative

**D2DF** distills a multi-step draft-guided diffusion teacher into **one-step** video object removal: **D2DF-DG** (draft-guided) via PPCD, then **D2DF-DF** (draft-free) via SGFP latent planting. Inference code uses Hugging Face `diffusers`/`transformers`; base is **CogVideoX-5B-I2V**.

**Phase-0: CONDITIONAL-GO** — Apache-2.0 code shipped; full smoke needs CogVideoX-5B + D2DF transformers (>>500 MB). Local adopt today: **code clone only**. Persona use: remove props/people from B-roll without multi-step erase pipelines.

## Snippets

> "This repository provides standalone inference code for both D2DF-DF and D2DF-DG using the official Hugging Face `diffusers` and `transformers` packages."

[Source: github.com/bigD233/D2DF README (retrieved 2026-07-17)]
