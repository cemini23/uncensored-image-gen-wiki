---
title: "Behavioral reprogramming of open-weights models — cognitive plasticity / alignment bounds (arXiv:2608.13069) — routed cybersec"
type: source
tags: [paper, routed, security, alignment, dpo, peft, cross-wiki, llm]
keywords: [behavioral reprogramming, cognitive plasticity, alignment bounds, PEFT, LoRA rank, DPO, zero-shot persona transfer, abliteration-adjacent]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-14-daily.md
maturity: draft
read_status: read
created: 2026-08-14
updated: 2026-08-14
---

## Relations

Primary: Cybersecurity wiki brief `briefs/2026-08-14_behavioral-reprogramming-from-image-gen.md` · @cybersecurity-wiki/concepts/local-abliterated-llm-pentest-stack.md (cross-wiki). Dedup stub for image-gen digest.
@concepts/federated-daily-research-digest.md @sweeps/2026-08-14-daily.md

## Raw Concept

- **Title**: Behavioral Reprogramming of Open-Weights Models: Cognitive Plasticity and Alignment Bounds
- **Authors**: Lucia Malíčková
- **Type**: arXiv:2608.13069 [cs.CL]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.13069-behavioral-reprogramming-of-open-weights-models.pdf`
- **URL**: https://arxiv.org/abs/2608.13069
- **Retrieved**: 2026-08-14
- **Code**: none in PDF → no SPDX check

## Narrative

**Routed stub (cybersec) — not gen stack.** Challenges the passive-sycophantic assistant default: induces a **proactive, Socratic persona** in open-weights LLMs via behavioral reprogramming. 405 HPC hyperparameter-sweep jobs define PEFT bounds: LoRA threshold at rank 16; epoch window `e ∈ [2,3]` optimal for generalization (min val loss 0.919); 14B scaling lowers eval perplexity (1.414); **DPO decouples assertive behavior from localized syntax**; cross-lingual zero-shot persona transfer degrades in morphologically-distant languages.

**Image-gen relevance:** none as a gen-media artifact, but the PEFT/DPO "behavior decoupled from syntax" result + persona-transfer bounds are directly relevant to the operator's local-abliterated lab (low-refusal open-weight LLMs for authorized pentest assist) — reprogramming a model toward an operator-desired stance is the same mechanism as abliteration, with measured alignment bounds.

**Phase-0: SKIP gen-install / ROUTE cybersec REFERENCE.** No code, no SPDX, no dataset. Not atto / poker / guruwatcher / prod.

## Snippets

> "DPO successfully decoupled the underlying assertive behavior from localized syntax, while rigorous cross-lingual stress testing reveals both the capabilities and the structural boundaries of zero-shot persona transfer."

_[Source: arxiv-2608.13069, abstract]_
