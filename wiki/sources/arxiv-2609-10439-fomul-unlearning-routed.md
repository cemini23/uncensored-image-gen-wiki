---
title: "Layer-selective unlearning (arXiv:2609.10439) - routed CCC"
type: source
tags: [paper, skip, routed, ccc]
keywords: [machine unlearning, layer selection, quantization, LLM]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
maturity: draft
read_status: skimmed
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: SKIP
wire_status: routed
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **Title**: Forgetting Only What Matters: Layer-Selective Unlearning toward Robust LLMs
- **Type**: arXiv:2609.10439 [cs.LG]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.10439
- **Code**: Repo raviranjan-ai/FOMUL- returns 404 - do not clone.
- **Retrieved**: 2026-09-11

## Narrative

SKIP / ROUTE CCC. FOM-UL selects transformer layers with a forget-to-retain significance score and concentrates updates there to remove targeted knowledge with less utility loss and better 8-bit / 4-bit quantization resilience. Repo raviranjan-ai/FOMUL- returns 404 - do not clone. Image-gen Phase-1: none. Brief: briefs/2026-09-11_fomul-unlearning-from-image-gen.md.

## Snippets

"FOM-UL reduces residual memorization compared with strong GA, NPO, KLD, SURE, ReLearn, and LUNAR-based baselines while preserving retain-set utility close to the vanilla model." [Source: arxiv-2609.10439]
