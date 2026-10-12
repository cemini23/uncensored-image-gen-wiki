---
title: ""Predicting nanofabrication variance with a conditional diffusion model (arXiv:2610.13420) — SKIP""
type: source
tags: [paper, materials, process-modelling, out-of-domain, skip]
keywords: [nanofabrication, focused ion beam, conditional DDPM, SPADE conditioning, SEM images, linewidth variance, defect probability, materials process]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-12-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-12
updated: 2026-10-12
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-12-daily.md

## Raw Concept

- **Title**: Predicting Nanofabrication Variance: A Conditional Diffusion Model
- **Type**: arXiv:2610.13420 (University of Southampton; Wenhan Zhang et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.13420-predicting-nanofabrication-variance-a-conditiona.pdf (archived 2026-10-12)
- **URL**: https://arxiv.org/abs/2610.13420
- **Retrieved**: 2026-10-12

## Narrative

**Genuinely generative, but domain-locked.** A conditional DDPM (U-Net with self-attention bottleneck, SPADE geometry conditioning, DDIM sampling at 50 steps) that learns the distribution of focused-ion-beam milling outcomes conditioned on the input binary mask. It predicts a *distribution* of fabricated outcomes rather than one deterministic result.

**Results.** Predicts wide-trench linewidths 50.0 +/- 2.7 nm and narrow 30.0 +/- 1.8 nm; defect rates matched from ~1.3% to over 99%; PCA deformation modes reproduced to roughly the tenth component.

**Why SKIP.** The dataset is released via the University of Southampton ePrints (DOI 10.5258/SOTON/D3997) with no code, but the domain is semiconductor process variability. There is no generative-media relevance and **no materials or semiconductor sibling wiki**. The DDPM + SPADE stack is textbook, so there is nothing transferable either. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.13420 (retrieved 2026-10-12)]
