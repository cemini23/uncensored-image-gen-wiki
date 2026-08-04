---
title: "Token Radius Attention — efficient Wan/Hunyuan video attn (arXiv:2608.02504)"
type: source
tags: [paper, video-generation, attention, efficiency, wan, hunyuan, training-free]
keywords: [TRA, Token-Radius-Attention, sparse-attention, Wan2.1, Wan2.2, HunyuanVideo]
related:
  - entities/models/token-radius-attention.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - sources/arxiv-2607-27110-freqforcing.md
  - sweeps/2026-08-04-daily.md
maturity: draft
read_status: read
created: 2026-08-04
updated: 2026-08-04
---

## Relations

@entities/models/token-radius-attention.md @concepts/budget-aware-diffusion-caching.md @entities/models/wan-2-2.md @sweeps/2026-08-04-daily.md

## Raw Concept

- **Title**: Token Radius Attention for Efficient Video Generation
- **Type**: arXiv:2608.02504
- **Claimed code**: github.com/IF-LAB-PKU/Token-Radius-Attention — **404 at ingest**
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.02504-token-radius-attention-for-efficient-video-gener.pdf`
- **URL**: https://arxiv.org/abs/2608.02504
- **Retrieved**: 2026-08-04

## Narrative

Training-free TRA: query entropy → analytic token budget → temporally decayed radius (no key ranking). Claims 9–19% attention kept, ~1.56–2.0× speedup across Wan2.1/2.2 + HunyuanVideo T2V/I2V.

**Phase-0: WATCH → CONDITIONAL-GO when code lands** — top TipDrop latency steal for persona Wan. Phase-1: `deferred`.

## Snippets

_(none)_
