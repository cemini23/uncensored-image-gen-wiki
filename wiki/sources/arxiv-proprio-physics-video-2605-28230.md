---
title: "Proprio — latent self-scoring for physically plausible video (arXiv:2605.28230)"
type: source
tags: [paper, video-generation, physics, inference-time, wan, training-free]
keywords: [Proprio, flow residual, best-of-N, self-refinement, Physics-IQ, VideoPhy2, TurboWan2.2, training-free]
related:
  - concepts/world-models-video-generation.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
maturity: draft
read_status: read
created: 2026-06-01
updated: 2026-06-02
---

## Relations

@concepts/world-models-video-generation.md @entities/models/wan-2-2.md @sources/video-generation-survey-2026.md

## Raw Concept

- **Title**: Proprio: Latent Self-Scoring and Inference-Time Refinement for Physically Plausible Video Generation
- **Authors**: Mariam Hassan et al. (EPFL, Télécom Paris)
- **Type**: arXiv:2605.28230
- **Location**: `raw-sources/arxiv-2605.28230-proprio-latent-self-scoring-and-inference-time-r.pdf`
- **Retrieved**: 2026-06-01
- **Read status**: read (abstract + intro)

## Narrative

**Training-free** framework: frozen video generator scores its own outputs using **flow residual** under controlled latent perturbations — smaller/stable residuals ⇒ more consistent with learned dynamics ⇒ proxy for physical plausibility (proprioception analogy).

Uses:
- Inverse-variance aggregation across timesteps
- Dynamic spatiotemporal mask on motion regions
- **Best-of-N**, gradient **self-refinement** on initial noise, or hybrid

**Claims [TENTATIVE]:** TurboWan2.2 Physics-IQ 32.2→37.5 (+16.5%); VideoPhy2-hard 45.6→55.0 (+20.6%). Beats VLM scorers and external world-model baselines in several settings. ~82% diagnostic preference for real vs model-failure pairs on residual signal.

Project: https://vita-epfl.github.io/Proprio/

### Workspace relevance

Post-generation **quality gate** for Wan I2V persona clips — pick/refine takes before LatentSync/lipsync without external VLM judge. Pairs with world-model evaluation axis → @concepts/world-models-video-generation.md.

## Snippets

> "We treat the model's flow residual under controlled latent perturbations as a self-scoring signal." [Source: arXiv:2605.28230 abstract]

## Dead Ends

None — implementation on local Wan checkpoint `[NEEDS VERIFICATION 2026-06-01]`.
