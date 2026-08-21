---
title: VGI-BENCH — visual intelligence in video generation models
type: entity
tags: [benchmark, video, visual-reasoning, watch]
keywords: [VGI-BENCH, 27 tasks, 810 instances, Seedance 2.0, name-collision]
related:
  - entities/benchmarks/camworldqa.md
  - entities/benchmarks/personashot.md
  - entities/models/seedance-2.md
  - sources/arxiv-2608-19583-vgi-bench.md
  - sweeps/2026-08-21-daily.md
maturity: draft
created: 2026-08-21
updated: 2026-08-21
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-19583-vgi-bench.md @entities/models/seedance-2.md @entities/benchmarks/camworldqa.md @entities/benchmarks/personashot.md @sweeps/2026-08-21-daily.md

## Raw Concept

Entity from 2026-08-21 ingest of arXiv:2608.19583. Paper-only until authors ship code/data. Do not confuse with Seldon VGIBench.

## Narrative

27 tasks / 810 instances probing visual reasoning *inside video generators*. Seedance 2.0 51.0% is the paper's ceiling at ingest.

| Check | Result |
| --- | --- |
| Code / data | Promised, not located as this paper's repo |
| Collision | `Seldon-Foundation/VGIBench` = VLM video-QA. **Not this paper. Do not clone.** |
| vs CamWorldQA | CamWorldQA is camera-controlled *world video MOS*; VGI-BENCH is visual-*intelligence* tasks on T2V/I2V systems |
| vs PersonaShot | PersonaShot is person-centric multi-shot continuity; VGI-BENCH is broader skill-tag visual reasoning |

**Phase-1:** none (`deferred`).

## Snippets

_(see source page)_
