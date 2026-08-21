---
title: "Stream4D 4D-consistency for streaming AR video (arXiv:2608.19556)"
type: source
tags: [paper, video, streaming, autoregressive, 4d-consistency, watch]
keywords: [Stream4D, 4D reconstruction reward, motion prior, Wan2.1, UCLA]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/world-models-video-generation.md
  - entities/lipsync/dynaforcing.md
  - entities/models/stream4d.md
  - entities/models/wan-2-2.md
  - sweeps/2026-08-21-daily.md
maturity: draft
read_status: read
created: 2026-08-21
updated: 2026-08-21
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/models/stream4d.md @entities/models/wan-2-2.md @entities/lipsync/dynaforcing.md @concepts/world-models-video-generation.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-21-daily.md

## Raw Concept

- **Title**: Stream4D: 4D-Consistency for Streaming Autoregressive Diffusion Video Models
- **Authors**: Yuanhao Ban, Jiaqi Feng, Hengguang Zhou, Xiaohuan Pei, Justin Cui, Cho-Jui Hsieh (UCLA / Tsinghua)
- **Type**: arXiv:2608.19556 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.19556-stream4d-4d-consistency-for-streaming-autoregres.pdf`
- **URL**: https://arxiv.org/abs/2608.19556
- **Project**: https://banyuanhao.github.io/Stream4D/
- **Retrieved**: 2026-08-21
- **Code**: `banyuanhao/Stream4D` is GitHub Pages only (`index.html`, no training/inference). **Not cloned.** `WZ-CS/Stream4D` is unrelated.

## Narrative

Streaming AR diffusion models optimize local chunk prediction, so long rollouts accumulate geometric drift and collapse into static or unnatural motion. Bidirectional 3DGS reconstruction rewards punish genuine object motion as reconstruction error and are maximized by freezing the video — especially bad in AR, where a frozen chunk can propagate. Stream4D replaces that static critic with a **feed-forward 4D reconstruction reward** (explicit scene dynamics) plus a **motion prior** (natural scene-flow magnitude; jitter / non-rigid artifacts penalized) and a lightweight perceptual anchor. Paper evaluates on AR video backbones including Wan2.1 few-step paths.

**WATCH HIGH.** Persona streaming / long I2V rollouts care about 4D identity + motion, but there is no SPDX'd training code here — project site only. Do not swap production Wan / DynaForcing / PersonaLive. Image-gen Phase-1: none (`deferred`).

## Snippets

> "Streaming autoregressive diffusion models enable real-time, long-horizon video generation, but their training objectives optimize local frame prediction rather than the geometry and dynamics of a coherent world: long rollouts accumulate geometric drift and degrade into static or unnatural motion."

[Source: arxiv-2608.19556, abstract]
