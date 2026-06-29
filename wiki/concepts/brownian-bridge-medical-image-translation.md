---
title: Brownian bridge diffusion for medical image translation
type: concept
tags: [concept, img2img, brownian-bridge, medical-imaging, peripheral]
keywords: [BBDM, Prob-BBDM, Brownian bridge, MRI translation, few-step diffusion]
related:
  - sources/arxiv-2606-24313-prob-bbdm-mri-sequence-translation.md
  - concepts/budget-aware-diffusion-caching.md
maturity: draft
created: 2026-06-29
updated: 2026-06-29
---

## Relations

@sources/arxiv-2606-24313-prob-bbdm-mri-sequence-translation.md

## Raw Concept

Ingest 2026-06-29 from Valls et al. (arXiv:2606.24313) — probabilistic BBDM for MRI i2i; **peripheral** to generative-media stack.

## Narrative

**Brownian Bridge Diffusion Models (BBDM)** constrain diffusion between fixed endpoints (source MRI slice → target contrast) rather than noise→data — enables **very few steps** (4 in Prob-BBDM) with variational encoder uncertainty.

### Workspace boundary

Medical/clinical imaging — **not** persona, NSFW, or ComfyUI build track. Kept as technique reference for few-step bridge diffusion literature adjacent to inference-speed research.

## Snippets

> "Synthesizes magnetic resonance imaging (MRI) sequences from 2D axial slices."

## Dead Ends

Off-domain for uncensored local generative-media workspace.
