---
title: "JANUS materials neural sampler (arXiv:2608.19116) — skip scientific ML"
type: source
tags: [paper, skip, scientific-ml, materials, diffusion]
keywords: [JANUS materials, disordered materials, Microsoft Research, MIT, neural sampler]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-20-daily.md
maturity: draft
read_status: read
created: 2026-08-20
updated: 2026-08-20
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@sweeps/2026-08-20-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: JANUS: A Multi-modal Foundation Neural Sampler for Disordered Materials
- **Authors**: Denis Blessing, Mouyang Cheng, Maximilian Schebek, Jutta Rogal, Mingda Li, Carles Domingo-Enrich, Yuanqi Du (Microsoft Research New England / KIT / MIT / FU Berlin / Flatiron)
- **Type**: arXiv:2608.19116 [cond-mat.mtrl-sci]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.19116-janus-a-multi-modal-foundation-neural-sampler-fo.pdf`
- **URL**: https://arxiv.org/abs/2608.19116
- **Retrieved**: 2026-08-20
- **Code**: none at ingest.
- **Name collision**: **not** DeepSeek Janus-Pro VLM (`entities/models/janus-pro.md`). Slug kept `janus-materials-skip` on purpose. No related edge to the VLM entity.

## Narrative

**Phase-0: SKIP scientific ML.** Microsoft/MIT neural sampler that couples masked discrete diffusion (atomic identities/vacancies) with continuous diffusion (displacements + cell volume) for crystalline disordered materials. Reproduces Monte Carlo observables with >1000× fewer energy evals; inverse-designs alloys; finds semiconductor defect motifs. Not a generative-media model.

Image-gen `wont_wire`. Do not merge into Janus-Pro. No sibling ROUTE.

## Snippets

> "Here we introduce JANUS, a multimodal neural sampler that couples continuous and masked discrete diffusion through an equivariant graph neural network trained directly from energy evaluations, without pre-generated equilibrium data."

[Source: arxiv-2608.19116, abstract]
