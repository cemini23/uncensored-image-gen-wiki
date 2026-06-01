---
title: "Beyond Text Prompts — Visual-to-Visual Generation / V2V-Zero (arXiv:2605.12271)"
type: source
tags: [paper, v2v, conditioning, vlm, qwen-image, t2i, prompt-engineering]
keywords: [V2V, V2V-Zero, visual specification page, Qwen-Image, HunyuanVideo-1.5, Simple-V2V Bench, GenEval, hidden-state conditioning]
related:
  - concepts/visual-to-visual-generation.md
  - entities/models/qwen-image-2512.md
  - concepts/prompt-engineering-uncensored.md
  - concepts/multi-angle-dataset-prep.md
maturity: draft
read_status: read
created: 2026-06-01
updated: 2026-06-01
---

## Relations

@concepts/visual-to-visual-generation.md @entities/models/qwen-image-2512.md @concepts/prompt-engineering-uncensored.md @concepts/multi-angle-dataset-prep.md

## Raw Concept

- **Title**: Beyond Text Prompts: Visual-to-Visual Generation as A Unified Paradigm
- **Authors**: Yaofang Liu et al. (CityU HK, Celia Research, etc.)
- **Type**: arXiv:2605.12271
- **Location**: `raw-sources/arxiv-2605.12271-beyond-text-prompts-visual-to-visual-generation.pdf`
- **Retrieved**: 2026-06-01
- **Read status**: read (abstract + intro)

## Narrative

**V2V (visual-to-visual)** replaces text prompts with a **visual specification page** — sketches, swatches, reference boards, rendered typography, pose diagrams — fed through a frozen VLM; the generator cross-attends to **final-layer hidden states** (same route as text).

**V2V-Zero** — training-free: no adapter, no fine-tune. Works on VLM-conditioned DiT backbones (demonstrated on **Qwen-Image** frozen backbone; **HunyuanVideo-1.5** extension for video).

**Benchmarks:**
- GenEval: **0.85 overall** with V2V-Zero vs backbone optimized T2I `[TENTATIVE — paper claim]`
- **Simple-V2V Bench** (7 tasks × 7 models): capability tiers — attribute binding strong, content generation weak, structural control (pose/sketch) hardest

Mechanistic finding: **95%** of DiT conditioning-token attention mass routes to **visual-page** hidden states vs reasoning tokens in default path.

### Workspace relevance

Immediate zero-shot interface for **character turnaround sheets** and multi-reference boards without serializing layout into prose → @concepts/multi-angle-dataset-prep.md. Complements (not replaces) PuLID/Redux stacks.

Project: https://yaofang-liu.github.io/V2V_Web/

## Snippets

> "We propose visual-to-visual (V2V) generation, in which the user conditions a generative model with a visual specification page rather than a text prompt." [Source: arXiv:2605.12271 abstract]

## Dead Ends

- **V2V page as edit target** — explicitly not img2img reconstruction; conditioning document only.
