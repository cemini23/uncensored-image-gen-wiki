---
title: MoWorld (Moxin Technology — Flash World Model)
type: entity
tags: [world-model, video-generation, real-time, flash, moxin]
keywords: [MoWorld, Moxin, flash world model, 50 FPS, NPU, camera trajectory, open weights pending]
related:
  - sources/arxiv-2607-06216-moworld-flash-world-model.md
  - concepts/world-models-video-generation.md
  - entities/models/sana-wm.md
  - entities/models/wan-2-2.md
  - concepts/camera-controlled-video-generation.md
  - sweeps/2026-07-13-daily.md
maturity: draft
created: 2026-07-13
updated: 2026-07-13
---

## Relations

@sources/arxiv-2607-06216-moworld-flash-world-model.md @concepts/world-models-video-generation.md @entities/models/sana-wm.md @entities/models/wan-2-2.md

## Raw Concept

Entity stub from 2026-07-13 ingest of arXiv:2607.06216. MoWorld is Moxin Technology's **Flash World Model** — real-time (≤50 FPS) interactive video world generation with camera-trajectory conditioning.

## Narrative

### Status (Jul 2026)

| Field | Value |
|-------|--------|
| Paper | arXiv:2607.06216 |
| Code / weights | **Not released** at ingest — "open source soon" per project page |
| License | Unknown until release |
| Hardware story | Domestic NPU deployment; 30–50% inference cost vs prior world models (paper claim) |

### David adoption path

**WATCH only.** David's persona video lane remains **Wan 2.2 / HunyuanVideo I2V + LatentSync**. MoWorld becomes interesting if:

1. Open weights land on Hugging Face with permissive license
2. Camera-controlled **scene exploration** from a persona still is useful for B-roll / environment plates
3. A CUDA or MPS inference path appears (NPU-only stack is a blocker on laptop + RunPod)

Pairs conceptually with @entities/models/sana-wm.md (minute-scale camera WM) but optimizes **latency** over **horizon length**.

## Snippets

> "Weights and code will be open-sourced in the near future."

[TENTATIVE — press coverage of MoWorld launch, Jul 2026; verify on moxin-tech.github.io/moworld/]
