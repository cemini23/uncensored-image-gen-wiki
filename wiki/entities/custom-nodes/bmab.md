---
title: "ComfyUI-BMAB (Grounding-DINO-based limb + hand repair suite)"
type: entity
tags: [comfyui, custom-node, post-processing, hand-repair, limb-repair, grounding-dino, sam, inpainting]
keywords: [BMAB, comfyui_bmab, Grounding-DINO, hand-repair, limb-repair, anomaly-detection, automatic-inpaint, FLUX-compatible, person-detection, refiner]
related:
  - entities/uis/comfyui.md
  - entities/hardware/gpu-guide.md
  - entities/custom-nodes/impact-pack.md
  - concepts/two-pass-generation-workflow.md
  - concepts/persona-consistency-methods.md
maturity: draft
created: 2026-05-11
updated: 2026-05-11
---

## Relations

@entities/uis/comfyui.md @entities/hardware/gpu-guide.md
@entities/custom-nodes/impact-pack.md
@concepts/two-pass-generation-workflow.md @concepts/persona-consistency-methods.md

## Raw Concept

Page prompted by 2026-05-11 migration of `notes/frameworks-tools.md` into the wiki layer. BMAB was already referenced in @entities/uis/comfyui.md's custom-nodes table and @entities/hardware/gpu-guide.md's "heavy post-processing" line, but lacked a dedicated entity page. This page consolidates its role as the Grounding-DINO-based surgical hand/limb-repair sibling to @entities/custom-nodes/impact-pack.md.

Repo: `github.com/port090401/comfyui_bmab` (verify owner alias — earlier references in `notes/frameworks-tools.md` used `portu-sim/comfyui_bmab` which may be a prior fork or rename) [NEEDS VERIFICATION 2026-05-11].

## Narrative

### What it does

BMAB ("Bring Me All Beautiful") is an advanced ComfyUI post-processing suite that uses **Grounding-DINO** (open-vocabulary object detection) plus **SAM** segmentation to surgically detect malformed anatomy — particularly hands and limbs — and route those regions to an inpainting pass for repair. It targets the most persistent failure mode of modern image-gen models: anatomical distortions that survive base sampling.

Where @entities/custom-nodes/impact-pack.md uses pre-trained YOLO bbox/segm detectors (fixed vocabulary: face, hand, eye), BMAB uses Grounding-DINO with **arbitrary text prompts** to detect targets ("a left hand", "a poorly-rendered foot", "a misshapen finger"). This makes it more flexible but slower per detection pass.

Core node families:

- **Person + face detectors** — full-figure detection with composable region masks
- **Hand detailer** — Grounding-DINO targets hand regions → SAM segments → inpainting KSampler re-passes the hand at high denoise
- **Anomaly repair** — automated detection of common diffusion artifacts (extra fingers, fused limbs)
- **FLUX-compatible** — the suite has been updated to support FLUX.1 and DiT-class architectures (not just SDXL)

### Install path

Standard ComfyUI custom-node install:

```
cd ComfyUI/custom_nodes
git clone https://github.com/port090401/comfyui_bmab.git
cd comfyui_bmab && pip install -r requirements.txt
```

Pulls in `groundingdino`, `segment-anything`, and downloads ~3 GB of Grounding-DINO + SAM checkpoints on first run. Disk + bandwidth budget is materially larger than @entities/custom-nodes/impact-pack.md.

### Where it fits

| Phase | Role |
|---|---|
| T2I composition | Not used |
| I2I refinement | Optional — sometimes used for limb-level region passes |
| **Inpainting / detailing** | Primary use — hand/limb repair pass after base composition is locked |
| Upscaling | Often combined: detailer (Impact-Pack faces) → BMAB (hands/limbs) → upscale |

**Pairing pattern**: BMAB is most often used alongside @entities/custom-nodes/impact-pack.md. Impact-Pack handles faces (where YOLO is fast + accurate); BMAB handles hands and limbs (where Grounding-DINO's open-vocab flexibility matters more). On any persona workflow with full-body shots, expect both in the post-processing chain.

### Failure modes

- **Slow detection pass** — Grounding-DINO is ~5-10× slower than YOLO for the same crop. On 8 GB cards a single BMAB hand-repair pass can add 15-30s per image.
- **Heavy VRAM footprint** — Grounding-DINO + SAM in memory simultaneously needs ~6 GB on top of the base model. On 12 GB cards expect to unload the base model during the BMAB pass.
- **Detection prompt sensitivity** — "a hand" returns different results than "a malformed hand" or "a left hand". Detection-prompt tuning is a real iteration cost.
- **Architecture-specific node sets** — early BMAB versions were SDXL-only. FLUX compatibility shipped later. Verify the install supports the base model you're using.

### Apple Silicon (MPS)

Grounding-DINO runs on MPS but with stability caveats; SAM runs but is slow. For Mac persona workflows, prefer @entities/custom-nodes/impact-pack.md for the face pass and only invoke BMAB for full-body hand-repair when YOLO-based hand detection is insufficient. [NEEDS VERIFICATION 2026-05-11]

## Snippets

[Source: @entities/uis/comfyui.md custom-nodes table]
> "ComfyUI-BMAB — Grounding DINO-based post-processing for hand/limb repair"

[Source: @entities/hardware/gpu-guide.md]
> "Any model with heavy post-processing (BMAB, Impact-Pack detailers) [adds VRAM overhead]"
