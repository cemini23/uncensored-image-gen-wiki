---
title: "FilmBench + FilmOps — film-grade cinematic video benchmark (arXiv:2607.24241)"
type: source
tags: [paper, benchmark, video-generation, cinematic, evaluation]
keywords: [FilmBench, FilmOps, Beijing-Film-Academy, Cinematic-Language, T2V, R2V]
related:
  - entities/benchmarks/filmbench.md
  - entities/benchmarks/filmops.md
  - concepts/multi-shot-audio-video-evaluation.md
  - entities/models/wan-2-2.md
  - entities/models/ltx-2.md
  - sweeps/2026-07-28-daily.md
maturity: draft
read_status: read
created: 2026-07-28
updated: 2026-07-28
---

## Relations

@entities/benchmarks/filmbench.md @entities/benchmarks/filmops.md @concepts/multi-shot-audio-video-evaluation.md @entities/models/wan-2-2.md @entities/models/ltx-2.md

## Raw Concept

- **Title**: FilmBench: A Film-Grade Benchmark for Cinematic Video Generation
- **Authors**: Alibaba Group + Beijing Film Academy (+ Hujing Digital)
- **Type**: arXiv:2607.24241
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.24241-filmbench-a-film-grade-benchmark-for-cinematic-v.pdf`
- **URL**: https://arxiv.org/abs/2607.24241
- **Code**: github.com/Neo-yk/FilmOps (Apache-2.0)
- **Dataset**: huggingface.co/datasets/skylenage/FilmBench · operators HF Neo961/FilmOps
- **Retrieved**: 2026-07-28

## Narrative

T2V/R2V benchmark co-designed with film-academy directors: prompts reverse-engineered from award-winning films (20 genres); 1,169 prompts (1,056 multi-shot); 3-axis / 12-component / 35(+3 R2V) cinematic taxonomy. Open-sources **FilmOps** expert eval agent (six operators: shot scale, composition, camera angle, color/tone, character layout, camera movement).

**Phase-0: CONDITIONAL-GO (FilmOps code)** — Apache-2.0; local code clone `~/Desktop/projects/FilmOps` (~17 MB, no weights). Full operator weights ~62 GB on HF (InternVL3 shards dominate) — **David CUDA only**, over laptop 500 MB cap. DINOv3 composition backbone has separate Meta license restrictions. Complements MSAVBench / VGIF for persona cinematic QA.

## Snippets

> FilmOps bridges this gap: an open-source operator suite that maps video frames into structured cinematographic labels across six core dimensions

[Source: github.com/Neo-yk/FilmOps README]
