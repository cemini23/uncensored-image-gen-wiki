---
title: "SparsePR training-free sparse attention for video/WM (arXiv:2608.18484)"
type: source
tags: [paper, video, sparse-attention, world-model, training-free, watch]
keywords: [SparsePR, Response-Coupled Partitioning, Probe-Fitted Residual Reconstruction, HunyuanVideo-13B, Wan2.2-I2V-A14B, Cosmos]
related:
  - concepts/budget-aware-diffusion-caching.md
  - concepts/federated-daily-research-digest.md
  - concepts/input-stable-sparse-attention-video.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/linca.md
  - entities/models/sparsepr.md
  - entities/models/squad.md
  - entities/models/token-radius-attention.md
  - entities/models/wan-2-2.md
  - sweeps/2026-08-20-daily.md
maturity: draft
read_status: read
created: 2026-08-20
updated: 2026-08-20
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/models/sparsepr.md @concepts/budget-aware-diffusion-caching.md @concepts/input-stable-sparse-attention-video.md @entities/models/squad.md @entities/models/token-radius-attention.md @entities/models/wan-2-2.md @entities/models/hunyuanvideo-1-5.md @entities/models/linca.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-20-daily.md

## Raw Concept

- **Title**: Partition the Support, Reconstruct the Residual: Training-Free Sparse Attention for Video Generation and World Models
- **Authors**: Pardis Taghavi, Reza Langari, Gaurav Pandey (Texas A&M)
- **Type**: arXiv:2608.18484 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.18484-partition-the-support-reconstruct-the-residual-t.pdf`
- **URL**: https://arxiv.org/abs/2608.18484
- **Project**: https://pardistaghavi.github.io/SparsePR-website/
- **Retrieved**: 2026-08-20
- **Code**: `PardisTaghavi/SparsePR` Apache-2.0 on disk (`LICENSES/Apache-2.0.txt`) [CONFIRMED]. Cloned `.local/adopts/SparsePR` (~7.0 MB, no weights). GitHub API license field was null; SPDX lives in-tree. Linux + H100-class; two CUDA 12.8 venvs. HF checkpoints **not downloaded**.

## Narrative

Training-free block-sparse attention for video DiTs and world models. Row-wise attention concentration does not specify an executable operator: queries that share a block route can have poorly overlapping supports, and retained attention mass does not determine post-softmax error from skipped pairs. SparsePR splits the operator into **Response-Coupled Partitioning** (sampled-query key responses form paired K/V groups; centroids induce query-response coordinates for shared routing) and **Probe-Fitted Residual Reconstruction** (a few exact query rows fit a call-specific affine correction from the sparse output). All of it is online — no offline mask training.

Paper reports 22.0–26.0% realized executed-pair density with 1.48×–2.61× end-to-end speedups while matching dense quality across four models. README integrations: HunyuanVideo-13B T2V, Wan2.2-I2V-A14B, Cosmos-Predict2.5-14B, Cosmos3-Nano-16B. Distinct from SQuad (softmax→O(n√n) distill + DMD2), TRA (token-radius pattern), LinCa (learned feature cache), and MDD (FM magnitude/direction split): SparsePR is a current-call sparse *kernel*, not a student or a cache schedule.

**WATCH HIGH / GO code.** Clone is Apache-2.0 and small. Runtime stays `deferred`: Linux, H100, flash-attn/flashinfer, official Wan/Cosmos trees + HF weights. No Image-gen Phase-1 wire.

## Snippets

> "We introduce SparsePR, which combines Response-Coupled Partitioning with Probe-Fitted Residual Reconstruction. Sampled-query key responses form paired K/V groups, whose centroids induce query-response coordinates for shared routing. A small set of exact query rows then calibrates a call-specific affine correction from the sparse output within the output subspace observed in the probe residuals."

[Source: arxiv-2608.18484, abstract]
