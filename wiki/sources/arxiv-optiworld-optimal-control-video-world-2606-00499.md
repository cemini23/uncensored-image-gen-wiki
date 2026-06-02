---
title: "OptiWorld — optimal control for video world generation (arXiv:2606.00499)"
type: source
tags: [paper, video-generation, world-model, optimal-control, physics, inference-time]
keywords: [OptiWorld, optimal control, Riemannian manifold, goal-conditioned I2V, video dynamics editing, counterfactual video, physical constraints]
related:
  - concepts/world-models-video-generation.md
  - sources/arxiv-proprio-physics-video-2605-28230.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/sana-wm.md
  - sources/arxiv-proprio-physics-video-2605-28230.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
maturity: draft
read_status: read
created: 2026-06-02
updated: 2026-06-02
---

## Relations

@concepts/world-models-video-generation.md @sources/arxiv-proprio-physics-video-2605-28230.md @sources/arxiv-yocausal-world-model-benchmark-2605-30346.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: OptiWorld: Optimal Control for Video World Generation under Physical Constraints
- **Authors**: Yu Yuan, Jianhao Yuan, Xijun Wang, Daiqing Li, Liu He, Lu Ling, Stanley H. Chan (Purdue, Oxford, SixteenMiles Labs)
- **Type**: arXiv:2606.00499
- **Location**: `raw-sources/arxiv-2606.00499-optiworld-optimal-control-for-video-world-genera.pdf`
- **URL**: https://arxiv.org/abs/2606.00499
- **Retrieved**: 2026-06-02
- **Read status**: read (abstract + intro)

## Narrative

**Inference-time optimal control** for video world models: extract a compact task-relevant world state (geometry + semantics + VLM relations), **plan** a trajectory under heterogeneous physical constraints (goal reach, safety, smoothness, efficiency), then **render** video conditioned on that trajectory. Planning is cast as a **geodesic / shortest-path problem on a Riemannian manifold** so unsafe regions become costly and preferred directions become cheap — avoids brittle multi-penalty optimization.

Targets failures where 3D-aware generators look plausible but motion is unsafe, jerky, or inefficient (e.g. moving a full cup of water across a laptop).

**Tasks [TENTATIVE]:** goal-conditioned I2V, video dynamics editing, counterfactual generation. Code/data promised at https://yuyuanspace.com/OptiWorld/

### Workspace relevance

Complements **Proprio** (post-hoc physics scoring/refinement) and **YoCausal** (causality evaluation): OptiWorld is **proactive planning before generation** on the world-model axis → @concepts/world-models-video-generation.md. Persona track: research reference for controllable object/camera motion in explorable scenes; not a drop-in Wan LoRA until code + base-model pairing is verified `[NEEDS VERIFICATION 2026-06-02]`.

## Snippets

> "Video generation models are becoming a scalable form of world models, but they mainly generate plausible motion rather than proactively control or optimize the underlying dynamics."

> "OptiWorld fills this gap with a three-stage pipeline: understanding, planning, and generation."

## Dead Ends

None — local stack fit depends on released code and which 3D-aware video backbones are supported `[NEEDS VERIFICATION 2026-06-02]`.
