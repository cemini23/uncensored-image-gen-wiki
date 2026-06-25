---
title: "dVLA-RL — RL over denoising trajectories for discrete diffusion VLAs (arXiv:2606.23623)"
type: source
tags: [paper, robotics, vla, reinforcement-learning, peripheral, rerouted]
keywords: [dVLA-RL, UDVLA-RL, discrete diffusion VLA, denoising trajectory, LIBERO, RoboTwin, embodied-ai]
related:
  - concepts/discrete-diffusion-vla-reinforcement-learning.md
  - sweeps/2026-06-25-daily.md
maturity: draft
read_status: skimmed
created: 2026-06-25
updated: 2026-06-25
---

## Relations

@concepts/discrete-diffusion-vla-reinforcement-learning.md

## Raw Concept

- **Title**: dVLA-RL: Reinforcement Learning over Denoising Trajectories for Discrete Diffusion Vision-Language-Action Models
- **Authors**: Yuhao Wu et al. (SJTU, Tsinghua SIGS, Baidu AI Cloud, D-Robotics, Shanghai AI Lab)
- **Type**: arXiv:2606.23623
- **Location**: `raw-sources/arxiv-2606-23623-2606-23623v1-dvla-rl-reinforcement-learning-over.pdf`
- **URL**: https://arxiv.org/abs/2606.23623
- **Retrieved**: 2026-06-25
- **Read status**: skimmed (abstract only)

## Narrative

**dVLA-RL / UDVLA-RL** — policy-gradient RL for **discrete diffusion Vision-Language-Action** models by modeling the **full denoising path** as an MDP (product of step-wise transition log-probs), not marginal final-action probability.

Claims **99.7% LIBERO** success and **+30.6% vs SFT** on RoboTwin 2.0 with unified step scheduling across task complexity.

### Workspace relevance

**Off build-track** — embodied robotics control, not generative media production. Kept as peripheral source documenting discrete-diffusion + RL intersection (may inform future unified multimodal research). **Drop** from ComfyUI/persona adoption.

## Snippets

> "Modeling the denoising process as a Markov Decision Process… formulate this path probability as a product of step-wise transitions."

## Dead Ends

Robotics VLA domain — no image/video/voice persona pipeline application at ingest.
