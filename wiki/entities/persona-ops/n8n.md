---
title: "n8n (self-hosted orchestration for persona-ops)"
type: entity
tags: [persona-ops, orchestration, n8n, automation, self-hosted, workflow-engine, ai-agents]
keywords: [n8n, self-hosted-automation, workflow-engine, execution-based-pricing, webhook, AI-agent-nodes, Make, Zapier, LangChain, LangGraph, Temporal, CrewAI, AutoGen, persona-orchestration]
related:
  - sources/persona-ops-stack-2026.md
  - concepts/openrouter-chat-workflow.md
  - concepts/persona-ops-stack.md
  - concepts/persona-content-cadence.md
  - entities/persona-ops/postiz.md
  - entities/persona-ops/sillytavern.md
  - entities/persona-ops/fish-speech.md
  - concepts/model-selection-workflow.md
  - entities/uis/comfyui.md
  - entities/persona-ops/delive.md
  - entities/persona-ops/moneyprinter.md
  - sources/arxiv-2606-21710-privacyalign-llm-agents.md
  - concepts/contextual-privacy-alignment-llm-agents.md
  - concepts/agentic-video-editing-orchestration.md
  - entities/models/videoagent.md
  - sources/arxiv-2606-23327-videoagent-all-in-one-framework.md
  - entities/voice-models/confucius4-tts.md
maturity: draft
created: 2026-05-07
updated: 2026-06-27
---

## Relations

@sources/persona-ops-stack-2026.md @concepts/persona-ops-stack.md @concepts/persona-content-cadence.md @entities/persona-ops/postiz.md @entities/persona-ops/sillytavern.md @entities/persona-ops/fish-speech.md
@concepts/model-selection-workflow.md
@entities/uis/comfyui.md
@entities/persona-ops/delive.md @entities/persona-ops/moneyprinter.md

## Raw Concept

Page prompted by Path A step 6 ingest of the persona-ops survey docx (May 2026). n8n is the self-hosted, execution-based-pricing workflow engine that has become the modal orchestration layer for persona-ops in 2026 — preferred over Make.com / Zapier by technical operators for data sovereignty, and over LangChain / LangGraph / CrewAI / AutoGen for non-code-first builders.

Synthesized from @sources/persona-ops-stack-2026.md.

## Narrative

### Positioning

| Tool | Audience | Pricing | Self-host? |
|------|----------|---------|------------|
| **n8n** | Technical operators | Execution-based; free self-host | YES (modal choice) |
| Make.com | SaaS users (Maia AI builder) | Tiered subscription | No |
| Zapier | Mainstream SaaS-light | Tiered subscription | No |
| LangChain / LangGraph | Code-first builders | Free OSS + LangSmith hosted | YES |
| Temporal | Code-first, durable execution | Free OSS + cloud | YES |
| CrewAI | Multi-agent code-first | Free OSS | YES |
| AutoGen | Microsoft multi-agent | Free OSS | YES |

n8n's wedge: visual workflow builder + 400+ pre-built integrations + native AI agent nodes + execution-based pricing self-hosted. Operators get LangChain-class flexibility without writing code, and Make-class ease without SaaS lock-in.

### Capabilities (May 2026)

- 400+ integrations (HTTP, webhook, Postgres, Redis, OpenAI, Anthropic, ComfyUI via webhook, Postiz, SillyTavern via API, Telegram, Discord, Slack, Airtable, Notion, Google Sheets, etc.)
- AI agent nodes — orchestrate LLM calls with tool-use (web search, code execution, custom tools)
- Conditional logic, loops, error handlers, retries
- Schedule triggers + webhook triggers + file-watch triggers
- JSON workflow export — version-control friendly
- Self-hosted via Docker / npm / managed cloud

### Reference architecture (full persona-ops loop)

```
1. Schedule trigger (3x/week per persona)
       ↓
2. n8n — fetch content calendar entry from Airtable / Notion
       ↓
3. n8n — call LLM for caption + scene description (model router: cheap LLM for simple tasks)
       ↓
4. n8n — webhook to ComfyUI for image/video generation
       ↓
5. ComfyUI returns asset URL
       ↓
6. n8n — pass to Opus Clip / Vidyo.ai for repurposing (long → short variants)
       ↓
7. n8n — schedule via Postiz to multi-platform distribution
       ↓
8. n8n — update content calendar status to "posted"

PARALLEL: incoming DM
       ↓
9. n8n — webhook from Fanvue / Telegram / Supercreator
       ↓
10. n8n — fetch fan profile from CRM
       ↓
11. n8n — call SillyTavern API with character card + lorebook + fan-context RAG
       ↓
12. n8n — local LLM (Qwen 3) generates response
       ↓
13. (optional) n8n — Fish-Speech S2 Pro voice synthesis
       ↓
14. n8n — deliver back to fan via CRM
```

### Cost discipline (Model Routers)

n8n's flexibility makes it the natural place to implement **AI Model Routers** — workflow-level decisioning that routes simple NLP tasks to cheap models (GPT-4o-mini class) and complex reasoning to premium (Claude 3.5 Sonnet / GPT-5.4). Reported 60-90% infrastructure savings on agency-scale persona-ops. → @concepts/persona-ops-stack.md

### Tier ladders

| Tier | n8n setup | Cost |
|------|-----------|------|
| Solo / aspirational | n8n Cloud free tier or Docker on personal machine | $0-20/mo |
| Mid (Tier 2) | Docker on $20-40/mo VPS, single-tenant | $20-80/mo |
| Agency-managed | Multi-tenant Docker cluster, persona-isolated workflows, dedicated team | $200-1K/mo infra |
| Enterprise / Tier 1 | n8n Enterprise + dedicated infra + multi-region failover | $5K-15K/mo (part of $100K-300K build budget) |

[Source: AI Persona Operations Software Stack.docx Section 5 (retrieved 2026-05-06)]

### Strategic notes

- **Versus Make / Zapier**: n8n self-host eliminates SaaS data inspection. Persona DMs and fan profiles stay on operator infrastructure.
- **Versus LangChain / CrewAI**: n8n's visual builder lowers the bar for non-programmers; LangChain etc. assume Python fluency.
- **Versus Temporal**: Temporal's Durable Agent Execution is the right answer for very-long-running multi-week persona arcs that need to survive infra failures. n8n + Temporal hybrid is becoming common at agency tier.

## Snippets

> "n8n (self-hosted, execution-based pricing) is the modal orchestration layer for persona-ops. Make.com targets SaaS users with the Maia AI builder; LangChain/LangGraph, Temporal (Durable Agent Execution), CrewAI, and AutoGen serve code-first multi-agent builders. Enterprise cost: $100K-$300K build + $3.2K-$13K/mo LLM API."
[Source: AI Persona Operations Software Stack.docx Section 5 (retrieved 2026-05-06)]

## Dead Ends

- **SaaS-only orchestration (Make / Zapier)** at agency scale: data sovereignty + persona DM privacy concerns. Self-host n8n.
- **Pure-code orchestration (LangChain raw)** for non-programmer operators: development speed bottleneck. n8n is the visual-workflow shortcut.
- **n8n free cloud tier** at agency scale: hits execution caps. Self-host on dedicated infra.
