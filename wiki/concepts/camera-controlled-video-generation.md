---
related:
  - sources/sana-wm-minute-scale-world-model.md
  - entities/models/sana-wm.md
  - concepts/world-models-video-generation.md
  - sources/arxiv-2606-09507-prisma-world-multi-agent-video.md
  - entities/models/prisma-world.md
  - concepts/multi-agent-cross-view-video-world-models.md
  - sources/arxiv-2606-09828-mirage-latent-spatial-memory.md
  - entities/models/mirage.md
  - concepts/latent-spatial-memory-video-world-models.md
  - sources/arxiv-2606-13376-moverse-panoramic-gaussian-world.md
  - concepts/panoramic-gaussian-video-world-models.md
  - entities/models/moverse.md
  - sources/arxiv-2606-16449-permavid-disentangled-context-memory.md
  - concepts/disentangled-context-memory-video-edits.md
  - entities/models/permavid.md
  - sources/arxiv-2606-13768-cineorchestra-entity-centric-cinematic-video.md
  - concepts/entity-centric-cinematic-video-conditioning.md
  - entities/models/cineorchestra.md
  - sources/arxiv-2606-17536-omnidrive-llm-choreographed-driving-world.md
  - concepts/llm-choreographed-multi-view-world-models.md
  - concepts/implicit-memory-retrieval-video-world-models.md
  - entities/models/car.md
  - sources/arxiv-2606-23105-car-implicit-memory-video-world.md
title: Camera-Controlled Video Generation
type: concept
tags: [concept, video-generation, camera-control, 6-dof, conditioning]
keywords: [camera control, 6-DoF camera trajectory, Plucker coordinates, Plucker mixing, UCPE, dual-branch camera control, metric-scale camera pose, camera conditioning, temporal VAE stride, revisit trajectory]
maturity: draft
created: 2026-05-16
updated: 2026-06-24
---

## Relations

@sources/sana-wm-minute-scale-world-model.md @entities/models/sana-wm.md @concepts/world-models-video-generation.md @entities/models/prisma-world.md @concepts/multi-agent-cross-view-video-world-models.md

## Raw Concept

Stub created during the cross-wiki ingest of NVIDIA's SANA-WM paper (@sources/sana-wm-minute-scale-world-model.md), routed from the OSINT workspace 2026-05-16. Anchors the technique of conditioning video generation on an explicit camera trajectory.

## Narrative

**Camera-controlled video generation** conditions a video model on an explicit 6-DoF camera trajectory (position + orientation) so the synthesized video follows a chosen motion path through the scene. A core difficulty: aggressive temporal VAE compression collapses many raw frames into one latent token, destroying fine camera motion. SANA-WM's answer is **dual-branch camera control** — a latent-rate UCPE branch capturing global trajectory structure plus a raw-frame Plücker mixing branch that restores fine motion inside each temporal VAE stride. Accurate **metric-scale** pose annotation (consistent real-world units) is a prerequisite, which is why SANA-WM built a dedicated pose-recovery annotation pipeline. → @entities/models/sana-wm.md
