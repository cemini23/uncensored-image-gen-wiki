---
title: "SPADE — input-adaptive sparse attention for Wan/Hunyuan (arXiv:2608.03335)"
type: source
tags: [paper, video-generation, attention, efficiency, wan, hunyuan, cuda, bsd-3-clause]
keywords: [SPADE, DAC-SPADE, sparseDiTEngine, Wan2.1, Wan2.2, HunyuanVideo]
related:
  - entities/models/spade.md
  - entities/models/token-radius-attention.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - sweeps/2026-08-05-daily.md
maturity: draft
read_status: read
created: 2026-08-05
updated: 2026-08-05
---

## Relations

@entities/models/spade.md @entities/models/token-radius-attention.md @concepts/budget-aware-diffusion-caching.md @entities/models/wan-2-2.md @sweeps/2026-08-05-daily.md

## Raw Concept

- **Title**: SPADE: An Input-Adaptive Sparse Attention Engine for Fast Video Diffusion Models Inference
- **Type**: arXiv:2608.03335
- **Code**: github.com/6somehow/DAC-SPADE (BSD-3-Clause; CUDA/CUTLASS/ThunderKittens; Wan 2.1/2.2 + Hunyuan integrations)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.03335-spade-an-input-adaptive-sparse-attention-engine.pdf`
- **URL**: https://arxiv.org/abs/2608.03335
- **Retrieved**: 2026-08-05

## Narrative

Training-free sparse-attention **engine** (not just a mask recipe): vDiT-SSR spec + SICS runtime + flash block-sparse executor. Claims attention 2.26–3.40× and e2e 1.49–1.80× on Hunyuan-Video + Wan 2.1/2.2 T2V/I2V. Complements TRA (paper-only / 404) with a real CUDA repo.

**Phase-0: CONDITIONAL-GO (David CUDA)** — BSD-3-Clause. Skip wiki-laptop clone (native CUDA + gitee submodules ThunderKittens/flash-attn). Pair A/B with TRA when TRA code appears. Phase-1: TipDrop brief only (`deferred` Image-gen local wire).

## Snippets

_(none)_
