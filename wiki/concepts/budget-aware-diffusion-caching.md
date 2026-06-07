---
title: Budget-aware diffusion feature caching (ReCache)
type: concept
tags: [concept, inference, optimization, caching, diffusion, hardware]
keywords: [ReCache, feature caching, caching schedule, REINFORCE, TaylorSeer, HiCache, compute budget, inference acceleration]
related:
  - sources/arxiv-2606-06060-recache-diffusion-caching.md
  - entities/hardware/gpu-guide.md
  - entities/models/flux-1-dev.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - concepts/synthetic-media-compute-economics.md
  - concepts/one-step-autoregressive-video-distillation.md
  - sources/arxiv-2606-03972-aad-1-one-step-ar-video.md
  - sources/video-generation-survey-2026.md
  - entities/uis/comfyui.md
maturity: draft
created: 2026-06-07
updated: 2026-06-07
---

## Relations

@sources/arxiv-2606-06060-recache-diffusion-caching.md @entities/hardware/gpu-guide.md @entities/models/flux-1-dev.md @entities/models/wan-2-2.md

## Raw Concept

Concept from 2026-06-07 ingest — arXiv:2606.06060 ReCache.

## Narrative

**Two-axis caching problem:**

| Axis | Question | ReCache scope |
|------|----------|---------------|
| **Mechanism** | Reuse vs forecast activations? | Agnostic — stacks on TaylorSeer, HiCache, FORA, Δ-DiT |
| **Schedule** | Which k of N steps fully recompute? | **Learned** budget-conditioned policy |

**User-facing knob:** specify budget **k** → MLP outputs step importance logits → top-k full passes, rest cached. Trained with REINFORCE against full-inference targets (no labels).

**vs other speed axes:**

- **Quantization** (FP8/GGUF) — shrinks per-step cost
- **Step distillation** (AAD-1) — fewer steps architecturally
- **ReCache** — same step count, skip expensive blocks on non-critical steps

Build-track: monitor GitHub `thecrazymage/ReCache` for FLUX/Wan ComfyUI hooks `[NEEDS VERIFICATION 2026-06-07]`.

## Snippets

(See @sources/arxiv-2606-06060-recache-diffusion-caching.md)

## Dead Ends

Per-model policy training required. Quality tradeoffs at extreme budgets — not a free lunch vs full inference.
