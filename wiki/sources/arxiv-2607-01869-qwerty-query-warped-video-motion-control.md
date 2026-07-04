---
title: "QWERTY — query-warped video motion control (arXiv:2607.01869)"
type: source
tags: [paper, video-generation, motion-control, training-free, wan, cogvideox]
keywords: [QWERTY, query warping, STCD, semantic-temporal channel decomposition, Wan2.2, CogVideoX, image-to-video, motion control, optical flow]
related:
  - concepts/query-warped-video-motion-control.md
  - concepts/camera-controlled-video-generation.md
  - concepts/video-identity-inheritance.md
  - entities/models/wan-2-2.md
  - entities/models/cogvideox-1-5.md
  - sweeps/2026-07-04-daily.md
maturity: draft
read_status: read
created: 2026-07-04
updated: 2026-07-04
---

## Relations

@concepts/query-warped-video-motion-control.md @concepts/camera-controlled-video-generation.md @concepts/video-identity-inheritance.md @entities/models/wan-2-2.md @entities/models/cogvideox-1-5.md

## Raw Concept

- **Title**: QWERTY: Training-Free Motion Control via Query-Warped Video Diffusion Transformers
- **Authors**: Kyobin Choo, Youngmin Kim, Hyunkyung Han, Geunrip Park, Chanyoung Kim, Sunyoung Jung, Seong Jae Hwang (Yonsei)
- **Type**: arXiv:2607.01869
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.01869-qwerty-training-free-motion-control-via-query-wa.pdf`
- **URL**: https://arxiv.org/abs/2607.01869
- **Retrieved**: 2026-07-04
- **Read status**: read (abstract, method, experiments, implementation appendix)

## Narrative

**QWERTY** is a training-free motion-control method for image-to-video DiTs. Instead of adding ControlNet branches or fine-tuning on trajectories, it warps the **query** tokens inside 3D full attention so later-frame regions attend back to first-frame semantic features at user-specified target locations.

The key mechanism is **semantic-temporal channel decomposition (STCD)**: PCA separates frame-consistent semantic query channels from frame-variant temporal/RoPE channels, then only the semantic channels are warped. This prevents the common artifact where naive hidden-state or query-key warping drags the wrong temporal position into later frames.

The method supports two control modes:

| Control | Input | Operational effect |
|---------|-------|--------------------|
| Object motion | User-drawn mask warp | Move / rotate / scale a subject from the first-frame image |
| Camera motion | Optical flow | Push camera dolly/orbit/zoom control into the I2V model |

Experiments use **Wan 2.2 TI2V-5B** and **CogVideoX-I2V-5B**. QWERTY applies query-warped prediction and latent optimization during the first five denoising steps only; the model then returns to normal denoising for appearance refinement. The appendix reports a single RTX A6000 48GB for experiments.

### Workspace relevance

For persona video, QWERTY is the cleanest research signal yet for **training-free, user-specified motion** on Wan-class DiTs. It complements @concepts/ray-space-positional-encoding-video.md and @concepts/ucm-time-aware-pe-warping-world-models.md: RayPE/UCM are model-training or addon directions, while QWERTY is an inference-time control primitive that could become a ComfyUI/Wan patch if code lands.

Phase-0: **WATCH** — no public QWERTY repo found at ingest. The paper references DiTFlow and RoPECraft codebases plus official Wan/CogVideoX repos, but the QWERTY implementation itself is not released.

## Snippets

> "We introduce Qwerty, a training-free framework that enables flexible motion control in pretrained image-to-video DiTs via user-defined object warping and optical flow."

> "Warping queries is the only effective mechanism for achieving this behavior among all attention components."

> "Qwerty is implemented on both the Wan 2.2 TI2V-5B and CogVideoX-I2V-5B backbones."

## Dead Ends

- **Immediate ComfyUI adoption**: no code/weights. Watch for a Wan2.2 ComfyUI custom node or a diffusers patch.
- **Long clips**: experiments truncate some baselines to 25/49-frame regimes; treat as short-clip motion control, not a long-video continuity solution.
