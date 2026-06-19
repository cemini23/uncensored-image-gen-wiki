---
title: "CineOrchestra — entity-centric cinematic video conditioning (arXiv:2606.13768)"
type: source
tags: [paper, video-generation, cinematic, multi-subject, camera-control, snap]
keywords: [CineOrchestra, entity-centric conditioning, interval-sampled RoPE, multi-shot, camera, transition, Snap Research, temporal control]
related:
  - concepts/entity-centric-cinematic-video-conditioning.md
  - entities/models/cineorchestra.md
  - concepts/camera-controlled-video-generation.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - concepts/subject-reconstruction-long-video-memory.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-19-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-06-19
updated: 2026-06-19
---

## Relations

@concepts/entity-centric-cinematic-video-conditioning.md @entities/models/cineorchestra.md @concepts/camera-controlled-video-generation.md @concepts/persona-consistency-methods.md

## Raw Concept

- **Title**: CineOrchestra: Unified Entity-Centric Conditioning for Cinematic Video Generation
- **Authors**: Sharath Girish, Tsai-Shien Chen, Zhikang Dong et al. (Snap Inc., UC Merced)
- **Type**: arXiv:2606.13768
- **Location**: `raw-sources/arxiv-2606-13768-unified-entity-centric-conditioning-for-cinemati.pdf`
- **URL**: https://arxiv.org/abs/2606.13768 · https://snap-research.github.io/CineOrchestra/
- **Retrieved**: 2026-06-19
- **Read status**: read (abstract + entity-centric design)

## Narrative

**Problem:** Cinematic video needs simultaneous control of **multi-subject identity**, **time-localized events**, **camera motion**, and **shot transitions** — prior work addresses each axis with disjoint architectures.

**CineOrchestra** unifies all four via **entity-centric conditioning**:

| Element | Representation |
|---------|----------------|
| Visual subjects | Tag + optional ref image + global ID + dense interval captions |
| Camera | `{camera}` entity with NL motion descriptors (no Plücker poses) |
| Transitions | `{transition}` entity with cut/dissolve timing + description |

**Architecture:** Parameter-free extensions to video DiT — (i) interval-sampled temporal RoPE, (ii) 2D entity-temporal cross-attention RoPE. Multi-reference image tokens in self-attention.

**Release:** Project page only at ingest — no public weights/repo `[NEEDS VERIFICATION 2026-06-19]`.

### Workspace relevance

Directly maps to **multi-shot persona reels** (@concepts/persona-consistency-methods.md): same character tags across shots, timed actions, camera moves, hard cuts — single forward pass vs stitching Wan clips + @concepts/seam-stitching-strategies.md post-processing.

## Snippets

> "Each is an entity acting over a specific temporal interval, which can therefore all be expressed through one shared structure of entity-centric conditioning primitives."

> "We extend the same structure to cinematography through two special tags, {camera} and {transition}."

## Dead Ends

Snap commercial research — unlikely self-host path. Pattern reference for entity-tagged multi-shot conditioning in local stacks.
