---
title: Lighting-consistent 3DGS object compositing (dot3d)
type: concept
tags: [concept, 3dgs, compositing, relighting, peripheral, vfx]
keywords: [dot3d, 3D Gaussian Splatting, harmonization, object transfer, multi-view diffusion, relighting]
related:
  - sources/arxiv-2606-22481-lighting-consistent-object-transfer-3dgs.md
  - concepts/2026-05-13_gracia-ai-volumetric-video.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-25
updated: 2026-06-25
---

## Relations

@sources/arxiv-2606-22481-lighting-consistent-object-transfer-3dgs.md @concepts/2026-05-13_gracia-ai-volumetric-video.md

## Raw Concept

Ingest 2026-06-25 from Violante et al. (arXiv:2606.22481) — diffusion harmonization for 3DGS object insertion across scenes.

## Narrative

### Pipeline

```
Source 3DGS ──extract object──► Place in target 3DGS
                                      ↓
                           Render inconsistent views
                                      ↓
                     Per-view diffusion harmonizer
                                      ↓
                           Re-fit 3DGS + optimize
```

**Training data mix:** curated Blender synthetic pairs + FLUX-generated + ORIDa real composites — Blender subset most impactful per ablations.

### Build-track boundary

Persona work is **2D LoRA + video DiT** first-class; 3DGS compositing is **VFX/virtual-set** adjacent. Revisit only if operator adopts Gaussian splat captures for environment libraries.

## Snippets

> "Our diffusion model harmonizes each one of these views, which are finally consolidated in a 3DGS representation with a post-optimization step."

## Dead Ends

No Wan/FLUX/ComfyUI integration at ingest.
