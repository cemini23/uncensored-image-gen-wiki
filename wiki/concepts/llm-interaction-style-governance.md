---
title: LLM interaction style governance
type: concept
tags: [concept, persona-ops, llm-governance, alignment, safety, style-drift]
keywords: [safety gating, civility steering, affective default lock-in, prompt steerability, style drift, regression-to-default, anthropomorphism, persona prompts]
related:
  - sources/arxiv-2606-08172-human-llm-interaction-governance.md
  - concepts/llm-instruction-hierarchy-training.md
  - sources/arxiv-2606-10860-gravity-weighted-instruction-hierarchy-dpo.md
  - concepts/pluralistic-safety-alignment.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - sources/arxiv-2606-00369-geo-cultural-safety-alignment.md
  - sources/arxiv-2606-15396-chillguard-chinese-llm-safety.md
  - concepts/chinese-llm-safety-guardrails.md
  - sources/arxiv-2606-21710-privacyalign-llm-agents.md
  - concepts/contextual-privacy-alignment-llm-agents.md
maturity: draft
created: 2026-06-12
updated: 2026-06-23
---

## Relations

@sources/arxiv-2606-08172-human-llm-interaction-governance.md @concepts/pluralistic-safety-alignment.md @concepts/persona-ops-stack.md @entities/persona-ops/sillytavern.md

## Raw Concept

Ingest 2026-06-12 from Reani et al. (arXiv:2606.08172) — provider-side control over *how* LLMs communicate, not just *what* they say.

## Narrative

**Interaction style as governance object:** alignment doesn't only block harmful content — it stabilizes **communicative defaults** (warmth, empathy, anthropomorphism) that users may not want in finance, medicine, or professional persona DMs.

### Three modes (operationalizable)

```
User persona prompt ("cold, professional")
        ↓
┌───────────────────────────────────────┐
│ Safety gating     → hard refuse harmful│
│ Civility steering → soften sarcasm     │
│ Affective lock-in → drift to warm default│
└───────────────────────────────────────┘
        ↓
Long-horizon style drift (measurable)
```

| Mode | Operator implication |
|------|---------------------|
| Safety gating | Expected — blocks jailbreak personas |
| Civility steering | May flatten edgy persona voice in SillyTavern |
| Affective lock-in | **Cold/professional persona cards may decay** over 50+ turn DMs on hosted APIs |

### vs pluralistic safety alignment

@concepts/pluralistic-safety-alignment.md focuses on **cultural value diversity** in harm labels. Style governance focuses on **communicative configurability** — can users sustain non-empathic interaction when culturally/professionally appropriate? Both argue monolithic RLHF targets compress legitimate variation.

### Build-track note

Local persona stacks (@concepts/persona-ops-stack.md) using self-hosted LLMs bypass provider civility steering but inherit base-model alignment priors unless abliterated/de-censored.

## Snippets

> "The concern is not only what the model says, but how it presents itself and whether users can configure that style."

## Dead Ends

Paper tests cloud APIs only — Fish-Speech / local LLM persona loops untested for style drift. Not routed to cybersecurity wiki (HCI/governance, not offensive security).
