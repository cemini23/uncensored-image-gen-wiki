---
title: Budget-aware diffusion feature caching (ReCache)
type: concept
tags: [concept, inference, optimization, caching, diffusion, hardware]
keywords: [ReCache, feature caching, caching schedule, REINFORCE, TaylorSeer, HiCache, compute budget, inference acceleration]
related:
  - sources/arxiv-2606-06060-recache-diffusion-caching.md
  - sources/arxiv-2606-13496-budcache-diffusion-caching.md
  - entities/hardware/gpu-guide.md
  - entities/models/flux-1-dev.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - concepts/synthetic-media-compute-economics.md
  - concepts/one-step-autoregressive-video-distillation.md
  - sources/arxiv-2606-03972-aad-1-one-step-ar-video.md
  - sources/video-generation-survey-2026.md
  - entities/uis/comfyui.md
  - sources/arxiv-2606-17566-aoizora-topology-aware-dit-parallel.md
  - concepts/topology-aware-dit-parallel-inference.md
maturity: draft
created: 2026-06-07
updated: 2026-06-23
---

## Relations

@sources/arxiv-2606-06060-recache-diffusion-caching.md @entities/hardware/gpu-guide.md @entities/models/flux-1-dev.md @entities/models/wan-2-2.md

## Raw Concept

Concept from 2026-06-07 ingest — arXiv:2606.06060 ReCache.

## Narrative

**Two-axis caching problem:**

| Axis | Question | Scope |
|------|----------|-------|
| **Mechanism** | Reuse vs forecast activations? | Agnostic — stacks on TaylorSeer, HiCache, FORA, Δ-DiT |
| **Schedule** | Which k of N steps fully recompute? | **Learned or searched** under fixed budget |

### ReCache (RL policy)

**User-facing knob:** specify budget **k** → MLP outputs step importance logits → top-k full passes, rest cached. Trained with REINFORCE against full-inference targets (no labels). See @sources/arxiv-2606-06060-recache-diffusion-caching.md.

### BudCache (combinatorial search)

**User-facing knob:** fix **NFE = B** upfront → offline SA+HC finds static cache mask maximizing teacher fidelity; optional Stage 2 schedule alignment under aggressive caching. **Strict latency** — exactly B evaluations per sample. See @sources/arxiv-2606-13496-budcache-diffusion-caching.md. Apache-2.0 reference impl: `Westlake-AGI-Lab/BudCache` (FLUX + Wan2.1).

| | ReCache | BudCache |
|---|---------|----------|
| Search cost | Train RL policy once | Minutes offline per (model, B) |
| Latency guarantee | Budget-conditioned | Exact B NFE |
| ComfyUI | `[NEEDS VERIFICATION 2026-06-07]` | `[NEEDS VERIFICATION 2026-06-15]` |

**vs other speed axes:**

- **Quantization** (FP8/GGUF) — shrinks per-step cost
- **Step distillation** (AAD-1) — fewer steps architecturally
- **Budget-aware caching** — same nominal step count, skip recompute on non-critical steps

Build-track: evaluate BudCache Stage-1 on local FLUX persona workflow before ReCache RL training investment.

## Snippets

(See @sources/arxiv-2606-06060-recache-diffusion-caching.md)

## Dead Ends

Per-model policy training required. Quality tradeoffs at extreme budgets — not a free lunch vs full inference.
