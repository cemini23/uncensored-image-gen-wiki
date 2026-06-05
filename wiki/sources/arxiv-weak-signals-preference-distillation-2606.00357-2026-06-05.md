---
title: "PDA / GAM — preference delta LoRA aggregation (arXiv:2606.00357)"
type: source
tags: [paper, lora, merging, preference-learning, llm, cross-domain, rerouted]
keywords: [PDA, GAM, preference delta aggregation, geometric alignment merging, weak signals, LoRA merge, Qwen3]
related:
  - concepts/preference-delta-lora-aggregation.md
  - concepts/de-censoring-techniques.md
  - concepts/lora-taxonomy.md
maturity: draft
read_status: deep-read
created: 2026-06-05
updated: 2026-06-05
---

## Relations

@concepts/preference-delta-lora-aggregation.md @concepts/de-censoring-techniques.md @concepts/lora-taxonomy.md

## Raw Concept

- **Title**: From "Weak" Signals to Strong Models: Preference Delta Aggregation with LoRA Merging
- **Authors**: Qi Sun, Siyue Zhang et al. (NYU Shanghai, NTU, JTU)
- **Type**: arXiv:2606.00357
- **Location**: `raw-sources/arxiv-2606.00357-from-weak-signals-to-strong-models-preference-de.pdf`
- **URL**: https://arxiv.org/abs/2606.00357
- **Code**: AlbertQiSun/Preference-Delta-Aggregation (post-review release promised)
- **Retrieved**: 2026-06-05
- **Read status**: deep-read (abstract + intro)

## Narrative

**LLM post-training** paper — **not video generation**. K100 federation ingest mis-clustered under video steering; rerouted 2026-06-05.

**Core idea:** Relative quality deltas between **weak–weaker model pairs** (e.g. Qwen3-4B preferred over Qwen3-1.7B on same prompt) provide supervision signal even when absolute response quality is low. **PDA** trains one LoRA per delta via preference optimization, then merges adapters. **GAM (Geometric Alignment Merging)** aligns adapter subspaces before merge to reduce interference vs naive LoRA merge / sequential DPO.

**Baselines beaten [TENTATIVE]:** Sequential preference training (catastrophic forgetting), joint mixture training (gradient conflict). PDA+GAM on Qwen3-8B: +6.8 avg knowledge reasoning, +7.3 agentic search vs strong base; +2.1 / +4.3 over best single-delta baseline.

### Image-gen tangential relevance

Merge geometry may inform **multi-LoRA stacking** beyond SLERP/TIES/DARE (@concepts/de-censoring-techniques.md) when combining preference-tuned persona adapters — **untested on diffusion** in this work `[NEEDS VERIFICATION 2026-06-05]`.

## Snippets

> "Can multiple 'weak' signals be constructively aggregated for improving strong models?"

> "We introduce Geometric Alignment Merging (GAM), a geometry-aware merging method that aligns adapter subspaces before aggregation."

## Dead Ends

**Do not use as video world-model or activation-steering citation** — mis-filed in K100 stub ingest.
