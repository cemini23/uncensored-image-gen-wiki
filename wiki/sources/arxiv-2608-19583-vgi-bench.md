---
title: "VGI-BENCH visual intelligence in video generators (arXiv:2608.19583)"
type: source
tags: [paper, video, benchmark, visual-reasoning, watch]
keywords: [VGI-BENCH, Seedance 2.0, 27 tasks, 810 instances, UIUC]
related:
  - concepts/federated-daily-research-digest.md
  - entities/benchmarks/camworldqa.md
  - entities/benchmarks/personashot.md
  - entities/benchmarks/vgi-bench.md
  - entities/models/seedance-2.md
  - sweeps/2026-08-21-daily.md
maturity: draft
read_status: read
created: 2026-08-21
updated: 2026-08-21
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/benchmarks/vgi-bench.md @entities/models/seedance-2.md @entities/benchmarks/camworldqa.md @entities/benchmarks/personashot.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-21-daily.md

## Raw Concept

- **Title**: VGI-BENCH: Probing Visual Intelligence in Video Generation Models
- **Authors**: Xuan He et al. (UIUC / Tsinghua / Waterloo / MIT / UBC / Vector / Microsoft Research / NetMind / Etude AI)
- **Type**: arXiv:2608.19583 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.19583-vgi-bench-probing-visual-intelligence-in-video-g.pdf`
- **URL**: https://arxiv.org/abs/2608.19583
- **Retrieved**: 2026-08-21
- **Code**: Paper says *"We will release our code and data."* **Not released as this paper's repo.** **NAME COLLISION:** `Seldon-Foundation/VGIBench` (MIT) is a *different* VLM video-QA bench (550 questions). **Do not clone it for this paper.**

## Narrative

Benchmark for whether video generators can do visually grounded reasoning, not just a pretty last frame. 27 tasks / 810 instances with a two-level taxonomy (domains × skill tags). Design constraints: inputs aligned with current video-model priors; require a valid *evolving process*; difficulty calibrated so tasks are partly feasible. Strongest reported model is **Seedance 2.0 at 51.0%**. Analysis: limited self-correction in denoising (later steps refine early hypotheses rather than fix reasoning errors); synthetic fine-tune transfer is bounded.

**WATCH.** Catalog alongside CamWorldQA (camera-path MOS) and PersonaShot (person-centric multi-shot). Not a production eval harness until *this* paper's code/data ship. Image-gen Phase-1: none (`deferred`).

## Snippets

> "Our evaluations show that current generative systems can solve a subset of visually grounded reasoning tasks, but remain far from reliable, with even the strongest model, Seedance 2.0, achieving only 51.0% under our evaluation criteria."

[Source: arxiv-2608.19583, abstract]
