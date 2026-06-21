---
title: UniAR (Qwen Team / ShareLab — shared-context UMM)
type: entity
tags: [model, unified-multimodal, t2i, image-editing, autoregressive, qwen, alibaba, open-weights]
keywords: [UniAR, ShareLab-SII, BSQ tokenizer, ICML 2026, Hugging Face, 24GB VRAM]
related:
  - sources/arxiv-2606-18249-uniar-shared-context-visual-tokenizer.md
  - concepts/shared-context-single-tokenizer-umm.md
  - concepts/holistic-visual-tokenizer-umm.md
  - entities/models/bagel.md
  - entities/models/janus-pro.md
  - entities/models/hydra-x.md
  - sources/arxiv-2606-13289-hydra-x-unified-multimodal.md
  - entities/models/qwen-image-2512.md
  - sources/video-generation-survey-2026.md
  - concepts/understanding-generation-gap.md
maturity: draft
created: 2026-06-21
updated: 2026-06-21
phase_0_verdict: CONDITIONAL-GO
phase_0_date: 2026-06-21
---

## Relations

@sources/arxiv-2606-18249-uniar-shared-context-visual-tokenizer.md @concepts/shared-context-single-tokenizer-umm.md @entities/models/bagel.md @entities/models/hydra-x.md

## Raw Concept

Entity from 2026-06-21 ingest — UniAR (arXiv:2606.18249). Code: https://github.com/ShareLab-SII/UniAR

## Narrative

**UniAR** — ICML 2026 unified AR multimodal model (understand / generate / edit) with single BSQ visual tokenizer.

| Field | Value |
|-------|-------|
| Repo | `ShareLab-SII/UniAR` — ~23★; pushed 2026-06-17 |
| Weights | HF `ShareLab-SII/UniAR-RL`, `UniAR-SFT` |
| License | **No LICENSE file in repo** at audit — verify HF model cards |
| VRAM | ≥24 GB inference (README) |
| Phase-0 | **CONDITIONAL-GO** — code + weights live; license + NSFW posture TBD |

**Status:** Phase-0 adopt after license check + local NSFW eval on persona prompts.

## Snippets

> "Requirements: Python 3.12, CUDA 12.1+, GPU with >= 24 GB VRAM for inference." [Source: github.com/ShareLab-SII/UniAR README (retrieved 2026-06-21)]

## Dead Ends

Decoder training code not yet released (TODO in README). No ComfyUI node at ingest.
