---
title: "Safety Degradation in AI Agents (arXiv:2505.14215)"
type: source
tags: [paper, llm-safety, retrieval, agents, persona-ops, routed]
keywords: [safety degradation, retrieval agents, RAG, refusal rates, bias amplification, uncensored LLM, NeurIPS 2025]
related:
  - concepts/retrieval-agent-safety-degradation.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - concepts/llm-interaction-style-governance.md
  - concepts/pragmatic-open-model-adoption.md
  - concepts/persona-failure-modes.md
  - sweeps/2026-07-11-daily.md
maturity: draft
read_status: read
created: 2026-07-11
updated: 2026-07-11
---

## Relations

@concepts/retrieval-agent-safety-degradation.md @concepts/persona-ops-stack.md @entities/persona-ops/sillytavern.md @concepts/llm-interaction-style-governance.md @concepts/pragmatic-open-model-adoption.md

## Raw Concept

- **Title**: Safety Degradation in AI Agents
- **Authors**: Cheng Yu, Benedikt Stroebl, Diyi Yang, Orestis Papakyriakopoulos (TUM, Princeton, Stanford)
- **Type**: arXiv:2505.14215v3 · NeurIPS 2025
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2505.14215-safety-degradation-in-ai-agents-arxiv.pdf`
- **URL**: https://arxiv.org/abs/2505.14215
- **Retrieved**: 2026-07-11
- **Read status**: read (abstract, introduction, core claim)

## Narrative

Empirical study of how **retrieval breadth** affects agent safety: as LLM agents gain access from no retrieval → Wikipedia → open web search, **refusal rates fall**, **bias sensitivity rises**, and **harmful outputs increase** — even when retrieval accuracy is high and mitigations are prompt-based.

Notable finding: **retrieval-enabled agents built on aligned LLMs can behave less safely than uncensored models without retrieval**, because retrieved content structurally reshapes generation (bias laundering, reduced refusals).

**Image-gen ingest verdict: SKIP build-track** — no diffusion/video tooling. **Persona-ops relevance: REFERENCE** for SillyTavern / agentic DM stacks that enable web search, RAG, or tool plugins.

## Snippets

> "Retrieval-enabled agents built on aligned LLMs often behave more unsafely than uncensored models without retrieval."

[Source: arxiv-2505.14215 abstract]

> "This effect persists even under strong retrieval accuracy and prompt-based mitigation, suggesting that the mere presence of retrieved content reshapes model behavior in structurally unsafe ways."

[Source: arxiv-2505.14215 abstract]

## Dead Ends

- Not a de-censoring technique — opposite risk vector (safety collapse from external context).
- No actionable image-model integration.
