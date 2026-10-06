---
title: "LoGo — local-global rewards for long-horizon video consistency (arXiv:2610.03636)"
type: source
tags: [paper, video-generation, reward-modeling, 3d-consistency, camera-control, watch]
keywords: [LoGo, local-global reward, voxel reprojection, TrajectoryBench, DiffusionNFT, VGGT, long-horizon consistency, epipolar, camera-controlled video]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-05-daily.md
  - concepts/camera-controlled-video-generation.md
  - concepts/world-models-video-generation.md
maturity: draft
read_status: skimmed
created: 2026-10-06
updated: 2026-10-06
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-05-daily.md @concepts/camera-controlled-video-generation.md @concepts/world-models-video-generation.md

## Raw Concept

- **Title**: LoGo: Local-Global Rewards for Consistent Long-Horizon Video Generation
- **Type**: arXiv:2610.03636 (Caltech + World Labs; Ziqi Ma et al.)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.03636
- **Retrieved**: 2026-10-06

## Narrative

**What is new.** Prior geometry-reward work (VideoGPA/DPO, World-R1/Flow-GRPO, Epipolar-DPO, VGGT-reprojection) collapses the whole clip to **one scalar**. LoGo adds **voxelized local-global credit assignment**: a spatial per-voxel reward that localizes where 3D consistency broke, blended with the usual global reprojection error. It is reward design plus a benchmark, not a memory or architecture method — contrast `@concepts/world-models-video-generation.md`, where WorldMem and ReWorld solve the same problem architecturally.

**Method.** Build a scene point cloud with VGGT-Ω from keyframes, then voxelize 3D space (voxel = 0.1 x P90 depth, about 3,000 voxels per 240-frame clip). Per-voxel RGB and depth reprojection error gives the local reward; the mean gives the global reward. These blend 1/2 + 1/4 + 1/4 into the DiffusionNFT optimality probability, applied per latent spatio-temporal patch. Reward interleaving cycles aesthetic (HPSv3) and camera rewards.

**Results.** On the new **TrajectoryBench** (long-horizon, complex camera control): Lingbot2 PSNR-D 16.0 to 18.2 (+2.2 dB), epipolar 1.507 to 1.111 (−26%); Lyra2 PSNR-V 18.4 to 19.7; UniWorld 17.6 to 18.8. On DL3DV up to −37% epipolar. It beats VideoGPA, World-R1 and its own global-only ablation, while preserving camera following and video quality.

**Phase-0 (2026-10-06).** The conclusion states "We release code, checkpoints, and benchmark", but **no repository URL appears in the paper** — only the project page `ziqi-ma.github.io/logo-website`. **No licence stated.** Treat the release as claimed but unconfirmed. Training used 64 H100s for 16–36 h per base model; LoGo's own overhead is about 0.5% per training step. The base backbones — Lingbot-world-v2 (14B AR), Lyra-2 (14B), UniWorld (14B bidirectional) — are **outside the Wan/Hunyuan/LTX lineage** this wiki tracks, and are largely unreleased.

**Verdict: WATCH-thin.** The idea (localized credit beats a scalar reward) is sound and the benchmark is worth tracking, but there is no local execution path. The portable asset is the voxel-space consistency *metric*, which is what makes the Basgiath hook real — see `../dragon-rider-map/briefs/2026-10-06_logo-voxel-consistency-metric.md`.

## Snippets

[Source: https://arxiv.org/abs/2610.03636 (retrieved 2026-10-06) — TrajectoryBench epipolar error drops 26% on Lingbot2.]
