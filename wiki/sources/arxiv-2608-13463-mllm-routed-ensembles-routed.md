---
title: "MLLM-Routed Heterogeneous Ensembles — routed (arXiv:2608.13463)"
type: source
tags: [paper, routed, image-classification, mllm, routing, cross-wiki]
keywords: [ARMDIL, MLLM router, cross-dataset classification, ResNet, DINO, CLIP, ensemble routing, image-domain, routed]
related:
  - concepts/grpo-i2v-post-training.md
  - sweeps/2026-08-14-daily.md
maturity: draft
read_status: read
created: 2026-08-14
updated: 2026-08-14
---

## Relations

Primary ingest target: `@image-gen-wiki/` (image classification / visual-domain routing / ensemble). Dedup stub from cybersecurity wiki digest (fetched in the llm-security paper lane).

## Raw Concept

- **Title**: MLLM-Routed Heterogeneous Ensembles for Robust Cross-Dataset Image Classification
- **Authors**: Daniel Perkins, John Squires, Janou Milligan, Chandra Raskoti, Linda Ungerboeck (UT Knoxville)
- **Type**: arXiv:2608.13463 [cs.CV], v1 13 Aug 2026
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.13463-mllm-routed-heterogeneous-ensembles-for-robust-c.pdf`
- **URL**: https://arxiv.org/abs/2608.13463
- **Code**: none public at retrieval
- **Retrieved**: 2026-08-14

## Narrative

ARMDIL (Adaptive Router for Multi-Domain Image classification with LLMs): a Gemma-4-12B MLLM agent dynamically routes each image to the most suitable vision backbone — ResNet (CNN), DINO (SSL), CLIP (VLM) — across five domain aliases (GENERAL/FACIAL/GEOGRAPHIC/MEDICAL/UNSURE) with a unified 38-class head. Cross-domain image classification routing; no offensive/defensive cybersec content. Held as image-gen primary.
