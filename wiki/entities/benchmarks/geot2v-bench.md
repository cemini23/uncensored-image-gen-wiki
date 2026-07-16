---
title: GeoT2V-Bench — reconstruction-based T2V 3D consistency benchmark
type: entity
tags: [entity, benchmark, video-generation, 3d-consistency, evaluation]
keywords: [GeoT2V-Bench, GeCo, MedianGS, DeformableGS, ControlBench, camera-prompted T2V]
related:
  - sources/arxiv-2606-24829-geot2v-bench-3d-consistency.md
  - concepts/reconstruction-based-t2v-benchmarking.md
  - concepts/multi-view-3d-consistent-world-models.md
  - entities/benchmarks/mentisoculi.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
  - entities/models/wan-2-2.md
  - entities/models/cogvideox-1-5.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/ltx-2.md
  - entities/benchmarks/vgif-score.md
maturity: draft
created: 2026-06-24
updated: 2026-06-24
---

## Relations

@sources/arxiv-2606-24829-geot2v-bench-3d-consistency.md @concepts/reconstruction-based-t2v-benchmarking.md @entities/benchmarks/mentisoculi.md

## Raw Concept

Entity for **GeoT2V-Bench** (arXiv:2606.24829) — University of Bern reconstruction-profile benchmark for camera-prompted T2V.

## Narrative

| Attribute | Value |
|-----------|-------|
| **Paper** | arXiv:2606.24829 |
| **Prompts** | 80 GeCo-Eval static-scene camera-motion prompts |
| **Models tested** | 12 open-weight configs (Wan, CogVideoX, HunyuanVideo, LTX-2, MAGI-1, Open-Sora, SkyReels, …) |
| **Scale** | 3,840 completed reconstructions (4 seeds) |
| **Backend** | VGGT-style poses → DeformableGS → MedianGS static proxy |
| **Code** | Promised; not public at ingest `[NEEDS VERIFICATION 2026-06-24]` |
| **Phase-0** | **Skipped** — benchmark release pending |

### Complementary benchmarks

| Benchmark | Focus |
|-----------|-------|
| VBench / VBench-2 | Perceptual + faithfulness scalars |
| GeCo | Local 3D geometry inconsistency |
| **GeoT2V-Bench** | Global rigid static-scene reconstruction profile |
| YoCausal | Causal physics in world models |

### Use in workspace

Model-selection diagnostic for **orbit/dolly persona B-roll** before committing LoRA identity tests on multi-angle outputs.

## Snippets

> "Reports a continuous reconstruction profile… rather than a pass/fail label or a single scalar ranking."

## Dead Ends

None until code release.
