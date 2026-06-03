---
title: "Geo-Cultural Values for Pluralistic Safety Alignment (arXiv:2606.00369)"
type: source
tags: [paper, safety, alignment, culture, rlhf, moderation]
keywords: [geo-cultural values, pluralistic safety, Inglehart-Welzel, RLHF datasets, cultural zone, safety ratings, LLM-as-judge]
related:
  - concepts/pluralistic-safety-alignment.md
  - sources/uncensored-image-generation-survey.md
  - concepts/prompt-engineering-uncensored.md
maturity: draft
read_status: read
created: 2026-06-03
updated: 2026-06-03
---

## Relations

@concepts/pluralistic-safety-alignment.md @sources/uncensored-image-generation-survey.md @concepts/prompt-engineering-uncensored.md

## Raw Concept

- **Title**: Quantifying the Salience of Geo-Cultural Values for Pluralistic Safety Alignment
- **Authors**: (see paper — asaakyan et al.)
- **Type**: arXiv:2606.00369
- **Location**: `raw-sources/arxiv-2606.00369-quantifying-the-salience-of-geo-cultural-values.pdf`
- **URL**: https://arxiv.org/abs/2606.00369
- **Retrieved**: 2026-06-03
- **Read status**: read (abstract + intro)
- **Resources**: https://asaakyan.github.io/culture-safety

## Narrative

Argues standard **RLHF / safety datasets** are geographically homogeneous — demographic diversity (age, gender, ethnicity) alone does not capture **cultural value systems** (Inglehart-Welzel dimensions). Meta-analysis: most safety datasets lack geo-cultural metadata; those that report it lack unified joint analysis with demographics.

**Findings [TENTATIVE]** (abstract-level):

- Cultural zone membership explains variance in safety ratings beyond demographics (p<0.05 across 6 datasets)
- ~10% of examined items are **culturally sensitive** — likely misclassified safe without adequate cultural representation
- Current LLMs are **unreliable rater surrogates** but can help **triage** culturally sensitive items for human annotation

### Workspace relevance

Explains **why Western-aligned base models over-refuse** while Eastern Vanguard models (@sources/uncensored-image-generation-survey.md) behave differently — safety training encodes geo-cultural priors, not universal harm definitions. Informs **de-censoring / abliterated encoder** strategy: alignment is culturally situated, not merely "NSFW vs SFW." Not a generation technique — meta-context for @concepts/prompt-engineering-uncensored.md and model-selection rationale.

## Snippets

> "Most datasets for safety and alignment via human feedback … are typically geographically homogeneous."

> "Cultural zone membership explains variance in safety ratings beyond standard demographics."

## Dead Ends

Text-modality study — no direct T2I benchmark. Does not prescribe uncensored fine-tune recipes; use for understanding refusal behavior, not bypass implementation.
