---
title: CamWorldQA — camera-controlled world video quality bench
type: entity
tags: [benchmark, world-model, camera-control, video-quality, watch]
keywords: [CamWorldQA, CWQA, 720 videos, 6 trajectories, MOS]
related:
  - concepts/camera-controlled-video-generation.md
  - concepts/world-models-video-generation.md
  - sources/arxiv-2608-18710-camworldqa.md
  - entities/benchmarks/vgi-bench.md
  - sources/arxiv-2608-19583-vgi-bench.md
  - sweeps/2026-08-20-daily.md
  - sweeps/2026-08-21-daily.md
maturity: draft
created: 2026-08-20
updated: 2026-08-21
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-18710-camworldqa.md @concepts/camera-controlled-video-generation.md @concepts/world-models-video-generation.md @entities/benchmarks/vgi-bench.md @sources/arxiv-2608-19583-vgi-bench.md @sweeps/2026-08-20-daily.md @sweeps/2026-08-21-daily.md

## Raw Concept

Entity from 2026-08-20 ingest. Paper-only. First MOS bench for camera-controlled *world* video.

## Narrative

720 generated clips (20 sources × 4 categories × 6 camera trajectories × 6 generators). 18 raters / 12,960 ratings. CWQA NR-VQA with spatial + motion + optical-flow branches. Use when scoring camera-path world models; not a generic VBench substitute.

**WATCH.** No code/dataset downloaded. `deferred`.

## Snippets

_(see source page)_
