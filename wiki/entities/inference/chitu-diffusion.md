---
title: ChituDiffusion (thu-pacman — DiT parallel + FlexCache runtime)
type: entity
tags: [inference, dit, parallel, flexcache, mit, flux, wan]
keywords: [ChituDiffusion, DiTango, FlexCache, ChituBench, context-parallelism]
related:
  - sources/arxiv-2607-15650-ditango-chitudiffusion.md
  - concepts/ditango-parallel-diffusion-attention.md
  - concepts/budget-aware-diffusion-caching.md
  - concepts/input-stable-sparse-attention-video.md
  - entities/models/wan-2-2.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/z-image-turbo.md
  - entities/models/qwen-image-2512.md
  - entities/uis/comfyui.md
  - sweeps/2026-07-20-daily.md
  - sources/arxiv-2607-16190-fvattn-sparse-attention-video.md
maturity: draft
created: 2026-07-20
updated: 2026-07-20
---

## Relations

@sources/arxiv-2607-15650-ditango-chitudiffusion.md @concepts/ditango-parallel-diffusion-attention.md @entities/models/wan-2-2.md @entities/models/flux-1-dev.md @entities/uis/comfyui.md

## Raw Concept

Entity from 2026-07-20 Phase-0 of arXiv:2607.15650 / github.com/thu-pacman/ChituDiffusion.

## Narrative

| Field | Value |
|-------|--------|
| Paper | DiTango arXiv:2607.15650 (HPDC '26) |
| Code | `github.com/thu-pacman/ChituDiffusion` — **MIT** (LICENSE file; README Apache badge is stale) |
| Local clone | `~/Desktop/projects/ChituDiffusion` (~60 MB, 2026-07-20) |
| Host req | CUDA multi-GPU (badge: CUDA required) |
| Models | FLUX.1 Dev, FLUX.2 Klein 4B, Qwen-Image, Z-Image, Wan2.1 1.3B/14B, Wan2.2-T2V-A14B (partial FlexCache WIP) |

### Phase-0

**CONDITIONAL-GO (code only)** — clone + read docs/install_and_launch.md. Do **not** pull model weights onto laptop (>>500 MB). Useful on next CUDA multi-GPU / RunPod session for FLUX/Wan throughput experiments alongside ComfyUI single-node workflows. Not a ComfyUI replacement.

## Dead Ends

- Single MacBook / MPS: unsupported (CUDA-required).
- Treating README "Apache-2.0" badge as authoritative — LICENSE is MIT.
