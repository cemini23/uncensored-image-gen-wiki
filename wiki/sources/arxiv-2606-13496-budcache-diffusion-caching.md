---
title: "BudCache — budget-constrained step-level diffusion caching (arXiv:2606.13496)"
type: source
tags: [paper, inference, optimization, caching, diffusion, flux, wan, icml]
keywords: [BudCache, step-level caching, NFE budget, simulated annealing, hill climbing, cache-aware schedule alignment, TeaCache, FLUX.1-dev, Wan2.1]
related:
  - concepts/budget-aware-diffusion-caching.md
  - sources/arxiv-2606-06060-recache-diffusion-caching.md
  - entities/models/flux-1-dev.md
  - entities/models/wan-2-2.md
  - entities/uis/comfyui.md
  - concepts/synthetic-media-compute-economics.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-15-daily.md
  - concepts/navicache-navigation-guided-video-caching.md
  - sources/arxiv-2606-26795-navicache-test-time-self-calibration-caching.md
maturity: draft
read_status: read
created: 2026-06-15
updated: 2026-06-27
---

## Relations

@concepts/budget-aware-diffusion-caching.md @sources/arxiv-2606-06060-recache-diffusion-caching.md @entities/models/flux-1-dev.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: Budget-Constrained Step-Level Diffusion Caching
- **Authors**: Mingkun Lei, Tong Zhao, Liangyu Yuan, Chi Zhang (Westlake University AGI Lab)
- **Type**: arXiv:2606.13496 (ICML 2026)
- **Location**: `raw-sources/arxiv-2606.13496-budget-constrained-step-level-diffusion-caching.pdf`
- **URL**: https://arxiv.org/abs/2606.13496 · https://github.com/Westlake-AGI-Lab/BudCache
- **Retrieved**: 2026-06-15
- **Read status**: read (abstract + method + repo README)

## Narrative

**Problem:** Step-level caching (TeaCache, MagCache, etc.) uses **runtime error thresholds** → variable NFE/latency and no direct optimization of final output quality under a fixed budget.

**BudCache:** **Invert the formulation** — fix compute budget B (NFE) upfront; **offline search** for binary cache mask m over K denoising steps that maximizes fidelity to full-compute teacher trajectory.

**Search:** Simulated Annealing (global) + Hill Climbing (local polish) on mask m; optional **Stage 2 cache-aware schedule alignment** via teacher-student distillation on σ discretization when caching is aggressive.

**Properties:**

- **Deterministic latency** — exactly B NFE at inference (vs heuristic trigger variance)
- **Training-free** — reuses pretrained weights; offline search ~minutes per (model, budget, prompt set)
- **Plug-and-play** with standard solvers

**Evaluated:** FLUX.1-dev and Wan2.1. Paper claims up to **3.73× speedup at 6 NFE** on FLUX with preserved detail vs heuristic baselines `[TENTATIVE]`.

**Released code:** Apache-2.0; `src/flux/` and `src/wan/` integrations; expects local checkpoints via `MODEL_ROOT`.

### vs ReCache (@sources/arxiv-2606-06060-recache-diffusion-caching.md)

| | ReCache | BudCache |
|---|---------|----------|
| Search | RL-learned policy (REINFORCE) | SA + HC combinatorial search |
| Budget input | Top-k recompute count | Fixed NFE mask |
| Latency | Learned schedule | Strict B NFE guarantee |
| Stage 2 | N/A | Optional schedule distillation |

Both are build-track **inference acceleration** axes for FLUX persona T2I and Wan I2V — no uncensoring effect.

## Snippets

> "Rather than letting per-step error thresholds dictate the runtime cost, we fix the compute budget in advance and search for the cache policy that best preserves the final output."

> "BudCache expects model checkpoints to be available locally."

## Dead Ends

No ComfyUI node at release `[NEEDS VERIFICATION 2026-06-15]`. Per-model offline search required — not universal zero-config. FLUX weights remain BFL non-commercial.
