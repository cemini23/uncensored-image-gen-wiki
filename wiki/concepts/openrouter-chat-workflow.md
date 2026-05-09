---
title: OpenRouter Chat Workflow (LLM Orchestration)
type: concept
tags: [OpenRouter, LLM, chat, workflow, context-window, n8n, automation, API, persona]
keywords: [OpenRouter, chat completions, context window, token truncation, n8n, webhook, persona script, auto-routing]
related:
  - sources/ai-creator-operations-blueprint.md
  - sources/ai-persona-launch-strategy-analysis.md
  - runbooks/zimage-setup-runbook.md
  - concepts/persona-ops-workflow.md
  - entities/persona-ops/n8n.md
  - concepts/persona-ops-workflow.md
maturity: validated
created: 2026-05-08
updated: 2026-05-08
read_status: deep-read
provenance:
  stub: false
---

## Relations

@sources/ai-creator-operations-blueprint.md @sources/ai-persona-launch-strategy-analysis.md

## Raw Concept

OpenRouter provides a unified API gateway to 100+ LLMs through a single `/api/v1/chat/completions` endpoint. Both source documents (Operations Blueprint §1.5, Launch Strategy Analysis §1.2) identify it as the core orchestration layer for automated persona conversations. Includes context window management patterns and positive-framing prompt design.

## Narrative

### Why OpenRouter

- **Unified endpoint**: `/api/v1/chat/completions` using OpenAI SDK structure → single integration for 100+ models (OpenAI, Anthropic, Google, etc.)
- **`openrouter/auto` routing**: autonomously evaluates prompt complexity → routes to most efficient/cost-effective LLM
- **Falls back gracefully** if a model provider is down or rate-limited
- **No UI wrappers**: direct API integration avoids middleware costs and potential data leakage from consumer frontends (Supercreator's Izzy AI, OnlyMonster, JanitorAI)

### Integration Architecture

```
Platform DM (Fanvue)
    → n8n / Make.com webhook
        → HTTP POST to OpenRouter API
            → openrouter/auto routes to best LLM
                → Response sent back via webhook
                    → Posted as persona reply
```

### System Prompt Design (NSFW-Aware)

**Avoid negative constraints** ("never use X word") — causes attention mechanisms to fixate on banned tokens, increasing their probabilistic likelihood. Use **positive framing**:

> "You are [Persona], an enthusiastic and charismatic conversational partner. Your purpose is to create engaging, flirty, and imaginative interactions."

- System prompt dictates persona tone, backstory (wiki lore), objective (upsell PPV)
- Content guidelines expressed as positive behaviors, not prohibitions

### Context Window Management

As conversations progress, appending entire history to each API request causes:
- Exponential token cost growth
- Slower inference speeds
- Eventual context window overflow

**Solution**: Python script monitors `conversation_history` token count; once threshold reached, older context is truncated/summarized into a dense text block passed back via system prompt.

```python
import requests, json, os

API_KEY = os.getenv("OPENROUTER_API_KEY")
API_URL = "https://openrouter.ai/api/v1/chat/completions"
MAX_HISTORY_TOKENS = 15

def chat_with_persona(user_prompt, conversation_history, persona_context):
    if len(conversation_history) > MAX_HISTORY_TOKENS:
        conversation_history = conversation_history[-MAX_HISTORY_TOKENS:]

    messages = [
        {"role": "system", "content": persona_context}
    ] + conversation_history + [{"role": "user", "content": user_prompt}]

    payload = {
        "model": "openrouter/auto",
        "messages": messages
    }
    response = requests.post(
        API_URL,
        headers={"Authorization": f"Bearer {API_KEY}"},
        json=payload
    )
    return response.json()
```

## Sources

- [Operations Blueprint §1.5](sources/ai-creator-operations-blueprint.md) — n8n/webhook integration, system prompt design
- [Launch Strategy Analysis §1.2](sources/ai-persona-launch-strategy-analysis.md) — context truncation script, positive prompt framing, `openrouter/auto` routing
- [Persona Ops Workflow](concepts/persona-ops-workflow.md) — full operational lifecycle
- [Day 1 Checklist](runbooks/day-1-checklist-for-friend.md) — getting started guide