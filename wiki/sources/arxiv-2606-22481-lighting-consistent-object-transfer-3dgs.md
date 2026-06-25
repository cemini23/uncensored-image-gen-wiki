---
title: "Lighting-consistent object transfer across 3DGS (arXiv:2606.22481)"
type: source
tags: [paper, 3dgs, compositing, relighting, diffusion, peripheral]
keywords: [dot3d, 3D Gaussian Splatting, object transfer, harmonization, multi-view consistency, Inria]
related:
  - concepts/lighting-consistent-3dgs-compositing.md
  - concepts/2026-05-13_gracia-ai-volumetric-video.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - sweeps/2026-06-25-daily.md
maturity: draft
read_status: read
created: 2026-06-25
updated: 2026-06-25
---

## Relations

@concepts/lighting-consistent-3dgs-compositing.md @concepts/2026-05-13_gracia-ai-volumetric-video.md

## Raw Concept

- **Title**: Lighting-Consistent Object Transfer Across Radiance Fields
- **Authors**: Nicolás Violante, George Kopanas, Linus Franke, Julien Philip, George Drettakis (Inria / Google DeepMind / Eyeline Labs)
- **Type**: arXiv:2606.22481 · CGF / EGSR 2026
- **Location**: `raw-sources/arxiv-2606-22481-lighting-consistent-object-transfer-across-radia.pdf`
- **URL**: https://arxiv.org/abs/2606.22481 · https://repo-sam.inria.fr/nerphys/dot3d/
- **Retrieved**: 2026-06-25
- **Read status**: read (abstract + pipeline)

## Narrative

**dot3d** pipeline for **lighting-consistent object transfer** between captured **3DGS** scenes:

1. Extract object Gaussians from source scene
2. User places object in target scene (3D)
3. Render inconsistent composite views
4. **Per-view diffusion harmonization** (Blender + FLUX + ORIDa training mix)
5. Consolidate harmonized views back into 3DGS + post-optimize

Targets VFX / interior design / marketing — avoids full inverse rendering. Trained harmonizer uses heterogeneous synthetic + generated + real pairs.

### Workspace relevance

**Peripheral** to 2D persona LoRA stack — relevant only if operator builds **3DGS environment assets** for virtual sets (@concepts/2026-05-13_gracia-ai-volumetric-video.md axis). Phase-0: **CONDITIONAL-GO** — project page live; full adopt pending license + ComfyUI bridge audit — `briefs/2026-06-25_phase-0-dot3d-arctic-shift.md`.

## Snippets

> "Naively compositing scenes by copying Gaussian primitives… leads to unrealistic results because of the lighting inconsistencies between the two scenes."

## Dead Ends

No direct Pony/Wan/FLUX persona path at ingest — 3D capture compositing only.
