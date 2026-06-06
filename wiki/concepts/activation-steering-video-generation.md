---
title: Activation steering for video generation (LA-LQR)
type: concept
tags: [concept, video-generation, steering, safety, optimal-control, inference-time]
keywords: [LA-LQR, activation steering, latent LQR, T2V safety, contrastive vectors, reduced-order control, inference-time alignment, DiT]
related:
  - sources/arxiv-activation-steering-video-gen-2606.04775-2026-06-05.md
  - sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/prompt-engineering-uncensored.md
  - concepts/world-models-video-generation.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - concepts/cross-model-safety-steering.md
  - sources/arxiv-2606-05290-cross-model-safety-steering.md
maturity: draft
created: 2026-06-05
updated: 2026-06-06
---

## Relations

@sources/arxiv-activation-steering-video-gen-2606.04775-2026-06-05.md @sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md @concepts/censorship-tier-taxonomy.md @sources/video-generation-survey-2026.md @entities/models/wan-2-2.md

## Raw Concept

Deep-read from K100 ingest (2026-06-05) — arXiv:2606.04775 LA-LQR (Georgia Tech).

## Narrative

**Inference-time activation steering** for DiT-based T2V without weight edits or prompt filtering. Contrasts with coarse contrastive-vector addition (over/under-steering) and offline-trained controllers.

**LA-LQR pipeline:**

1. Treat reverse diffusion as a **finite-horizon dynamical system** on layer/timestep activations
2. Build a **low-dimensional latent subspace** from contrastive prompt pairs (with/without target concept)
3. Estimate **local linear dynamics** in latent space (Jacobian-vector products)
4. Solve **latent LQR** for closed-loop feedback steering signals per layer and denoising step — minimally invasive setpoint tracking with penalty on perturbation magnitude

**Claims [TENTATIVE]:** Reduces unsafe generations on concept-steering + video-safety benchmarks vs T2V steering baselines while preserving prompt fidelity and visual quality. Evaluated on Wan-class DiT T2V stack per paper related work.

### Workspace relevance

- **Safety axis (not de-censoring):** Mechanistic **suppression** of undesired concepts at inference — opposite direction from uncensored persona ops, but relevant for understanding what closed APIs enforce and what local Wan runs lack by default
- **Control cluster:** Shares optimal-control framing with **OptiWorld** (@sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md) — OptiWorld plans trajectories before render; LA-LQR steers activations during denoising
- **Build track:** Research-only until open code + ComfyUI hook for Wan/Hunyuan DiT blocks `[NEEDS VERIFICATION 2026-06-05]`

## Snippets

> "LA-LQR formulates T2V inference as a dynamical system and computes closed-loop feedback interventions that steer activations toward desired feature setpoints while penalizing unnecessary perturbations."

## Dead Ends

None — not a substitute for abliteration/LoRA uncensoring; steering toward safety setpoints ≠ removing alignment from Eastern Vanguard bases.
