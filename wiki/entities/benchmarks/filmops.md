---
title: FilmOps (cinematography operator suite for FilmBench)
type: entity
tags: [benchmark, evaluation, cinematic, apache-2-0]
keywords: [FilmOps, DINO, InternVL3, shot-scale, camera-movement]
related:
  - sources/arxiv-2607-24241-filmbench.md
  - entities/benchmarks/filmbench.md
  - concepts/multi-shot-audio-video-evaluation.md
  - entities/models/wan-2-2.md
  - sweeps/2026-07-28-daily.md
maturity: draft
created: 2026-07-28
updated: 2026-07-28
---

## Relations

@sources/arxiv-2607-24241-filmbench.md @entities/benchmarks/filmbench.md @concepts/multi-shot-audio-video-evaluation.md

## Raw Concept

Phase-0 audited 2026-07-28: github.com/Neo-yk/FilmOps.

## Narrative

| Field | Value |
|-------|--------|
| License (code) | Apache-2.0 |
| Stars / size | ~3★ · repo ~7–17 MB code |
| Operators | shot scale · composition · camera angle · color/tone · character layout · camera movement |
| Weights | HF Neo961/FilmOps (~62 GB with InternVL3); DINOv3 composition restricted |
| Local (wiki laptop) | **code cloned** `~/Desktop/projects/FilmOps` (no weights) |

### Phase-0

**CONDITIONAL-GO (code).** Weights on David CUDA only. Review DINOv3 license before commercial composition-operator use.

## Snippets

_(none)_
