---
title: OpenRouter Chat Workflow (LLM Orchestration)
type: concept
tags: [OpenRouter, LLM, chat, workflow, context-window, n8n, automation]
keywords: [OpenRouter, chat completions, context window, token truncation, n8n, webhook, persona script]
related:
  - sources/ai-creator-operations-blueprint.md
  - sources/ai-persona-launch-strategy-analysis.md
  - concepts/openrouter-chat-workflow.md
maturity: stub
created: 2026-05-08
updated: 2026-05-08
read_status: skimmed
provenance:
  stub: true
---

## Relations

@sources/ai-creator-operations-blueprint.md @sources/ai-persona-launch-strategy-analysis.md

## Raw Concept

Stub — OpenRouter API orchestration patterns detailed in both source documents (especially the Launch Strategy Analysis §1.2 and §4.2).

## Narrative

_OpenRouter provides unified `/api/v1/chat/completions` endpoint across 100s of LLMs. `openrouter/auto` routing selects most efficient model per prompt. Context window management: Python script truncates conversation history at token threshold to prevent cost bloat. Positive-framing system prompts ("You are [Persona], enthusiastic and charismatic...") mitigate safety filter refusal better than negative constraints._