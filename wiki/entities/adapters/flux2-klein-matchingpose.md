---
title: FLUX.2 Klein 9B MatchingPose LoRA
type: entity
tags: [adapter, lora, flux2, klein, pose-transfer, persona-consistency, comfyui]
keywords: [Flux.2-Klein-9B-MatchingPose, matchingpose9b, mannequin pose, pose transfer, character consistency, ComfyUI LoRA]
related:
  - sources/hf-flux2-klein-9b-matchingpose.md
  - entities/models/flux-2-klein.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - entities/adapters/pulid.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - entities/uis/comfyui.md
  - concepts/model-selection-workflow.md
  - sweeps/2026-07-04-daily.md
  - concepts/stage-aware-lora-distribution-calibrated-selection.md
  - entities/custom-nodes/comfyui-angelo.md
maturity: draft
created: 2026-07-04
updated: 2026-07-04
---

## Relations

@sources/hf-flux2-klein-9b-matchingpose.md @entities/models/flux-2-klein.md @entities/adapters/flux2-klein-9b-faceswap.md @entities/adapters/pulid.md @concepts/persona-consistency-methods.md @concepts/video-identity-inheritance.md @entities/uis/comfyui.md @concepts/model-selection-workflow.md

## Raw Concept

Created from the 2026-07-04 sweep's Flux.2 Klein MatchingPose Hugging Face row. It is not a paper; it is an immediately usable LoRA/model-card adoption candidate for David's persona image workflow.

## Narrative

**MatchingPose** is a FLUX.2 Klein 9B LoRA that makes pose transfer cleaner by splitting structure and identity. Instead of asking FLUX to copy a full human reference pose (which also leaks the source person's face, clothes, and lighting), the workflow first converts the pose image into a mannequin. MatchingPose then rebuilds the target character around that mannequin pose.

### Workflow

```text
Pose reference photo
  -> Flux.2 Klein Mannequin LoRA
  -> clean mannequin pose
  -> MatchingPose LoRA + character/face reference
  -> target persona in same pose
```

Use trigger `matchingpose9b` at the start of the positive prompt. In ComfyUI, place the safetensors file under `ComfyUI/models/loras/` and load it in the Klein 9B graph.

### Why David should smoke-test it

This is a direct answer to a recurring persona-production problem: pose consistency across characters without training a new ControlNet or building a full multi-angle dataset first. It is especially useful for:

| Need | MatchingPose role |
|------|-------------------|
| Recreate a proven pose from a real/persona reference | Normalize it to mannequin first |
| Produce several outfit variants with the same body orientation | Keep mannequin constant, vary style/outfit |
| Build video master frames before Wan I2V | Generate clean, repeatable pose anchors |
| Avoid source-person identity contamination | Mannequin strips identity before character generation |

Phase-0 verdict: **GO (smoke-test)**. The model-card license says Apache-2.0 for the LoRA; base-model terms for FLUX.2 Klein still apply. It is narrow enough to test locally without changing the canonical stack.

## Snippets

Prompt skeleton:

```text
matchingpose9b, [persona description], matching the mannequin reference pose,
[outfit], [lighting], [camera/lens], high detail
```

## Dead Ends

- **Using it as a de-censoring LoRA**: not its job. Pair with explicit-anatomy LoRAs or the existing FLUX/Pony two-pass stack when needed.
- **Replacing PuLID**: no. MatchingPose controls body pose; PuLID/native multi-reference controls identity.
