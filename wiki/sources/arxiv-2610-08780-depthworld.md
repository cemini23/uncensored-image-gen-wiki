---
title: "DepthWorld — 3D world model for robot manipulation (arXiv:2610.08780)"
type: source
tags: [paper, world-model, robotics, depth, diffusion, watch]
keywords: [DepthWorld, DROID-3D, metric depth, bundle adjustment, SVD, depth-as-latent-tile, multi-view, hand-eye calibration, robot manipulation]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-07-daily.md
  - concepts/world-models-video-generation.md
maturity: draft
read_status: skimmed
created: 2026-10-08
updated: 2026-10-08
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-07-daily.md @concepts/world-models-video-generation.md

## Raw Concept

- **Title**: DepthWorld: 3D World Model for Robot Manipulation
- **Type**: arXiv:2610.08780 (Czech Technical University in Prague; Jai Bardhan, Josef Sivic, Vladimir Petrik)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.08780
- **Retrieved**: 2026-10-08

## Narrative

**Two artifacts.** First, a **calibration pipeline** that reconstructs metric depth and robot-grounded multi-view extrinsics from teleoperation stereo video; applied to DROID it produces **DROID-3D** (71,100 episodes, 28 robots). Second, **DepthWorld**, a Stable-Video-Diffusion world model that jointly predicts multi-view RGB and metric depth — and reports that the depth supervision **improves the RGB as well**.

**Method.** Per-view metric depth from learned stereo (S2M2) plus two-pass bundle adjustment. A joint factor graph then pools all episodes per robot to solve shared hand-eye and joint-encoder offsets alongside per-scene extrinsics (GPU Levenberg-Marquardt with Schur complement, about 12.5 minutes per robot). DepthWorld encodes RGB and depth as **side-by-side tiles in the frozen SVD VAE latent** (72x80), so the U-Net sees both modalities **without retraining the VAE**, and a VGGT-initialised DPT head adds robot-frame point-map supervision.

**Results.** Calibration against the PointWorld baseline: end-effector reprojection 0.25 px vs 5.84, whole-body 1.03 vs 13.19 px, robot depth 14.0 vs 111.3 mm, mask IoU 0.81 vs 0.44. On a ground-truth rig, extrinsics reach 4.9 mm / 0.39 degrees. The world model gains **+1.48 dB PSNR over an identical RGB-only baseline** (24.09 vs 22.63 external) and beats an adapted TesserAct (24.07 vs 19.43).

**Phase-0 (2026-10-08).** **Code and weights ship**: `github.com/Jai2500/depthworld` and `huggingface.co/jaibrdhn/depthworld`, with DROID-3D extrinsics on HF (the full dataset is gated). **No licence is stated** on either repository — check before any use. Training used two H200 nodes for about two days. Inference is small (192x320, 3 views, 11 frames) and SVD runs on 24GB, so the checkpoint is runnable, but it wants DROID-3D data, a URDF and three synchronised calibrated cameras.

**Verdict: WATCH-thin.** The model is bound to robot manipulation with no creative use, so it does not route anywhere — robotics is not a sibling wiki. What transfers is one technique worth remembering: **encode a new modality as a tile inside a frozen VAE latent** to add it without destroying the pretrained priors, which is the Marigold line of thinking. No Basgiath hook — its 3D-consistency metrics need calibrated multi-camera rigs, not a single add-on view.

## Snippets

[Source: https://arxiv.org/abs/2610.08780 (retrieved 2026-10-08) — depth supervision improves RGB by +1.48 dB PSNR.]
