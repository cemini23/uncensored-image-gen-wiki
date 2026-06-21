---
title: Entity-centric cinematic video conditioning (CineOrchestra)
type: concept
tags: [concept, video-generation, cinematic, multi-subject, temporal-control, camera]
keywords: [CineOrchestra, entity-centric conditioning, interval RoPE, multi-shot, camera entity, transition entity, dense captions]
related:
  - sources/arxiv-2606-13768-cineorchestra-entity-centric-cinematic-video.md
  - entities/models/cineorchestra.md
  - concepts/camera-controlled-video-generation.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - concepts/subject-reconstruction-long-video-memory.md
  - sources/video-generation-survey-2026.md
  - concepts/llm-choreographed-multi-view-world-models.md
  - sources/arxiv-2606-17536-omnidrive-llm-choreographed-driving-world.md
maturity: draft
created: 2026-06-19
updated: 2026-06-21
---

## Relations

@sources/arxiv-2606-13768-cineorchestra-entity-centric-cinematic-video.md @entities/models/cineorchestra.md @concepts/camera-controlled-video-generation.md @concepts/persona-consistency-methods.md

## Raw Concept

Ingest 2026-06-19 from CineOrchestra (arXiv:2606.13768) — unified entity-interval conditioning for cinematic composition.

## Narrative

**Design pattern:** Treat every cinematic element as `(start_time, end_time, prompt)` on a tagged entity:

```
{hero}     + ref image + global description + [0–2s] waves … [5–8s] turns …
{camera}   + [0–10s] slow push-in …
{transition} + [6.3–6.4s] hard cut …
```

**Why it matters:** Replaces four siloed specialist models (multi-ref personalization, temporal control, multi-shot, camera) with **one DiT forward pass** and parameter-free RoPE extensions.

**Persona ops:** Multi-shot Reels with consistent tagged character + timed beats + intentional camera + cuts — the compositional layer above per-shot Wan I2V.

## Snippets

(See @sources/arxiv-2606-13768-cineorchestra-entity-centric-cinematic-video.md)

## Dead Ends

No open weights — architectural pattern only until Snap or community ports to Wan.
