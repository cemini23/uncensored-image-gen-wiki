---
title: Contextual privacy alignment for LLM agents
type: concept
tags: [concept, persona-ops, privacy, llm-agents, alignment]
keywords: [PrivacyAlign, contextual privacy, agent leakage, reward modeling, human norms, share with whom]
related:
  - sources/arxiv-2606-21710-privacyalign-llm-agents.md
  - concepts/llm-interaction-style-governance.md
  - concepts/persona-ops-stack.md
  - concepts/anti-personalization-privacy.md
  - concepts/pluralistic-safety-alignment.md
  - entities/persona-ops/sillytavern.md
  - entities/persona-ops/n8n.md
  - sources/arxiv-2606-08172-human-llm-interaction-governance.md
  - sources/persona-ops-stack-2026.md
maturity: draft
created: 2026-06-23
updated: 2026-06-23
---

## Relations

@sources/arxiv-2606-21710-privacyalign-llm-agents.md @concepts/llm-interaction-style-governance.md @concepts/persona-ops-stack.md @entities/persona-ops/sillytavern.md

## Raw Concept

Ingest 2026-06-23 from PrivacyAlign (arXiv:2606.21710) — agent actions need context-sensitive privacy norms, not binary refuse/allow.

## Narrative

**Beyond content safety:** Agentic privacy = *who* sees *what* under *which social context* (DM vs public post vs tool API).

**PrivacyAlign stack:**

| Layer | Role |
|-------|------|
| Human annotation dataset | Ground norms where LLMs actually leak |
| Annotation-conditioned judges | Reliable automated eval |
| Annotation-conditioned RM + RL | Train small agents to respect norms |

**Persona ops:** Synthetic creator stacks (@concepts/persona-ops-stack.md) increasingly use **local LLM + tool calls** — risk of leaking operator identity, fan PII, or cross-persona context in automated replies.

Pairs with **style governance** (@concepts/llm-interaction-style-governance.md) on the interaction-control axis.

## Snippets

> "Human judgment does not merely label privacy violations but also helps define them."

## Dead Ends

Research benchmark + training recipe — not shipped as SillyTavern extension.
