---
title: DiT chat-template tokens as implicit semantic registers
type: concept
tags: [concept, dit, interpretability, pruning, inference]
keywords: [template-tokens, attention-sinks, GenEval, training-free-prune]
related:
  - concepts/budget-aware-diffusion-caching.md
  - concepts/ditango-parallel-diffusion-attention.md
  - entities/inference/chitu-diffusion.md
  - entities/models/flux-1-dev.md
  - entities/models/qwen-image-2512.md
  - sources/arxiv-2607-19139-dit-template-token-registers.md
  - sources/arxiv-2607-20048-importance-aware-obs-pruning.md
  - sweeps/2026-07-22-daily.md
  - sweeps/2026-07-23-daily.md
maturity: draft
created: 2026-07-22
updated: 2026-07-23
---

## Relations

@sources/arxiv-2607-19139-dit-template-token-registers.md @concepts/ditango-parallel-diffusion-attention.md @concepts/budget-aware-diffusion-caching.md @entities/models/qwen-image-2512.md

## Raw Concept

Ingest 2026-07-22 from Li et al. (arXiv:2607.19139).

## Narrative

Chat-template tokens in LLM-conditioned DiTs act as **identity registers** (I2T sinks) rather than inert formatting. Operator implication: training-free head pruning targeting prompt-reading heads is a plausible free throughput win once Met4physics code ships — complementary to FlexCache / DiTango / FVAttn.
