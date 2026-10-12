---
title: ""Robot failure dynamics from human interaction video (arXiv:2610.13522) — SKIP""
type: source
tags: [paper, robotics, world-model, out-of-domain, skip]
keywords: [HF-WM, failure dynamics, counterfactual actions, Flow-GRPO, Cosmos 3, stabilized pointflow, skeleton action space, policy evaluation, RH20T, DROID]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-12-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-12
updated: 2026-10-12
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-12-daily.md

## Raw Concept

- **Title**: Beyond Successful Robot Demonstrations: Learning from Human Interactions and Modeling Failure Dynamics
- **Type**: arXiv:2610.13522 (Zhejiang University + USTC + IA-CAS; Peiyan Tu et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.13522-beyond-successful-robot-demonstrations-learning.pdf (archived 2026-10-12)
- **URL**: https://arxiv.org/abs/2610.13522
- **Retrieved**: 2026-10-12

## Narrative

**A robotics paper with a video world model at its core.** HF-WM learns dynamics from egocentric human interaction data, bridging the human-hand to robot-arm gap through a shared 2D skeleton action space, and learns **failure** dynamics from counterfactual action perturbations without any ground-truth failure videos. It doubles as a robot policy evaluator.

**Method.** Built on Cosmos 3 Nano (mixture-of-transformers, Wan2.2 VAE). Stage one is supervised fine-tuning with an auxiliary stabilized pointflow head; stage two is Flow-GRPO post-training on perturbed actions, rewarded by an action-alignment scorer and a VLM-built physical-plausibility checklist.

**Results.** Action-conditioned video generation reaches PSNR 26.077, SSIM 0.889, LPIPS 0.082, FVD 14.449, ahead of the comparison set. Policy evaluation correlates at Pearson r = 0.983 with real-world success rates.

**Why SKIP.** Robotics end to end — the video model is inseparable from robot action conditioning, and **there is no robotics sibling wiki** to route into. It ships a project page only, no code, no weights, no failure-dataset release, and the base Cosmos 3 weights are gated. Training used 8x A100. The one transferable technique — reward-guided RL post-training of flow video models (Flow-GRPO) — originates in a cited prior paper, not here. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.13522 (retrieved 2026-10-12)]
