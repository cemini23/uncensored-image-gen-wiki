---
title: ""Predicting alignment generalization with value representations (arXiv:2610.12410) — SKIP""
type: source
tags: [paper, llm-alignment, rlhf, out-of-domain, skip]
keywords: [alignment generalization, value representations, DPO, SFT, persona vectors, gradient directions, Anthropic constitution, ConflictScope, Olmo-3, Qwen-3]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-12-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-12
updated: 2026-10-12
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-12-daily.md

## Raw Concept

- **Title**: Predicting Alignment Generalization with Value Representations
- **Type**: arXiv:2610.12410 (Carnegie Mellon University + Mila/McGill + ETH Zurich + UBC + Vector Institute; Andy Liu et al.)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.12410
- **Retrieved**: 2026-10-12

## Narrative

**The word "alignment" is the trap.** This is **LLM behavioural alignment**, not image-text alignment, not geometric alignment, and not protein alignment — all three were checked explicitly.

**What it does.** Predicts how fine-tuning a language model to follow one value changes its behaviour on held-out values. It builds a 49x66 generalization matrix over 66 Anthropic-constitution values using DPO and SFT on four base models, then benchmarks representation methods that predict that matrix *before* training. Activation-based methods (persona vectors, gradient directions) reach correlation 0.45, against 0.05 for text-description embeddings.

**Why SKIP.** Zero mentions of image, video, diffusion or vision models. It offers no reward model, no preference-optimization advance (it uses stock DPO), and no safety-evaluation protocol that transfers to the wiki's TTS preference-optimization or video RL post-training work. Code exists at `github.com/andyjliu/value-generalization` with no licence stated, but that does not make it on-domain. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.12410 (retrieved 2026-10-12)]
