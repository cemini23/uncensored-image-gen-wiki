---
related:
  - sources/arxiv-2606-09828-mirage-latent-spatial-memory.md
  - entities/models/mirage.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - entities/models/decmem.md
  - entities/models/sana-wm.md
  - concepts/long-video-rag-retrieval.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - sources/arxiv-2606-13376-moverse-panoramic-gaussian-world.md
  - concepts/panoramic-gaussian-video-world-models.md
  - entities/models/moverse.md
  - sources/arxiv-2606-16449-permavid-disentangled-context-memory.md
  - concepts/disentangled-context-memory-video-edits.md
  - entities/models/permavid.md
  - concepts/implicit-memory-retrieval-video-world-models.md
  - sources/arxiv-2606-23105-car-implicit-memory-video-world.md
  - concepts/ucm-time-aware-pe-warping-world-models.md
  - sources/arxiv-2602-22960-ucm-camera-control-memory-world-models.md
title: Latent spatial memory for video world models
type: concept
tags: [concept, world-model, video-generation, spatial-memory, 3d-consistency]
keywords: [latent spatial memory, Mirage, 3D cache, latent-space warping, RGB point cloud bottleneck, revisit consistency, depth back-projection, world model memory]
maturity: draft
created: 2026-06-12
updated: 2026-07-02
---

## Relations

@sources/arxiv-2606-09828-mirage-latent-spatial-memory.md @entities/models/mirage.md @concepts/world-models-video-generation.md @entities/models/decmem.md @entities/models/sana-wm.md

## Raw Concept

Ingest 2026-06-12 from Mirage (arXiv:2606.09828) — 3D spatial memory in diffusion **latent space** instead of RGB point clouds.

## Narrative

**Problem:** Video world models need persistent 3D memory for **revisit consistency** (same wall looks the same when camera returns). RGB point-cloud memories work but require expensive **render full-res → VAE encode** every conditioning step, and lose latent-feature fidelity.

**Latent spatial memory pattern:**

```
Observe frame → VAE encode → depth lift → store (world_xyz, latent_token)
Query view   → latent-resolution z-buffer projection → ControlNet cond
Generate     → denoise in latent space (no pixel round trip)
Update cache → back-project new static geometry only
```

### Memory architecture landscape (2026)

| Approach | Example | Mechanism |
|----------|---------|-----------|
| Implicit temporal | Wan I2V AR | Sliding context — drift on detours |
| Learned decoupled memory | DecMem | Sparse global + anchored local tokens |
| RAG over latents | LongLive-RAG | Retrieve non-local chunks |
| RGB 3D cache | Prior world-gen systems | Point cloud + rasterize + encode |
| **Latent 3D cache** | **Mirage** | Latent tokens in world space |

Footprint shrinks ~s² vs pixel cache (VAE spatial compression factor).

### Persona ops horizon

Relevant for **interactive explorable sets** (walk through same room from multiple angles) — orthogonal to identity LoRA / lipsync stack. Today: research-only.

## Snippets

> "The repeated round trip between latent and pixel space is computationally prohibitive … RGB detour does not preserve the model's native latent conditioning features."

## Dead Ends

Requires depth estimator + dynamic segmentation per chunk — failure modes on fast human motion in persona video. Not a drop-in upgrade for Wan seam stitching.
