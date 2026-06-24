---
related:
  - concepts/multi-view-3d-consistent-world-models.md
  - concepts/world-models-video-generation.md
  - concepts/multi-agent-cross-view-video-world-models.md
  - concepts/physical-ai-native-world-model-stacks.md
  - concepts/video-generation-physical-executability.md
  - entities/models/kairos.md
  - entities/models/wan-2-2.md
  - entities/models/cogvideox-1-5.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-22-daily.md
  - concepts/federated-daily-research-digest.md
  - concepts/reconstruction-based-t2v-benchmarking.md
  - sources/arxiv-2606-24829-geot2v-bench-3d-consistency.md
title: "PAIWorld — 3D-consistent multi-view world foundation model (arXiv:2606.18375)"
type: source
tags: [paper, world-model, video-generation, multi-view, 3d-consistency, robotics, physical-ai]
keywords: [PAIWorld, cross-view attention, Geo-RoPE, Latent 3D-REPA, robotic manipulation, WorldArena, AgiBot-Challenge, CASIA]
maturity: draft
read_status: read
created: 2026-06-22
updated: 2026-06-24
---

## Relations

@concepts/multi-view-3d-consistent-world-models.md @concepts/world-models-video-generation.md @concepts/multi-agent-cross-view-video-world-models.md @concepts/physical-ai-native-world-model-stacks.md

## Raw Concept

- **Title**: PAIWorld: A 3D-Consistent World Foundation Model for Robotic Manipulation
- **Authors**: The PAIWorld Team (Institute of AI for Industries, Chinese Academy of Sciences)
- **Type**: arXiv:2606.18375
- **Location**: `raw-sources/arxiv-2606.18375-paiworld-a-3d-consistent-world-foundation-model.pdf`
- **URL**: https://arxiv.org/abs/2606.18375
- **Retrieved**: 2026-06-22
- **Read status**: read (abstract + architecture)

## Narrative

**PAIWorld** — DiT-based **multi-view world foundation model** for robotic manipulation with explicit **3D cross-view consistency** (egocentric + wrist + eye-to-hand cameras).

**Root problem:** Flat token concatenation across views → object drift, depth/texture misalignment without geometric reasoning.

**Two pillars / three modules:**

| Pillar | Component | Role |
|--------|-----------|------|
| Inter-view pathway | Geometry-Aware Cross-View Attention | Dedicated cross-view feature exchange in DiT |
| Inter-view pathway | **Geo-RoPE** | Ray directions + extrinsics in rotary PE |
| Geometric objective | **Latent 3D-REPA** | Align DiT features to frozen 3D foundation model via REPA |

**Training:** 2.5M multi-view video clips. Claims **#1 WorldArena** EWMScore and strong AgiBot-Challenge2026 scene consistency.

**Downstream:** model-based planning, world action models, multi-view policy post-training.

### Workspace relevance

- Extends world-model axis beyond persona T2V into **embodied multi-camera sim** — pattern relevant for multi-angle persona scene consistency research
- Complements **Prisma-World / MetaWorld** joint-denoising line (@concepts/multi-agent-cross-view-video-world-models.md) with explicit 3D REPA + Geo-RoPE
- **No public repo** at ingest `[NEEDS VERIFICATION 2026-06-22]`

## Snippets

> "Communication without geometric guidance collapses to trivial shortcuts, while geometric priors without an inter-view pathway cannot propagate constraints across viewpoints."

> "Only when both are present does the system achieve genuine multi-view 3D consistency."

## Dead Ends

Robotics / Physical AI focus — not a drop-in Wan persona workflow. No weights at ingest.
