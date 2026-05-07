---
title: BLIP-3o
type: entity
tags: [model, unified-multimodal, llm, diffusion, salesforce, fully-open]
keywords: [BLIP-3o, fully open unified multimodal, BLIP3-o, Salesforce, unified architecture training dataset]
related:
  - sources/unireasoner.md
  - entities/models/bagel.md
  - entities/models/janus-pro.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/unireasoner.md
@entities/models/bagel.md
@entities/models/janus-pro.md

## Raw Concept

Stub created during ingest of UniReasoner (@sources/unireasoner.md), where BLIP-3o appears as a strong unified-multimodal benchmark competitor. Standalone reference: Chen, Xu, Pan, Hu, Qin, Goldstein, Huang, Zhou, Xie, Savarese et al., "BLIP3-o: A family of fully open unified multimodal models — architecture, training and dataset", arXiv:2505.09568 (2025).

## Narrative

### What it is

BLIP-3o is a **fully open** family of unified multimodal models — open architecture, open training procedure, open dataset. Continues the BLIP / BLIP-2 / BLIP-3 lineage from Salesforce Research et al. into the unified-understanding-and-generation regime. Distinguishes itself from BAGEL / Janus-Pro by emphasizing reproducibility of the entire training stack.

[CONFIRMED] [Source: Chen et al. 2025a, referenced in arXiv:2605.04040v1]

### Headline benchmarks (UniReasoner Tables 1–2)

[CONFIRMED] [Source: arXiv:2605.04040v1 Tables 1–2]

- GenEval overall: **0.83** — second only to GPT-4o (0.84) among the pre-UniReasoner systems benchmarked
- DPG-Bench overall: **82.27** (lower than SANA 84.50 and Janus-Pro 84.19; held back by Relation 87.03)
- Per-category strengths: Position 0.77 (best in pre-UniReasoner field tied), Colors 0.86, Attribute Binding 0.67 (best in field for attribute binding pre-UniReasoner).

### Workspace relevance

- The "fully open" framing matters for any future workspace-level reproduction or fine-tuning. Open dataset + open training code is a different proposition from "open weights only" releases like BAGEL / Janus-Pro.
- Not yet in `notes/models-catalog.md`. [NEEDS VERIFICATION 2026-05-06] on local runtime, VRAM, censorship profile, and presence of community fine-tunes.
- Strong attribute-binding score (0.67 in unified-model field, second only to UniReasoner-on-SANA 0.72) makes BLIP-3o interesting for multi-subject persona scenes if locally runnable.

### Open questions

[NEEDS VERIFICATION 2026-05-06]

- Hugging Face availability and license details
- Local-hardware tier (parameter count, quantization)
- Whether the "fully open" claim holds — open dataset access vs. open dataset *card* are different things in practice
- NSFW alignment behavior and whether community uncensored fine-tunes exist or are feasible

## Snippets

(none yet — stub. Populate with BLIP-3o paper / model-card excerpts on next deep-read.)
