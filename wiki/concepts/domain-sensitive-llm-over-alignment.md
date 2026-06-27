---
related:
  - sources/arxiv-2606-23375-tf-refusalbench-over-alignment.md
  - concepts/llm-interaction-style-governance.md
  - concepts/de-censoring-techniques.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - sources/arxiv-2606-08172-human-llm-interaction-governance.md
  - sources/arxiv-2606-15396-chillguard-chinese-llm-safety.md
  - concepts/pluralistic-safety-alignment.md
  - concepts/pragmatic-open-model-adoption.md
  - sources/arxiv-2606-22211-open-ai-local-llama-wild.md
  - concepts/low-resource-text-detoxification.md
  - sources/arxiv-2606-26015-tatoxa-text-detoxification-tatar.md
  - sources/arxiv-2603-03326-personality-sliders-llm-inference-time.md
title: Domain-sensitive LLM over-alignment
type: concept
tags: [concept, persona-ops, llm-governance, alignment, safety]
keywords: [over-alignment, over-refusal, disclaimer, TF-RefusalBench, domain-sensitive content, abliteration, on-premises]
maturity: draft
created: 2026-06-24
updated: 2026-06-27
---


## Relations

@sources/arxiv-2606-23375-tf-refusalbench-over-alignment.md @concepts/llm-interaction-style-governance.md @concepts/de-censoring-techniques.md @entities/persona-ops/sillytavern.md

## Raw Concept

Ingest 2026-06-24 from Wuhrmann et al. (arXiv:2606.23375) — over-alignment beyond binary refusal in professional domains.

## Narrative

### Three response modes (not just refuse/allow)

```
Legitimate sensitive prompt
        ↓
   ┌────┴────┬────────────┐
 Refusal   Disclaimer    Clean comply
 (block)   (value color)  (desired)
```

**Over-alignment** includes disclaimers and sanitization that distort **task faithfulness** — critical when operator content is intentionally NSFW/edgy (persona DMs) or professionally sensitive (legal/medical summaries).

### vs generic safety benchmarks

| Benchmark | Gap |
|-----------|-----|
| XSTest / OR-Bench | Adversarial "seems unsafe" English Q&A |
| TF-RefusalBench | **Intrinsic severity** content in FR/DE/IT/EN professional tasks |

### Mitigation spectrum for local LLMs

| Method | Refusal | Disclaimer | Quality |
|--------|---------|------------|---------|
| System prompts | Partial | Partial | Variable |
| **Abliteration** | Removed | ↓ | ~<2% translation drop; summarization sanitization ↓3× |

Links @concepts/de-censoring-techniques.md — abliteration is not free: verbosity increase reported; domain-specific eval required.

### Persona ops implication

SillyTavern cards with explicit NSFW/edgy personas may hit the same **disclaimer/refusal** failure modes as court criminal-law passages — evaluate with **task-faithfulness**, not refusal-rate alone.

## Snippets

> "Refusal-rate-only evaluations treat compliant-with-disclaimer and clean compliance identically."

## Dead Ends

Court/legal domain benchmark — do not treat TF-RefusalBench scores as persona-chat proxy without adaptation.
