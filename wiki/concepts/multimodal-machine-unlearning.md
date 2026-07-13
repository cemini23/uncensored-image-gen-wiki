---
title: Multimodal machine unlearning — survey lens for generative media
type: concept
tags: [concept, safety, unlearning, alignment, multimodal, survey]
keywords: [machine unlearning, concept erasure, NSFW removal, multimodal survey, de-censoring inverse]
related:
  - sources/arxiv-2607-07907-multimodal-unlearning-survey.md
  - concepts/de-censoring-techniques.md
  - concepts/autoregressive-concept-erasure-obliviate.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/retrieval-agent-safety-degradation.md
  - concepts/cross-model-safety-steering.md
  - sweeps/2026-07-13-daily.md
maturity: draft
created: 2026-07-13
updated: 2026-07-13
---

## Relations

@sources/arxiv-2607-07907-multimodal-unlearning-survey.md @concepts/de-censoring-techniques.md @concepts/autoregressive-concept-erasure-obliviate.md @concepts/censorship-tier-taxonomy.md @concepts/retrieval-agent-safety-degradation.md @sweeps/2026-07-13-daily.md

## Raw Concept

Synthesized from arXiv:2607.07907 (Jul 2026 multimodal unlearning survey). Provides vocabulary for how **safety teams remove capabilities** — the mirror image of this wiki's de-censoring / uncensored-local research track.

## Narrative

### Why this wiki cares

Uncensored persona ops sits on the **other side** of unlearning:

| Unlearning goal | Persona-ops analog |
|-----------------|-------------------|
| Erase NSFW concepts from base model | Community abliteration / de-censor merges |
| Remove a person's likeness | Right-of-publicity risk if cloning non-owned voices/faces |
| Forget copyrighted styles | LoRA collision / style bleed in multi-character studios |
| Multimodal forget (V+L+V+A) | Fish-Speech + Wan + SillyTavern stacks spanning modalities |

The survey is a **REFERENCE map** — use when stress-testing whether a checkpoint reintroduces safety after merge, or when evaluating "obliviate" / concept-erasure papers in the digest.

### David adoption

**None.** No production install. Informs Phase-0 **SKIP** when a tool is unlearning-only without a generative upside.

## Snippets

> "Multimodal Unlearning Across Vision, Language, Video, and Audio: Survey of Methods, Datasets, and Benchmarks."

[Source: arxiv-2607.07907]
