---
title: Representation-space video safety steering (REINS)
type: concept
tags: [concept, video-generation, safety, steering, inference-time, training-free]
keywords: [REINS, SPCA, hidden-state steering, DiT safety direction, Wan, CogVideoX, norm preservation, intermediate layer]
related:
  - sources/arxiv-2606-17257-reins-video-safety-representation-steering.md
  - concepts/activation-steering-video-generation.md
  - concepts/cross-model-safety-steering.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/de-censoring-techniques.md
  - concepts/pluralistic-safety-alignment.md
  - sources/arxiv-2606-05290-cross-model-safety-steering.md
  - sources/arxiv-activation-steering-video-gen-2606.04775-2026-06-05.md
  - entities/models/wan-2-2.md
  - entities/models/cogvideox-1-5.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-20
updated: 2026-06-20
---

## Relations

@sources/arxiv-2606-17257-reins-video-safety-representation-steering.md @concepts/activation-steering-video-generation.md @concepts/cross-model-safety-steering.md @concepts/de-censoring-techniques.md @entities/models/wan-2-2.md

## Raw Concept

Ingest 2026-06-20 from REINS (arXiv:2606.17257) — SPCA-discovered safety direction on VDM transformer hidden states.

## Narrative

**Problem:** Open-weight VDMs lack built-in safety; finetuning is expensive and hurts quality; prompt/output filters are bypassable and waste compute.

**REINS approach:**

| Stage | Mechanism |
|-------|-----------|
| Offline | Safety classifier labels + forward passes → **SPCA direction** δ in hidden-state space |
| Layer pick | ~50% depth — peak steerability vs accumulated safety signal |
| Inference | Add scaled δ early in denoising; **norm-preserving** per channel; both CFG paths |

**Why hidden states not latents:** Paper claims safety structure is **linearly separable** in DiT activations but not equivalently accessible in VAE latent space for video `[TENTATIVE]`.

**Steering literature map:**

- **LA-LQR** — closed-loop optimal control on activations (@concepts/activation-steering-video-generation.md)
- **Cross-model** — LLM direction → T2V via benign alignment (@concepts/cross-model-safety-steering.md)
- **REINS** — native VDM SPCA direction, no weight edits, video-specific eval suite

### Workspace relevance

Understands **how** safety could be bolted onto local Wan runs — inverse lens for uncensored persona pipelines. Adversarial **anti-steering** is discussed in paper appendix; not an uncensoring recipe.

## Snippets

> "Steering effectiveness peaks at intermediate layers (~50% depth), exposing a fundamental tradeoff between information availability and downstream propagation capacity."

## Dead Ends

Not a substitute for abliterated encoders / Eastern Vanguard uncensored bases; adds safety, does not remove alignment.
