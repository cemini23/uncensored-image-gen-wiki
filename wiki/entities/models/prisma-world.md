---
title: Prisma-World (NTU — multi-agent video world model)
type: entity
tags: [model, video, world-model, multi-agent, camera-control, research]
keywords: [Prisma-World, PrismaDataset, MultiAgentBench, MA-RoPE, NTU S-Lab, HUST, multi-agent, UE5, minimap]
related:
  - sources/arxiv-2606-09507-prisma-world-multi-agent-video.md
  - concepts/multi-agent-cross-view-video-world-models.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - entities/models/metaworld.md
  - entities/models/sana-wm.md
  - sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-11
updated: 2026-06-11
---

## Relations

@sources/arxiv-2606-09507-prisma-world-multi-agent-video.md @concepts/multi-agent-cross-view-video-world-models.md @concepts/world-models-video-generation.md @entities/models/metaworld.md @entities/models/sana-wm.md

## Raw Concept

Entity stub from 2026-06-11 ingest — Prisma-World (arXiv:2606.09507). Project: https://huiqiang-sun.github.io/prisma-world/

## Narrative

**Camera-controllable multi-agent video world model** — joint denoising of N synchronized agent videos with cross-view consistency via MA-RoPE + camera-aware attention. Trained on **PrismaDataset** (UE5, panoramic → multi-agent perspective groups).

| vs peer | Prisma-World edge |
|---------|-------------------|
| MetaWorld | Explicit multi-agent camera trajectories + overlap curriculum; UE5 diverse scenes vs monocular-unroll |
| SANA-WM | Multi-agent vs single 6-DoF observer |
| Solaris / MultiWorld | Open-domain UE5 vs single Minecraft/It-Takes-Two game |

**Status:** Research demo; weights/dataset release `[NEEDS VERIFICATION 2026-06-11]`. Not build-track for persona I2V until open weights + real-human domain eval.

## Snippets

(See @sources/arxiv-2606-09507-prisma-world-multi-agent-video.md)

## Dead Ends

Minimap conditioning requires layout priors unavailable from text-only persona prompts — extra conditioning pipeline needed for ops use.
