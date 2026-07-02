---
title: Self-evolving unified multimodal training (ASG)
type: concept
tags: [concept, unified-multimodal, self-training, alignment]
keywords: [Ask-Solve-Generate, self-consistency rewards, Solver Token Entropy, Proposer Solver Generator]
related:
  - sources/arxiv-2606-27376-ask-solve-generate-self-evolving-multimodal.md
  - entities/models/hunyuanimage-3-0.md
  - concepts/llm-as-image-conditioning.md
  - concepts/autoregressive-concept-erasure-obliviate.md
  - sweeps/2026-07-02-daily.md
  - concepts/autoregressive-concept-erasure-obliviate.md
  - entities/models/hydra-x.md
maturity: draft
created: 2026-07-02
updated: 2026-07-02
---

## Relations

@sources/arxiv-2606-27376-ask-solve-generate-self-evolving-multimodal.md @entities/models/hunyuanimage-3-0.md

## Raw Concept

Ingest 2026-07-02 from Thawkar et al. (arXiv:2606.27376) — unlabeled-image self-evolution for unified understanding+generation LMMs.

## Narrative

### Unified multimodal training axes

| Signal source | ASG | IPA (hands) | Obliviate (erase) |
|---------------|-----|-------------|-------------------|
| Data | Unlabeled images | Good-only video samples | Concept-specific prompts |
| Supervision | Self-consistency | Implicit reward | KL vs teacher |
| Goal | Improve both understand + gen | Hand fidelity | Remove concept |

Relevant as **alignment research context** for Eastern Vanguard unified AR image hosts — not a ComfyUI workflow.

### Build-track note

Phase-0 **CONDITIONAL-GO** on repo — defer until BAGEL/HunyuanImage fine-tune recipes documented for operator hardware.

## Snippets

> "Whether a unified LMM can improve both abilities autonomously using only unlabeled images."

## Dead Ends

Peripheral to local persona generation pipeline at ingest.
