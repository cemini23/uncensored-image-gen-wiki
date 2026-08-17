---
title: "Polar-low SAR segmentation / CREST (arXiv:2608.14366) — skip"
type: source
tags: [paper, skip, remote-sensing, segmentation]
keywords: [CREST, polar low, Sentinel-1, SAR, weakly supervised segmentation]
related:
  - sweeps/2026-08-17-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-08-17
updated: 2026-08-17
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@sweeps/2026-08-17-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: Weakly Supervised Polar Low Segmentation in Sentinel-1 SAR Imagery
- **Authors**: Andrea Federici, Jakob Grahn, Giacomo Boracchi, Filippo Maria Bianchi (UiT + NORCE + Politecnico di Milano)
- **Type**: arXiv:2608.14366 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.14366-weakly-supervised-polar-low-segmentation-in-sent.pdf`
- **URL**: https://arxiv.org/abs/2608.14366
- **Retrieved**: 2026-08-17
- **Code**: none in PDF → no SPDX.

## Narrative

**Phase-0: SKIP (remote-sensing).** CREST (Constrained Region Erasing with Soft Targets) is a weakly supervised semantic-segmentation recipe for polar lows in Sentinel-1 SAR. Image-level labels only; adversarial erasing plus a connectedness prior and a bootstrapping loss that down-weights later-mined regions. Meteorology / geology, same class as the W2 geology SKIP precedent — no T2I, T2V, persona, voice, or lipsync hook. Not atto / poker / guruwatcher / prod. Image-gen local wire: none (`wont_wire`).

## Snippets

> "We propose Constrained Region Erasing with Soft Targets (CREST), a Weakly Supervised Semantic Segmentation (WSSS) framework that generates masks solely from image-level labels."

[Source: arxiv-2608.14366, abstract]
