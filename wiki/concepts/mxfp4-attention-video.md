---
title: MXFP4 attention quantization for video DiTs
type: concept
tags: [concept, quantization, video-generation, mxfp4, inference]
keywords: [MXAttention, MXFP4, NVFP4, Wan2.2, HunyuanVideo, MindIE-SD]
related:
  - sources/arxiv-2607-24377-mxattention.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/hardware/gpu-guide.md
  - sweeps/2026-07-28-daily.md
maturity: draft
created: 2026-07-28
updated: 2026-07-28
---

## Relations

@sources/arxiv-2607-24377-mxattention.md @entities/models/wan-2-2.md @entities/hardware/gpu-guide.md

## Raw Concept

Question: can MXFP4 attention accelerate Wan/HunyuanVideo without killing VBench quality?

## Narrative

MXAttention (Huawei) shows data-free UOS+PNQ recovers near-FP16 quality on Wan2.2/HunyuanVideo when attention GEMMs run MXFP4. Practical path today is Ascend MindIE-SD; CUDA Blackwell MXFP4 / vLLM-Omni ports are the TipDrop watch item — not an install today.

## Snippets

_(none)_
