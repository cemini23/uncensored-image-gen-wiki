---
title: "ReCache — budget-aware diffusion caching via REINFORCE (arXiv:2606.06060)"
type: source
tags: [paper, inference, optimization, caching, diffusion, flux, wan, hunyuanvideo]
keywords: [ReCache, feature caching, REINFORCE, budget-aware scheduling, TaylorSeer, HiCache, DiCache, FLOPs reduction, LPIPS, VBench]
related:
  - concepts/budget-aware-diffusion-caching.md
  - sources/arxiv-2606-13496-budcache-diffusion-caching.md
  - entities/hardware/gpu-guide.md
  - entities/models/flux-1-dev.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - concepts/synthetic-media-compute-economics.md
  - sources/video-generation-survey-2026.md
  - entities/uis/comfyui.md
  - concepts/one-step-autoregressive-video-distillation.md
  - sources/arxiv-2606-03972-aad-1-one-step-ar-video.md
maturity: draft
read_status: read
created: 2026-06-07
updated: 2026-06-15
---

## Relations

@concepts/budget-aware-diffusion-caching.md @entities/hardware/gpu-guide.md @entities/models/flux-1-dev.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: ReCache: Learning Budget-Aware Caching Schedules for Diffusion Models via REINFORCE
- **Authors**: Mishan Aliev, Eva Neudachina, Ilya Bykov, Aleksandr Oganov, Kirill Struminsky, Aibek Alanov, Denis Rakitin (HSE, Yandex Research)
- **Type**: arXiv:2606.06060
- **Location**: `raw-sources/arxiv-2606.06060-recache-learning-budget-aware-caching-schedules.pdf`
- **URL**: https://arxiv.org/abs/2606.06060 · https://github.com/thecrazymage/ReCache
- **Retrieved**: 2026-06-07
- **Read status**: read (abstract + method)

## Narrative

**Problem:** DiT diffusion inference is expensive; **feature caching** reuses/forecasts activations across denoising steps. Prior work fixes schedules uniformly or via error heuristics — compute budget is an implicit side-effect, not a user-controlled input.

**ReCache:** Given target budget **k** full recomputation steps, learn a **policy** (budget-conditioned MLP → Plackett-Luce top-k schedule) that maximizes output quality vs uncached full inference. Trained with **REINFORCE** — no backprop through diffusion, no labeled data; reward = fidelity to full output + perceptual quality score.

**Compatible** with reuse (FORA, Δ-DiT) and forecasting (TaylorSeer, HiCache) mechanisms. One policy adapts across budgets at inference (nested schedules empirically).

**Claims [TENTATIVE]:**

- **FLUX.1-dev:** 5.04× FLOPs cut → LPIPS 0.456→0.316 vs DiCache (−31%)
- **Wan 2.1:** ~2.6× speedup → LPIPS 0.480→0.169 vs uniform HiCache (−65%); VBench +5.6 pts (70.4→76.0)
- Also evaluated on **HunyuanVideo**

### Workspace relevance

Direct **inference acceleration** path for local FLUX persona T2I and Wan I2V — pairs with quantization tiers in @entities/hardware/gpu-guide.md. Watch ComfyUI node integration `[NEEDS VERIFICATION 2026-06-07]`. Does not change uncensoring posture — speed-only axis.

## Snippets

> "Given a target budget k, it learns the recomputation schedule that maximizes generation quality, turning compute into a directly controllable input."

> "Different denoising timesteps contribute unequally to the final generation."

## Dead Ends

Training is per-model policy — not a universal plug-in without retraining. RL schedule ≠ step distillation (AAD-1 class).
