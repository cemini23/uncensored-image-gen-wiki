---
title: "DSTAR — DiT spatial/temporal redundancy accelerator (arXiv:2607.15846)"
type: source
tags: [paper, hardware, accelerator, dit, peripheral]
keywords: [DSTAR, DiT, quantization, sparse-attention-reuse, ASIC]
related:
  - concepts/budget-aware-diffusion-caching.md
  - sweeps/2026-07-20-daily.md
maturity: draft
read_status: skimmed
created: 2026-07-20
updated: 2026-07-20
---

## Relations

@concepts/budget-aware-diffusion-caching.md

## Raw Concept

- **Title**: DSTAR: Accelerating Diffusion Transformers via Spatial and Temporal Redundancy Reduction
- **Authors**: Chi Zhang et al. (SJTU / Guizhou)
- **Type**: arXiv:2607.15846
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.15846-dstar-accelerating-diffusion-transformers-via-sp.pdf`
- **URL**: https://arxiv.org/abs/2607.15846
- **Retrieved**: 2026-07-20

## Narrative

Software–hardware co-design: mixed-precision quantization of differential activations + sparse attention reuse, plus a specialized accelerator. Claims up to 7.33× latency / 41.89× energy vs A100.

**Phase-0: SKIP** — ASIC/FPGA class; no consumer laptop adopt path. Thin conceptual adjacency to DiT caching/sparsity only.

## Snippets

_(none)_
