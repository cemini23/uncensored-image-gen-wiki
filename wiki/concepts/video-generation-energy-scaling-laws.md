---
title: "Video generation energy scaling laws"
type: concept
tags: [compute-economics, video-generation, sustainability, scaling-laws, inference]
keywords: [energy, T2V, T2VA, quadratic attention, denoising steps, resolution, duration, MAPE, sustainability]
related:
  - sources/arxiv-2607-04553-lights-camera-carbon-video-energy-scaling.md
  - concepts/synthetic-media-compute-economics.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/ltx-2.md
  - concepts/budget-aware-diffusion-caching.md
  - sweeps/2026-07-09-daily.md
maturity: draft
created: 2026-07-09
updated: 2026-07-09
---

## Relations

@sources/arxiv-2607-04553-lights-camera-carbon-video-energy-scaling.md @concepts/synthetic-media-compute-economics.md @entities/models/wan-2-2.md @entities/models/hunyuanvideo-1-5.md @entities/models/ltx-2.md @concepts/budget-aware-diffusion-caching.md

## Raw Concept

Synthesized from @sources/arxiv-2607-04553-lights-camera-carbon-video-energy-scaling.md — architectural first-principles energy models for T2V/T2VA diffusion.

## Narrative

Video diffusion energy is dominated by **denoising**, which is predominantly **compute-bound** on modern GPUs. Total energy per clip scales roughly as:

`E ≈ S × B × (N_v·T² + M_v·T + audio_terms + overhead) + E_VAE`

where `T` is spatiotemporal token volume (resolution × frames), `S` is denoising steps, and `B` is batch size.

### Operator use

| Decision | How scaling laws help |
|----------|----------------------|
| Clip length vs quality | Quadratic in frames for full spatiotemporal attention — shortening clips saves more than lowering steps alone |
| Resolution ladder | 720p→480p cuts `T` sharply; pair with LiteVSR / cascaded SR if needed |
| Model pick | Wan vs Hunyuan vs LTX coefficients differ; same wall-clock ≠ same Wh |
| Batch persona renders | Linear in `B` only when clips are independent |

This complements dollar-based unit economics in @concepts/synthetic-media-compute-economics.md — use Wh estimates when comparing step-distilled vs full-step Wan on RunPod before large persona video batches.

Phase-0 posture: **REFERENCE** — no tooling to install.

## Snippets

> "Forward, it predicts energy from generation parameters and architectural principles; backward, it recovers architectural scaling behavior from observed inference times."

## Dead Ends

- Treating energy models as quality predictors — VBench still required.
