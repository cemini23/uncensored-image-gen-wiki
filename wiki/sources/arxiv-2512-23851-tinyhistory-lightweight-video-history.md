---
title: "TinyHistory — lightweight video history embeddings (arXiv:2512.23851)"
type: source
tags: [paper, video-generation, long-horizon, autoregressive, memory, stanford]
keywords: [TinyHistory, history embedding, two-stage context learning, frame query, Wan 2.1, HunyuanVideo, identity consistency]
related:
  - concepts/lightweight-video-history-embeddings.md
  - entities/models/tinyhistory.md
  - concepts/long-video-rag-retrieval.md
  - concepts/causal-clip-attention-long-video.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - sources/arxiv-2606-02553-longlive-rag-long-video-generation.md
  - sources/arxiv-2606-22370-error-free-long-video-generation.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - sweeps/2026-06-25-daily.md
maturity: draft
read_status: read
created: 2026-06-25
updated: 2026-06-25
---

## Relations

@concepts/lightweight-video-history-embeddings.md @entities/models/tinyhistory.md @concepts/long-video-rag-retrieval.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: TinyHistory: Lightweight Video History Embeddings via Two-Stage Context Learning
- **Authors**: Lvmin Zhang, Shengqu Cai, et al. (Stanford, MIT, CMU, HKUST)
- **Type**: arXiv:2512.23851
- **Location**: `raw-sources/arxiv-2512.23851-tinyhistory-lightweight-video-history-embeddings.pdf`
- **URL**: https://arxiv.org/abs/2512.23851
- **Retrieved**: 2026-06-25
- **Read status**: read (abstract + eval setup)

## Narrative

**TinyHistory** — compact **history encoder** for autoregressive video diffusion, targeting personal/offline workflows with tight VRAM.

**Two-stage training:**

| Stage | Objective |
|-------|-----------|
| 1 | Large-scale video pretrain with **randomized frame query** — content interpretation |
| 2 | Embed encoder in AR video DiT — **content-level consistency** fine-tune |

**Design goals:** (1) identity/content consistency, (2) **complete uninterrupted** history coverage vs sparse keyframes, (3) queryable feature manifold under fixed token budget.

Evaluated on **Wan 2.1 14B** and **HunyuanVideo 12.8B** at 480p; claims comparable VLM/VBench/ELO to heavier FramePack/FOV-retrieval baselines at lower tokens/sec context cost `[TENTATIVE]`.

### Workspace relevance

Directly adjacent to **LongLive-RAG**, **CaR**, and **causal clip attention** on the long-horizon memory axis — but optimizes **encoder compression** rather than retrieval or cross-clip attention. Persona minute-long Reels + individual LoRA finetunes are called out explicitly in paper.

## Snippets

> "Personal users, offline workflows, and individual-scale finetuning need to encode longer video histories under tight compute and memory budgets."

## Dead Ends

No public code/weights at ingest — research reference until release.
