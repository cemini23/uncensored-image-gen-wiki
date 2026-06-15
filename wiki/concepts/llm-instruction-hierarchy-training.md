---
title: LLM instruction hierarchy training (GW-DPO)
type: concept
tags: [concept, llm, alignment, prompt-injection, instruction-hierarchy, dpo, persona-ops]
keywords: [instruction hierarchy, GW-DPO, gravity-weighted DPO, ISE, delimiter tokens, five-level hierarchy, prompt injection defense, system prompt priority]
related:
  - sources/arxiv-2606-10860-gravity-weighted-instruction-hierarchy-dpo.md
  - concepts/llm-interaction-style-governance.md
  - concepts/pluralistic-safety-alignment.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - sources/arxiv-2606-08172-human-llm-interaction-governance.md
maturity: draft
created: 2026-06-15
updated: 2026-06-15
---

## Relations

@sources/arxiv-2606-10860-gravity-weighted-instruction-hierarchy-dpo.md @concepts/llm-interaction-style-governance.md @concepts/pluralistic-safety-alignment.md @concepts/persona-ops-stack.md

## Raw Concept

Ingest 2026-06-15 from Bolliger & Jäger (arXiv:2606.10860) — training LLMs to enforce explicit multi-level instruction priority, not just content safety.

## Narrative

**Core idea:** Treat the prompt stack as a **privilege lattice**, not a flat concatenation. When levels conflict, higher privilege wins; severity of DPO margin scales with structural distance (GW-DPO bilateral schedule).

### Five-level production mapping

```
L0  Platform governance     (immutable safety ToS)
L1  Developer system prompt (persona card / app scope)
L2  Per-user configuration
L3  User message
L4  Tool / RAG / retrieved content  ← injection surface
```

Ten pairwise constraints at k=5. Evaluation suite tests all pairs — prior work often tested subset only.

### Architectural add-ons

- **Delimiter tokens** per level (`<|L0_START|>` …) — segment boundaries
- **ISE** — additive segment embeddings; calibrates refusal threshold more than raw conflict accuracy

### Persona-ops vs provider alignment

| Lens | Question |
|------|----------|
| **Defense** | Can L1 persona card survive L4 lore injection? |
| **Governance** | Does L0 provider policy override L1 edgy persona? (@concepts/llm-interaction-style-governance.md) |
| **Local ops** | Self-hosted Ollama stacks skip cloud L0 but still need L4 RAG hygiene |

Complements pluralistic alignment (@concepts/pluralistic-safety-alignment.md) — hierarchy training is **structural** priority; pluralism is **value diversity** in harm labels.

### Build-track note

Research training recipe on Llama-3.1-8B — not a drop-in for SillyTavern without finetune. Useful design pattern for custom persona LLM finetunes if operator owns full stack.

## Snippets

> "A platform-policy breach induced by an injected tool output is structurally more dangerous than a user request being overridden by retrieved content."

## Dead Ends

Does not help uncensored image/video models directly. GW-DPO repo URL unverified — watch UZH release.
