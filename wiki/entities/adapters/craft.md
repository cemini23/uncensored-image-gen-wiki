---
title: CRAFT — ReFL LoRA personalization without composed targets
type: entity
tags: [adapter, identity-injection, lora, flux, refl, watch]
keywords: [CRAFT, ReFL, FLUX.2-klein-9B, attention reward, XVerseBench, composed-target-free]
related:
  - sources/arxiv-2608-14403-craft-attention-personalization.md
  - concepts/persona-consistency-methods.md
  - entities/models/flux-2-klein.md
  - concepts/reference-plus-lora-stacking.md
  - entities/adapters/characonsist.md
  - entities/adapters/pulid.md
maturity: draft
created: 2026-08-17
updated: 2026-08-17
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-14403-craft-attention-personalization.md @concepts/persona-consistency-methods.md @entities/models/flux-2-klein.md @concepts/reference-plus-lora-stacking.md @entities/adapters/characonsist.md @entities/adapters/pulid.md

## Raw Concept

Phase-0 from arXiv:2608.14403. Single-step ReFL LoRA on FLUX.2-klein-9B using 10K reference+mask pairs — no composed-target factory.

## Narrative

| Field | Value |
|-------|-------|
| Org | DGIST + Baidu + KAIST |
| Backbone | FLUX.2-klein-9B (recipe said to transfer to other reference-aware MMDiTs) |
| Data | 10K ref images + subject masks vs 150K–2M composed pairs in prior generalized methods |
| Method | Attention-level "where to look" reward + gated pixel identity reward (ReFL + LoRA) |
| Claim | XVerseBench SOTA [TENTATIVE, single source] |
| Code | Project page only — https://jihun999.github.io/projects/CRAFT/ — **no GitHub** |
| Phase-0 | **WATCH** (HIGH persona) |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Vs PuLID: CRAFT is a *training* recipe (LoRA + ReFL), not an inference adapter. Vs CharaConsist: CRAFT is not training-free; it spends a small LoRA pass to teach attention routing. Watch for a code drop before stacking onto the Klein 9B face-swap / matchingpose path.

## Snippets

> "CRAFT realizes a Where to look principle: attention-level rewards align noise- and phrase-token attention with the correct reference subject, and the resulting per-subject attention masks gate a pixel-level identity reward."

[Source: arxiv-2608.14403, abstract]
