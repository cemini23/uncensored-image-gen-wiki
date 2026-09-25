---
title: "AV-GRPO (arXiv:2609.29816)"
type: source
tags: [paper, audio, video, watch]
keywords: [joint audio-video, GRPO, RL post-training, synchronization]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/persona-audio-stack.md
  - concepts/joint-audio-visual-instruction-editing.md
  - sweeps/2026-09-25-daily.md
  - entities/models/av-grpo.md
  - entities/benchmarks/va-judger.md
maturity: draft
read_status: deep-read
created: 2026-09-25
updated: 2026-09-25
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @concepts/persona-audio-stack.md @concepts/joint-audio-visual-instruction-editing.md @sweeps/2026-09-25-daily.md @entities/models/av-grpo.md @entities/benchmarks/va-judger.md

## Raw Concept

- **Title**: AV-GRPO: Modality-Anchored Decoupling Diffusion Reinforcement Learning for Joint Audio-Video Generation
- **Type**: arXiv:2609.29816
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/ (archived 2026-09-25)
- **URL**: https://arxiv.org/abs/2609.29816
- **Retrieved**: 2026-09-25

## Narrative

AV-GRPO (Shanghai AI Laboratory et al.) is **online diffusion RL** for **joint audio–video** generation built on **Flow-GRPO / LongCat-Video**-style flow matching. Problem: joint towers have **divergent optimization dynamics**; naive joint RL makes **sync rewards incomparable** across rollouts.

**AV-GRPO** uses **modality-anchored decoupling**: (1) **modality-anchored rollouts** separate learning signals and stabilize difficulty; (2) **trajectory-locked frozen-tower optimization**; (3) **adaptive noise clipping** + **hyperparameter decoupling** for stable sampling. Theory appendix proves convergence under alternating Gibbs-style modality updates.

**Data:** **5DAV** — decoupled, **difficulty-controllable** paired A/V set for RL. Rewards: composed **per-modality + sync** judges (see §3.2.1).

Build-track link: pairs with @entities/benchmarks/va-judger.md and persona mux QA when open weights exist. Phase-0: **no public SPDX code drop** found at deep-read — **no clone**. License on arXiv HTML: **CC BY 4.0** (paper). Image-gen Phase-1: **none**.


## Snippets

- "We propose AV-GRPO, a modality-anchored online diffusion RL framework, and 5DAV, a decoupled, difficulty-controllable training dataset." [Source: arXiv abs 2609.29816]
- "Modality-anchored rollouts … disentangle learning signals while reducing anchor-induced difficulty variation." [Source: arXiv HTML 2609.29816 §2.2]
- Built on Flow-GRPO + LongCat-Video framework (appendix C). [Source: arXiv HTML 2609.29816]
- Paper license: CC BY 4.0 on HTML front matter. [Source: arXiv HTML 2609.29816]
