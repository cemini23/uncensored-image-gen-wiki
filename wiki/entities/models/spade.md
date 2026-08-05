---
title: SPADE / sparseDiTEngine (Wan/Hunyuan sparse attention)
type: entity
tags: [model, attention, efficiency, wan, hunyuan, cuda, bsd-3-clause, conditional]
keywords: [SPADE, DAC-SPADE, sparseDiTEngine]
related:
  - sources/arxiv-2608-03335-spade.md
  - entities/models/token-radius-attention.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - sweeps/2026-08-05-daily.md
maturity: draft
created: 2026-08-05
updated: 2026-08-05
wire_status: deferred
wire_target: tipdrop-workspace-kit/briefs (David CUDA — no Image-gen local wire)
---

## Relations

@sources/arxiv-2608-03335-spade.md @entities/models/token-radius-attention.md @concepts/budget-aware-diffusion-caching.md @entities/models/wan-2-2.md

## Raw Concept

Phase-0 2026-08-05: github.com/6somehow/DAC-SPADE BSD-3-Clause CUDA engine.

## Narrative

| Field | Value |
|-------|--------|
| License | BSD-3-Clause |
| Host | CUDA + ThunderKittens/flash-attn (gitee submodules) |
| Local laptop | **Do not clone** |

### Phase-0 / Phase-1

**CONDITIONAL-GO on David CUDA.** Image-gen `deferred` / no local wire.

## Snippets

_(none)_
