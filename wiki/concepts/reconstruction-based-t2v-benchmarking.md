---
title: Reconstruction-based T2V benchmarking
type: concept
tags: [concept, benchmark, video-generation, 3d-consistency, evaluation]
keywords: [GeoT2V-Bench, 3D reconstruction, MedianGS, camera motion, static scene, GeCo, evaluation profile]
related:
  - sources/arxiv-2606-24829-geot2v-bench-3d-consistency.md
  - entities/benchmarks/geot2v-bench.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
  - concepts/multi-view-3d-consistent-world-models.md
  - sources/arxiv-2606-18375-paiworld-3d-consistent-world-foundation.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/ltx-2.md
maturity: draft
created: 2026-06-24
updated: 2026-06-24
---

## Relations

@sources/arxiv-2606-24829-geot2v-bench-3d-consistency.md @entities/benchmarks/geot2v-bench.md @concepts/multi-view-3d-consistent-world-models.md

## Raw Concept

Ingest 2026-06-24 from Fan & Favaro (arXiv:2606.24829) — explicit 3D reconstruction probe for camera-prompted T2V.

## Narrative

### Evaluation gap

Perceptual metrics (VBench, FVD) and **local** geometry checks (GeCo) miss **global static-scene explainability**:

> Can generated frames be observations of **one rigid 3D scene** along **one camera path**?

### GeoT2V-Bench reconstruction profile (continuous, not scalar)

| Diagnostic | What it catches |
|------------|-----------------|
| Apparent motion | Static-image "orbit" fakes |
| Trajectory behavior | Inconsistent parallax |
| MedianGS render error | View-dependent texture drift |
| Flow agreement | Motion without static explanation |
| Flexible vs static gap | Needs temporal deformation to fit |

### When to use in workspace

Selecting **camera-orbit B-roll** models (Wan, LTX, HunyuanVideo, Open-Sora) for persona environments — especially multi-angle consistency for later img2img/identity workflows.

### Caveats

Pose estimator + Gaussian fit can fail independently of generator — ControlBench separates backend stress from generator failure.

## Snippets

> "Visually plausible videos can fail camera acquisition in different ways… the missing test is reconstructive."

## Dead Ends

Benchmark-only artifact — no generative model bundled.
