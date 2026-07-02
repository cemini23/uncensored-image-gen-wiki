---
title: "Ask-Solve-Generate — self-evolving unified multimodal (arXiv:2606.27376)"
type: source
tags: [paper, unified-multimodal, self-training, bagel, blip3o, vargpt]
keywords: [ASG, Proposer Solver Generator, self-consistency rewards, STE, BAGEL, BLIP3o]
related:
  - concepts/self-evolving-unified-multimodal-training.md
  - entities/models/hunyuanimage-3-0.md
  - sources/arxiv-2509-23951-hunyuanimage-3-0-technical-report.md
  - concepts/llm-as-image-conditioning.md
  - concepts/persona-consistency-methods.md
  - sweeps/2026-07-02-daily.md
  - concepts/autoregressive-concept-erasure-obliviate.md
  - entities/models/hydra-x.md
maturity: draft
read_status: read
created: 2026-07-02
updated: 2026-07-02
---

## Relations

@concepts/self-evolving-unified-multimodal-training.md @entities/models/hunyuanimage-3-0.md

## Raw Concept

- **Title**: Ask, Solve, Generate: Self-Evolving Unified Multimodal Understanding and Generation via Self-Consistency Rewards
- **Authors**: Ritesh Thawkar et al. (MBZUAI Oryx)
- **Type**: arXiv:2606.27376
- **Location**: `raw-sources/arxiv-2606.27376-2606-27376v1-ask-solve-generate-self-evolving-un.pdf`
- **URL**: https://arxiv.org/abs/2606.27376 · https://github.com/mbzuai-oryx/Ask-Solve-Generate
- **Retrieved**: 2026-07-02
- **Read status**: read (abstract + Phase-0)

## Narrative

**ASG** — self-evolving post-training for **unified LMMs** (understanding + generation) using **only unlabeled images** — no human prefs or external reward models.

**Roles:** Proposer (visual questions) → Solver (answer + evaluate) → Generator (synthesize images). **Solver Token Entropy (STE)** stabilizes training when sample consistency degrades.

**Backbones tested:** diffusion BLIP3o, rectified-flow **BAGEL**, autoregressive VARGPT-v1.1. BAGEL: **+3.5% MMMU**, GenEval **82%→85%** `[TENTATIVE]`.

### Workspace relevance

Training methodology for unified multimodal hosts (@entities/models/hunyuanimage-3-0.md class) — not an inference UI. Useful for understanding how AR unified models may self-improve alignment without curated NSFW prefs.

Phase-0: **CONDITIONAL-GO** — `mbzuai-oryx/Ask-Solve-Generate` Apache-2.0, 4★ early; training pipeline audit before adoption.

## Snippets

> "Training uses only self-derived consistency signals, without human annotations, preference labels, or task-trained external reward/judge models."

## Dead Ends

Not a persona inference model — post-training framework only.
