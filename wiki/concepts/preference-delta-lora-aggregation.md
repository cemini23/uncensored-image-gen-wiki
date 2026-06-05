---
title: Preference delta LoRA aggregation (PDA / GAM)
type: concept
tags: [concept, lora, merging, preference-learning, cross-domain, reference]
keywords: [PDA, GAM, preference delta aggregation, geometric alignment merging, weak signals, LoRA merge, Qwen3]
related:
  - sources/arxiv-weak-signals-preference-distillation-2606.00357-2026-06-05.md
  - concepts/de-censoring-techniques.md
  - concepts/lora-taxonomy.md
  - concepts/reference-plus-lora-stacking.md
maturity: draft
created: 2026-06-05
updated: 2026-06-05
---

## Relations

@sources/arxiv-weak-signals-preference-distillation-2606.00357-2026-06-05.md @concepts/de-censoring-techniques.md @concepts/lora-taxonomy.md

## Raw Concept

K100 ingest reroute (2026-06-05) — arXiv:2606.00357 is **LLM post-training**, not video generation. Filed here as tangential reference for **multi-adapter LoRA merge geometry**.

## Narrative

**Preference Delta Aggregation (PDA):** derive a preference delta from each weak–weaker model pair (e.g. Qwen3 4B vs 1.7B rankings), train a LoRA adapter per delta via preference optimization, then **merge adapters**. **Geometric Alignment Merging (GAM)** aligns adapter subspaces before merge to reduce directional interference.

**Results [TENTATIVE]:** +6.8 / +7.3 avg points on knowledge reasoning and agentic search when aggregating multiple weak signals into Qwen3-8B; beats sequential/joint training baselines.

### Image-gen relevance (indirect)

Existing merge stack uses SLERP / TIES / DARE (@concepts/de-censoring-techniques.md) for **checkpoint-level** fusion. PDA/GAM is a **2026 research pattern** for composing multiple preference-derived LoRAs without catastrophic forgetting — may apply if stacking multiple persona/style LoRAs from weak ranking data `[NEEDS VERIFICATION 2026-06-05]`. Not tested on FLUX/Wan in this paper.

## Snippets

> "We propose Preference Delta Aggregation (PDA), the first framework that derives a preference delta from each weak-weaker model pair, instantiates it as a LoRA adapter learned through preference optimization, and aggregates the resulting deltas via LoRA merging."

## Dead Ends

**Mis-filed under video steering** in K100 federation stub — do not cite for T2V control or world models.
