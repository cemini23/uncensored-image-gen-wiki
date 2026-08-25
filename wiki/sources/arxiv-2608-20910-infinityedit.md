---
title: "InfinityEdit infinite streaming video edit adapter (arXiv:2608.20910)"
type: source
tags: [paper, video, editing, streaming, apache-2-0, watch]
keywords: [InfinityEdit, edit-ignition adapter, Helios-Distilled, Alibaba, ZJU]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/world-models-video-generation.md
  - entities/models/editbridge.md
  - entities/models/infinityedit.md
  - entities/models/stream4d.md
  - entities/models/wan-2-2.md
  - sweeps/2026-08-24-daily.md
maturity: draft
read_status: read
created: 2026-08-25
updated: 2026-08-25
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/models/infinityedit.md @entities/models/stream4d.md @entities/models/wan-2-2.md @entities/models/editbridge.md @concepts/world-models-video-generation.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-24-daily.md

## Raw Concept

- **Title**: InfinityEdit: Infinite Video Editing with a Lightweight Edit-Ignition Adapter
- **Authors**: Yunze Tong, Mushui Liu, Canyu Zhao, et al. (Zhejiang University / Alibaba)
- **Type**: arXiv:2608.20910 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.20910-infinityedit-infinite-video-editing-with-a-light.pdf`
- **URL**: https://arxiv.org/abs/2608.20910
- **Project**: https://yunzetong.github.io/InfinityEdit
- **Retrieved**: 2026-08-25
- **Code**: `YunzeTong/InfinityEdit` **Apache-2.0 CONFIRMED** (`LICENSE.txt`). Cloned `.local/adopts/InfinityEdit` (code only). Frozen backbone **Helios-Distilled** HF weights **not downloaded**.

## Narrative

Existing instruction video editors assume **in-place** rewrite of a fixed clip. **Infinite video editing** instead: given preceding segment + edit request, emit the *next* chunk that continues the stream with the edit applied; repeat unbounded. InfinityEdit is a lightweight adapter (history cross-attn + temporal causal self-attn + edit cross-attn) on a frozen streaming generator. Adapter fires only on the chunk that receives the edit; later chunks use the original model with a reset anchor.

**WATCH HIGH / GO code.** Clone is Apache-2.0. Runtime stays `deferred`: Helios-Distilled + CUDA. Complements Stream4D (4D *reward* for AR rollouts) vs this *edit adapter*. Distinct from EditBridge (still UHR image bridge). Image-gen Phase-1: none.

## Snippets

> "We study this setting and name it infinite video editing: given a preceding segment and an edit request, a model must generate the next segment that continues the stream while applying the requested edit."

[Source: arxiv-2608.20910, abstract]
