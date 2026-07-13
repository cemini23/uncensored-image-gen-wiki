---
title: Cross-model safety steering
type: concept
tags: [concept, safety, steering, alignment, cross-model, inference-time]
keywords: [cross-model safety, safety direction transfer, LLM to T2I, LLM to T2V, benign alignment, representation geometry, modular safety]
related:
  - sources/arxiv-2606-05290-cross-model-safety-steering.md
  - concepts/activation-steering-video-generation.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/de-censoring-techniques.md
  - concepts/pluralistic-safety-alignment.md
  - sources/arxiv-activation-steering-video-gen-2606.04775-2026-06-05.md
  - entities/models/wan-2-2.md
  - entities/models/flux-1-dev.md
  - entities/models/qwen-image-2512.md
  - entities/models/z-image-turbo.md
  - sources/arxiv-2606-17257-reins-video-safety-representation-steering.md
  - concepts/representation-space-video-safety-steering.md
  - concepts/sequential-adaptive-personality-steering.md
  - sources/arxiv-2603-03326-personality-sliders-llm-inference-time.md
  - concepts/autoregressive-concept-erasure-obliviate.md
  - sources/arxiv-2606-28643-obliviate-autoregressive-concept-erasure.md
  - concepts/multimodal-machine-unlearning.md
  - sources/arxiv-2607-07907-multimodal-unlearning-survey.md
  - sweeps/2026-07-13-daily.md
maturity: draft
created: 2026-06-06
updated: 2026-07-02
---

## Relations

@sources/arxiv-2606-05290-cross-model-safety-steering.md @concepts/activation-steering-video-generation.md @concepts/de-censoring-techniques.md @entities/models/wan-2-2.md

## Raw Concept

Concept from 2026-06-06 ingest — arXiv:2606.05290 cross-model safety steering.

## Narrative

**Modular safety hypothesis:** safety-relevant behavior may live in **transferable latent directions** across LLM → T2I/T2V boundaries, not only per-model finetunes.

**Pipeline:**

1. Contrastive safe/unsafe prompt pairs → mean activation delta **v_s** in source LLM
2. Fit **T_{s→t}** on benign anchors only (no unsafe target data)
3. **v_t = β · T_{s→t}(v_s)** applied to target hidden states at inference strength α
4. Optional **multi-vector** per harm category

Evaluated on FLUX, Qwen-Image, Z-Image-Turbo, Wan2.2 — ASR drops with preserved CLIP/FID on safe prompts `[TENTATIVE]`.

### Workspace relevance

- **Defense reading:** how cloud APIs / future local guardrails might steer Wan/FLUX without retraining
- **Offense reading (speculative):** shared geometry suggests **inverse steering** might relate to abliteration paths on Minimal-tier bases — not demonstrated in paper; do not treat as de-censor recipe
- Complements **LA-LQR** (@concepts/activation-steering-video-generation.md) — LQR is optimal-control on DiT activations during denoise; cross-model transfer is LLM→generator direction porting

## Snippets

> "Safety can be represented as a portable latent direction, learned once and reused across heterogeneous generators."

## Dead Ends

Paper increases safety only. Target-side unsafe data explicitly excluded — inverse use unvalidated.
