---
title: Shared-context single-tokenizer unified multimodal models (UniAR)
type: concept
tags: [concept, unified-multimodal, t2i, image-editing, autoregressive, tokenizer, shared-context]
keywords: [UniAR, single visual tokenizer, shared context, BSQ, parallel bitwise prediction, dual-tokenizer problem, Janus, BAGEL]
related:
  - sources/arxiv-2606-18249-uniar-shared-context-visual-tokenizer.md
  - entities/models/uniar.md
  - concepts/holistic-visual-tokenizer-umm.md
  - concepts/understanding-generation-gap.md
  - entities/models/bagel.md
  - entities/models/janus-pro.md
  - entities/models/hydra-x.md
  - sources/arxiv-2606-13289-hydra-x-unified-multimodal.md
  - sources/video-generation-survey-2026.md
  - entities/models/qwen-image-2512.md
maturity: draft
created: 2026-06-21
updated: 2026-06-21
---

## Relations

@sources/arxiv-2606-18249-uniar-shared-context-visual-tokenizer.md @entities/models/uniar.md @concepts/holistic-visual-tokenizer-umm.md @concepts/understanding-generation-gap.md @entities/models/bagel.md @entities/models/janus-pro.md

## Raw Concept

Ingest 2026-06-21 from UniAR (arXiv:2606.18249) — one BSQ visual tokenizer for AR understand/gen/edit in shared context.

## Narrative

**Dual-tokenizer problem:** Janus / BAGEL / many UMMs use separate encoders for understanding vs generation → generated images must be **re-encoded** before the model can reason about them — breaks unified context.

**UniAR approach:**

| Piece | Role |
|-------|------|
| Multi-level ViT fusion | Semantics (deep) + detail (shallow) in one code |
| Lookup-free BSQ | Massive effective vocab without huge codebook |
| Parallel bitwise AR steps | 32× shorter visual sequences |
| Text-free DiT decoder | Pixels from visual tokens only |

**Comparison cluster:** HYDRA-X holistic tokenizer (@concepts/holistic-visual-tokenizer-umm.md), X-Omni (dual codebook), hybrid AR+flow models (JanusFlow).

### Workspace relevance

Candidate **unified T2I + edit + VQA** stack for persona ops if weights are permissive and 24 GB inference holds. ComfyUI path unverified.

## Snippets

> "Enabling a shared context in which the model can directly interpret its own generated visual tokens without additional re-encoding."

## Dead Ends

Image-only at audit — no native video gen in UniAR paper. Not a Wan/FLUX replacement for persona video rolls.
