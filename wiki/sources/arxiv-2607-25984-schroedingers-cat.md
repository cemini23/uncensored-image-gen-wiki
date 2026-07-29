---
title: "Schrödinger's Cat / GARFIELD — probabilistic scene kinematics (arXiv:2607.25984)"
type: source
tags: [paper, world-model, motion, kinematics, eccv, non-commercial]
keywords: [GARFIELD, CompVis, scene-kinematics, trajectory-prediction, density-decoder]
related:
  - entities/models/garfield.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - entities/models/wonder.md
  - sweeps/2026-07-29-daily.md
maturity: draft
read_status: read
created: 2026-07-29
updated: 2026-07-29
---

## Relations

@entities/models/garfield.md @concepts/world-models-video-generation.md @concepts/camera-controlled-video-generation.md @sweeps/2026-07-29-daily.md

## Raw Concept

- **Title**: Schrödinger's Cat: Probabilistic Representation and Prediction of Potential Scene Kinematics
- **Authors**: Timy Phan, Jannik Wiese, Björn Ommer (CompVis @ LMU / MCML)
- **Type**: arXiv:2607.25984 · ECCV 2026
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.25984-schr-dinger-s-cat-probabilistic-representation-a.pdf`
- **URL**: https://arxiv.org/abs/2607.25984
- **Project**: https://compvis.github.io/schroedingers_cat
- **Code**: github.com/CompVis/schroedingers_cat (~24 MB)
- **Weights**: huggingface.co/CompVis/schroedingers_cat
- **Retrieved**: 2026-07-29

## Narrative

GARFIELD learns a structured latent of possible futures from an image + optional sparse constraints; supports joint trajectory sampling **and** deterministic density decode (≈100× faster than MC). Competitive motion planning vs large video gens at 97× faster trajectory sampling.

**Phase-0: CONDITIONAL-GO (research non-commercial only)** — LICENSE is LMU personal/scientific **non-commercial**. Do not use for monetized persona pipelines. Skip laptop clone (non-commercial + not production). TipDrop: research sidecar only if needed for motion-planning A/B.

## Snippets

_(none)_
