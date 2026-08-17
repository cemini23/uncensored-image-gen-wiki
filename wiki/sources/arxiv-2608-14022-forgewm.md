---
title: "ForgeWM: progressive causal few-step action-conditioned video WM (arXiv:2608.14022)"
type: source
tags: [paper, video, world-model, distillation, causal, watch]
keywords: [ForgeWM, Wan2.1, Matrix-Game 2, BidSFT, causal distillation, DMD, Minecraft, CrossFPS]
related:
  - entities/models/forgewm.md
  - concepts/world-models-video-generation.md
  - concepts/context-matched-video-distillation.md
  - concepts/hybrid-policy-self-distillation-video.md
  - entities/models/wan-2-2.md
  - entities/models/kairos.md
  - sweeps/2026-08-17-daily.md
maturity: draft
read_status: read
created: 2026-08-17
updated: 2026-08-17
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/models/forgewm.md @concepts/world-models-video-generation.md @concepts/context-matched-video-distillation.md @concepts/hybrid-policy-self-distillation-video.md @entities/models/wan-2-2.md @entities/models/kairos.md @sweeps/2026-08-17-daily.md

## Raw Concept

- **Title**: ForgeWM: Progressive Causal Training for Few-Step Action-Conditioned Video World Models
- **Authors**: Xinye Li, Lingshuai Lin, et al. (CUHK + Tencent PCG + FDU + Shanghai AI Lab + HKUST)
- **Type**: arXiv:2608.14022 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.14022-forgewm-progressive-causal-training-for-few-step.pdf`
- **URL**: https://arxiv.org/abs/2608.14022
- **Retrieved**: 2026-08-17
- **Code**: `asdfo123/ForgeWM` Apache-2.0 ✅, ~90 MB GitHub / **182 MB** local depth-1 clone at `.local/adopts/ForgeWM`. HF `ForgeWM/ForgeWM` + ~89 GB LMDB — **do not download**.

## Narrative

Four-stage recipe that turns a bidirectional action-conditioned video generator (Matrix-Game 2.0 / Wan2.1-T2V-1.3B + action module) into budget-specialized causal students at 1, 2, and 4 denoising steps. Stages: domain adaptation (BidSFT) → teacher-forced causal training (TF-AR) → causal consistency distillation (CD) → on-policy distribution matching (DMD) with a bidirectional teacher. Keyboard+mouse (Minecraft) and gamepad (CrossFPS) stay frame-aligned through latent compression and AR rollout. Dual-path deploy: 1-step student for latency-critical interaction; optional replay-time refine (re-noise the saved 1-step draft, 4 updates) that matches 4-step quality while staying closer to the experienced trajectory than regen-from-noise.

Sibling to NVIDIA CMD (causal teacher matches student information set) and HPSD (self-distill I2V quality into T2V). Persona hook is the portable few-step causal + action-interface recipe, not Minecraft itself.

**Phase-0: WATCH stack / GO code.** SPDX Apache-2.0 verified on disk. Clone is code-only (182 MB < 500 MB). No HF weights, no 89 GB data. Image-gen Phase-1 local wire: none (`deferred`).

## Snippets

> "We introduce ForgeWM, a progressive framework that transforms a bidirectional action-conditioned video generator into efficient few-step world models through domain adaptation, teacher-forced causal training, causal consistency distillation, and on-policy distribution matching with a bidirectional teacher. The resulting budget-specialized students operate at steady-state denoising budgets of 1, 2, and 4 steps."

[Source: arxiv-2608.14022, abstract]
