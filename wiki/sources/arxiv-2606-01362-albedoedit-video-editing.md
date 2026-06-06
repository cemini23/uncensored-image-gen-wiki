---
title: "AlbedoEdit — unified instance-level video editing (arXiv:2606.01362)"
type: source
tags: [paper, video-editing, albedo, intrinsic, wan, voi, vor, vte]
keywords: [AlbedoEdit, albedo guidance, video object insertion, video object removal, texture editing, Wan 2.1, DiffusionRenderer, illumination harmonization, MPI, NVIDIA]
related:
  - concepts/albedo-guided-instance-video-editing.md
  - entities/models/albedoedit.md
  - entities/models/wan-2-2.md
  - concepts/two-pass-generation-workflow.md
  - sources/video-generation-survey-2026.md
maturity: draft
read_status: read
created: 2026-06-06
updated: 2026-06-06
---

## Relations

@concepts/albedo-guided-instance-video-editing.md @entities/models/albedoedit.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: AlbedoEdit: Unified Instance-Level Video Editing with Albedo Guidance
- **Authors**: Xilong Zhou, Bao-Huy Nguyen, Zheng Zeng, Jacob Munkberg, Jon Hasselgren, Thomas Leimkühler, Nima Kalantari, Miloš Hašan, Christian Theobalt (MPI-INF, UCSB, NVIDIA Research, Texas A&M)
- **Type**: arXiv:2606.01362
- **Location**: `raw-sources/arxiv-2606.01362-albedoedit-unified-instance-level-video-editing.pdf`
- **URL**: https://arxiv.org/abs/2606.01362 · https://vcai.mpi-inf.mpg.de/projects/AlbedoEdit/
- **Retrieved**: 2026-06-06
- **Read status**: read (abstract + method + inference pipeline)

## Narrative

Unified **instance-level video editing** framework on a Wan 2.1 T2V-14B DiT backbone. Single model handles three tasks via shared conditioning:

- **VOI** — video object insertion with lighting harmonization (specular, shadows, reflections)
- **VOR** — object removal including secondary effects (cast shadows, reflections)
- **VTE** — texture / material editing on selected instances

**Key insight:** **Albedo maps** (illumination-invariant) as edit specification — users edit first-frame albedo (Photoshop-class tools) rather than RGB masks alone. Model ingests concatenated latents: source video + original albedo + edited albedo → edited RGB video via flow-matching finetune.

**Training:** large synthetic PBR dataset (Objaverse + primitives, hero/non-hero layouts); VLM-generated captions. Finetune full Wan 2.1 at 832×480 × 33 frames on 8× H200 (~8 days). VOR trained as reverse of VOI pairs.

**Inference:** DiffusionRenderer inverse rendering extracts first-frame albedo → user edits → AlbedoEdit denoises. Models + dataset promised open release.

### Workspace relevance

Potential **post-production** tool for persona video — swap outfits/props in albedo space without re-running full I2V. Heavy VRAM (Wan 14B + 2×N+2 latent concat). Not identity-LoRA path; complements @concepts/two-pass-generation-workflow.md inpainting passes `[NEEDS VERIFICATION 2026-06-06]`.

## Snippets

> "The intrinsic albedo map … provides an effective and user-friendly mechanism for specifying fine-grained appearance edits."

> "AlbedoEdit implicitly learns to harmonize edited contents and simulate complex real-world visual effects … including specular highlights, soft shadows, and mirror reflections."

## Dead Ends

Synthetic-only training — real-world albedo extraction quality depends on DiffusionRenderer. Not audio/lipsync editing.
