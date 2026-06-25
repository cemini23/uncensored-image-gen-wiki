---
title: Discrete-diffusion VLA reinforcement learning
type: concept
tags: [concept, robotics, vla, reinforcement-learning, peripheral]
keywords: [dVLA-RL, denoising trajectory RL, discrete diffusion actions, embodied AI, MDP]
related:
  - sources/arxiv-2606-23623-dvla-rl-discrete-diffusion-vla.md
maturity: draft
created: 2026-06-25
updated: 2026-06-25
---

## Relations

@sources/arxiv-2606-23623-dvla-rl-discrete-diffusion-vla.md

## Raw Concept

Ingest 2026-06-25 from Wu et al. (arXiv:2606.23623) — RL objective for masked discrete-diffusion action models in robotics.

## Narrative

**Core idea:** policy-gradient RL must sum log-probs over **each denoising step** in discrete diffusion VLAs — optimizing final-step marginal alone is unstable when multi-step decoding is used.

**Workspace note:** robotics-only at ingest. Tangential interest: discrete diffusion + RL math may eventually touch unified multimodal generators — no current persona pipeline hook.

## Snippets

> "Intermediate denoising transitions are not merely implementation details."

## Dead Ends

LIBERO / RoboTwin benchmarks — off-domain for generative media wiki.
