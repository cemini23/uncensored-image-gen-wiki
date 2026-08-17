---
title: "CRAFT: ReFL LoRA subject personalization without composed targets (arXiv:2608.14403)"
type: source
tags: [paper, persona, lora, flux, attention, watch]
keywords: [CRAFT, ReFL, FLUX.2-klein-9B, composed targets, attention reward, XVerseBench]
related:
  - entities/adapters/craft.md
  - concepts/persona-consistency-methods.md
  - concepts/reference-plus-lora-stacking.md
  - entities/models/flux-2-klein.md
  - sweeps/2026-08-17-daily.md
maturity: draft
read_status: read
created: 2026-08-17
updated: 2026-08-17
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/adapters/craft.md @concepts/persona-consistency-methods.md @concepts/reference-plus-lora-stacking.md @entities/models/flux-2-klein.md @sweeps/2026-08-17-daily.md

## Raw Concept

- **Title**: CRAFT: Constrained Reward via Attention Fine-Tuning for Subject Personalization without Composed Targets
- **Authors**: Jihun Park, Kyoungmin Lee, et al. (DGIST + Baidu + KAIST)
- **Type**: arXiv:2608.14403 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.14403-craft-constrained-reward-via-attention-fine-tuni.pdf`
- **URL**: https://arxiv.org/abs/2608.14403
- **Project**: https://jihun999.github.io/projects/CRAFT/ — **no code repo**. Do not invent a GitHub.
- **Retrieved**: 2026-08-17

## Narrative

Subject-driven personalization is usually a giant paired-data problem: 150K–2M (reference, composed-target) images from a multi-stage LLM→T2I→VLM curation pipeline. CRAFT drops the composed targets. Single-step **ReFL** fine-tunes a pretrained reference-aware MMDiT with **LoRA** on **10K reference images + subject masks only**. "Where to look": attention-level rewards align noise- and phrase-token attention with the right reference subject; those attention masks then **gate** a pixel-level identity reward so image-space supervision follows the learned routing. Applied to **FLUX.2-klein-9B**; authors claim XVerseBench SOTA [TENTATIVE, single source, no code]. Recipe said to transfer to other reference-aware backbones.

HIGH persona relevance: this is the first ingested method that treats Klein 9B as a ReFL personalization student without a composed-pair factory. Compare to PuLID (inference adapter) and CharaConsist (training-free attention). Watch for a code drop before any trainer wire.

**Phase-0: WATCH (HIGH persona).** Project page only → no SPDX. Image-gen local wire: none (`deferred`).

## Snippets

> "Applied to FLUX.2-klein-9B, CRAFT achieves state-of-the-art performance on XVerseBench while using no composed-target supervision—only 10K reference-only samples, whereas prior generalized methods require 150K to over 2M composed-target pairs."

[Source: arxiv-2608.14403, abstract]
