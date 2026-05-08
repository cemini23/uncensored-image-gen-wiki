---
title: Multi-angle dataset preparation (persona consistency)
type: concept
tags: [persona-consistency, dataset-preparation, multi-angle, lora-training, character-turnaround, mickmumpitz, kontext-lora]
keywords: [multi-angle, character-turnaround-sheet, mickmumpitz, 96-angle, 5-angle, kontext, redux, wan-i2v, persona-dataset, lora-training-dataset, three-quarter-views, pose-permutations]
related:
  - sources/video-generation-survey-2026.md
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - concepts/character-dna-templates.md
  - concepts/video-identity-inheritance.md
  - entities/adapters/flux-kontext.md
  - entities/adapters/flux-redux.md
  - entities/models/wan-2-2.md
  - entities/models/flux-2-klein.md
  - entities/models/qwen-image-2512.md
  - sources/headsup-3d-gaussian-head.md
  - entities/uis/comfyui.md
maturity: draft
created: 2026-05-07
updated: 2026-05-07
---

## Relations

@sources/video-generation-survey-2026.md @sources/synthetic-character-consistency-survey.md @concepts/persona-consistency-methods.md @concepts/character-dna-templates.md @concepts/video-identity-inheritance.md @entities/adapters/flux-kontext.md @entities/adapters/flux-redux.md @entities/models/wan-2-2.md @entities/models/flux-2-klein.md @entities/models/qwen-image-2512.md @sources/headsup-3d-gaussian-head.md

## Raw Concept

Page prompted by the May 2026 video survey ingest (synthesizes deferred multi-angle content from earlier Path A steps). Multi-angle dataset preparation is the third axis of the persona-consistency taxonomy — building a per-persona library of head-pose / expression / body-angle variants that LoRA training (or reference-stack) can leverage to lock identity across novel poses.

Synthesized from @sources/video-generation-survey-2026.md and @sources/synthetic-character-consistency-survey.md.

## Narrative

### Why this matters

Single-image identity adapters (PuLID II / IP-Adapter FaceID) preserve face well but fail at three-quarter views, profile, top-down, or extreme expressions because the source image only encoded near-frontal features. LoRA training on a multi-angle dataset closes the gap by giving the model explicit examples of the persona's facial geometry from underrepresented angles.

A "production-grade" multi-angle dataset typically covers:
- 5-12 head angles (frontal, ±30°, ±60°, ±90° profile, ±15° upward-tilt, ±15° downward-tilt)
- 3-5 expression baselines (neutral, smile, laugh, contemplative, intense)
- 2-4 lighting conditions (key-from-left, key-from-right, soft, hard)
- 2-3 hair / styling permutations (held in matched-light environment)
- Optional body angles (full-body permutations) for full-figure consistency

### Production approaches

**Approach 1 — Mickmumpitz 96-angle Wan I2V pipeline** [TENTATIVE, single-source — sub-sweep D]

Production-grade pipeline credited to Mickmumpitz that uses a single PuLID-anchored static master image as I2V seed for Wan 2.2, generating 96 systematic angle variations. Workflow steps:

1. Generate FLUX.2 / Qwen / Z-Image Turbo master image with locked LoRA + PuLID II anchor
2. Pass master through CLIP Vision encoder for I2V (preserves anatomical depth)
3. Drive Wan 2.2 with prompt-sequence (camera angle keyframe sweeps)
4. Extract frames at exact angle markers → 96-image dataset
5. Curate and use as LoRA training set or as ConsistentID/PhotoMaker V2 reference stack

→ @entities/models/wan-2-2.md → @concepts/video-identity-inheritance.md

**Approach 2 — Kontext-LoRA 5-angle Character Turnaround Sheet** [CONFIRMED, sub-sweep D resolution]

The Character Turnaround Sheet variant is a separate **5-angle** approach — front, ¾-front-right, profile-right, ¾-back, full-back — generated via FLUX.1 Kontext editing of a single-input reference. Confirmed in sub-sweep D (2026-05-07) as **distinct from** the 96-angle Wan I2V pipeline; the two are complementary not interchangeable. → @entities/adapters/flux-kontext.md

**Approach 3 — Redux multi-reference compose (FLUX.1)** [CONFIRMED]

FLUX.1 Redux pairs with PuLID II as a dual-node identity-and-composition stack. For multi-angle datasets, batched Redux runs with rotated reference compositions can synthesize angle variants without driving them through Wan's video stack — useful when video model isn't available or when only a 8-12-shot dataset is needed. → @entities/adapters/flux-redux.md

Note: FLUX.2 ships **multi-reference editing natively** (no separate Redux variant), so for FLUX.2 / Klein 9B workflows the Redux branch collapses into the base model. → @entities/models/flux-2-klein.md (sub-sweep D resolution, 2026-05-07)

### Dataset hygiene checks

Before LoRA training:
- Verify no duplicates / near-duplicates (perceptual hash)
- Verify identity stability across the set (run face-recognition similarity matrix; throw out outliers <0.85 vs anchor)
- Verify lighting / expression diversity (otherwise LoRA overfits to one pose)
- Tag captions consistently with the persona's DNA template tokens → @concepts/character-dna-templates.md

### Failure modes

- **Frontal bias**: dataset over-weighted toward 0°-30° → LoRA collapses three-quarter and profile views back to frontal
- **Lighting overfit**: all images key-from-left → generated outputs ignore prompt-specified lighting
- **Expression freeze**: only neutral/smile baselines → LoRA refuses to generate intense / dynamic expressions
- **Identity drift across the dataset**: PuLID II at 0.45 strength can drift slightly across many seeds → run identity-similarity matrix before training, prune drifters
- **Wan 2.2 pre-training scrub**: if training a NSFW persona LoRA, base Wan 2.2 outputs may artifact on anatomical content — anchor I2V on FLUX/Qwen/Z-Image instead, then feed clean frames to LoRA training

## Snippets

> "ComfyUI environments utilize specialized nodes to enforce I2V consistency. A critical architectural pattern is passing the initial static image through a CLIP Vision encoder rather than simply using it as a raw pixel initialization. The CLIP Vision encoder extracts deep semantic features and 3D structural data from the face, ensuring the subsequent video model understands the anatomical depth of the character before animating it."
[Source: Video Generation Models Survey 2026.docx p.5, citing reddit.com/r/comfyui/comments/1s746sw + youtube.com/watch?v=ocj3E8FUDIg]

## Dead Ends

- **Single-image identity adapter for full-pose persona consistency**: insufficient for ¾ / profile / top-down views. Multi-angle dataset is the only known reliable path to lock identity across the full pose range.
- **Frontal-bias datasets**: avoid; LoRA training will collapse novel angles back to frontal — defeating the purpose of the dataset.
