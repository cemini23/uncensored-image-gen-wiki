---
title: Multi-agent cross-view video world models
type: concept
tags: [concept, world-model, video-generation, multi-agent, cross-view-consistency, camera-control]
keywords: [multi-agent world model, cross-view consistency, joint denoising, MA-RoPE, Prisma-World, MetaWorld, overlapping viewpoints, shared scene geometry]
related:
  - sources/arxiv-2606-09507-prisma-world-multi-agent-video.md
  - entities/models/prisma-world.md
  - entities/models/metaworld.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2606-17536-omnidrive-llm-choreographed-driving-world.md
  - concepts/llm-choreographed-multi-view-world-models.md
maturity: draft
created: 2026-06-11
updated: 2026-06-21
---

## Relations

@sources/arxiv-2606-09507-prisma-world-multi-agent-video.md @entities/models/prisma-world.md @entities/models/metaworld.md @concepts/world-models-video-generation.md @concepts/camera-controlled-video-generation.md

## Raw Concept

Ingest 2026-06-11 from Prisma-World (arXiv:2606.09507); synthesizes with MetaWorld (2606.02753) on the multi-agent world-model axis.

## Narrative

**Failure mode of naive extension:** sampling each agent's video **independently** factorizes one shared scene into N incompatible worlds — same building gets different facades when two egocentric cameras overlap.

**Fix taxonomy (2026):**

| Approach | Mechanism | Examples |
|----------|-----------|----------|
| Independent rollouts | None — consistency post-hoc or absent | Single-agent T2V × N |
| Concat + ambiguous RoPE | Long sequence but agent/time ambiguity | Early IC-World-style |
| **Joint denoising + geometry-aware attention** | Shared scene evidence during diffusion | **Prisma-World**, **MetaWorld** (WSA) |
| Monocular → multi-ego unroll | Reconstruct shared state from single-view training | MetaWorld MWSU |

### Prisma-World-specific commitments

- **MA-RoPE:** RoPE(t, n, h, w) — agents separated in spatial embedding, t synchronized across agents
- **Relative camera in attention:** biases overlapping frusta toward consistent geometry (extends single-agent PRoPE/UCPE lineage → @concepts/camera-controlled-video-generation.md)
- **Variable N at inference:** one model, flexible agent count

### Persona / ops horizon

Relevant if synthetic persona content moves from isolated clips to **multi-camera live sets** (main + B-roll angles of same room). Today: research-only; Wan I2V + seam stitching remains production path.

## Snippets

> "Multi-agent video world modeling exposes a structural limitation in existing generation paradigms."

> "Cross-view consistency does not rely on post-processing; rather, it emerges naturally during the attention computation at each denoising step."

## Dead Ends

Multi-agent UE5 models don't solve **identity consistency** across agents (different people) — that's still IP-Adapter / LoRA territory per clip. MetaWorld vs Prisma-World benchmark overlap not yet reconciled in wiki `[NEEDS VERIFICATION 2026-06-11]`.
