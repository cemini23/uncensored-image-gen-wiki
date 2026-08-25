---
title: "FixAnything 3D-consistent render refine (arXiv:2608.23549)"
type: source
tags: [paper, video, 3dgs, nerf, watch]
keywords: [FixAnything, 3DGS, NeRF, video generative priors, CMU]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/world-models-video-generation.md
  - entities/models/fixanything.md
  - entities/models/wan-2-2.md
  - sweeps/2026-08-25-daily.md
maturity: draft
read_status: read
created: 2026-08-25
updated: 2026-08-25
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/models/fixanything.md @concepts/world-models-video-generation.md @entities/models/wan-2-2.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-25-daily.md

## Raw Concept

- **Title**: FixAnything: 3D-Consistent Rendering Refinement via Video Generative Priors
- **Authors**: Khiem Vuong, Deva Ramanan, Srinivasa Narasimhan (CMU)
- **Type**: arXiv:2608.23549 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.23549-fixanything-3d-consistent-rendering-refinement-v.pdf`
- **URL**: https://arxiv.org/abs/2608.23549
- **Project**: https://fix-anything.github.io
- **Retrieved**: 2026-08-25
- **Code**: none matching (`ianleupold1/fixanythingforfree` is unrelated HTML).

## Narrative

Takes a rendering video from 3DGS / NeRF / mesh / sparse point cloud and produces a photorealistic, 3D-consistent video that keeps camera trajectory + scene, via a single model finetuned from a pretrained video diffusion prior. **WATCH** for sparse-view 3D persona cleanup. No public code. Image-gen Phase-1: none. Not a 3D-wiki print-farm topic.

## Snippets

> "FixAnything takes a rendering video from any 3D representation — 3DGS, NeRF, mesh, or sparse point cloud — and produces a photorealistic, 3D-consistent video that preserves the camera trajectory and scene content."

[Source: arxiv-2608.23549, abstract]
