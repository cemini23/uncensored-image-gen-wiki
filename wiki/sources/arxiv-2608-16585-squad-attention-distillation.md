---
title: "SQuad: sub-quadratic attention distillation for Wan 2.2 5B (arXiv:2608.16585)"
type: source
tags: [paper, video, wan, attention, distillation, efficiency, watch]
keywords: [SQuad, DMD2, Wan 2.2 5B, sub-quadratic, NFE, VBench, Qualcomm]
related:
  - entities/models/squad.md
  - entities/models/wan-2-2.md
  - entities/models/token-radius-attention.md
  - entities/models/spade.md
  - concepts/budget-aware-diffusion-caching.md
  - concepts/context-matched-video-distillation.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-18-daily.md
maturity: draft
read_status: read
created: 2026-08-18
updated: 2026-08-18
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/models/squad.md @entities/models/wan-2-2.md @entities/models/token-radius-attention.md @entities/models/spade.md @concepts/budget-aware-diffusion-caching.md @concepts/context-matched-video-distillation.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-18-daily.md

## Raw Concept

- **Title**: SQuad: Sub-Quadratic Attention Distillation for Efficient Video Generation
- **Authors**: Animesh Karnewar, Denis Korzhenkov, Amirhossein Habibian, Mohsen Ghafoorian (Qualcomm AI Research)
- **Type**: arXiv:2608.16585 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.16585-squad-sub-quadratic-attention-distillation-for-e.pdf`
- **URL**: https://arxiv.org/abs/2608.16585
- **Retrieved**: 2026-08-18
- **Code**: none in PDF. Authors are Qualcomm-class. GitHub search negative. Do **not** clone Qualcomm internals. No SPDX.

## Narrative

Qualcomm distillation that fits a pretrained full-softmax video DiT into an **O(n√n)** attention that keeps a true softmax. Linear / low-rank kernels (`O(n)` / `O(nk)`) drop the sharp input-dependent selectivity that video needs; SQuad factorizes attention into a **local** pass inside `O(√n)` windows plus a **global** pass across windows — full receptive field, cheaper.

Two-stage distill: Flow-Matching SFT, then improved Distribution Matching Distillation (**DMD2**) that also cuts sampling steps. On **Wan 2.2 5B** T2V: VBench **83.08 → 83.20**, per-step per-block attention FLOPs **~67×** down, attention latency **47.10 ms → 4.27 ms** (~11×), end-to-end DiT latency **2×**, NFE **100 → 6**.

Sibling contrast: Token-Radius / SPADE are *inference-time sparse* (training-free or CUDA engine). Budget-aware caching skips compute by reuse. CMD / ForgeWM distill *steps* with a causal information-set match. SQuad distills the *attention kernel itself* plus steps. Highest-leverage Wan efficiency paper in this inbox — still paper-only.

**Phase-0: WATCH HIGH** efficiency. No GitHub. Image-gen local wire: none (`deferred`).

## Snippets

> "On the Wan 2.2 5B text-to-video model, SQuAD matches the quadratic teacher on VBench (83.20 v/s 83.08) while cutting the per-step per-block attention FLOPs by ∼67× and attention latency by ∼11×, and end-to-end DiT latency by 2×, all while also generating a video in only 6 Neural Functional Evaluations (NFEs) instead of the default 100."

[Source: arxiv-2608.16585, abstract]
