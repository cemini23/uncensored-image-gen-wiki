---
title: PuLID (PuLID, PuLID-FLUX-v0.9.1, PuLID-Flux II)
type: entity
tags: [adapter, identity-injection, pulid, flux, sdxl, sd15, bytedance]
keywords: [PuLID, PuLID-FLUX, PuLID II, PuLID-Flux II, ByteDance, Pure and Lightning ID Customization, identity adapter, FLUX face adapter, model pollution]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - entities/adapters/ip-adapter.md
  - entities/adapters/instantid.md
  - entities/adapters/consistentid.md
  - entities/adapters/infinite-you.md
  - entities/adapters/photomaker-v2.md
  - entities/adapters/characonsist.md
  - entities/adapters/flux-redux.md
  - entities/adapters/flux-kontext.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - concepts/reference-plus-lora-stacking.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - sources/video-generation-survey-2026.md
  - concepts/video-identity-inheritance.md
  - concepts/model-selection-workflow.md
  - entities/marketplaces/civitai.md
  - entities/uis/comfyui.md
maturity: draft
created: 2026-05-06
updated: 2026-05-07
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@entities/adapters/ip-adapter.md
@entities/adapters/instantid.md
@entities/adapters/consistentid.md
@entities/adapters/infinite-you.md
@entities/adapters/photomaker-v2.md
@entities/adapters/characonsist.md
@entities/adapters/flux-redux.md
@entities/adapters/flux-kontext.md
@entities/adapters/flux2-klein-9b-faceswap.md
@concepts/reference-plus-lora-stacking.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@sources/video-generation-survey-2026.md
@concepts/video-identity-inheritance.md

## Raw Concept

Entity stub created during back-fill of @sources/synthetic-character-consistency-survey.md. PuLID is the dominant 2025-2026 face identity adapter on FLUX, the photoreal-and-skin-fidelity successor to @entities/adapters/ip-adapter.md FaceID variants on SDXL.

## Narrative

### What it is

