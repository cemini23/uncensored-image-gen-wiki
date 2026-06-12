---
title: Mirage (ZJU — latent spatial memory world model)
type: entity
tags: [model, video, world-model, spatial-memory, research]
keywords: [Mirage, latent spatial memory, ZJU, Microsoft Research, WorldScore, camera-controllable, 3D-consistent video]
related:
  - sources/arxiv-2606-09828-mirage-latent-spatial-memory.md
  - concepts/latent-spatial-memory-video-world-models.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - entities/models/sana-wm.md
  - entities/models/decmem.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
maturity: draft
created: 2026-06-12
updated: 2026-06-12
---

## Relations

@sources/arxiv-2606-09828-mirage-latent-spatial-memory.md @concepts/latent-spatial-memory-video-world-models.md @concepts/world-models-video-generation.md @entities/models/sana-wm.md @entities/models/decmem.md

## Raw Concept

Entity stub from 2026-06-12 ingest — Mirage (arXiv:2606.09828). Project: https://aka.ms/latent-spatial-memory

## Narrative

**Mirage** — camera-controllable video world model with **latent spatial memory** (3D cache of VAE latent tokens, not RGB points). Chunk-wise AR rollout with initialize/readout/update cycle; ControlNet-style memory injection.

| vs peer | Mirage edge |
|---------|-------------|
| SANA-WM | Explicit 3D latent cache vs hybrid-attention long horizon |
| DecMem | Open research vs Kling closed industrial memory |
| RGB point-cloud WM | 10.57× faster, 55× less memory (paper claims) |

**Status:** Research demo; weights/code `[NEEDS VERIFICATION 2026-06-12]`. Not build-track for persona I2V.

## Snippets

(See @sources/arxiv-2606-09828-mirage-latent-spatial-memory.md)

## Dead Ends

Depth-guided lifting fails on uncensored persona content with heavy motion blur — untested domain.
