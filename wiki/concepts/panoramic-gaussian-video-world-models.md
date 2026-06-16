---
title: Panoramic Gaussian scaffold video world models
type: concept
tags: [concept, world-model, 3d-gaussian, panorama, real-time, interactive]
keywords: [panoramic Gaussian scaffold, NFOV to world, ERP panorama, 3DGS world model, explicit geometry anchor, causal video refinement, MoVerse]
related:
  - sources/arxiv-2606-13376-moverse-panoramic-gaussian-world.md
  - entities/models/moverse.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - concepts/latent-spatial-memory-video-world-models.md
  - concepts/cascaded-streaming-high-resolution-video.md
  - entities/models/sana-wm.md
  - entities/models/mirage.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-16
updated: 2026-06-16
---

## Relations

@sources/arxiv-2606-13376-moverse-panoramic-gaussian-world.md @entities/models/moverse.md @concepts/world-models-video-generation.md

## Raw Concept

Ingest 2026-06-16 from MoVerse (arXiv:2606.13376) — explicit panoramic 3DGS scaffold + causal generative refinement for real-time world roaming from one image.

## Narrative

**Design pattern:** Hybrid world models that refuse to choose between pure 3D assets and pure video diffusion.

```
NFOV image
    → 360° ERP panorama (complete omnidirectional evidence)
    → Persistent 3D Gaussian scaffold (splat-renderable, camera-controllable)
    → Causal AR video renderer (perceptual polish + temporal coherence)
Interactive video @ 8+ FPS
```

| vs approach | Tradeoff |
|-------------|----------|
| Pure 3DGS from one view | Holes/floaters on large motion |
| Implicit video WM | Geometry drift on long trajectories |
| Sparse geometry + bidirectional video | Too slow for interaction |
| **MoVerse-style dense panoramic scaffold + causal student** | Offline heavy lift; online streaming |

Relates to latent spatial memory WMs (@concepts/latent-spatial-memory-video-world-models.md) but uses **explicit splats** as the durable anchor.

### Build-track

Watch `Orange-3DV-Team/MoVerse` weight release. RTX 4090-class target aligns with operator hardware tier.

## Snippets

> "The explicit scaffold carries long-range spatial memory."

## Dead Ends

Not trained for NSFW persona content — uncensoring posture inherits base video model when Stage III ships.
