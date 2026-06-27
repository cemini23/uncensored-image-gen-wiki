---
title: "NaviCache — test-time self-calibration caching for video (arXiv:2606.26795)"
type: source
tags: [paper, video-generation, caching, inference, optimization, icml-2026]
keywords: [NaviCache, test-time self-calibration, INS, feature caching, Wan, HunyuanVideo, Open-Sora, TeaCache, MagCache]
related:
  - concepts/navicache-navigation-guided-video-caching.md
  - concepts/budget-aware-diffusion-caching.md
  - sources/arxiv-2606-06060-recache-diffusion-caching.md
  - sources/arxiv-2606-13496-budcache-diffusion-caching.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - sources/video-generation-survey-2026.md
  - entities/uis/comfyui.md
  - sweeps/2026-06-27-daily.md
maturity: draft
read_status: read
created: 2026-06-27
updated: 2026-06-27
---

## Relations

@concepts/navicache-navigation-guided-video-caching.md @concepts/budget-aware-diffusion-caching.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: NaviCache: Test-Time Self-Calibration Caching for Video Generation
- **Authors**: (ICML 2026 submission)
- **Type**: arXiv:2606.26795
- **Location**: `raw-sources/arxiv-2606.26795-navicache-test-time-self-calibration-caching.pdf`
- **URL**: https://arxiv.org/abs/2606.26795 · https://github.com/HelloZicky/NaviCache
- **Retrieved**: 2026-06-27
- **Read status**: read (abstract + INS framing)

## Narrative

**NaviCache** — plug-and-play **test-time self-calibration** for video diffusion feature caching. Reconceptualizes feature evolution as an **Inertial Navigation System (INS)** problem vs zero-order instantaneous approximations (TeaCache/MagCache class).

**Mechanism:** dual-state estimation tracks feature change ratio + latent drift; Initial Alignment phase; uncertainty-aware measurement update for error-bounded skip decisions.

**Evaluated on:** HunyuanVideo, **Wan**, Open-Sora — claims better skip/error tradeoff than offline calibration-free baselines `[TENTATIVE]`.

### Workspace relevance

Persona video batch throughput on single GPU — stacks with @concepts/budget-aware-diffusion-caching.md axis. Phase-0: **GO** — `HelloZicky/NaviCache` Apache-2.0 — `briefs/2026-06-27_phase-0-navicache-lora-optimizer-confucius4.md`.

## Snippets

> "Re-conceptualizing feature evolution as an Inertial Navigation System (INS) problem."

## Dead Ends

None pending Wan 2.2 ComfyUI node integration audit.
