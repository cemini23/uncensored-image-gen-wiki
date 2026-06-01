---
title: Visual-to-visual generation (V2V)
type: concept
tags: [conditioning, v2v, prompt-engineering, vlm, qwen-image]
keywords: [V2V, V2V-Zero, visual specification page, hidden-state injection, Simple-V2V Bench, character turnaround]
related:
  - sources/arxiv-visual-to-visual-generation-2605-12271.md
  - entities/models/qwen-image-2512.md
  - concepts/multi-angle-dataset-prep.md
  - concepts/prompt-engineering-uncensored.md
  - concepts/persona-consistency-methods.md
maturity: draft
created: 2026-06-01
updated: 2026-06-01
---

## Relations

@sources/arxiv-visual-to-visual-generation-2605-12271.md @entities/models/qwen-image-2512.md @concepts/multi-angle-dataset-prep.md @concepts/prompt-engineering-uncensored.md @concepts/persona-consistency-methods.md

## Raw Concept

Ingest 2026-06-01 from arXiv:2605.12271 (V2V-Zero). Training-free conditioning via visual pages on VLM→DiT architectures.

## Narrative

**Problem:** Text serializes spatial layout, exact colors, glyph shapes, and reference bindings poorly.

**V2V:** User builds a **visual specification page** (boards, swatches, sketches, inline reference thumbnails). Frozen VLM encodes page → final hidden states → frozen DiT cross-attention (same path as text prompts).

**V2V-Zero** — no fine-tuning. Demonstrated on Qwen-Image (T2I) and HunyuanVideo-1.5 (T2V extension).

**Capability tiers (Simple-V2V Bench):**
- Strong: attribute / reference binding
- Weak: counting, complex content generation
- Hardest: pose + sketch structural control

### Persona workflow hooks

- **Character turnaround sheets** as V2V pages instead of long prompt strings → @concepts/multi-angle-dataset-prep.md
- **Style/mood boards** for narrative progression posts → @concepts/persona-content-cadence.md (future backlink optional)

Not a replacement for PuLID numeric identity lock — complementary conditioning surface.

## Snippets

> "The input page is not an image to be reconstructed or modified, but a conditioning document whose visual content should be interpreted as the scene specification." [Source: arXiv:2605.12271 §1]

## Dead Ends

- **Expecting V2V to enforce face-ID metrics alone** — use identity adapters + LoRA stack alongside V2V pages.
