---
title: "Hydra-0 action-flow robot world model (arXiv:2608.18077) — skip gen / route game-dev"
type: source
tags: [paper, skip, routed, robotics, world-model, nvidia]
keywords: [Hydra-0, action flow, pixel motion, RoboLab, NVIDIA Isaac, LightX2V]
related:
  - sweeps/2026-08-19-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-08-19
updated: 2026-08-19
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

Primary: Game Dev wiki brief `briefs/2026-08-19_hydra-0-from-image-gen.md`.
@sweeps/2026-08-19-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: Hydra-0: Action Flow for Generalist World Modeling and Control
- **Authors**: Hongyu Li, Bowen Wen, Xinghao Zhu, Yixuan Wang, Yilun Du, Yunzhu Li, George Konidaris, Stan Birchfield, Soha Pouya, Chenran Li, Yan Chang (NVIDIA / Brown / Columbia / Harvard)
- **Type**: arXiv:2608.18077 [cs.RO]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.18077-hydra-0-action-flow-for-generalist-world-modelin.pdf`
- **URL**: https://arxiv.org/abs/2608.18077
- **Project**: https://nvidia-isaac.github.io/video_to_data/hydra-0/
- **Retrieved**: 2026-08-19
- **Code**: no public SPDX clone at ingest. Mentions LightX2V as a video backbone, not a persona recipe.

## Narrative

**Phase-0: SKIP gen / ROUTE game-dev.** Hydra-0 conditions a generalist world model on **action flow** — robot actions as pixel motion — so the same visual interface spans embodiments and backbones. Reported 90.4% / 60.2% lower robot/object motion error vs an action-conditioned baseline; RoboLab Pearson r=0.96 replay vs reference success. Emergent inverse mode: predict robot motion from object flow copied from a human demo.

This is NVIDIA robot control, not talking-head or T2I persona. Image-gen `wont_wire`. Game-dev brief carries the LightX2V / world-model pointer.

## Snippets

> "We introduce Hydra-0, a generalist world model conditioned on action flow, which represents robot actions as pixel motion. This shared visual interface enables generalist world modeling and control by learning action consequences across embodiments, tasks, environments, and video-generation backbones."

[Source: arxiv-2608.18077, abstract]
