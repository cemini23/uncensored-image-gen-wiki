---
title: "EditBridge ultra-high-resolution image editing (arXiv:2608.18063)"
type: source
tags: [paper, image-editing, diffusion-bridge, qwen, alibaba, watch]
keywords: [EditBridge, UHR editing, information divergence, texture degradation, diffusion bridge]
related:
  - entities/models/editbridge.md
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

@entities/models/editbridge.md @entities/models/qwen-image-2512.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-19-daily.md

## Raw Concept

- **Title**: EDITBRIDGE: Towards Faithful and Efficient Ultra-High-Resolution Image Editing
- **Authors**: Jiayi Song, Shijie Huang, Fangtai Wu, Yubo Huang, Zhenxiong Tan, Songhua Liu, Jiaming Liu, Ruihua Huang (SJTU / Alibaba Qwen BU / NUS)
- **Type**: arXiv:2608.18063 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.18063-editbridge-towards-faithful-and-efficient-ultra.pdf`
- **URL**: https://arxiv.org/abs/2608.18063
- **Project**: https://editbridge.github.io/
- **Retrieved**: 2026-08-19
- **Code**: project page only. GitHub search negative. No SPDX.

## Narrative

Professional stills want edits above 1K; quadratic attention and memory cap most diffusion editors. The usual workaround — edit at LR then independent SR — hallucinates details that contradict the original HR file (**information divergence**) and smears or over-sharpens texture. EditBridge is a **data-to-data diffusion bridge** from the LR edited result to HR, conditioned on the original HR source instead of regenerating from noise.

Persona hook: poster/still pipelines that currently downscale → Kontext/Qwen-edit → upscale. **WATCH** until code. `wire_status: deferred`. No Image-gen Phase-1.

## Snippets

> "Unlike conventional diffusion that regenerates from noise, we formulate refinement as structured data-to-data translation from the low-resolution (LR) edited result to its HR counterpart, explicitly conditioned on the original HR source to preserve authentic details."

[Source: arxiv-2608.18063, abstract]
