---
title: Autoregressive video foresight training (Video-Mirai)
type: concept
tags: [concept, video-generation, autoregressive, training, consistency, causal-forcing]
keywords: [Video-Mirai, planning gap, foresight encoder, causal video diffusion, representation alignment, training-only]
related:
  - sources/arxiv-2606-03971-video-mirai-autoregressive-foresight.md
  - concepts/grpo-i2v-post-training.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - concepts/long-video-rag-retrieval.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
maturity: draft
created: 2026-06-04
updated: 2026-06-04
---

## Relations

@sources/arxiv-2606-03971-video-mirai-autoregressive-foresight.md @concepts/grpo-i2v-post-training.md @concepts/persona-consistency-methods.md @concepts/video-identity-inheritance.md

## Raw Concept

Concept stub from 2026-06-04 ingest — arXiv:2606.03971 Video-Mirai.

## Narrative

**Planning gap:** causal AR video trains each state to explain the **present** segment, but streaming inference requires states that **preserve** identity, layout, and motion for **future** segments. Many hidden states look locally plausible yet discard foresight-critical information.

**Video-Mirai** closes this at **training only**:

1. Causal rollout (same mask as inference)
2. Frozen bidirectional **foresight encoder** on completed rollout
3. Lightweight predictor aligns causal hidden states to future-informed targets
4. Discard encoder + predictor at inference — strictly past-only generation unchanged

Orthogonal to exposure-bias fixes (Self-Forcing), injectivity (Causal-Forcing), rolling windows (Rolling-Forcing), and reward GRPO (@concepts/grpo-i2v-post-training.md). Complements retrieval memory (@concepts/long-video-rag-retrieval.md) — foresight improves representations; RAG improves context selection.

## Snippets

(See @sources/arxiv-2606-03971-video-mirai-autoregressive-foresight.md)
