---
title: CausalMotion (Shanghai AI Lab — training-free physics video)
type: entity
tags: [model, video, physics, training-free, research, ltx]
keywords: [CausalMotion, zhuangsh0713, LTX-Video, Grounded SAM2, keyframe trajectory, PhyGenBench]
related:
  - sources/arxiv-2606-14317-causalmotion-physical-reasoning-video.md
  - concepts/vlm-guided-physical-video-generation.md
  - concepts/video-generation-physical-executability.md
  - entities/models/ltx-2.md
  - sources/video-generation-survey-2026.md
  - concepts/world-models-video-generation.md
  - sources/arxiv-proprio-physics-video-2605-28230.md
maturity: draft
created: 2026-06-17
updated: 2026-06-17
phase_0_verdict: CONDITIONAL-GO
phase_0_date: 2026-06-17
---

## Relations

@sources/arxiv-2606-14317-causalmotion-physical-reasoning-video.md @concepts/vlm-guided-physical-video-generation.md @entities/models/ltx-2.md

## Raw Concept

Entity from 2026-06-17 ingest — CausalMotion (arXiv:2606.14317). Code: https://github.com/zhuangsh0713/CausalMotion

## Narrative

**CausalMotion** — training-free VLM keyframe + trajectory guidance for LTX-Video synthesis.

| Field | Value |
|-------|-------|
| Repo | `zhuangsh0713/CausalMotion` — ~3★; pushed 2026-06-15 |
| License | No LICENSE file at audit |
| Deps | `Grounded-SAM-2`, `LTX-Video` git submodules |
| Phase-0 | **CONDITIONAL-GO** — see `briefs/2026-06-17_phase-0-causalmotion-permavid.md` |

**Adopt when:** Physics-heavy T2V prompts on LTX backbone; operator accepts multi-model inference stack.

## Snippets

(See @sources/arxiv-2606-14317-causalmotion-physical-reasoning-video.md)

## Dead Ends

LTX weight license chain — verify BFL terms before commercial persona use.
