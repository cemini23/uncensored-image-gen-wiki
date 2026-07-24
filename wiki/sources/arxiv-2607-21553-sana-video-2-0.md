---
title: "SANA-Video 2.0 — hybrid linear attention + AttnRes (arXiv:2607.21553)"
type: source
tags: [paper, video-generation, nvidia, linear-attention, sana]
keywords: [SANA-Video-2.0, AttnRes, hybrid-linear-softmax, Sol-Engine, VBench]
related:
  - entities/models/sana-video-2.md
  - entities/models/sana.md
  - entities/models/sana-wm.md
  - concepts/hybrid-linear-attention.md
  - concepts/world-models-video-generation.md
  - entities/models/wan-2-2.md
  - sweeps/2026-07-24-daily.md
maturity: draft
read_status: read
created: 2026-07-24
updated: 2026-07-24
---

## Relations

@entities/models/sana-video-2.md @entities/models/sana.md @concepts/hybrid-linear-attention.md @concepts/world-models-video-generation.md

## Raw Concept

- **Title**: SANA-Video 2.0: Hybrid Linear Attention with Attention Residuals for Efficient Video Generation
- **Authors**: Junsong Chen et al. (NVIDIA)
- **Type**: arXiv:2607.21553
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.21553-sana-video-2-0-hybrid-linear-attention-with-atte.pdf`
- **URL**: https://arxiv.org/abs/2607.21553
- **Lineage**: NVlabs/Sana (Apache-2.0) — 2.0 weights/code not confirmed in-tree at ingest
- **Retrieved**: 2026-07-24

## Narrative

5B/14B hybrid video DiT: gated linear attention + periodic gated-softmax anchors (3:1) + Block Attention Residuals (AttnRes). Claims VBench 84.30 @ 480p / 13.2s H100; Sol-Engine stack 120× vs Wan 2.2-A14B on one H100 for 5B@720p/5s.

**Phase-0: WATCH** — do not clone full `NVlabs/Sana` (~GB-class). Re-check HF / Sana repo for 2.0 checkpoints; TipDrop when Apache weights land. Complements SANA-WM / hybrid-linear lane.

## Snippets

_(none)_
