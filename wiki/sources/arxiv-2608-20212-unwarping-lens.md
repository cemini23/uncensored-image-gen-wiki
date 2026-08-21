---
title: "Unwarping the Lens video glasses removal (arXiv:2608.20212)"
type: source
tags: [paper, video, glasses-removal, identity, watch]
keywords: [JFSnet, Unwarping the Lens, glasses removal, DINOv2, Google, CTU]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - entities/models/jfsnet-unwarping-lens.md
  - sweeps/2026-08-21-daily.md
maturity: draft
read_status: read
created: 2026-08-21
updated: 2026-08-21
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/models/jfsnet-unwarping-lens.md @concepts/video-identity-inheritance.md @concepts/persona-consistency-methods.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-21-daily.md

## Raw Concept

- **Title**: Unwarping the Lens: A Physics-Grounded Approach to Video Glasses Removal
- **Authors**: Radim Spetlik (CTU Prague); David Futschik, Radek Danecek, Feitong Tan, Ziqian Bai, Rohit Pandey, Yinda Zhang (Google; Spetlik work done at Google)
- **Type**: arXiv:2608.20212 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.20212-unwarping-the-lens-a-physics-grounded-approach-t.pdf`
- **URL**: https://arxiv.org/abs/2608.20212
- **Retrieved**: 2026-08-21
- **Code**: **No public GitHub found** at ingest.

## Narrative

High-fidelity eyeglasses removal in video is not inpainting a mask: lenses add refractive distortion and view-dependent speculars. Generative priors (Nano Banana / Gemini 3 Pro Image, Runway Gen-4.5) drift identity / expression / pose across frames. The paper transfers photo-realistic multi-view knowledge from a commercial generative model into **JFSnet** (Joint Feature-Spatial network: DINOv2 semantic features + convolutional decoder, translation-equivariance for temporal consistency). Training uses three-stage structural filtering plus physically-based lens-optics simulation for paired data. Claimed 27.68 FPS; perceptual preference on CelebV-Text vs diffusion/GAN baselines.

**WATCH HIGH** for persona stills/video when glasses confound identity LoRA / likeness checks. Not a local ComfyUI adopt: teacher is a cloud generative prior; no SPDX repo. Image-gen Phase-1: none (`deferred`).

## Snippets

> "While large-scale generative priors have shown promise in eyeglasses removal via static image inpainting, they often lack the structural constraints necessary to maintain identity, expression, and pose, leading to visible “identity drift” in both static images and dynamic sequences."

[Source: arxiv-2608.20212, abstract]
