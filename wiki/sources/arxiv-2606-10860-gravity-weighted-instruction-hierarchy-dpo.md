---
title: "GW-DPO — gravity-weighted instruction hierarchy training (arXiv:2606.10860)"
type: source
tags: [paper, llm, alignment, prompt-injection, instruction-hierarchy, dpo, persona-ops]
keywords: [GW-DPO, gravity-weighted DPO, instruction hierarchy, k-level hierarchy, ISE, delimiter tokens, Llama-3.1, prompt injection, ODPO]
related:
  - concepts/llm-instruction-hierarchy-training.md
  - concepts/llm-interaction-style-governance.md
  - concepts/pluralistic-safety-alignment.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - sources/arxiv-2606-08172-human-llm-interaction-governance.md
  - sweeps/2026-06-15-daily.md
  - concepts/implicit-preference-alignment-human-animation.md
  - sources/arxiv-2605-07545-implicit-preference-alignment-human-animation.md
maturity: draft
read_status: read
created: 2026-06-15
updated: 2026-06-15
---

## Relations

@concepts/llm-instruction-hierarchy-training.md @concepts/llm-interaction-style-governance.md @concepts/pluralistic-safety-alignment.md @concepts/persona-ops-stack.md @entities/persona-ops/sillytavern.md

## Raw Concept

- **Title**: Training LLMs to Enforce Multi-Level Instruction Hierarchies via Gravity-Weighted Direct Preference Optimization
- **Authors**: Lena S. Bolliger, Lena A. Jäger (University of Zurich)
- **Type**: arXiv:2606.10860
- **Location**: `raw-sources/arxiv-2606.10860-training-llms-to-enforce-multi-level-instruction.pdf`
- **URL**: https://arxiv.org/abs/2606.10860
- **Retrieved**: 2026-06-15
- **Read status**: read (abstract + formalization + GW-DPO + training pipeline)

## Narrative

**Problem:** Production LLMs concatenate platform policy, developer system prompt, user config, user message, and tool/RAG outputs into one token stream with **uniform attention privilege** — the structural root of prompt injection and unresolved legitimate instruction conflicts.

**Formalization:** General **k-level instruction hierarchy** (k=5 instantiated): L0 platform governance → L1 developer system → L2 per-user config → L3 user message → L4 data/tool outputs. Ten pairwise priority constraints (L_i beats L_j when i<j and they conflict).

**GW-DPO:** Adapts offset-DPO (ODPO) so per-sample margin δ scales with **hierarchy distance** between victim level i and attacker level j. Two schedules:

| Schedule | δ formula | Behavior |
|----------|-----------|----------|
| Linear | α·(j−i) | Gap-only severity |
| **Bilateral** | α·(j−i)·(k−1−i) | Gap × victim privilege — **Pareto-best** in paper |

Combined with **delimiter tokens** (Chen et al. 2025a) and **Instructional Segment Embeddings (ISE)** (Wu et al. 2025). Trained on Llama-3.1-8B-Instruct: Phase 1 LoRA SFT on hierarchy-formatted data (~10k); Phase 2 GW-DPO on conflict triples (~8.7k) with easy-to-hard curriculum on gap size.

**Findings [TENTATIVE]:** Bilateral GW-DPO improves macro pairwise priority adherence vs standard DPO at **half the over-refusal rate**. ISE mainly calibrates refusal threshold, not raw conflict accuracy. Five-level training trades generality vs three-level specialization.

### Persona-ops relevance

Maps directly to **SillyTavern stack layers** (@entities/persona-ops/sillytavern.md): character card (L1) vs user turn (L3) vs retrieved lore/RAG (L4). Complements style-governance paper (@sources/arxiv-2606-08172-human-llm-interaction-governance.md) — that work measures provider drift; this work **trains** explicit priority enforcement.

Not a generative-media model — no ComfyUI application. Training-time defense, not runtime jailbreak for uncensored local weights.

## Snippets

> "This uniformity is the structural cause of prompt injection: adversarial instructions hidden in inputs that hijack the model's intended behavior."

> "GW-DPO with the bilateral schedule Pareto-improves over both standard DPO and the linear variant on conflict-resolution accuracy at a fraction of the over-refusal cost."

## Dead Ends

Paper cites GitHub for reproduction pipeline — public repo URL not verified in PDF extract `[NEEDS VERIFICATION 2026-06-15]`. Trained on hosted-API-generated data (Claude Sonnet 4) — local uncensored persona LLMs need separate hierarchy datasets. Not routed to cybersecurity wiki (training methodology; AdvGRPO remains the red-team routed stub).
