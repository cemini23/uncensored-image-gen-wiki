---
title: "MoVerse — real-time panoramic Gaussian world model (arXiv:2606.13376)"
type: source
tags: [paper, world-model, 3d-gaussian, panorama, real-time, interactive]
keywords: [MoVerse, panoramic Gaussian scaffold, NFOV to 360, ERP panorama, 3DGS, autoregressive video refinement, Wan2.1, Youku Orange Team, 8 FPS RTX 4090]
related:
  - concepts/panoramic-gaussian-video-world-models.md
  - entities/models/moverse.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - concepts/latent-spatial-memory-video-world-models.md
  - entities/models/wan-2-2.md
  - entities/models/mirage.md
  - entities/models/sana-wm.md
  - sources/video-generation-survey-2026.md
  - concepts/cascaded-streaming-high-resolution-video.md
  - sweeps/2026-06-16-daily.md
maturity: draft
read_status: read
created: 2026-06-16
updated: 2026-06-16
---

## Relations

@concepts/panoramic-gaussian-video-world-models.md @entities/models/moverse.md @concepts/world-models-video-generation.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: MoVerse: Real-Time Video World Modeling with Panoramic Gaussian Scaffold
- **Authors**: Yang Zhou, Ziheng Wang, Yuqin Lu et al. (SCUT, Columbia, Youku Orange Team / Alibaba, SMU)
- **Type**: arXiv:2606.13376
- **Location**: `raw-sources/arxiv-2606.13376-2606-13376v1-moverse-real-time-video-world-model.pdf`
- **URL**: https://arxiv.org/abs/2606.13376 · https://orange-3dv-team.github.io/MoVerse/ · https://github.com/Orange-3DV-Team/MoVerse
- **Retrieved**: 2026-06-16
- **Read status**: read (abstract + three-stage pipeline)

## Narrative

**Problem:** Single narrow-field-of-view (NFOV) image → interactively navigable world requires completing missing FOV, persistent geometry, controllable cameras, and temporally coherent high-fidelity video at interactive rates.

**MoVerse** separates **world construction** (offline) from **observation rendering** (online):

| Stage | Input → output | Role |
|-------|----------------|------|
| I — Panoramic generation | NFOV → gravity-aligned 360° ERP | Topology-aware diffusion; closes FOV before 3D |
| II — Gaussian scaffold | Panorama → panoramic 3DGS asset | Feed-forward residual prediction; splat-renderable memory |
| III — AR video refinement | Scaffold renders + camera traj → photoreal video | Bidirectional teacher → causal AR student (Wan2.1-1.3B DiT backbone per fig.) |

**Claims [TENTATIVE]:** **8 FPS real-time roaming on single RTX 4090**; explicit scaffold prevents long-trajectory drift vs implicit video WMs.

**Release posture:** GitHub repo live; weights/code under corporate review (~1 month per README) `[NEEDS VERIFICATION 2026-06-16]`.

### Workspace relevance

Build-track **watch** for persona environment previews (single hero image → explorable set) and world-model landscape (@concepts/world-models-video-generation.md). Not uncensoring-related — geometry + streaming quality axis.

## Snippets

> "We separate world construction from observation rendering: Stages I and II build a reusable scaffold offline, while Stage III turns scaffold renderings along user-specified camera trajectories into high-fidelity video online."

> "This design supports real-time roaming at 8 FPS on a single NVIDIA RTX 4090 GPU."

## Dead Ends

Not a talking-head / lipsync path — use @entities/lipsync/latentsync.md for persona DM video. Pretrained weights not yet public.
