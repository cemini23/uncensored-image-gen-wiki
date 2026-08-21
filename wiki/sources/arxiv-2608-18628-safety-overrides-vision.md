---
title: "When Safety Overrides Vision (arXiv:2608.18628) — k244 pointer"
type: source
tags: [paper, vlm, safety, refusal, k244, reference]
keywords: [safety override, visual grounding, abstention, Gupta, Chakraborty, IIT Delhi]
related:
  - concepts/agent-safety-executable-evaluation.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-21-daily.md
maturity: draft
read_status: read
created: 2026-08-21
updated: 2026-08-21
phase0_verdict: REFERENCE
wire_status: wont_wire
---

## Relations

@concepts/agent-safety-executable-evaluation.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-21-daily.md

## Raw Concept

- **Title**: When Safety Overrides Vision: Exploring Dynamics between Vision Influence and Safety Alignment in Vision-Language Models
- **Authors**: Mehak Gupta, Tanmoy Chakraborty (IIT Delhi)
- **Type**: arXiv:2608.18628
- **URL**: https://arxiv.org/abs/2608.18628
- **Retrieved**: 2026-08-21
- **Code**: none cloned. No activation-steering recipe filed here.

## Narrative

**Phase-0: REFERENCE / `wont_wire`.** Same image+question: safety instruction makes aligned VLMs abstain on items they already answered. Visual influence stays up through decoding. Late-layer refusal steering restores answers. Architecture-dependent geometry (Qwen separable, Phi entangled); shared causal role.

Image-gen takeaway: **VLM safety can refuse while still seeing.** Do not treat abstention as “the model didn’t perceive it.” Fills the dangling related: on `briefs/2026-08-21_k244-vlm-safety-override-pointer.md`. OSINT keeps interpretability steal. No clone, no runtime wire.

## Snippets

> "Aligned vision-language models (VLMs) are designed to balance grounded visual reasoning with safe generation behavior. However, we observe a striking phenomenon: under safety-constrained instruction, models frequently abstain from answering questions that remain correctly answerable under default instruction despite receiving identical image-question inputs."

[Source: https://arxiv.org/abs/2608.18628 (retrieved 2026-08-21)]
