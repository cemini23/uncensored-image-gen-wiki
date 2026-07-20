---
title: "DiTango / ChituDiffusion — selective attention state reuse for parallel DiT (arXiv:2607.15650)"
type: source
tags: [paper, diffusion, parallel, dit, inference, flux, wan]
keywords: [DiTango, ChituDiffusion, context-parallelism, FlexCache, HPDC-2026]
related:
  - entities/inference/chitu-diffusion.md
  - concepts/ditango-parallel-diffusion-attention.md
  - concepts/input-stable-sparse-attention-video.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/wan-2-2.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/z-image-turbo.md
  - entities/models/qwen-image-2512.md
  - sweeps/2026-07-20-daily.md
maturity: draft
read_status: read
created: 2026-07-20
updated: 2026-07-20
---

## Relations

@entities/inference/chitu-diffusion.md @concepts/ditango-parallel-diffusion-attention.md @concepts/input-stable-sparse-attention-video.md @entities/models/wan-2-2.md @entities/models/flux-1-dev.md

## Raw Concept

- **Title**: DiTango: Cost-Effective Parallel Diffusion Generation with Selective Attention State Reuse
- **Authors**: Yuyang Chen et al. (SJTU / Shanghai AI Lab / Tsinghua / USTB)
- **Type**: arXiv:2607.15650 (HPDC '26 preprint)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.15650-ditango-cost-effective-parallel-diffusion-genera.pdf`
- **URL**: https://arxiv.org/abs/2607.15650
- **Code**: https://github.com/thu-pacman/ChituDiffusion (MIT)
- **Retrieved**: 2026-07-20

## Narrative

**DiTango** reduces multi-node Context Parallelism communication for DiTs by selectively reusing attention states across denoising steps (anchor-guided planner + state-centric runtime). Claims up to **1.9×** end-to-end and **3.2×** attention speedup with near-linear multi-node scaling and quality comparable to SOTA CP baselines.

Ships inside **ChituDiffusion** (thu-pacman) — stage-level diffusion runtime with FlexCache, CFG/hybrid CP, Sage/Sparge attention backends. Bench coverage includes FLUX.1 Dev, FLUX.2 Klein 4B, Qwen-Image, Z-Image, Wan2.1 1.3B/14B, Wan2.2-T2V-A14B (some FlexCache rows still WIP).

**Phase-0: CONDITIONAL-GO (code only)** — MIT LICENSE confirmed; README Apache badge is stale. CUDA multi-GPU required; not an Apple Silicon / single-laptop production path. Local adopt today: shallow clone `~/Desktop/projects/ChituDiffusion` (~60 MB). Weights stay on CUDA RunPod / multi-GPU hosts.

## Snippets

> "Code is available at https://github.com/thu-pacman/ChituDiffusion."

[Source: arXiv:2607.15650 abs (retrieved 2026-07-20)]
