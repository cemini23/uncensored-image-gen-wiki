---
title: "OrthoPhys — orthogonal-view physics-guided video (arXiv:2603.18639)"
type: source
tags: [paper, video-generation, physics, multi-view, world-model, ti2v]
keywords: [OrthoPhys, Phys4View, VideoSyn, PhysMV, orthogonal views, physical plausibility, geometry-enhanced attention, physics engine, 3D-GS]
related:
  - concepts/physics-aware-orthogonal-view-video.md
  - concepts/world-models-video-generation.md
  - sources/arxiv-proprio-physics-video-2605-28230.md
  - sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
  - sources/video-generation-survey-2026.md
  - concepts/video-generation-physical-executability.md
  - sources/arxiv-2606-04811-dream-exe-robot-executability.md
maturity: draft
read_status: read
created: 2026-06-06
updated: 2026-06-07
---

## Relations

@concepts/physics-aware-orthogonal-view-video.md @concepts/world-models-video-generation.md @sources/arxiv-proprio-physics-video-2605-28230.md @sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md

## Raw Concept

- **Title**: OrthoPhys: Physically Plausible Video Generation with Orthogonal-View Geometry Guidance
- **Authors**: Cong Wang, Hanxin Zhu, Xiao Tang, Jiayi Luo, Xin Jin, Long Chen, Zhibo Chen (CAS, USTC, Tongji, Beihang, Zhongguancun Academy)
- **Type**: arXiv:2603.18639
- **Location**: `raw-sources/arxiv-2603.18639-orthophys-physically-plausible-video-generation.pdf`
- **URL**: https://arxiv.org/abs/2603.18639
- **Retrieved**: 2026-06-06
- **Read status**: read (abstract + two-stage pipeline)

## Narrative

Two-stage **physics-plausible TI2V** without explicit 3D reconstruction at inference.

**Stage 1 — Phys4View:** generates **four synchronized orthogonal-view foreground videos** conditioned on image, text, and explicit **physical attributes** (velocity, acceleration, density, Young's modulus, Poisson's ratio). Uses physics-aware attention + **geometry-enhanced cross-view attention** (depth-lifted 3D affinity weights) for spatiotemporal coherence across views.

**Stage 2 — VideoSyn:** composes final background-aware video using orthogonal foreground motion as rigid guidance — learns foreground–background contact, occlusion, context-consistent motion data-driven (no physics sim at inference).

**PhysMV dataset:** physics engine + 3D-GS objects → 10K objects, 40K scenes, 160K orthogonal video clips for training.

Claims improved physical realism vs data-driven and physics-engine baselines on motion plausibility benchmarks `[TENTATIVE]`.

### Workspace relevance

Research-layer **physics fidelity** reference for persona/action clips — not build-track today (multi-view intermediate, PhysMV not consumer-deployable). Clusters with Proprio (inference-time physics scoring), OptiWorld (optimal control), YoCausal (causality eval) as the wiki's physics axis for video.

## Snippets

> "Physically plausible motion … should remain consistent across viewpoints."

> "Orthogonal-view foreground motion guidance enables data-driven learning of realistic foreground–background interactions without explicit physical simulation at inference."

## Dead Ends

Not uncensored persona tooling. Requires physical attribute specification — overkill for stylized anime persona ops. Anonymous project page at ingest.
