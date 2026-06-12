---
title: MetaWorld (multi-agent video world model)
type: entity
tags: [model, video, world-model, multi-agent, sjtu, research]
keywords: [MetaWorld, MWSU, World-State Alignment, WSA, multi-agent, egocentric, Subject-Aware World Generator, single-view training]
related:
  - sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md
  - concepts/world-models-video-generation.md
  - concepts/persona-consistency-methods.md
  - entities/models/decmem.md
  - entities/models/sana-wm.md
  - sources/sana-wm-minute-scale-world-model.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - entities/models/prisma-world.md
  - sources/arxiv-2606-09507-prisma-world-multi-agent-video.md
  - concepts/multi-agent-cross-view-video-world-models.md
maturity: draft
created: 2026-06-05
updated: 2026-06-11
---

## Relations

@sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md @concepts/world-models-video-generation.md @entities/models/decmem.md @entities/models/sana-wm.md @entities/models/prisma-world.md @concepts/multi-agent-cross-view-video-world-models.md

## Raw Concept

Entity stub from K100 deep-read (2026-06-05) — SJTU / ZJU / NTU MetaWorld (arXiv:2606.02753). Project: https://sjtuplayer.github.io/projects/MetaWorld/

## Narrative

**Multi-agent video world model** trained from **single-view monocular video** — no multi-camera capture required.

| Component | Role |
|-----------|------|
| **MWSU** (Monocular World-State Unrolling) | Decompose footage into camera ego-motion + subject spatial trajectory in shared 3D space |
| **Subject-Aware World Generator** | Appearance-driven simulation from per-agent identity images |
| **WSA** (World-State Alignment) | Per-frame inter-branch cross-attention at **every DiT layer** during joint denoising — static geometry + dynamic motion consistency across simultaneous egocentric views |

**Claims [TENTATIVE]:** Superior cross-view consistency and identity fidelity vs single-agent world models on open-domain multi-agent scenarios.

### Workspace relevance

Research-layer extension of world-model axis (@concepts/world-models-video-generation.md): **multi-agent / multi-perspective** consistency — relevant if persona ops move from single-camera clips to synchronized multi-view synthetic scenes. Closed weights / code status `[NEEDS VERIFICATION 2026-06-05]`. Compare memory architecture to **DecMem** (@entities/models/decmem.md) and camera control to **SANA-WM** (@entities/models/sana-wm.md).

## Snippets

(See @sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md)

## Dead Ends

None — not a drop-in Wan LoRA; training pipeline and weights availability unverified locally.
