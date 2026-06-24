---
title: CaR — Compression and Retrieval video world model
type: entity
tags: [entity, world-model, video-generation, memory, orange-3dv]
keywords: [CaR, Orange-3DV, Retrieval Attention, SceneFly, implicit memory, HUJING]
related:
  - sources/arxiv-2606-23105-car-implicit-memory-video-world.md
  - concepts/implicit-memory-retrieval-video-world-models.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - entities/models/mirage.md
  - entities/models/wan-2-2.md
maturity: draft
created: 2026-06-24
updated: 2026-06-24
---

## Relations

@sources/arxiv-2606-23105-car-implicit-memory-video-world.md @concepts/implicit-memory-retrieval-video-world-models.md @concepts/world-models-video-generation.md

## Raw Concept

Entity for **CaR** (arXiv:2606.23105) — Orange-3DV / HUJING video world model with implicit memory retrieval.

## Narrative

| Attribute | Value |
|-----------|-------|
| **Paper** | arXiv:2606.23105 |
| **Repo** | `Orange-3DV-Team/CaR` (README only; code TBD) |
| **Dataset** | SceneFly (~1000 min UE5, 100 scenes) — coming soon |
| **Modes** | I2V exploration, V2V extension, hard-cut trajectory switch |
| **Phase-0** | **CONDITIONAL-GO** — `briefs/2026-06-24_phase-0-car-signposevae.md` |

### Memory mechanism

Dual-branch DiT: standard self-attention + **Retrieval Attention** with camera-pose-encoded history. Context compression for long horizons.

### Build-track status

Watchlist — no inference code/weights at ingest. Re-evaluate when code + SceneFly drop.

## Snippets

> "An attention-driven implicit memory retrieval mechanism that operates flexibly and globally across the historical context."

## Dead Ends

None until code release fails to materialize.
