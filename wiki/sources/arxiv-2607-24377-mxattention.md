---
title: "MXAttention — data-free MXFP4 attention for Wan/HunyuanVideo (arXiv:2607.24377)"
type: source
tags: [paper, quantization, video-generation, mxfp4, ascend, wan]
keywords: [MXAttention, MXFP4, UOS, PNQ, MindIE-SD, Wan2.2, HunyuanVideo]
related:
  - concepts/mxfp4-attention-video.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/hardware/gpu-guide.md
  - sweeps/2026-07-28-daily.md
maturity: draft
read_status: read
created: 2026-07-28
updated: 2026-07-28
---

## Relations

@concepts/mxfp4-attention-video.md @entities/models/wan-2-2.md @entities/models/hunyuanvideo-1-5.md @entities/hardware/gpu-guide.md

## Raw Concept

- **Title**: MXAttention: Data-Free Optimal Scaling and Pre-Normalization Quantization for MXFP4 Attention
- **Authors**: Huawei Technologies
- **Type**: arXiv:2607.24377
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.24377-mxattention-data-free-optimal-scaling-and-pre-no.pdf`
- **URL**: https://arxiv.org/abs/2607.24377
- **Code**: Ascend MindIE-SD (`gitcode.com/Ascend/MindIE-SD` / `github.com/Ascend/MindIE-SD`) — NOASSERTION / Ascend stack
- **Retrieved**: 2026-07-28

## Narrative

Data-free PTQ for MXFP4 attention: Universal Optimal Scaling (Qmax=7.25 closed form) + Pre-Normalization Quantization so softmax rows still sum to 1. Empirically closes ≥95% of VBench Imaging Quality gap vs FP16 on Wan2.2 and HunyuanVideo with <0.01 absolute metric drop (paper claims).

**Phase-0: SKIP (David NVIDIA stack) / WATCH** — implementation lives in MindIE-SD (Ascend NPU). Technique is relevant once MXFP4 attention ports land in CUDA/ComfyUI/vLLM-Omni; do not adopt Ascend-only stack on TipDrop CUDA hosts today.

## Snippets

_(none)_
