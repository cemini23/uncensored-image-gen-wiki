---
title: Product identity in instruction editing (ProductConsistency)
type: concept
tags: [concept, image-editing, identity, product, ocr, rl, persona-consistency]
keywords: [ProductConsistency, cyclic consistency reward, product editing, text fidelity, brand preservation, instruction editing]
related:
  - sources/arxiv-2606-19103-productconsistency-product-identity-editing.md
  - concepts/persona-consistency-methods.md
  - concepts/likeness-collision-verification.md
  - concepts/causal-multi-turn-image-editing.md
  - entities/models/qwen-image-2512.md
  - entities/adapters/flux-kontext.md
  - entities/models/flux-1-dev.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-19
updated: 2026-06-19
---

## Relations

@sources/arxiv-2606-19103-productconsistency-product-identity-editing.md @concepts/persona-consistency-methods.md @entities/adapters/flux-kontext.md @entities/models/qwen-image-2512.md

## Raw Concept

Ingest 2026-06-19 from ProductConsistency (arXiv:2606.19103) — SFT+RL for product/brand-preserving instruction edits.

## Narrative

**Problem class:** General instruction editors optimize aesthetic + follow instructions but **destroy fine-grained object identity** (logo text, packaging shape, brand colors).

**ProductConsistency approach:**

1. **87k SFT** product-scene edit pairs
2. **RL** with cyclic consistency reward (original caption ↔ edited-image caption)
3. **Benchmark** with OCR/perceptual/MLLM metrics

**Persona parallel:** Hero-image scene swaps via @entities/adapters/flux-kontext.md must preserve face + signature props — same identity-preservation problem as product shots, different domain.

**Transferable idea:** Caption-cycle RL reward cheaper than human preference labels for identity-lock fine-tunes.

## Snippets

(See @sources/arxiv-2606-19103-productconsistency-product-identity-editing.md)

## Dead Ends

E-commerce dataset — NSFW persona edits need custom reward; no public dataset/weights at ingest.
