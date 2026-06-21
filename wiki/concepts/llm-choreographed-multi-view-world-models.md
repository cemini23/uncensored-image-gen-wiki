---
title: LLM-choreographed multi-view world models (OmniDrive Choreo)
type: concept
tags: [concept, world-model, video-generation, multi-view, llm-agent, latent-compression, driving]
keywords: [OmniDrive Choreo, WorldScript, latent co-compression, LLM director, position-aware tokens, view-time permutation, multi-agent layout]
related:
  - sources/arxiv-2606-17536-omnidrive-llm-choreographed-driving-world.md
  - concepts/multi-agent-cross-view-video-world-models.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - concepts/entity-centric-cinematic-video-conditioning.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2606-17536-omnidrive-llm-choreographed-driving-world.md
  - concepts/llm-choreographed-multi-view-world-models.md
maturity: draft
created: 2026-06-21
updated: 2026-06-21
---

## Relations

@sources/arxiv-2606-17536-omnidrive-llm-choreographed-driving-world.md @concepts/multi-agent-cross-view-video-world-models.md @concepts/world-models-video-generation.md @concepts/camera-controlled-video-generation.md

## Raw Concept

Ingest 2026-06-21 from OmniDrive arXiv:2606.17536 — LLM agents author a shared token grid co-compressed with multi-view video.

## Narrative

**Problem:** Multi-view video world models encode each camera independently, then fuse with cross-view attention — global 3-D geometry drifts. Heterogeneous controls (language, HD maps, trajectories, poses) sit in incompatible spaces.

**OmniDrive Choreo pattern:**

1. **LLM agents** (Architect / Cartographer / Auditor) produce symbolic + layout signals
2. **Position-aware token sequence** aligns language, geometry, and pixels on one grid
3. **Latent co-compression** — view–time permutation + shared 3-D VAE early-fuses cameras

Contrasts with **Prisma-World / MetaWorld** joint denoising (@concepts/multi-agent-cross-view-video-world-models.md) by adding **LLM-authored WorldScript** as first-class latent citizens, not just post-hoc conditioning.

### Workspace relevance

Research pattern for **multi-camera persona environments** (dual-angle consistency + language layout) — driving-specific eval only today.

## Snippets

> "The absence of a shared symbolic interlingua aligning language, geometry, and pixels at the latent-token level."

## Dead Ends

Not the NVlabs OmniDrive Drive-LLM (2405.01533). No open implementation at ingest.
