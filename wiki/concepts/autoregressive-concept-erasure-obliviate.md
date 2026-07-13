---
title: Autoregressive concept erasure (Obliviate)
type: concept
tags: [concept, concept-erasure, safety, autoregressive, alignment]
keywords: [Obliviate, visual token erasure, trajectory-level KL, aligned prefix, unified multimodal safety]
related:
  - sources/arxiv-2606-28643-obliviate-autoregressive-concept-erasure.md
  - concepts/de-censoring-techniques.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/cross-model-safety-steering.md
  - entities/models/hunyuanimage-3-0.md
  - sources/arxiv-2509-23951-hunyuanimage-3-0-technical-report.md
  - sources/arxiv-2606-27376-ask-solve-generate-self-evolving-multimodal.md
  - sweeps/2026-07-02-daily.md
  - concepts/multimodal-machine-unlearning.md
  - sources/arxiv-2607-07907-multimodal-unlearning-survey.md
  - sweeps/2026-07-13-daily.md
  - concepts/self-evolving-unified-multimodal-training.md
  - concepts/cross-model-safety-steering.md
  - sources/arxiv-2606-05290-cross-model-safety-steering.md
maturity: draft
created: 2026-07-02
updated: 2026-07-02
---

## Relations

@sources/arxiv-2606-28643-obliviate-autoregressive-concept-erasure.md @concepts/de-censoring-techniques.md @concepts/censorship-tier-taxonomy.md

## Raw Concept

Ingest 2026-07-02 from Shakibania et al. (arXiv:2606.28643) — AR visual-token concept erasure via KL + full rollout updates.

## Narrative

### Erasure vs de-censoring (workspace framing)

| Direction | Paradigm | Representative |
|-----------|----------|----------------|
| **Remove capability** | Weight edit away from concept | **Obliviate** (AR), ESD/EraseFlow (diffusion) |
| **Restore capability** | LoRA / abliteration / merge | @concepts/de-censoring-techniques.md |

AR models (Liquid, Janus-Pro, **HunyuanImage 3.0**) use **long visual token chains** — naive diffusion-style erasure fails without **prefix alignment** and **trajectory-level** objectives.

### Persona ops implication

Unified AR hosts may ship **pre-erased** for NSFW — same structural barrier as Strict-tier Western models, but erasure tooling now exists for AR fine-tunes. Community de-censor path `[NEEDS VERIFICATION 2026-07-02]` for HunyuanImage-class weights.

## Snippets

> "A naive translation of diffusion-based erasure does not yield the desired results."

## Dead Ends

Reference-only — operator does not deploy erasure for persona NSFW workflows.
