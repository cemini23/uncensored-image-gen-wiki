---
related:
  - concepts/llm-interaction-style-governance.md
  - concepts/llm-instruction-hierarchy-training.md
  - sources/arxiv-2606-10860-gravity-weighted-instruction-hierarchy-dpo.md
  - concepts/pluralistic-safety-alignment.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - sources/arxiv-2606-00369-geo-cultural-safety-alignment.md
  - sweeps/2026-06-12-daily.md
  - sources/arxiv-2606-21710-privacyalign-llm-agents.md
  - concepts/contextual-privacy-alignment-llm-agents.md
  - concepts/domain-sensitive-llm-over-alignment.md
  - sources/arxiv-2606-23375-tf-refusalbench-over-alignment.md
  - concepts/pragmatic-open-model-adoption.md
  - sources/arxiv-2606-22211-open-ai-local-llama-wild.md
title: "Human-LLM interaction governance — style drift (arXiv:2606.08172)"
type: source
tags: [paper, persona-ops, llm-governance, alignment, safety, style-drift, pluralism]
keywords: [LLM governance, prompt steerability, style drift, safety gating, civility steering, affective default lock-in, anthropomorphism, SillyTavern, persona conditions]
maturity: draft
read_status: read
created: 2026-06-12
updated: 2026-06-25
---


## Relations

@concepts/llm-interaction-style-governance.md @concepts/pluralistic-safety-alignment.md @concepts/persona-ops-stack.md @entities/persona-ops/sillytavern.md

## Raw Concept

- **Title**: The Governance of Human-LLM Interaction: Safety Gating, Civility Steering, and Affective Default Lock-In
- **Authors**: Manuele Reani, Hongjian Zhang, Hongyu Tian (CUHK Shenzhen)
- **Type**: arXiv:2606.08172
- **Location**: `raw-sources/arxiv-2606.08172-2606-08172v1-the-governance-of-human-llm-interac.pdf`
- **URL**: https://arxiv.org/abs/2606.08172
- **Retrieved**: 2026-06-12
- **Read status**: read (abstract + method + governance framework)

## Narrative

Empirical **governance framework** for how provider-side LLM alignment shapes *communicative form*, not just content safety. Three observable modes:

| Mode | Definition |
|------|------------|
| **Safety gating** | Hard blocks on harmful/disruptive personas |
| **Civility steering** | Soft pressure toward polite/prosocial tone |
| **Affective default lock-in** | Prompt-specified neutral/cold/distant styles **drift back** to warm, empathic, anthropomorphic defaults |

**Method:** Deterministic multi-agent pipeline — 100 frozen user-only scripts × 4 domains (entertainment, finance, mental health, medicine) × 3 persona conditions (default, sarcastic, cold) × 3 models (DeepSeek-V3, GPT-4o-mini, Gemini-2.5-Flash) → 90,000 assistant turns scored by human-calibrated LLM judge (harm, emotion, inappropriateness, empathy, anthropomorphism, refusal). Harmful persona tested separately as safety-gating stress test.

**Findings [TENTATIVE]:** Prompt steerability and regression-to-default are measurable — provider control over interaction style has autonomy implications in high-stakes domains.

### Persona-ops relevance

Directly maps to **SillyTavern persona cards** and DM-bot style configuration (@entities/persona-ops/sillytavern.md): operators may specify "cold/professional" persona system prompts but hosted APIs may **revert to alignment mean** over long horizons. Complements pluralistic alignment (@concepts/pluralistic-safety-alignment.md) — monolithic civility targets compress legitimate style diversity.

Not a generative-media model paper — no ComfyUI / TTS application.

## Snippets

> "We distinguish three governance modes. Safety gating refers to hard constraints that block harmful or clearly disruptive personas. Civility steering refers to softer pressure toward polite, respectful, prosocial communication. Affective default lock-in refers to the failure of prompt-specified neutral, distant, or non-anthropomorphic styles to remain stable."

> "Prompt steerability and regression-to-default are observable indicators of provider control over communicative form."

## Dead Ends

No open pipeline code verified 2026-06-12. Findings are cloud-LLM specific — local uncensored models (Ollama + abliterated weights) may exhibit different drift profiles `[NEEDS VERIFICATION 2026-06-12]`.
