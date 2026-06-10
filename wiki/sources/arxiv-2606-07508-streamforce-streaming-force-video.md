---
title: "StreamForce — streaming force-controlled video (arXiv:2606.07508)"
type: source
tags: [paper, video-generation, world-model, interactive, force-control, autoregressive, streaming]
keywords: [StreamForce, force-conditioned video, global force, local force, time-varying control, Self-Forcing, causal distillation, ControlNet, Force-Prompting, 16.6 FPS, interactive world model]
related:
  - concepts/streaming-force-controlled-video-generation.md
  - concepts/world-models-video-generation.md
  - concepts/one-step-autoregressive-video-distillation.md
  - concepts/autoregressive-video-foresight-training.md
  - concepts/seam-stitching-strategies.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2606-03972-aad-1-one-step-ar-video.md
maturity: draft
read_status: read
created: 2026-06-10
updated: 2026-06-10
---

## Relations

@concepts/streaming-force-controlled-video-generation.md @concepts/world-models-video-generation.md @entities/models/wan-2-2.md @concepts/one-step-autoregressive-video-distillation.md

## Raw Concept

- **Title**: Streaming Video Generation with Streaming Force Control
- **Authors**: Hanhui Wang, Yiming Xie, Haiwen Feng, Zhaoyang Lv, Shenlong Wang, Huaizu Jiang (NEU, Impossible Research, UC Berkeley, UIUC)
- **Type**: arXiv:2606.07508
- **Location**: `raw-sources/arxiv-2606.07508-streaming-video-generation-with-streaming-force.pdf`
- **URL**: https://arxiv.org/abs/2606.07508 · https://neu-vi.github.io/StreamForce/
- **Retrieved**: 2026-06-10
- **Read status**: read (abstract + method + main results)

## Narrative

**STREAMFORCE** — causal unified model for **time-varying global + local force** control on streaming video from a single image. Users adjust forces mid-generation (wind, pushes) with ~**0.6s latency**, **16.6 FPS** on one GPU.

### vs Force-Prompting / Kling Motion Brush

| Limitation (prior) | StreamForce fix |
|--------------------|-----------------|
| Separate models for global vs local force | Unified masked force tensor `f ∈ R^{T×4×H×W}` |
| Fixed forces only | Force-changing supervision in Blender synth data |
| Bidirectional offline gen | Causal AR student via Self-Forcing + DMD distillation |
| Trajectory = predetermined effect | Force = cause; mass/material response emergent |

**Pipeline:** Stage 1 bidirectional teacher (ControlNet branch on base DiT) on synthetic Blender forces; Stage 2 ODE init + Self-Forcing distillation to causal student with diverse Pexels image–force pairs.

**Results:** Beats Force-Prompting and Wan 2.2 TI2V on force adherence / physical plausibility; strong on **changing-force** cases (86.5% global force adherence vs 32.7% Force-Prompting) `[TENTATIVE]`.

### Workspace relevance

Interactive **world-model** tier for persona/scene what-if sims (@concepts/world-models-video-generation.md) — not yet a ComfyUI node. Shares Self-Forcing / CausVid lineage with @concepts/one-step-autoregressive-video-distillation.md. Force control may complement camera-control world models (SANA-WM) for physics-grounded previews.

## Snippets

> "Force-based control specifies the cause, delegating the physical response to the model, so that object-dependent dynamics emerge naturally without explicit material or mass specification."

> "STREAMFORCE runs at up to 16.6 FPS on a single GPU, achieving state-of-the-art performance in both force adherence and motion realism."

## Dead Ends

Synthetic Blender training domain — real-world persona/NSFW motion not evaluated. No open weights cited in abstract skim; Phase-0 before workflow adoption.
