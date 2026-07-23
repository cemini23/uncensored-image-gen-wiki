---
title: Autoregressive video foresight training (Video-Mirai)
type: concept
tags: [concept, video-generation, autoregressive, training, consistency, causal-forcing]
keywords: [Video-Mirai, planning gap, foresight encoder, causal video diffusion, representation alignment, training-only]
related:
  - concepts/bidirectional-autoregressive-video-generation.md
  - concepts/grpo-i2v-post-training.md
  - concepts/hierarchical-latent-coarse-to-fine-video.md
  - concepts/long-video-rag-retrieval.md
  - concepts/one-step-autoregressive-video-distillation.md
  - concepts/persona-consistency-methods.md
  - concepts/seam-stitching-strategies.md
  - concepts/streaming-force-controlled-video-generation.md
  - concepts/streaming-video-generation-serving.md
  - concepts/video-identity-inheritance.md
  - entities/models/self-gradient-forcing.md
  - entities/models/tango-ar-video.md
  - entities/models/wan-2-2.md
  - sources/arxiv-2606-03971-video-mirai-autoregressive-foresight.md
  - sources/arxiv-2606-03972-aad-1-one-step-ar-video.md
  - sources/arxiv-2606-07508-streamforce-streaming-force-video.md
  - sources/arxiv-2606-09056-millivid-hierarchical-latents.md
  - sources/arxiv-2606-18702-unitemp-bidirectional-video-generation.md
  - sources/arxiv-2606-19271-turboserve-streaming-video-serving.md
  - sources/arxiv-2607-15849-tango-test-time-noise-guided-ar-video.md
  - sources/arxiv-2607-20368-self-gradient-forcing.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-07-20-daily.md
  - sweeps/2026-07-23-daily.md
maturity: draft
created: 2026-06-04
updated: 2026-07-23
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
