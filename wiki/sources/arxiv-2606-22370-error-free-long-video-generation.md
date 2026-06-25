---
related:
  - concepts/causal-clip-attention-long-video.md
  - concepts/seam-stitching-strategies.md
  - concepts/long-video-rag-retrieval.md
  - sources/arxiv-2606-02553-longlive-rag-long-video-generation.md
  - sources/arxiv-2606-14667-memento-long-video-subject-reconstruction.md
  - sources/arxiv-2606-16449-permavid-disentangled-context-memory.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/seedance-2.md
  - sweeps/2026-06-24-daily.md
  - sources/arxiv-2512-23851-tinyhistory-lightweight-video-history.md
title: "Error-free long video generation — causal clip attention + T-RFlow (arXiv:2606.22370)"
type: source
tags: [paper, video-generation, long-horizon, autoregressive, kv-cache, alibaba]
keywords: [error accumulation, attribute drift, causal clip attention, T-RFlow, truncation-rectified flow, KV cache, video extension, minute-scale]
maturity: draft
read_status: read
created: 2026-06-24
updated: 2026-06-25
---


## Relations

@concepts/causal-clip-attention-long-video.md @concepts/long-video-rag-retrieval.md @concepts/seam-stitching-strategies.md @sources/video-generation-survey-2026.md

## Raw Concept

- **Title**: Towards Error-Free Long Video Generation
- **Authors**: Shuning Chang, Weihua Chen, et al. (Zhejiang University + Alibaba Group)
- **Type**: arXiv:2606.22370
- **Location**: `raw-sources/arxiv-2606-22370-towards-error-free-long-video-generation-arxiv.pdf`
- **URL**: https://arxiv.org/abs/2606.22370
- **Retrieved**: 2026-06-24
- **Read status**: read (abstract + method sections)

## Narrative

Alibaba/ZJU framework for **single-shot minute-scale+ video** that targets **error accumulation** (exposure bias, oversharpening, color drift) and **attribute drift** (identity/scene memory loss).

**Two-stage training:**

| Stage | Data | Mechanism |
|-------|------|-----------|
| 1 | Large-scale short clips | Fine-tune diffusion backbone as **video extension** model — last-frame conditioning for local continuity |
| 2 | Long videos | **Hybrid attention**: bidirectional within each clip; **causal/unidirectional across clips** (LLM-inspired) with **KV cache** of past clips |

**T-RFlow (truncation-rectified flow):** reformulates rectified-flow sampling as a linear combination of timestep predictions; suppresses low/high-frequency error phases that compound when conditioning on prior clips.

**Inference:** constant KV memory via caching; conditional frames + cached KV from history for next-clip generation.

Claims superior long-horizon VBench scores vs commercial Kling on 30s+ clips `[TENTATIVE]` — no public weights/repo at ingest.

### Workspace relevance

Complements **LongLive-RAG** (retrieve non-local latents) and **PermaVid/Memento** (memory for edits/identity) on the long-horizon axis. Persona reel pipelines still need seam QA (@concepts/seam-stitching-strategies.md) until a local port exists.

## Snippets

> "The tokens in one clip are computed by bidirectional attention while tokens among clips are computed by unidirectional attention."

> "We introduce truncation-rectified flow (T-RFlow) technique to further suppress error accumulation."

## Dead Ends

No public GitHub or weights at ingest — research-only reference until Alibaba releases code.
