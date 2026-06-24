---
title: "TF-RefusalBench — domain-sensitive LLM over-alignment (arXiv:2606.23375)"
type: source
tags: [paper, llm-governance, alignment, abliteration, persona-ops, legal]
keywords: [TF-RefusalBench, over-alignment, disclaimer, refusal, abliteration, criminal law, multilingual, on-premises]
related:
  - concepts/domain-sensitive-llm-over-alignment.md
  - concepts/llm-interaction-style-governance.md
  - concepts/de-censoring-techniques.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - sources/arxiv-2606-08172-human-llm-interaction-governance.md
  - sources/arxiv-2606-15396-chillguard-chinese-llm-safety.md
  - sweeps/2026-06-24-daily.md
maturity: draft
read_status: read
created: 2026-06-24
updated: 2026-06-24
---

## Relations

@concepts/domain-sensitive-llm-over-alignment.md @concepts/llm-interaction-style-governance.md @concepts/de-censoring-techniques.md @entities/persona-ops/sillytavern.md

## Raw Concept

- **Title**: Measuring & Mitigating Over-Alignment for LLMs in Multilingual Criminal Law Courts
- **Authors**: Arthur Wuhrmann, Gaetan Stein, Daniel Brunner, Andrei Kucharavy (Surelio.ai + Swiss Federal Supreme Court + HES-SO)
- **Type**: arXiv:2606.23375
- **Location**: `raw-sources/arxiv-2606-23375-pdf-measuring-mitigating-over-alignment-for-llms.pdf`
- **URL**: https://arxiv.org/abs/2606.23375
- **Retrieved**: 2026-06-24
- **Read status**: read (abstract + mitigation section)

## Narrative

Studies **over-alignment** beyond simple refusal: models may **refuse**, add **content disclaimers**, or comply cleanly on legitimate criminal-law translation/summarization tasks — all problematic in professional court workflows.

**TF-RefusalBench:** 100 sensitive public ruling extracts → **5,200 prompts** (FR/DE/IT/EN × translation + summarization). Evaluates five on-prem open-weight LLMs similar to court deployments.

**Mitigations tested:**

| Approach | Refusal | Disclaimer | Task faithfulness |
|----------|---------|------------|-------------------|
| System prompting | Partial | Partial | Variable |
| **Abliteration** (refusal-direction ablation) | Eliminated | Reduced | <2% translation quality drop; summarization sanitization ↓3× |

### Workspace relevance

Directly relevant to **SillyTavern / local LLM persona ops** when NSFW or edgy persona content triggers guardrails on otherwise legitimate operator workflows. Connects to @concepts/de-censoring-techniques.md abliteration axis — but warns abliteration can increase verbosity and requires domain-specific eval, not OR-Bench alone.

No public benchmark repo indexed at ingest (paper cites `github.com/LDNOO` fragment — not resolved).

## Snippets

> "Over-alignment is a multifaceted phenomenon… its impact cannot be evaluated solely from an over-refusal perspective, given the disclaimer's impact on task faithfulness."

## Dead Ends

Legal/court domain — benchmark not persona-specific; use as governance pattern, not copy-paste prompts.
