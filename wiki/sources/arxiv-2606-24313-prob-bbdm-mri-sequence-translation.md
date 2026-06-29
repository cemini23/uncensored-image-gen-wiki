---
title: "Prob-BBDM — probabilistic Brownian bridge MRI translation (arXiv:2606.24313)"
type: source
tags: [paper, medical-imaging, img2img, brownian-bridge, peripheral]
keywords: [Prob-BBDM, BBDM, MRI sequence translation, BraTS, variational encoder, 4-step diffusion]
related:
  - concepts/brownian-bridge-medical-image-translation.md
  - concepts/budget-aware-diffusion-caching.md
  - sweeps/2026-06-29-daily.md
maturity: draft
read_status: read
created: 2026-06-29
updated: 2026-06-29
---

## Relations

@concepts/brownian-bridge-medical-image-translation.md

## Raw Concept

- **Title**: Prob-BBDM: a Probabilistic Brownian Bridge Diffusion Model for MRI sequence image-to-image translation
- **Authors**: Martin Valls, Pascal Bourdon, et al.
- **Type**: arXiv:2606.24313 · Comp. Med. Imag. and Graph. 2026
- **Location**: `raw-sources/arxiv-2606.24313-2606-24313v1-prob-bbdm-a-probabilistic-brownian.pdf`
- **URL**: https://arxiv.org/abs/2606.24313 · https://gitlab.xlim.fr/mvalls/Prob-BBDM
- **Retrieved**: 2026-06-29
- **Read status**: read (abstract)

## Narrative

**Prob-BBDM** — **Brownian Bridge Diffusion** for **MRI sequence i2i** (2D axial slice → alternate MRI contrast/sequence). Variational encoder guides probabilistic bridge; **4 denoising steps** on BraTS 2021 (88.46% SSIM) `[TENTATIVE]`.

### Workspace relevance

**Peripheral** — medical imaging domain; technique note only (few-step BBDM) for @concepts/budget-aware-diffusion-caching.md adjacent literature. Phase-0: **NO-GO** for persona/generative-media build track — `briefs/2026-06-29_phase-0-emosh-prob-bbdm.md`.

## Snippets

> "Our diffusion process requires only 4 steps, making it computationally efficient while maintaining high-quality synthesis."

## Dead Ends

Clinical MRI synthesis — no ComfyUI/persona pipeline integration.
