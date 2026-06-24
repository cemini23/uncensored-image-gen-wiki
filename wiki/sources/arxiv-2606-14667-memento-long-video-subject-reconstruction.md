---
related:
  - concepts/subject-reconstruction-long-video-memory.md
  - entities/models/memento.md
  - concepts/long-video-rag-retrieval.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - sources/video-generation-survey-2026.md
  - concepts/world-models-video-generation.md
  - entities/models/wan-2-2.md
  - sweeps/2026-06-17-daily.md
  - concepts/causal-clip-attention-long-video.md
  - sources/arxiv-2606-22370-error-free-long-video-generation.md
title: "Memento — reconstruct-to-remember long video consistency (arXiv:2606.14667)"
type: source
tags: [paper, video-generation, long-horizon, memory, subject-consistency, baidu]
keywords: [Memento, subject reconstruction, dual-query memory, shot-level AR, ERNIE Team, Baidu, long-form video, identity grounding]
maturity: draft
read_status: read
created: 2026-06-17
updated: 2026-06-24
---

## Relations

@concepts/subject-reconstruction-long-video-memory.md @entities/models/memento.md @concepts/long-video-rag-retrieval.md @concepts/persona-consistency-methods.md

## Raw Concept

- **Title**: Memento: Reconstruct to Remember for Consistent Long Video Generation
- **Authors**: Xuan Wei, Longbin Ji, Guan Wang et al. (Xiamen University + ERNIE Team, Baidu)
- **Type**: arXiv:2606.14667
- **Location**: `raw-sources/arxiv-2606.14667-memento-reconstruct-to-remember-for-consistent-l.pdf`
- **URL**: https://arxiv.org/abs/2606.14667
- **Retrieved**: 2026-06-17
- **Read status**: read (abstract + dual-memory design)

## Narrative

**Problem:** Shot-by-shot AR video scales length but **recurring subjects drift** — memory selection optimizes local continuation, not identity preservation.

**Memento** treats consistency as **identity grounding**:

- **Auxiliary objective:** reconstruct target subject appearance from memory + global story caption alone (no direct visual prompt) — if memory works, subject is recoverable.
- **Dual-query memory:** story-conditioned query → long-range identity evidence; shot-conditioned query → short-range layout/motion for next shot.
- **Data:** subject-aware cinematic pipeline with pronoun-free captions for reconstruction supervision.

**Contrast with memory baselines:**

| Method | Memory focus |
|--------|----------------|
| StoryMem / OneStory | Generic salience / compression |
| LongLive-RAG | Latent retrieval against window drift |
| **Memento** | Explicit subject reconstruction loss + disentangled queries |

**Release:** No public GitHub/HF at ingest `[NEEDS VERIFICATION 2026-06-17]`.

### Workspace relevance

Directly addresses **multi-shot persona reels** (@concepts/persona-consistency-methods.md) where the same character must survive scene changes — complementary to image-side LoRA + I2V inheritance (@concepts/video-identity-inheritance.md).

## Snippets

> "If a memory bank truly preserves a subject, the model should be capable of recovering the subject from memory."

> "A dual-query memory mechanism separates the retrieval of long-context subject evidence and short-context visual cues."

## Dead Ends

Baidu/ERNIE lineage — open-weight release uncertain. Training-heavy (not plug-in like LongLive-RAG). No ComfyUI path at ingest.
