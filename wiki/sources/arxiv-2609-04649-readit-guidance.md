---
title: "ReaDiT guidance control for image and video generation (arXiv:2609.04649)"
type: source
tags: [paper, guidance, diffusion, video, watch]
keywords: [ReaDiT, DiT features, spatial control, motion control]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - entities/models/readit-guidance.md
maturity: draft
read_status: read
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @entities/models/readit-guidance.md

## Raw Concept

- **Title**: ReaDiT Guidance: Control for Image and Video Generation using Diffusion Transformer Features
- **Type**: arXiv:2609.04649 [cs.CV]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.04649
- **Code**: none found
- **Retrieved**: 2026-09-11

## Narrative

The paper presents DiT Readout (ReaDiT) Guidance, a lightweight framework that controls diffusion transformer models through their internal feature representations. It uses features from a single DiT block to steer generation toward spatial targets such as depth, pose, or edge maps given at test time. Because modern text-to-video models use DiT backbones, the method also extends to camera and motion control. The authors report competitive or improved results versus feature-based and adapter-based approaches with fewer parameters. Image-gen Phase-1: none.

## Snippets

> We present DiT Readout (ReaDiT) Guidance, a lightweight framework for controlling generation with Diffusion Transformer (DiT) models via their internal feature representations. [Source: arxiv-2609.04649]
