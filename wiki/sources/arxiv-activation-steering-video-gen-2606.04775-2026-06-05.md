---
title: "LA-LQR — activation steering for T2V (arXiv:2606.04775)"
type: source
tags: [paper, video-generation, steering, safety, optimal-control, inference-time, dit]
keywords: [LA-LQR, latent activation LQR, activation steering, T2V safety, contrastive vectors, reduced-order control, Georgia Tech]
related:
  - concepts/activation-steering-video-generation.md
  - sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/world-models-video-generation.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
maturity: draft
read_status: deep-read
created: 2026-06-05
updated: 2026-06-05
---

## Relations

@concepts/activation-steering-video-generation.md @sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md @sources/video-generation-survey-2026.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: Activation Steering of Video Generation Models via Reduced-Order Linear Optimal Control
- **Authors**: Jihoon Hong, Alice Chan, Qiyue Dai, Julian Skifstad, Glen Chou (Georgia Institute of Technology)
- **Type**: arXiv:2606.04775
- **Location**: `raw-sources/arxiv-2606.04775-activation-steering-of-video-generation-models-v.pdf`
- **URL**: https://arxiv.org/abs/2606.04775
- **Retrieved**: 2026-06-05
- **Read status**: deep-read (abstract + intro + method preliminaries)

## Narrative

Proposes **Latent Activation Linear-Quadratic Regulator (LA-LQR)** for **inference-time** steering of DiT-based T2V models without finetuning or weight editing.

**Problem:** Web-scale T2V models inherit unsafe concepts; prompt filters jailbreak; naive activation steering (contrastive vector addition) is non-anticipative and causes oversteering / quality loss.

**Method:**

1. Model reverse diffusion as LTV dynamical system on per-layer activations \(x_{l,t}\) (video patches + cross-attn text context)
2. Derive **contrastive steering subspace** from prompt pairs (concept present vs absent)
3. Project high-dimensional activations to low-dimensional latent features; estimate local linear dynamics via JVP
4. Solve **latent LQR** online for minimum-norm feedback \(u^*_k = -K_k z_k\) toward concept setpoints at each denoising step and layer

**Evaluation [TENTATIVE]:** Concept steering + video safety benchmarks — reduces unsafe output rate vs T2V steering baselines while preserving prompt adherence and visual quality. Paper discusses Wan et al. (2025) class models in related work.

### Workspace relevance

Mechanistic **safety steering** reference (suppression axis). Pairs with OptiWorld optimal-control-before-render (@sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md). Not a persona uncensoring tool — documents inference-time control surface on DiT video blocks.

## Snippets

> "We formalize T2V generation as a finite-horizon dynamical system and propose a linear optimal control framework for inference-time T2V steering."

> "We make control tractable for T2V models by constructing and projecting to a reduced-order latent space capturing dominant features from contrastive vectors in the full activation space."

## Dead Ends

Open-source implementation + Wan/Hunyuan layer hooks not verified `[NEEDS VERIFICATION 2026-06-05]`. Paper contains offensive model outputs in safety eval figures — handle as research artifact only.
