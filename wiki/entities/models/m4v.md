---
title: M4V (Meituan — Multimodal Mamba T2V)
type: entity
tags: [model, video, mamba, ssm, efficient-inference, meituan, t2v]
keywords: [M4V, MM-DiM, Multimodal Diffusion Mamba, PyramidFlow, Wan2.1, Meituan, linear-time, VBench]
related:
  - sources/arxiv-2506-10915-m4v-multimodal-mamba-t2v.md
  - concepts/multimodal-diffusion-mamba-efficient-t2v.md
  - entities/models/wan-2-2.md
  - concepts/hybrid-linear-attention.md
  - concepts/video-generation-energy-scaling-laws.md
  - concepts/synthetic-media-compute-economics.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-07-14-daily.md
maturity: draft
created: 2026-07-14
updated: 2026-07-14
---

## Relations

@sources/arxiv-2506-10915-m4v-multimodal-mamba-t2v.md @concepts/multimodal-diffusion-mamba-efficient-t2v.md @entities/models/wan-2-2.md @concepts/hybrid-linear-attention.md @concepts/video-generation-energy-scaling-laws.md

## Raw Concept

Entity from 2026-07-14 ingest of arXiv:2506.10915. Meituan-led **Mamba-for-T2V** stack claiming large inference FLOP cuts while matching/beating attention baselines on VBench when grafted onto PyramidFlow or Wan2.1.

## Narrative

### Status (Jul 2026)

| Field | Value |
|-------|--------|
| Paper | arXiv:2506.10915v2 / CVPR 2026 |
| Code / weights | **Not released** — "will be publicly available" on project page |
| License | Unknown until release |
| Bases studied | PyramidFlow (FLUX MM-DiT hybrid) + Wan2.1 full-attn→MM-DiM swap |
| Hardware story | A100 paper timings; Mamba CUDA kernels assumed — no MPS story |

### Operator relevance

**WATCH only.** David's production video lane stays **Wan 2.2 / HunyuanVideo I2V + LatentSync**. M4V becomes interesting if:

1. Open weights land with a commercial-usable license (training data includes Midjourney/Instagram/internal portraits — audit carefully)
2. A **Wan2.1/Wan2.2 ComfyUI** path appears (paper's strongest claim is M4V\* Wan2.1 VBench 86.14 + faster decode)
3. Linear-time mixers cut RunPod \$/clip enough to matter for long 768p persona clips (pairs with @concepts/video-generation-energy-scaling-laws.md)

Complements @concepts/hybrid-linear-attention.md (SANA-WM GDN+softmax) as a different linear-time lineage: **selective SSM (Mamba)** vs **gated linear attention**, both targeting quadratic DiT cost.

### Phase-0

| Axis | Notes |
|------|-------|
| Domain fit | Model release (video) — efficiency fork of Wan/PyramidFlow |
| License | Unknown — do not adopt until SPDX + weights ToS clear |
| Maturity | Paper + project demos only; no repo stars/commits to score |
| Failure modes | Weights delayed; training-data license poison; no ComfyUI Day-0; Apple Silicon unlikely first-class |
| Verdict | **WATCH** — no local adopt (<500 MB N/A; nothing to download) |

## Snippets

> "…the Mamba blocks in M4V reduce the FLOPs by 45% compared to the attention alternative when generating 121-frame videos at 768×1280 resolution."

[Source: https://huangjch526.github.io/M4V_project/ (retrieved 2026-07-14)]
