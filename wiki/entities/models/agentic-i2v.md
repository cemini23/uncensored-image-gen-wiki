---
title: Agentic Self-Improvement for I2V adherence (Google)
type: entity
tags: [i2v, video-generation, agentic, prompt-optimization, watch]
keywords: [Agentic Self-Improvement, I2V adherence, DSG, CMQ, Bayesian optimization, VTA, Google, prompt optimization]
related:
  - sources/arxiv-2608-12290-agentic-i2v.md
  - concepts/grpo-i2v-post-training.md
  - concepts/persona-consistency-methods.md
  - concepts/mllm-mid-generation-video-correction.md
  - concepts/mllm-dit-video-fusion.md
  - sources/arxiv-2608-16513-mllm-semantic-correction-t2v.md
maturity: draft
created: 2026-08-13
updated: 2026-08-18
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-12290-agentic-i2v.md @concepts/grpo-i2v-post-training.md @concepts/persona-consistency-methods.md @concepts/mllm-mid-generation-video-correction.md @concepts/mllm-dit-video-fusion.md @sources/arxiv-2608-16513-mllm-semantic-correction-t2v.md

## Raw Concept

Phase-0 from arXiv:2608.12290. Closed-loop optimization for black-box I2V adherence: mLLM prompt refinement (DSG + CMQ evals) then Bayesian co-optimization of seeds/CFG guided by a Video-Text Adherence (VTA) score.

## Narrative

| Field | Value |
|-------|-------|
| Org | Google Cloud + Google DeepMind |
| Method | Two-stage: iterative mLLM prompt optimization (DSG semantic + CMQ artifact evals) → Bayesian search over seeds/CFG |
| Metric | Video-Text Adherence (VTA) score |
| Results | Strongly preferred over unguided search in human studies |
| Code | none (Google internal) |
| Phase-0 | **WATCH** |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Vendor-agnostic QA/optimization loop — reusable for prompt-tuning black-box I2V APIs (VEO-class) and for persona-video adherence QA. Distinguish from @concepts/grpo-i2v-post-training.md (weights-side RL) — this is inference-side search over a fixed black box.

Sibling 2026-08-18: @concepts/mllm-mid-generation-video-correction.md also uses an MLLM, but *inside* the sampler (preview + latent intervention). Agentic I2V is *before* the black box (prompt / seed / CFG).

## Snippets

_(none)_
