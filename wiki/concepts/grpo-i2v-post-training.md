---
title: GRPO post-training for image-to-video (TAGRPO)
type: concept
tags: [i2v, grpo, rlhf, post-training, video-generation]
keywords: [TAGRPO, GRPO, DanceGRPO, trajectory alignment, memory bank, Wan 2.2, HunyuanVideo, Q-Save, HPSv3]
related:
  - sources/arxiv-tagrpo-i2v-grpo-2601-05729.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - concepts/video-identity-inheritance.md
  - sources/video-generation-survey-2026.md
  - concepts/autoregressive-video-foresight-training.md
  - sources/arxiv-2606-03971-video-mirai-autoregressive-foresight.md
  - concepts/one-step-autoregressive-video-distillation.md
  - sources/arxiv-2606-03972-aad-1-one-step-ar-video.md
  - sources/arxiv-2606-09701-advgrpo-red-teaming-routed.md
  - sources/arxiv-2607-15273-meanflownft-forward-process-rl.md
  - entities/models/meanflownft.md
  - sweeps/2026-07-17-daily.md
maturity: draft
created: 2026-06-01
updated: 2026-07-17
---

## Relations

@sources/arxiv-tagrpo-i2v-grpo-2601-05729.md @entities/models/wan-2-2.md @entities/models/hunyuanvideo-1-5.md @concepts/video-identity-inheritance.md @sources/video-generation-survey-2026.md

## Raw Concept

Ingest 2026-06-01 from Tencent Hunyuan TAGRPO paper. First I2V-specific GRPO framework claiming gains on Wan 2.2 + HunyuanVideo-1.5 where T2V GRPO ports fail.

## Narrative

**GRPO (Group Relative Policy Optimization)** has landed in visual diffusion post-training (DanceGRPO, etc.) for text-conditioned models. **I2V is harder:** videos from the same conditioning image share structure — ranking **trajectories within a noise group** beats independent sample rewards.

**TAGRPO recipe:**
1. Roll out multiple I2V samples sharing conditioning image + matched initial noise groups
2. Apply trajectory-wise GRPO on **intermediate latents** — align to high-reward, repel low-reward paths
3. **Memory bank** caches historical latents/rewards to cut rollout compute

Reward models cited: Q-Save, HPSv3 `[TENTATIVE — verify open weights]`.

### Persona-ops fit

Post-training hook **after** identity-locked master image I2V — could improve motion quality / preference alignment without retraining character LoRA. Track release of Hunyuan/Tencent scripts before build-track adoption → @entities/models/wan-2-2.md.

**2026-07-17 adjacent:** @entities/models/meanflownft.md applies **forward-process RL (NFT)** to MeanFlow few-step generators (SD3.5-M primary; Wan2.1 branch WIP). Complements TAGRPO (trajectory GRPO on I2V) — different objective (average-velocity / few-step) but same persona question: post-train open video stacks without new LoRAs. Phase-0 **WATCH** until Wan weights + smoke path fit budget.

## Snippets

> "Videos generated from the same conditioning image share significant structural content, the relative relationships among their trajectories offer rich optimization cues." [Source: arXiv:2601.05729 §1]

## Dead Ends

- **Applying T2V GRPO recipes directly to I2V** — paper shows inconsistent gains; use I2V-specific alignment.
