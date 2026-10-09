---
title: "MORCA — learned cache scheduling for video diffusion (arXiv:2610.10457)"
type: source
tags: [paper, video-generation, caching, acceleration, reinforcement-learning, wan, watch]
keywords: [MORCA, cache reuse, offline-to-online RL, IQL, budget-constrained MDP, SeaCache, TeaCache, MagCache, Wan2.2, speedup control, PSNR]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-08-daily.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/wan-2-2.md
maturity: draft
read_status: skimmed
created: 2026-10-09
updated: 2026-10-09
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-08-daily.md @concepts/budget-aware-diffusion-caching.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: MORCA: Offline-to-Online Reinforcement Learning for Adaptive Cache Reuse in Video Diffusion Acceleration
- **Type**: arXiv:2610.10457 (Shanghai Jiao Tong University + Alibaba Cloud; Yuxiang Xiong, Ruiyan Wang, Wenqiang Wang et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.10457-morca-offline-to-online-reinforcement-learning-f.pdf (archived 2026-10-09)
- **URL**: https://arxiv.org/abs/2610.10457
- **Retrieved**: 2026-10-09

## Narrative

**What it is.** A **learned cache scheduler** for video diffusion transformers. At each denoising step it decides whether to reuse a cached computation or recompute it. Note the domain correction: despite the reinforcement-learning framing, this is **video-generation inference acceleration**, not RL post-training of a generative model.

**The key design choice.** It optimises for **final-video quality**, not per-step error. Most caching heuristics (TeaCache, MagCache, DiCache, SeaCache) decide reuse by how close the current step is to the last one; MORCA instead treats the terminal error as the objective and casts scheduling as a **budget-constrained MDP**, where the speedup target *is* the budget. For an operator that is the useful inversion: you ask for a speedup and the scheduler spends the budget to preserve quality, rather than tuning a threshold by hand and seeing where quality lands.

**Method.** State combines step-error proxies, 3D and 2D pooled latent features, and the remaining budget. Reward is a capped PSNR against the no-cache reference. It reduces to an augmented MDP and trains **offline then online with IQL**, chosen over REINFORCE for sample efficiency. Only a small scheduler network is needed at inference.

**Results.** It beats TeaCache, MagCache, DiCache and SeaCache at matched speedup. On **Wan2.2** it gains +2.22 / +1.86 / +1.78 dB PSNR over SeaCache at 1.8x / 2.4x / 3.0x, and on Wan2.1 +1.05 / +2.17 / +1.11 dB at 2.4x / 3.0x / 4.0x. Speedup-control error stays within 0.05, which is the point of the budget formulation.

**Phase-0 (2026-10-09).** Code is public at `github.com/x10ngyx/MORCA`; **no licence is stated**, and no weights or dataset ship. Measured on a Wan2.2-T2V-A14B with an RTX A6000 and a **Wan2.1-T2V-1.3B on an RTX 4090** — the operator's own GPU class.

**Verdict: WATCH-full** — it directly accelerates Wan video generation on hardware this workspace actually has, the caching nodes it competes with are already ComfyUI-relevant, and the code is public. See `@concepts/budget-aware-diffusion-caching.md`. The one thing to clear before adopting is the **missing licence**. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.10457 (retrieved 2026-10-09) — Wan2.2 +2.22 dB PSNR over SeaCache at 1.8x; measured on RTX 4090 for the 1.3B model.]
