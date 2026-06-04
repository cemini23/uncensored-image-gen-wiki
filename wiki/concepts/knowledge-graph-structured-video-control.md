---
title: Knowledge-graph structured video control (KGEdit)
type: concept
tags: [concept, video-generation, t2v, knowledge-graph, training-free, prompt-structure]
keywords: [KGEdit, AAKG, knowledge graph, structured semantic injection, TASC, training-free video editing, prompt disambiguation]
related:
  - sources/arxiv-2605-29509-kgedit-knowledge-graph-video-editing.md
  - concepts/prompt-engineering-uncensored.md
  - concepts/visual-to-visual-generation.md
  - concepts/persona-consistency-methods.md
  - sources/video-generation-survey-2026.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/wan-2-2.md
maturity: draft
created: 2026-06-04
updated: 2026-06-04
---

## Relations

@sources/arxiv-2605-29509-kgedit-knowledge-graph-video-editing.md @concepts/prompt-engineering-uncensored.md @concepts/visual-to-visual-generation.md @concepts/persona-consistency-methods.md

## Raw Concept

Concept stub from 2026-06-04 ingest — arXiv:2605.29509 KGEdit.

## Narrative

When natural-language video prompts bundle identity, relations, attributes, and negatives, holistic text encoding causes **semantic ambiguity** and **cross-frame drift**. KGEdit's pattern:

| Module | Role |
|--------|------|
| **AAKG** | Parse prompt → structured graph (identity / relation / attribute / negative) |
| **SSIM** | Inject structured signals into selected DiT layers (training-free) |
| **TASC** | Stage-aware semantic scheduling across denoising timesteps |

**Build-track posture:** research reference until code + Wan/Hunyuan node lands `[NEEDS VERIFICATION 2026-06-04]`. For persona ops, use when V2V pages (@concepts/visual-to-visual-generation.md) are insufficient and text refinement loops are costly.

## Snippets

(See @sources/arxiv-2605-29509-kgedit-knowledge-graph-video-editing.md)
