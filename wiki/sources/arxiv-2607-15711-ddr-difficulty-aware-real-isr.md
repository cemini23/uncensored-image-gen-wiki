---
title: "DDR — difficulty-aware dynamic routing for Real-ISR (arXiv:2607.15711)"
type: source
tags: [paper, super-resolution, diffusion, real-isr, watch]
keywords: [DDR, Real-ISR, Stable-Diffusion, VAE-downsampling, dynamic-routing]
related:
  - concepts/frozen-dit-video-super-resolution.md
  - entities/uis/comfyui.md
  - sweeps/2026-07-20-daily.md
maturity: draft
read_status: skimmed
created: 2026-07-20
updated: 2026-07-20
---

## Relations

@concepts/frozen-dit-video-super-resolution.md @entities/uis/comfyui.md

## Raw Concept

- **Title**: Efficient Difficulty-Aware Dynamic Routing for Diffusion-Based Real-World Image Super-Resolution
- **Authors**: Xue Wu et al. (Xidian / Tsinghua)
- **Type**: arXiv:2607.15711
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.15711-efficient-difficulty-aware-dynamic-routing-for-d.pdf`
- **URL**: https://arxiv.org/abs/2607.15711
- **Code**: none found at ingest
- **Retrieved**: 2026-07-20

## Narrative

Proposes **Difficulty-aware Dynamic Routing (DDR)** for SD-based Real-ISR: estimate restoration difficulty per image, route to capacity-modulated networks that vary VAE spatial downsampling (preserve HF detail on hard cases). Addresses one-size-fits-all SD-ISR + irreversible 8× VAE loss.

**Phase-0: WATCH** — no public code/weights at ingest. Relevant if/when a ComfyUI node ships for persona still upscale; do not displace existing SUPIR / ESRGAN paths yet.

## Snippets

_(none)_
