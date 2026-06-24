---
title: "GeoT2V-Bench — 3D consistency via reconstruction (arXiv:2606.24829)"
type: source
tags: [paper, benchmark, video-generation, 3d-consistency, evaluation]
keywords: [GeoT2V-Bench, GeCo, MedianGS, DeformableGS, VGGT, camera-prompted T2V, reconstruction profile]
related:
  - concepts/reconstruction-based-t2v-benchmarking.md
  - entities/benchmarks/geot2v-bench.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
  - concepts/multi-view-3d-consistent-world-models.md
  - sources/arxiv-2606-18375-paiworld-3d-consistent-world-foundation.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/cogvideox-1-5.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/ltx-2.md
  - sweeps/2026-06-24-daily.md
maturity: draft
read_status: read
created: 2026-06-24
updated: 2026-06-24
---

## Relations

@concepts/reconstruction-based-t2v-benchmarking.md @entities/benchmarks/geot2v-bench.md @sources/video-generation-survey-2026.md

## Raw Concept

- **Title**: GeoT2V-Bench: Benchmarking 3D Consistency in Text-to-Video Models via 3D Reconstruction
- **Authors**: Chenrui Fan, Paolo Favaro (University of Bern)
- **Type**: arXiv:2606.24829
- **Location**: `raw-sources/arxiv-2606-24829-2606-24829v1-geot2v-bench-benchmarking-3d-consis.pdf`
- **URL**: https://arxiv.org/abs/2606.24829
- **Retrieved**: 2026-06-24
- **Read status**: read (abstract + pipeline overview)

## Narrative

**GeoT2V-Bench** — reconstruction-based diagnostic for **camera-prompted T2V** clips (orbit, dolly, fly-through static scenes).

**Pipeline:** VGGT-style pose/intrinsics → **DeformableGS** fit → **MedianGS** static proxy (temporal median) → render along estimated path.

**Output:** continuous **reconstruction profile** (not single pass/fail):

- Apparent image motion
- Estimated trajectory behavior
- MedianGS static rendering error
- Static-render flow agreement
- Flexible-vs-static fit gap

Evaluated **12 open-weight configs** (CogVideoX, HunyuanVideo, LTX-2, MAGI-1, Open-Sora, SkyReels, Wan variants) on 80 GeCo-Eval static-scene prompts — **3,840 reconstructions** across four seeds.

**ControlBench** stress suite: real static captures + transformed controls (zoom, warp, repaint, deformation) to separate video failures from backend estimator failures.

Code/manifests promised at release — not public at ingest `[NEEDS VERIFICATION 2026-06-24]`.

### Workspace relevance

Use when selecting **Wan / LTX / HunyuanVideo** for camera-orbit persona B-roll — complements perceptual VBench scores and @concepts/multi-view-3d-consistent-world-models.md.

## Snippets

> "When a generated clip depicts a static scene under camera motion, how consistent is it with an explicit rigid 3D reconstruction of that scene?"

## Dead Ends

Benchmark-only — no generative model release. Reconstruction backend failures can confound scores (authors acknowledge).
