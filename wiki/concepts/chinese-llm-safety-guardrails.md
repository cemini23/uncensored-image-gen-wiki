---
title: Chinese LLM safety guardrails (CHILLGuard)
type: concept
tags: [concept, llm, safety, moderation, chinese, persona-ops, guardrail]
keywords: [CHILLGuard, Chinese content moderation, harm taxonomy, LlamaGuard, Qwen3Guard, MDPO, regulatory compliance]
related:
  - sources/arxiv-2606-15396-chillguard-chinese-llm-safety.md
  - concepts/pluralistic-safety-alignment.md
  - concepts/llm-interaction-style-governance.md
  - concepts/persona-ops-stack.md
  - concepts/llm-interaction-style-governance.md
  - entities/persona-ops/sillytavern.md
maturity: draft
created: 2026-06-17
updated: 2026-06-17
---

## Relations

@sources/arxiv-2606-15396-chillguard-chinese-llm-safety.md @concepts/pluralistic-safety-alignment.md @concepts/persona-ops-stack.md @entities/persona-ops/sillytavern.md

## Raw Concept

Ingest 2026-06-17 from CHILLGuard (arXiv:2606.15396) — fine-grained Chinese LLM input/output guardrail with scalable dataset construction.

## Narrative

**Why separate from Western guardrails:** Chinese deployment faces distinct implicit-expression attacks (homophones, emoji obfuscation, regulatory macro-categories A–E) poorly covered by LlamaGuard / Qwen3Guard multilingual modes.

**CHILLGuard contributions:**

- **31-micro taxonomy** mapped to Chinese regulatory harm classes (national security through rights infringement + quality categories).
- **405K training set** built via RAG prompt expansion, uncensored generator for hard negatives (Dolphin-Mistral-Venice), multi-model jury voting.
- **MDPO** — model-aware preference optimization in generator-classifier loop.

**Persona-ops use:** Pre/post-filter for **Chinese-language** character bots (@entities/persona-ops/sillytavern.md) — not for bypassing filters, but for **compliant deployment** when platform or jurisdiction requires granular unsafe/safe classification.

Ties to @concepts/pluralistic-safety-alignment.md — harm is not universal; guardrail choice is geo-cultural.

## Snippets

(See @sources/arxiv-2606-15396-chillguard-chinese-llm-safety.md)

## Dead Ends

Empty GitHub at audit — cannot deploy until release. Opposite of uncensored image-gen mission for *generation*; relevant only to **moderation layer** of persona stack.
