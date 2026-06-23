---
title: Multi-view 3D-consistent world models (PAIWorld)
type: concept
tags: [concept, world-model, video-generation, multi-view, 3d-consistency, robotics]
keywords: [PAIWorld, cross-view attention, Geo-RoPE, 3D-REPA, multi-camera consistency, world foundation model]
related:
  - sources/arxiv-2606-18375-paiworld-3d-consistent-world-foundation.md
  - concepts/world-models-video-generation.md
  - concepts/multi-agent-cross-view-video-world-models.md
  - concepts/physical-ai-native-world-model-stacks.md
  - concepts/video-generation-physical-executability.md
  - entities/models/kairos.md
  - entities/models/wan-2-2.md
  - entities/models/cogvideox-1-5.md
  - sources/video-generation-survey-2026.md
  - concepts/structural-prior-conditioned-spatiotemporal-generation.md
maturity: draft
created: 2026-06-22
updated: 2026-06-23
---

## Relations

@sources/arxiv-2606-18375-paiworld-3d-consistent-world-foundation.md @concepts/world-models-video-generation.md @concepts/multi-agent-cross-view-video-world-models.md @concepts/physical-ai-native-world-model-stacks.md

## Raw Concept

Ingest 2026-06-22 from PAIWorld (arXiv:2606.18375) — explicit 3D geometric pathway + objective for multi-view WFM.

## Narrative

**Failure mode:** Multi-view WFMs that **concatenate** view tokens treat cross-view alignment as implicit — yields drift, depth errors, texture mismatch in robotic rollouts.

**PAIWorld thesis:** Need **both**:

1. **Architectural inter-view pathway** (cross-view attention + Geo-RoPE on camera rays/poses)
2. **Geometric training signal** (Latent 3D-REPA from frozen 3D foundation features)

Neither alone suffices — communication without geometry copies textures; geometry per-view without pathway doesn't propagate.

**Positioning vs wiki cluster:**

| Line | Focus |
|------|-------|
| Prisma-World / MetaWorld | Multi-agent joint denoising, camera control |
| PAIWorld | 3D REPA + Geo-RoPE for manipulation multi-cam |
| Kairos | Full Physical AI stack (understand/generate/predict) |

### Workspace relevance

Theoretical reference for **multi-camera persona environments** — not directly runnable on laptop stack today.

## Snippets

> "Flat concatenation … leaves the model to discover cross-view correspondences implicitly from data."

## Dead Ends

Robotics benchmarks only at ingest; no open weights.
