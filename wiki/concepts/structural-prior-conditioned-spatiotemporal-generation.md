---
title: Structural-prior-conditioned spatiotemporal generation
type: concept
tags: [concept, world-model, structural-prior, spatiotemporal, conditioning]
keywords: [structural prior, asymmetric conditioning, BrainWorld, anatomy guides dynamics, latent DiT]
related:
  - sources/arxiv-2606-17742-brainworld-fmri-structural-prior.md
  - concepts/world-models-video-generation.md
  - concepts/multi-view-3d-consistent-world-models.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-23
updated: 2026-06-23
---

## Relations

@sources/arxiv-2606-17742-brainworld-fmri-structural-prior.md @concepts/world-models-video-generation.md @concepts/multi-view-3d-consistent-world-models.md

## Raw Concept

Ingest 2026-06-23 from BrainWorld (arXiv:2606.17742) — static structural context injected through denoising for long-horizon 4D rollout.

## Narrative

**Pattern:** Treat **slow structural state** (sMRI / scene layout / mesh) as **asymmetric prior** modulating **fast spatiotemporal dynamics** (fMRI / video), rather than shallow multimodal concat.

**BrainWorld instantiation:** VAE latents + conditional DiT; sMRI conditions denoising throughout backbone; autoregressive latent rollout to 400 frames.

**Wiki analogs:** PAIWorld Geo-RoPE (@concepts/multi-view-3d-consistent-world-models.md) uses geometry; BrainWorld uses anatomy — both reject naive token concat.

### Workspace relevance

Theoretical reference for **scene-locked persona environments** — not build-track today.

## Snippets

> "Injecting structural information into the denoising process allows anatomical context to modulate the formation of functional dynamics."

## Dead Ends

fMRI domain — no image-gen weights.
