---
title: VideoRAE (CUHK/HUST — VFM representation autoencoder)
type: entity
tags: [model, video, vae, tokenizer, foundation-model]
keywords: [VideoRAE, V-JEPA, VideoMAEv2, LTX-VAE drop-in, latent codec, V-RAE, tFVD]
related:
  - sources/arxiv-2607-14088-videorae-vfm-representation-autoencoder.md
  - sources/arxiv-2608-13556-v-rae.md
  - concepts/vae-latent-space-downstream-diffusion.md
  - entities/models/ltx-2.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-07-16-daily.md
maturity: draft
created: 2026-07-16
updated: 2026-08-14
---

## Relations

@sources/arxiv-2607-14088-videorae-vfm-representation-autoencoder.md @sources/arxiv-2608-13556-v-rae.md @concepts/vae-latent-space-downstream-diffusion.md @entities/models/ltx-2.md @entities/models/wan-2-2.md @sources/video-generation-survey-2026.md

## Raw Concept

Entity from 2026-07-16 ingest of arXiv:2607.14088; extended 2026-08-14 with sibling paper V-RAE (arXiv:2608.13556).

## Narrative

| Field | Value |
|-------|--------|
| Paper | arXiv:2607.14088 (VideoRAE) |
| Code / weights | **Pending release** |
| Role | Generation-friendly video latent codec from frozen VFMs |
| Operator interest | Possible LTX/Wan VAE alternative if ComfyUI path appears |

### Follow-up: V-RAE (arXiv:2608.13556, 2026-08-14)

Same frozen-VFM → generation-latents thesis, folded here rather than a duplicate entity. V-RAE builds compact latents on frozen vision encoders (V-JEPA 2.1 / EUPE / DINOv3) with lightweight temporal pooling + video decoder. Reported [TENTATIVE]: **2.13 rFVD on K600** (beats all evaluated large-scale pretrained video VAEs); gFVD **117.86 (UCF101) / 19.16 (K600)**, up to **6× faster convergence**; improves future-video prediction on Cityscapes over **Wan 2.2 VAE**; introduces **tFVD** temporal-coherence diagnostic that correlates better with generation quality than reconstruction metrics. → @sources/arxiv-2608-13556-v-rae.md

### Phase-0

**WATCH**. Persona video stays stock Wan/LTX VAE stacks until open + Day-0 tooling. V-RAE adds a Wan-2.2-VAE-specific comparison + tFVD eval angle to the watch list.
