---
title: NaviCache navigation-guided video caching
type: concept
tags: [concept, video-generation, caching, inference, optimization]
keywords: [NaviCache, INS, test-time self-calibration, trajectory-aware caching, Wan, HunyuanVideo]
related:
  - sources/arxiv-2606-26795-navicache-test-time-self-calibration-caching.md
  - concepts/budget-aware-diffusion-caching.md
  - sources/arxiv-2606-06060-recache-diffusion-caching.md
  - sources/arxiv-2606-13496-budcache-diffusion-caching.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-27
updated: 2026-06-27
---

## Relations

@sources/arxiv-2606-26795-navicache-test-time-self-calibration-caching.md @concepts/budget-aware-diffusion-caching.md @entities/models/wan-2-2.md

## Raw Concept

Ingest 2026-06-27 from arXiv:2606.26795 (ICML 2026) — INS-inspired offline-calibration-free video caching.

## Narrative

### Caching taxonomy (workspace)

| Class | Examples | NaviCache axis |
|-------|----------|----------------|
| Budget schedule | ReCache, BudCache | Which steps recompute |
| Zero-order cache | TeaCache, MagCache | Instantaneous feature delta |
| **Trajectory-aware** | **NaviCache** | Momentum + drift via INS dual-state |

### Persona ops mapping

Long Reel batches on Wan 2.2 — plug-and-play speedup without offline calibration datasets. Complements step-budget methods (@concepts/budget-aware-diffusion-caching.md), not replacement.

### Build-track

`HelloZicky/NaviCache` — **Apache-2.0**, Phase-0 **GO**. Integrate after ComfyUI Wan graph baseline is stable.

## Snippets

> "Modeling the relative coupling between input and output variations."

## Dead Ends

None until quality regression on NSFW prompts is tested.
