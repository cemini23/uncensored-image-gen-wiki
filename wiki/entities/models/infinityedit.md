---
title: InfinityEdit — edit-ignition adapter for unbounded video streams
type: entity
tags: [model, video, editing, streaming, apache-2-0, watch]
keywords: [InfinityEdit, Helios-Distilled, edit adapter, Alibaba]
related:
  - concepts/world-models-video-generation.md
  - entities/models/editbridge.md
  - entities/models/stream4d.md
  - entities/models/wan-2-2.md
  - sources/arxiv-2608-20910-infinityedit.md
  - sweeps/2026-08-24-daily.md
maturity: draft
created: 2026-08-25
updated: 2026-08-25
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-20910-infinityedit.md @entities/models/stream4d.md @entities/models/wan-2-2.md @entities/models/editbridge.md @concepts/world-models-video-generation.md @sweeps/2026-08-24-daily.md

## Raw Concept

Entity from 2026-08-25 ingest of arXiv:2608.20910. **GO code** Apache-2.0; Helios weights not fetched. No Image-gen Phase-1.

## Narrative

Lightweight adapter so a streaming video DiT can take sequential edit instructions on an unbounded stream.

| Check | Result |
| --- | --- |
| Code | `YunzeTong/InfinityEdit` Apache-2.0; `.local/adopts/InfinityEdit` |
| Weights | `BestWishYsh/Helios-Distilled` **not fetched** |
| vs Stream4D | Stream4D is a 4D consistency *reward*; InfinityEdit is an *edit adapter* |
| vs EditBridge | EditBridge is still-image UHR bridge; this is streaming video |

**Phase-1:** none (`deferred`). Do not `hf download` Helios from this wiki.

## Snippets

_(see source page)_