**PuLID** ("Pure and Lightning ID Customization") — face identity adapter from **ByteDance**. Same idea as IP-Adapter FaceID but with a cleaner training objective that keeps the face embedding more disentangled from style, lighting, and pose attributes ("ID-only" instead of "holistic image"). [Source: [github.com/ToTheBeginning/PuLID](https://github.com/ToTheBeginning/PuLID)]

Three lineage stages:

| Variant | Backbone | Notes |
|---|---|---|
| **PuLID (original)** | SD 1.5 / SDXL | First release; superseded for SDXL by FaceID-Plus-V2 in many workflows |
| **PuLID-FLUX-v0.9.1** | FLUX.1-Dev | The FLUX face-adapter standard. Most-used 2025-2026 |
| **PuLID-Flux II** ("PuLID II") | FLUX.1-Dev / FLUX.2 | Cleaner skin-tone preservation, refined ID disentanglement; current 2026 default |

### Why creators use it on FLUX

[CONFIRMED]

- **Higher face fidelity** than IP-Adapter FaceID-Plus-V2 on FLUX backbones.
- **Single-image conditioning** that scales to a couple-second-per-pass overhead at 1024 px on a 12-16 GB GPU.
- **Compatible with character LoRAs** in the standard 2026 stack (LoRA at 0.85 + PuLID at 0.45).
- **Strong with FLUX.1 Redux** as a dual-node identity-and-composition stack ([YouTube: FLUX Redux + PuLID II](https://www.youtube.com/watch?v=DLUHZUPBvEQ)).

### Known failure modes

[CONFIRMED]

1. **Skin-tone drift / colour pollution.** When the reference image has warm or cool lighting, PuLID generations skew that direction. Worse on PuLID-FLUX-v0.9.1, partially fixed on PuLID-Flux II. Mitigation: 0.15-0.25 denoise img2img colour-correct pass at end, ColorMatch / HSV-shift node, or [Perturbed Attention Guidance](https://www.youtube.com/watch?v=5RV793RiC6c) + ColorPeel/Color Me Correctly stack.
2. **Hairstyle copy-paste.** PuLID preserves hairstyle from the reference even when prompt asks for a different one. Documented as trained behaviour ([myaiforce hyperlora comparison](https://myaiforce.com/hyperlora-vs-instantid-vs-pulid-vs-ace-plus/)). Production fix: Hyper LoRA for hair, or post-hoc Kontext edit.
3. **NSFW anatomy degradation.** Inherits some of the IP-Adapter family's SFW-pretraining issue — semantic conflict on clothed-reference + nude-prompt. Less severe than IP-Adapter FaceID but present at high strength. Mitigation: NSFW LoRA at 0.85 + PuLID at 0.45 (modal stack); or two-pass face-inpaint pattern.
4. **"Model pollution" in long sessions.** [PuLID II model card / RunComfy framing](https://www.runcomfy.com/comfyui-workflows/pulid-flux-ii-in-comfyui-consistent-character-ai-generation): repeated PuLID calls in a long ComfyUI session accumulate floating-point error on the FLUX text encoder, subtly shifting identity over 100+ generations. Reload the workflow every ~50 generations; ComfyUI 0.3.39+ fixed the worst.

### Role in 2026 production stack

[CONFIRMED]

- **The 2026 modal photoreal-persona FLUX stack** uses **PuLID-Flux II + character LoRA + 0.15 denoise refinement pass**. PuLID II at 0.45-0.55 strength, LoRA at 0.85.
- **For "100 % face similarity"** workflows: render explicit composition without PuLID first, then face-inpaint the masked face region with PuLID at 0.9 ([medium.com Wei Mao](https://medium.com/@wei_mao/100-face-similarity-the-ultimate-face-swap-workflow-better-than-any-pulid-instantid-b7fa2daa5659)).
- **Compared to InstantID**: PuLID has higher fidelity, InstantID has more colour stability. The 2026 community choice is PuLID for face quality + a colour-correct pass to handle skin-tone drift.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- Whether PuLID II ships a FLUX.2 backbone variant or whether the 2025-2026 model is FLUX.1 Dev only. ([NEEDS VERIFICATION 2026-05-06])
- ~~Apple Silicon (MPS) compatibility — InsightFace dependency issues on macOS in late 2025~~ — **resolved [CONFIRMED 2026-05-07]**: PuLID FLUX runs on Apple Silicon ComfyUI with standard MPS caveats (force fp32 over fp16 for the LayerNormKernelImpl-fp16 issue; set `PYTORCH_ENABLE_MPS_FALLBACK=1` for any unsupported ops). InsightFace installs via `pip install insightface onnxruntime` (the late-2025 dependency issues were resolved upstream; the `onnxruntime-silicon` package ships universal2 wheels). Throughput on M3/M4 Pro/Max is 2-5× slower than equivalent NVIDIA but fully functional for single-shot persona generation.
- VRAM cost on a 12 GB GPU with FLUX.1-Dev FP8 + PuLID II — community claim ~10-11 GB peak.
- Whether the FLUX.2 Klein 9B base supports PuLID II directly or requires a different adapter (current path is FLUX.2 Klein face-swap, not PuLID).

## Snippets

> "PuLID followed by a refining pass for skin tone is probably the highest quality."
> — community consensus, [r/StableDiffusion: Is InstantID + Canny still the best method in 2025](https://www.reddit.com/r/StableDiffusion/comments/1p22zbb/is_instantid_canny_still_the_best_method_in_2025/)

> "PuLID preserves hairstyle from the reference image even when the prompt asks for a different one; this is a trained behaviour, not a bug. For wardrobe variation, use Hyper LoRA (or a custom outfit LoRA) instead of stacking PuLID."
> — @sources/synthetic-character-consistency-survey.md §6, hair/clothing carry-over

> "Repeated CLIP/T5 calls in long ComfyUI sessions occasionally accumulate floating-point error that subtly shifts identity over 100+ generations. Reload the workflow every ~50 generations or use ComfyUI 0.3.39+ which fixed the worst of the issue."
> — @sources/synthetic-character-consistency-survey.md §6, long-session text-encoder drift

## Dead Ends

- **PuLID at strength 0.9+ on a clothed reference for NSFW output** [RETRACTED]. Produces alien anatomy via the same semantic-conflict mechanism as IP-Adapter FaceID. Use the two-pass pattern instead: explicit composition first, face-only inpaint with PuLID after.
- **PuLID II as standalone (no character LoRA) for NSFW** [RETRACTED]. Skin-tone drift + thin NSFW coverage means the result lacks anatomical fidelity. The character LoRA carries the explicit anatomy; PuLID only nudges face.
