---
title: "ComfyUI-Impact-Pack (face/hand detection + detailer suite)"
type: entity
tags: [comfyui, custom-node, detailer, face-detection, inpainting, post-processing, adetailer-equivalent]
keywords: [Impact-Pack, ltdrdata, ImpactPack, FaceDetailer, MaskDetailerPipe, KSampler-detailer, SAMLoader, UltralyticsDetectorProvider, BBOX-detection, SEGM-detection, regional-sampling]
related:
  - entities/uis/comfyui.md
  - entities/hardware/gpu-guide.md
  - entities/custom-nodes/bmab.md
  - concepts/two-pass-generation-workflow.md
  - concepts/persona-consistency-methods.md
  - runbooks/runpod-comfyui-setup.md
  - runbooks/day-1-checklist-for-friend.md
  - runbooks/beginner-guide-to-persona.md
maturity: draft
created: 2026-05-11
updated: 2026-05-11
---

## Relations

@entities/uis/comfyui.md @entities/hardware/gpu-guide.md @entities/custom-nodes/bmab.md
@concepts/two-pass-generation-workflow.md @concepts/persona-consistency-methods.md
@runbooks/runpod-comfyui-setup.md @runbooks/day-1-checklist-for-friend.md @runbooks/beginner-guide-to-persona.md

## Raw Concept

Page prompted by 2026-05-11 migration of `notes/frameworks-tools.md` into the wiki layer. Impact-Pack was already referenced across the wiki (custom-node table in @entities/uis/comfyui.md, install lines in three runbooks) but lacked a dedicated entity page; this page consolidates its role as the canonical detailer / face-and-hand correction suite for ComfyUI workflows.

Repo: `github.com/ltdrdata/ComfyUI-Impact-Pack`. Maintainer: Dr.Lt.Data (`ltdrdata`).

## Narrative

### What it does

Impact-Pack is the de-facto **ADetailer equivalent for ComfyUI**: it ships detector nodes that automatically identify faces, hands, eyes, or arbitrary regions and route those crops to secondary KSamplers for localized re-generation. This pattern is foundational to the post-processing pass in @concepts/two-pass-generation-workflow.md and to face-consistency stabilization in @concepts/persona-consistency-methods.md.

Core node families:

- **Detector providers** — `UltralyticsDetectorProvider` (BBOX + SEGM) and `SAMLoader` (Segment Anything Model integration); detect faces/hands/eyes via pre-trained YOLO/SAM checkpoints.
- **Detailers** — `FaceDetailer`, `MaskDetailerPipe`, and `DetailerForEach`; run a second-pass KSampler on the detected region at higher denoise (~0.4-0.5) to repair distortions.
- **Regional samplers** — split a single canvas across multiple prompts/LoRAs, useful for multi-character scenes.
- **Iterative refinement** — `RegionalSampler` plus `ImpactSEGSToPipe` enables looped re-detailing.

Companion repo: **ComfyUI-Inspire-Pack** (`github.com/ltdrdata/ComfyUI-Inspire-Pack`) — prompt/control routing + batch processing; commonly installed alongside Impact-Pack.

### Install path

Standard ComfyUI custom-node install:

```
cd ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git
cd ComfyUI-Impact-Pack && python install.py
```

Pulls in `ultralytics`, `segment-anything`, and several YOLO checkpoints on first run. The post-install script downloads default detector models (~200 MB) — verify network connectivity before launching.

Verified in 2026 against ComfyUI v0.4.x. See @runbooks/runpod-comfyui-setup.md for the canonical RunPod install sequence (Impact-Pack ships in the default custom-node bootstrap list there).

### Where it fits

| Phase | Role |
|---|---|
| T2I composition | Not used (Impact-Pack runs post-generation) |
| I2I refinement | Optional — used for masked region passes |
| **Inpainting / detailing** | Primary use — face/hand detection → KSampler re-pass |
| Upscaling | Often combined: detailer pass → upscale → final detailer pass |

For persona workflows the canonical pattern is: base generation (T2I) → swap face via @entities/adapters/pulid.md or @entities/adapters/ip-adapter.md → **FaceDetailer pass** to repair the face-swap seam → upscale.

### Failure modes

- **Detector model mismatch** — base YOLO checkpoints are trained on photographic faces; can miss anime/illustrated faces. Fix by swapping in anime-specific detectors (`bbox/face_yolov8m-anime.pt`, `bbox/hand_yolov8s.pt`) from the community model index.
- **Over-detailing** — denoise too high (>0.6) on the detailer pass causes the face to drift from the base composition. Keep denoise 0.3–0.5 for consistency-critical work.
- **VRAM amplification** — detailer pass adds ~2-4 GB on top of base inference. On 8 GB cards, run detailer-pass with model unloaded between primary KSampler and detailer (use `--lowvram` or chained "purge cache" nodes).

### Apple Silicon (MPS)

Impact-Pack itself is pure-Python orchestration and runs on MPS without modification. The detector backbones (YOLO via Ultralytics) run on MPS through PyTorch; SAM runs on MPS but is slow (~3-5× CPU). For Mac workflows prefer YOLO-based detection.

## Snippets

[Source: github.com/ltdrdata/ComfyUI-Impact-Pack — README]
> "This extension offers various detector nodes and detailer nodes that allow you to configure a workflow that automatically enhances facial details."

[Source: @entities/uis/comfyui.md custom-nodes table]
> "ComfyUI-Impact-Pack — Face/hand detection, detailer nodes, regional KSampler"
