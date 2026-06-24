---
related:
  - concepts/chinese-llm-safety-guardrails.md
  - concepts/pluralistic-safety-alignment.md
  - concepts/llm-interaction-style-governance.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-06-17-daily.md
  - concepts/domain-sensitive-llm-over-alignment.md
  - sources/arxiv-2606-23375-tf-refusalbench-over-alignment.md
title: "CHILLGuard — fine-grained Chinese LLM safety guardrail (arXiv:2606.15396)"
type: source
tags: [paper, llm, safety, guardrail, chinese, moderation, persona-ops]
keywords: [CHILLGuard, Chinese harm taxonomy, MDPO, LlamaGuard, Qwen3Guard, content moderation, 31 micro-categories, Tsinghua]
maturity: draft
read_status: read
created: 2026-06-17
updated: 2026-06-24
---

## Relations

@concepts/chinese-llm-safety-guardrails.md @concepts/pluralistic-safety-alignment.md @concepts/persona-ops-stack.md @entities/persona-ops/sillytavern.md

## Raw Concept

- **Title**: CHILLGuard: Towards Fine-Grained Chinese LLM Safety Guardrail with Scalable Data Construction and Model-aware Preference Alignment
- **Authors**: Wenbo Yu, Bohua Wang, Hao Fang et al. (Tsinghua, HIT Shenzhen, SCUT)
- **Type**: arXiv:2606.15396
- **Location**: `raw-sources/arxiv-2606.15396-chillguard-towards-fine-grained-chinese-llm-safe.pdf`
- **URL**: https://arxiv.org/abs/2606.15396 · https://github.com/cswbyu/CHILLGuard
- **Retrieved**: 2026-06-17
- **Read status**: read (taxonomy + dataset scale)

## Narrative

**Problem:** English-centric guardrails (LlamaGuard, Qwen3Guard) miss Chinese regulatory taxonomy, homophones, euphemisms, and implicit harmful phrasing.

**CHILLGuard:**

| Component | Detail |
|-----------|--------|
| Taxonomy | 5 macro / 31 micro categories aligned to Chinese regulatory harm classes |
| CHILLGuardTrain | 405,007 samples — RAG expansion, PE rewriting, real-world crawls, multi-model label voting |
| CHILLGuardTest | 51,745 held-out eval samples |
| Training | Generator-classifier collaborative framework + Model-aware DPO (MDPO) |

**Claims [TENTATIVE]:** 8B variant F1 **89.77** on CHILLGuardTest (+15.92% vs Qwen3Guard-8B-Strict).

**Repo:** `cswbyu/CHILLGuard` — **empty** at Phase-0 audit (2026-06-13); paper promises release.

### Workspace relevance

**Persona-ops adjacent** — operators running **Chinese-language** SillyTavern / DM bots need input/output moderation that respects PRC content rules (@concepts/persona-ops-stack.md). Complements pluralistic alignment thesis (@concepts/pluralistic-safety-alignment.md): Western guardrails ≠ Chinese deployment compliance.

Not image/video generation — no build-track for ComfyUI.

## Snippets

> "We introduce a dedicated 5-macro, 31-micro category fine-grained risk taxonomy for Chinese scenarios."

> "We will release our resources at https://github.com/cswbyu/CHILLGuard."

## Dead Ends

Empty repo at audit — cannot self-host until weights/dataset ship. Regulatory taxonomy is jurisdiction-specific; not a de-censoring tool.
