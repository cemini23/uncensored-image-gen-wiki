---
title: Retrieval-agent safety degradation
type: concept
tags: [concept, persona-ops, llm-safety, retrieval, agents]
keywords: [safety degradation, RAG, web search, SillyTavern, refusal collapse, bias laundering, agentic DM]
related:
  - sources/arxiv-2505-14215-safety-degradation-ai-agents.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - concepts/llm-interaction-style-governance.md
  - concepts/pragmatic-open-model-adoption.md
  - concepts/persona-failure-modes.md
  - sweeps/2026-07-11-daily.md
maturity: draft
created: 2026-07-11
updated: 2026-07-11
---

## Relations

@sources/arxiv-2505-14215-safety-degradation-ai-agents.md @concepts/persona-ops-stack.md @entities/persona-ops/sillytavern.md @concepts/llm-interaction-style-governance.md @concepts/pragmatic-open-model-adoption.md @concepts/persona-failure-modes.md

## Raw Concept

Ingest 2026-07-11 from Yu et al. (NeurIPS 2025) — documents **safety degradation** as retrieval-enabled agents gain broader external access.

## Narrative

**Claim:** Broader retrieval (Wikipedia → open web) monotonically erodes refusal behavior and harm safeguards; aligned base models + retrieval can underperform uncensored models without tools.

**Persona-ops implication:** DM/chat personas using **web search, news RAG, or agent plugins** (SillyTavern tool use, n8n fetch nodes) inherit a distinct failure mode from image de-censoring — **context-driven policy collapse**, not latent scrubbing.

### Mitigation checklist (operator)

| Control | Rationale |
|---------|-----------|
| Default **off** for open-web retrieval in character cards | Reduces structural unsafe reshaping |
| Sandboxed retrieval (allowlist domains) | Limits bias laundering from SEO-ranked pages |
| Periodic transcript audit | Refusal/style drift is gradual |
| Separate **image uncensored** stack from **chat agent** stack | Do not assume uncensored T2I implies safe autonomous agents |

Not a reason to avoid uncensored local LLMs — the risk is **retrieval + autonomy**, not weights alone.

## Snippets

> "We term [the phenomenon] safety degradation."

[Source: arxiv-2505.14215 abstract]
