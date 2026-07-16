---
title: VAE latent space design for downstream diffusion
type: concept
tags: [concept, vae, latent-diffusion, training, codec]
keywords: [VAE design, reconstruction vs generative quality, latent smoothness, factorized latent, downstream diffusion]
related:
  - sources/arxiv-2606-22959-vae-latent-sign-pose-diffusion.md
  - sources/video-generation-survey-2026.md
  - entities/models/ltx-2.md
  - entities/models/wan-2-2.md
  - sources/arxiv-2606-22959-vae-latent-sign-pose-diffusion.md
  - entities/models/videorae.md
  - sources/arxiv-2607-14088-videorae-vfm-representation-autoencoder.md
  - sweeps/2026-07-16-daily.md
maturity: draft
created: 2026-06-24
updated: 2026-07-16
---

## Relations

@sources/arxiv-2606-22959-vae-latent-sign-pose-diffusion.md @entities/models/ltx-2.md @entities/models/wan-2-2.md @entities/models/videorae.md @sources/arxiv-2607-14088-videorae-vfm-representation-autoencoder.md
## Raw Concept

Ingest 2026-06-24 from Fauré et al. (arXiv:2606.22959) — sign-language pose VAE study with transferable latent-diffusion lesson.

## Narrative

**Core lesson:** VAE selection by **reconstruction metrics alone** mis-ranks codecs for **downstream latent diffusion**. Latent-space structure (smoothness, factorization, region-weighted losses) can dominate generative quality.

### Design axes (from SignPoseVAE study)

| Axis | Tradeoff |
|------|----------|
| Shared vs factorized latent distribution | Factorization can hurt hand-detail generation despite good recon |
| Multi-objective reconstruction weights | Position vs velocity terms shift latent geometry |
| β-VAE KL weight | Regularization vs expressivity for diffusion training |

### Image/video gen parallel

Same pattern noted in image latent diffusion literature — SD/VAE and video tokenizers (LTX, Wan VAE) should be evaluated on **DiT sample quality**, not PSNR/SSIM alone. **VideoRAE** (arXiv:2607.14088) makes the same point empirically: V-JEPA 2 teacher beats VideoMAEv2 on generation gFVD despite weaker PSNR; claimed LTX-VAE drop-in at 2B T2V. → @entities/models/videorae.md

### Build-track note

Peripheral source domain (sign language). Do not adopt SignPoseVAE repo for persona work — see Phase-0 NO-GO in `briefs/2026-06-24_phase-0-car-signposevae.md`.

## Snippets

> "Optimizing solely for reconstruction error does not necessarily yield the most suitable latent representations for generative modeling."

## Dead Ends

Skeletal sign-pose modality — not portable to RGB persona latents without re-derivation.
