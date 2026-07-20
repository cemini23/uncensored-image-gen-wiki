---
title: "FVAttn — adaptive sparse attention + runtime load balancing for video DiT (arXiv:2607.16190)"
type: source
tags: [paper, video-generation, sparse-attention, wan, systems]
keywords: [FVAttn, Top-p, Ulysses, Wan2.2, load-balancing, Tencent]
related:
  - concepts/input-stable-sparse-attention-video.md
  - concepts/ditango-parallel-diffusion-attention.md
  - entities/models/wan-2-2.md
  - entities/inference/chitu-diffusion.md
  - sweeps/2026-07-20-daily.md
maturity: draft
read_status: read
created: 2026-07-20
updated: 2026-07-20
---

## Relations

@concepts/input-stable-sparse-attention-video.md @concepts/ditango-parallel-diffusion-attention.md @entities/models/wan-2-2.md @entities/inference/chitu-diffusion.md

## Raw Concept

- **Title**: FVAttn: Adaptive Sparse Attention with Runtime Load Balancing for Video Generation
- **Authors**: Hao Liu et al. (SYSU / WeChat HPC+Vision Tencent / PKU)
- **Type**: arXiv:2607.16190
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.16190-fvattn-adaptive-sparse-attention-with-runtime-lo.pdf`
- **URL**: https://arxiv.org/abs/2607.16190
- **Code**: none public at ingest (cites ModelTC/lightx2v as related stack)
- **Retrieved**: 2026-07-20

## Narrative

Training-free sparse attention for Video DiTs under multi-GPU Ulysses sequence parallelism: Top-p routing + Top-k floor + **Runtime Load Balancing** (migrate heavy heads via P2P) + slack-aware sparse augmentation. On step-distilled **Wan2.2 I2V**: load imbalance 1.34→1.08; **4.41×** attention vs FlashAttention; **2.02–2.11×** DiT inference with competitive quality.

**Phase-0: WATCH** — no standalone repo yet; complements SVOO (@concepts/input-stable-sparse-attention-video.md) and ChituDiffusion DiTango on the Wan serving axis. Track for RunPod multi-GPU Wan serving when code ships.

## Snippets

_(none)_
