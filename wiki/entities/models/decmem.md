---
title: DecMem (Kling / Kuaishou)
type: entity
tags: [model, world-model, video-generation, memory, long-horizon, kling]
keywords: [DecMem, decoupled memory, sparse global memory, anchored local memory, minute-scale, Kling, Kuaishou, world generation]
related:
  - sources/arxiv-2605-31336-decmem-world-generation.md
  - concepts/world-models-video-generation.md
  - entities/models/sana-wm.md
  - entities/models/wan-2-2.md
  - entities/models/kwai-kolors.md
  - concepts/long-video-rag-retrieval.md
  - sources/arxiv-2606-02553-longlive-rag-long-video-generation.md
  - entities/models/metaworld.md
  - sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md
  - sources/arxiv-2606-09828-mirage-latent-spatial-memory.md
  - entities/models/mirage.md
  - concepts/latent-spatial-memory-video-world-models.md
maturity: draft
created: 2026-06-03
updated: 2026-06-12
---

## Relations

@sources/arxiv-2605-31336-decmem-world-generation.md @concepts/world-models-video-generation.md @entities/models/sana-wm.md @entities/models/metaworld.md @entities/models/wan-2-2.md

## Raw Concept

Entity stub from K95 ingest of arXiv:2605.31336 — Kling Team (Kuaishou) world-model memory architecture for minute-long consistent generation.

## Narrative

**DecMem** is a **decoupled memory** architecture for long-horizon controllable world video:

- **Sparse Global Memory** — scalable access to full scene history without attention dispersion
- **Anchored Local Memory** — stable extrapolation for new frames

Built on pretrained video backbones with action conditioning; targets **revisit consistency** failures in prior world models. Industrial counterpart to open **SANA-WM** on the minute-scale axis.

**Build-track status:** closed/industrial at ingest — no confirmed open weights `[NEEDS VERIFICATION 2026-06-03]`. Project page: https://jeffreyyzh.github.io/DecMem-Page

## Snippets

See @sources/arxiv-2605-31336-decmem-world-generation.md.

## Dead Ends

None until open weights or API documented.
