---
title: UCM time-aware PE warping for world models
type: concept
tags: [concept, world-model, camera-control, memory, video-generation]
keywords: [UCM, PE warping, PE-Field, dual-stream DiT, scene revisiting, memory injection]
related:
  - sources/arxiv-2602-22960-ucm-camera-control-memory-world-models.md
  - concepts/camera-controlled-video-generation.md
  - concepts/world-models-video-generation.md
  - concepts/latent-spatial-memory-video-world-models.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-07-02-daily.md
  - concepts/ray-space-positional-encoding-video.md
  - entities/models/hunyuanvideo-1-5.md
maturity: draft
created: 2026-07-02
updated: 2026-07-02
---

## Relations

@sources/arxiv-2602-22960-ucm-camera-control-memory-world-models.md @concepts/camera-controlled-video-generation.md @concepts/world-models-video-generation.md

## Raw Concept

Ingest 2026-07-02 from Xu et al. (arXiv:2602.22960) — explicit token-level PE warping for camera + memory in world simulation.

## Narrative

### World-model memory taxonomy (workspace)

| Approach | Geometry | Revisit consistency |
|----------|----------|---------------------|
| TSDF / point-cloud render | Explicit 3D | Strong but detail loss |
| Historical frame concat | Implicit 3D prior | Drift on long revisit |
| **UCM PE warping** | **Explicit token PE remap** | **Claims strong revisit + camera** |

### vs RayPE (@concepts/ray-space-positional-encoding-video.md)

| | UCM | RayPE |
|---|-----|-------|
| Target | World sim + memory | Pretrained Wan camera control |
| Injection | Warp PEs of memory/ref tokens | Additive Plücker Q/K |
| Scope | Clip-by-clip long horizon | Single-clip trajectory |

### Build-track note

Phase-0 **WATCH** — research code TBD. Persona use: scripted orbit Reels around a generated set without scene drift.

## Snippets

> "Reassign the 3D PEs of tokens from both the reference image and historical frames via a time-aware geometry-grounded warping operation."

## Dead Ends

No public implementation at ingest.
