---
title: "CamWorldQA camera-controlled world video quality bench (arXiv:2608.18710)"
type: source
tags: [paper, benchmark, world-model, camera-control, video-quality, watch]
keywords: [CamWorldQA, CWQA, camera-controlled world video, SJTU]
related:
  - concepts/camera-controlled-video-generation.md
  - concepts/federated-daily-research-digest.md
  - concepts/world-models-video-generation.md
  - entities/benchmarks/camworldqa.md
  - sweeps/2026-08-20-daily.md
maturity: draft
read_status: read
created: 2026-08-20
updated: 2026-08-20
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/benchmarks/camworldqa.md @concepts/camera-controlled-video-generation.md @concepts/world-models-video-generation.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-20-daily.md

## Raw Concept

- **Title**: CamWorldQA: Perceptual Quality Assessment of Camera-Controlled World Video Generation
- **Authors**: Yunhe Li, Likun Wu, Sijing Wu, Xinyu Tian, Huiyu Duan, Yixuan Gao, Yunhao Li, Guangtao Zhai (SJTU / Eindhoven)
- **Type**: arXiv:2608.18710 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.18710-camworldqa-perceptual-quality-assessment-of-came.pdf`
- **URL**: https://arxiv.org/abs/2608.18710
- **Retrieved**: 2026-08-20
- **Code**: none at ingest. Dataset/weights **not downloaded**.

## Narrative

First perceptual-quality bench aimed at **camera-controlled world video** rather than generic VQA. Generic VQA misses viewpoint consistency, trajectory following, and content preservation under a user-specified camera path. CamWorldQA: 720 clips from 20 source videos × 4 categories (animals/objects/human/scenes) × 6 trajectories (truck L/R, dolly in/out, pedestal up/down) × 6 generators (RecamMaster, Diffusion as Shader, TrajectoryCrafter, Sierpinski, CamGen, 3C Recapture). 18 raters, 12,960 MOS ratings. Companion **CWQA** no-reference scorer with spatial / temporal-motion / optical-flow branches.

**WATCH** for camera-controlled world-model eval (pairs with SANA-WM / Prisma-World / GeoT2V-Bench). Paper-only. `deferred`. No Image-gen Phase-1.

## Snippets

> "We introduce CamWorldQA, the first benchmark for perceptual quality assessment of camera-controlled world video generation. CamWorldQA contains 720 generated videos produced by 6 representative generation methods from 20 diverse source videos under 6 camera trajectories, where each video is annotated with a human-rated perceptual quality score through subjective experiments."

[Source: arxiv-2608.18710, abstract]
