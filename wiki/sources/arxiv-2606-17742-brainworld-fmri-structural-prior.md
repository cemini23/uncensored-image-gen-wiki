---
title: "BrainWorld — structural-prior-conditioned 4D fMRI generation (arXiv:2606.17742)"
type: source
tags: [paper, world-model, dit, structural-prior, spatiotemporal, medical-imaging, peripheral]
keywords: [BrainWorld, fMRI, sMRI conditioning, 4D brain dynamics, latent DiT, long-horizon generation, VAE]
related:
  - concepts/structural-prior-conditioned-spatiotemporal-generation.md
  - concepts/world-models-video-generation.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-23-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: skimmed
created: 2026-06-23
updated: 2026-06-23
---

## Relations

@concepts/structural-prior-conditioned-spatiotemporal-generation.md @concepts/world-models-video-generation.md

## Raw Concept

- **Title**: BrainWorld: A Structural-Prior-Conditioned Generative Model for Whole-Brain 4D fMRI Dynamics
- **Authors**: Junfeng Xia, Wenhao Ye et al. (SUSTech)
- **Type**: arXiv:2606.17742
- **Location**: `raw-sources/arxiv-2606.17742-brainworld-a-structural-prior-conditioned-genera.pdf`
- **URL**: https://arxiv.org/abs/2606.17742
- **Retrieved**: 2026-06-23
- **Read status**: skimmed (abstract + method overview)

## Narrative

**BrainWorld** — latent **DiT** for **whole-brain 4D fMRI** prediction. Uses **sMRI as asymmetric structural prior** injected through denoising (not parallel-modality concat).

**Pipeline:**

- Stage I: 4D fMRI **VAE** (frame-wise 3D encoder, WF-VAE-style wavelet fusion)
- Stage II: conditional **DiT** on latent brain dynamics under sMRI + past functional context + optional stimulus (video/audio encoders frozen)

**Claims:** Stable trajectories to **400 frames**; 22-dataset eval; generative augmentation improves downstream tasks.

### Workspace relevance

- **Peripheral** to persona T2I/T2V — useful as **analog** for structural-prior world models (anatomy → dynamics ≈ scene layout → video rollout)
- Code link in paper abstract; **no indexed GitHub** at Phase-0 `[NEEDS VERIFICATION 2026-06-23]`

## Snippets

> "sMRI can play an asymmetric role as anatomical context, rather than being treated as another parallel input modality."

## Dead Ends

Medical neuroimaging domain — no direct ComfyUI / Wan workflow path.
