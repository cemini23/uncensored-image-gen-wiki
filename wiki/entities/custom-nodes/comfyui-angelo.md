---
title: "ComfyUI-Angelo (FLUX.2 Klein click-to-refine node)"
type: entity
tags: [comfyui, custom-node, flux2, klein, inpainting, interactive-editing]
keywords: [ComfyUI-Angelo, shootthesound, click-to-refine, smart inpaint, FLUX 2 Klein, location-guided edit]
related:
  - entities/uis/comfyui.md
  - entities/models/flux-2-klein.md
  - entities/adapters/flux2-klein-matchingpose.md
  - entities/adapters/pulid.md
  - concepts/persona-consistency-methods.md
  - concepts/two-pass-generation-workflow.md
  - entities/custom-nodes/impact-pack.md
  - entities/uis/comfyui.md
  - sweeps/2026-07-10-daily.md
maturity: draft
created: 2026-07-10
updated: 2026-07-10
---

## Relations

@entities/uis/comfyui.md @entities/models/flux-2-klein.md @entities/adapters/flux2-klein-matchingpose.md @entities/adapters/pulid.md @concepts/persona-consistency-methods.md @concepts/two-pass-generation-workflow.md @entities/custom-nodes/impact-pack.md

## Raw Concept

Sweep news row **R2** (2026-07-10). Repo: `github.com/shootthesound/ComfyUI-Angelo`. MIT license. FLUX.2 Klein-focused interactive refinement node.

## Narrative

**ComfyUI-Angelo** packs generate + interactive refine into one node for **FLUX 2 Klein**:

- Initial T2I generation
- **Click-to-refine** on regions
- **Paint / drag** inpaint-style corrections
- **Location-guided whole-image edits**

Fits persona master-frame iteration: generate a Klein still with PuLID + character LoRA, then click-fix hands/face/outfit without rebuilding the whole graph. Complements @entities/custom-nodes/impact-pack.md (detector-driven second pass) with operator-driven local edits.

### Phase-0 audit (2026-07-10)

| Check | Result |
|-------|--------|
| License | MIT — commercial persona use OK |
| Stars / cadence | ~126★; updated 2026-07-10 |
| Base model | FLUX.2 Klein explicit in README |
| Apple Silicon | Unverified at ingest — CUDA-first assumption |
| Maintainer risk | Single-author repo — smoke-test before production dependency |

**Verdict: GO (smoke-test)** — install in ComfyUI `custom_nodes`, run one persona still + click-fix workflow.

### Install

```bash
cd ComfyUI/custom_nodes
git clone https://github.com/shootthesound/ComfyUI-Angelo.git
# restart ComfyUI; follow repo README for example workflow JSON
```

## Snippets

> "Click-to-refine + smart inpaint sampler node for ComfyUI (FLUX 2 Klein). One node: generate, then click / paint / drag to refine."
[Source: github.com/shootthesound/ComfyUI-Angelo (retrieved 2026-07-10)]

## Dead Ends

- Wan / video graphs — image-only node family at ingest.
- Replacing MatchingPose — Angelo is local refinement, not pose transfer (@entities/adapters/flux2-klein-matchingpose.md).
