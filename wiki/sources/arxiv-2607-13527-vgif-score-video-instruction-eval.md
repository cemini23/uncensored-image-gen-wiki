---
title: "VGIF-Score — diagnostic video instruction-following eval (arXiv:2607.13527)"
type: source
tags: [paper, video-generation, benchmark, evaluation]
keywords: [VGIF-Score, VGIF-Bench, ST-DAG, AutoRubric, instruction following, PRIS-CV]
related:
  - entities/benchmarks/vgif-score.md
  - concepts/multi-shot-audio-video-evaluation.md
  - entities/models/wan-2-2.md
  - entities/models/ltx-2.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-07-16-daily.md
maturity: draft
read_status: skimmed
created: 2026-07-16
updated: 2026-07-16
---

## Relations

@entities/benchmarks/vgif-score.md @concepts/multi-shot-audio-video-evaluation.md @entities/models/wan-2-2.md @entities/models/ltx-2.md @sources/video-generation-survey-2026.md

## Raw Concept

- **Title**: VGIF-Score: Interpretable and Diagnostic Evaluation of Spatio-Temporal Instruction Following in Video Generation
- **Authors**: Songyu Xu et al. (BUPT + China Telecom)
- **Type**: arXiv:2607.13527
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.13527-vgif-score-interpretable-and-diagnostic-evaluati.pdf`
- **URL**: https://arxiv.org/abs/2607.13527
- **Repo**: https://github.com/PRIS-CV/VGIF-SCORE
- **Retrieved**: 2026-07-16
- **Read status**: skimmed (abstract, framework overview)

## Narrative

Automated **instruction-following** eval for video generators: objective ST-DAG prompt parse + dependency-aware QA with short-circuit diagnostics, plus subjective AutoRubric (cinematography, purity, motion, physics). Instantiated as **VGIF-Bench** (223 long entangled prompts, ~4.3K eval items); tested on 14 VGMs / 3K+ videos.

**Phase-0: WATCH** — `PRIS-CV/VGIF-SCORE` exists but is a **README-only placeholder** (241 B README, repo size ~1 KB, no license, 2★) as of 2026-07-16. Same M4V-style "repo before code" pattern. No local adopt.

## Snippets

> "The code will be available at https://github.com/PRIS-CV/VGIF-SCORE."

[Source: arxiv-2607.13527 abstract]

## Dead Ends

- Placeholder GitHub — do not clone expecting a runnable eval harness.
