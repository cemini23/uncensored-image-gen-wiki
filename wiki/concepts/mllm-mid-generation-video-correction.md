---
title: MLLM mid-generation semantic correction for T2V
type: concept
tags: [concept, video-generation, mllm, training-free, inference]
keywords: [Semantic Assessment Supervisor, Semantic Modification Assistant, mid-sampling, latent intervention, training-free]
related:
  - sources/arxiv-2608-16513-mllm-semantic-correction-t2v.md
  - concepts/mllm-dit-video-fusion.md
  - concepts/llm-as-image-conditioning.md
  - entities/models/agentic-i2v.md
  - entities/models/wan-2-2.md
  - sweeps/2026-08-18-daily.md
maturity: draft
created: 2026-08-18
updated: 2026-08-18
---

## Relations

@sources/arxiv-2608-16513-mllm-semantic-correction-t2v.md @concepts/mllm-dit-video-fusion.md @concepts/llm-as-image-conditioning.md @entities/models/agentic-i2v.md @entities/models/wan-2-2.md @sweeps/2026-08-18-daily.md

## Raw Concept

The question: can an MLLM supervise a T2V sampler *during* denoising, not only before or after? Bootstrapped from arXiv:2608.16513. Do **not** fold into `@concepts/mllm-dit-video-fusion.md` (token-bridge architecture) or `@concepts/llm-as-image-conditioning.md` (T2I LM roles).

## Narrative

Three places an MLLM can touch a video generator:

| When | Pattern | Example |
|------|---------|---------|
| Before sampling | Rewrite the prompt / pick seed / CFG | Agentic I2V (DSG+CMQ + Bayesian search) |
| **During sampling** | Preview frames → diagnose → latent intervention | **This page** (Semantic Assessment Supervisor + Semantic Modification Assistant) |
| After sampling | Rescore / repair a finished clip | VideoRepair, NeuS-E |
| Architecture | MLLM emits tokens the DiT consumes | BiVidGen / `@concepts/mllm-dit-video-fusion.md` |

Mid-loop is the missing slot. Raw noisy latents are semantically empty, so the Supervisor **decodes preview frames** at selected steps, asks the MLLM what is missing or wrong, and the Assistant nudges the latent trajectory. Training-free; teacher weights stay frozen.

**Why it is not dumped into the fusion page.** Fusion answers "what token should condition the DiT?" Correction answers "the current sample drifted — push it back." Different code path, different failure modes (preview cost, MLLM latency, over-correction of motion).

**Operator takeaway.** For persona I2V/T2V, Agentic I2V is the cheaper first watch (prompt loop around a black box). Mid-generation correction is higher-leverage if preview decode + MLLM calls are affordable on the same GPU as Wan. No public code at ingest. `wire_status` stays deferred on the source.

## Snippets

> "Our framework achieves diffusion trajectory correction by injecting semantic evaluation signals during video synthesis, enabling the model to optimize the generated content through continuous self-reflection."

[Source: arxiv-2608.16513, abstract]
