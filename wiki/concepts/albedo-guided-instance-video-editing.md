---
title: Albedo-guided instance video editing (AlbedoEdit)
type: concept
tags: [concept, video-editing, albedo, intrinsic, voi, vor, vte]
keywords: [AlbedoEdit, albedo conditioning, instance-level editing, illumination harmonization, inverse rendering, Wan finetune]
related:
  - sources/arxiv-2606-01362-albedoedit-video-editing.md
  - entities/models/albedoedit.md
  - entities/models/wan-2-2.md
  - concepts/two-pass-generation-workflow.md
  - concepts/knowledge-graph-structured-video-control.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - concepts/task-isolated-unified-video-editing.md
  - entities/models/tide.md
  - sources/arxiv-2606-08514-omnitryon-video-try-on.md
  - concepts/video-try-on-anything.md
  - concepts/layered-diffusion-content-preserving-video-editing.md
maturity: draft
created: 2026-06-06
updated: 2026-06-26
---

## Relations

@sources/arxiv-2606-01362-albedoedit-video-editing.md @entities/models/albedoedit.md @entities/models/wan-2-2.md @concepts/two-pass-generation-workflow.md

## Raw Concept

Concept from 2026-06-06 ingest — arXiv:2606.01362 AlbedoEdit.

## Narrative

**Unified instance editing** via **albedo-space user specification** instead of coarse text or per-task specialist pipelines.

**Three tasks, one model:**

- **VOI** — insert object albedo → harmonized lighting in full clip
- **VOR** — remove region in albedo → side-effect erasure (shadows, reflections)
- **VTE** — swap textures in albedo → material change with preserved unedited regions

**Workflow:** inverse render first-frame albedo (DiffusionRenderer-class) → Photoshop-class albedo edit → Wan 14B DiT translates to edited RGB video with flow-matching finetune on synthetic PBR data.

Contrasts with KGEdit (@concepts/knowledge-graph-structured-video-control.md) — structured semantic graphs vs intrinsic appearance maps. Persona use: wardrobe/prop swaps on existing clips without full re-generation `[TENTATIVE]`.

## Snippets

(See @sources/arxiv-2606-01362-albedoedit-video-editing.md)
