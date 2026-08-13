---
title: "Agentic optimization for image-to-video adherence (arXiv:2608.12290)"
type: source
tags: [paper, i2v, video-generation, agentic, prompt-optimization, watch]
keywords: [Agentic Self-Improvement, I2V adherence, DSG, CMQ, Bayesian optimization, VTA, Google, prompt optimization]
related:
  - entities/models/agentic-i2v.md
  - concepts/grpo-i2v-post-training.md
  - concepts/persona-consistency-methods.md
  - sweeps/2026-08-13-daily.md
maturity: draft
read_status: read
created: 2026-08-13
updated: 2026-08-13
---

## Relations

@entities/models/agentic-i2v.md @concepts/grpo-i2v-post-training.md @concepts/persona-consistency-methods.md @sweeps/2026-08-13-daily.md

## Raw Concept

- **Title**: Beyond Trial-and-Error: Agentic Optimization for Image-to-Video Adherence
- **Authors**: Aman Tyagi, Hemanth Boinpally, Jonathan Chen, Douglas Gebert (Google Cloud), Steven Hickson (Google DeepMind)
- **Type**: arXiv:2608.12290 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.12290-beyond-trial-and-error-agentic-optimization-for.pdf`
- **URL**: https://arxiv.org/abs/2608.12290
- **Code**: none (Google internal; no repo in paper)
- **Retrieved**: 2026-08-13

## Narrative

"Agentic Self-Improvement" for black-box I2V: stage-1 iterative mLLM prompt refinement with two automated evals — Davidsonian Scene Graph (DSG) queries for semantic adherence + Common Mistake Questions (CMQ) for artifact detection; stage-2 Bayesian optimization co-optimizing stochastic seeds and CFG scale, guided by a Video-Text Adherence (VTA) score. Human-preference studies strongly prefer agentic outputs over unguided search.

**Phase-0: WATCH.** Persona-relevant (adherence/control for persona video generation; the DSG+CMQ eval loop is a portable QA technique independent of the vendor I2V model). No public code → no SPDX check. Reusable pattern for prompt-tuning black-box I2V APIs (VEO/Veo-class). Phase-1: `deferred`.

## Snippets

> "A two-stage approach. In the first stage, an iterative prompt optimization loop uses a multimodal Large Language Model (mLLM) to refine the input prompt... At the second stage, we use Bayesian optimization to efficiently co-optimize stochastic seeds and CFG scales."

_[Source: arxiv-2608.12290, abstract]_
