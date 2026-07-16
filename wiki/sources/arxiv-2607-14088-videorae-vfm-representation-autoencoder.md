---
title: "VideoRAE — VFM representation autoencoders for video generation (arXiv:2607.14088)"
type: source
tags: [paper, video-generation, vae, tokenizer, foundation-model]
keywords: [VideoRAE, V-JEPA 2, VideoMAEv2, LTX-VAE, Wan2.1-VAE, representation autoencoder, DiT, autoregressive]
related:
  - entities/models/videorae.md
  - concepts/vae-latent-space-downstream-diffusion.md
  - entities/models/ltx-2.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-07-16-daily.md
maturity: draft
read_status: read
created: 2026-07-16
updated: 2026-07-16
---

## Relations

@entities/models/videorae.md @concepts/vae-latent-space-downstream-diffusion.md @entities/models/ltx-2.md @entities/models/wan-2-2.md @sources/video-generation-survey-2026.md

## Raw Concept

- **Title**: VideoRAE: Taming Video Foundation Models for Generative Modeling via Representation Autoencoders
- **Authors**: Zhihao Xie, Junfeng Wu, Xinting Hu, Junchao Huang, Li Jiang (CUHK-Shenzhen / HUST / SLAI / USTC)
- **Type**: arXiv:2607.14088 preprint
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.14088-videorae-taming-video-foundation-models-for-gene.pdf`
- **URL**: https://arxiv.org/abs/2607.14088
- **Retrieved**: 2026-07-16
- **Read status**: read (abstract, method, Tables 2–4 claims)

## Narrative

**VideoRAE** freezes a video foundation encoder (VideoMAEv2 or V-JEPA 2), projects multi-scale features with a light 1D self-attention projector into compact latents for **both continuous DiT and discrete AR** (Multi-Codebook SimVQ). KL-free training via local+global alignment to the frozen teacher.

Reported [TENTATIVE]: UCF-101 class-to-video gFVD **40 (AR)** / **93 (DiT)**; ~5× faster AE convergence; controlled 2B T2V replacing **LTX-VAE → VideoRAE** → faster + better VBench. Reconstruction vs generation split: VideoMAEv2 better PSNR; V-JEPA 2 better generation.

Reinforces @concepts/vae-latent-space-downstream-diffusion.md — evaluate VAEs on generative metrics, not recon alone.

**Phase-0: WATCH** — "model and code will be released"; none public 2026-07-16. No local adopt.

## Snippets

> "In a controlled 2B-scale text-to-video experiment, replacing LTX-VAE with VideoRAE leads to faster convergence and consistently better VBench performance."

[Source: arxiv-2607.14088 abstract]
