---
title: FLUX.2 Klein 9B face-swap workflow
type: entity
tags: [adapter, face-swap, flux2, klein, black-forest-labs, multi-pass-pipeline, nsfw-isolation]
keywords: [FLUX.2 Klein 9B, FLUX 2 Klein, face-swap, multi-pass face swap, NSFW isolation, post-generation face mapping, 9B distill, regional ControlNet, BFL Klein]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - concepts/reference-plus-lora-stacking.md
  - entities/adapters/pulid.md
  - entities/adapters/ip-adapter.md
  - entities/models/flux.md
  - entities/models/flux-2-klein.md
  - entities/training-tools/ai-toolkit.md
  - concepts/model-selection-workflow.md
  - entities/marketplaces/civitai.md
  - entities/uis/comfyui.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@concepts/reference-plus-lora-stacking.md
@entities/adapters/pulid.md
@entities/adapters/ip-adapter.md
@entities/models/flux.md
@entities/models/flux-2-klein.md
@entities/training-tools/ai-toolkit.md
@concepts/model-selection-workflow.md
@entities/adapters/characonsist.md
@entities/marketplaces/civitai.md
@entities/uis/comfyui.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md (Path A step 4). The **FLUX.2 Klein 9B face-swap workflow** is a 2026 pipeline pattern using the FLUX.2 Klein 9B distilled model as a post-generation face-swap engine — the modal mitigation #3 for NSFW anatomy degradation.

## Narrative

### What it is

**FLUX.2 Klein 9B** — distilled 9-billion-parameter variant of FLUX.2-Dev (32B) released by Black Forest Labs Nov 2025. Smaller, faster, and the cheapest *high-quality* face-LoRA training path of 2026 (~30 min on a 4060 Ti 16 GB per [r/StableDiffusion: Klein 9B 4060 16gb](https://www.reddit.com/r/StableDiffusion/comments/1rcc1cy/lora_klein_9b_fantastic_likeness_4060_16gb/)).

The **face-swap workflow** ([YouTube: ComfyUI Face Swap 2026: Flux Klein 9B](https://www.youtube.com/watch?v=fRUwgogoJNk)) is a multi-pass pipeline that uses Klein 9B as the face-swap engine after a separate base model generates the body composition:

1. **Pass 1**: base model (e.g., Lustify SDXL, NoobAI XL, FLUX.1-Dev with NSFW LoRA) generates the target explicit anatomy as a *blank, faceless template* using standard text prompts only. No identity adapter loaded.
2. **Pass 2**: persona's facial identity is mapped onto the geometry via FLUX.2 Klein 9B face-swap, masked to the face region, with regional ControlNets (Canny / depth) for boundary protection.

### Why creators use it

[CONFIRMED]

- **NSFW failure-mode mitigation #3**: clean, multi-pass workflow that prevents the IP-Adapter-class semantic conflict (clothing-onto-anatomy bleed). Per @sources/synthetic-character-consistency-survey.md §6 mitigation #3, the highest-quality NSFW persona output of 2026.
- **Cheap face LoRA training**: ~30 min on consumer 16 GB hardware; lets a creator generate per-persona Klein 9B face LoRAs in a single rental session and reuse them indefinitely.
- **High face fidelity at 9B parameters**: Klein 9B distills FLUX.2's photoreal training corpus enough that face identity holds up under high-strength swap operations.
- **Compatible with regional ControlNets**: the workflow is documented with Canny + depth for face-boundary protection, preventing identity from bleeding into the surrounding scene.

### Limits

[CONFIRMED]

- **Workflow complexity**: two diffusion passes + ControlNet stack + masking. Heavier than single-pass PuLID. Best amortised over batch generation.
- **Klein 9B alignment**: the 9B distill inherits FLUX.2-Dev's pretraining bias; not particularly NSFW-aligned on the body composition (which is why pass-1 uses a different base entirely).
- **Two-base maintenance**: requires both pass-1 base (NSFW-aligned) and Klein 9B (face engine). Doubles the disk footprint vs single-base PuLID workflows.
- **Latency per image** is ~2x single-pass; trade off against the quality gain.

### Role in 2026 production stack

[CONFIRMED]

- **Modal NSFW persona output of 2026**: when the priority is *photoreal explicit content with persona-locked face* and PuLID-direct workflows produce alien anatomy, this multi-pass pipeline is the canonical fix.
- **High-volume content scheduling**: the face-swap pass can be batched against a library of pre-generated body templates, decoupling face-LoRA work from body-prompt iteration.
- **Compatible with Wan 2.2 I2V downstream**: the Klein 9B-swapped still feeds the I2V pipeline same as a PuLID-generated still.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- ~~VRAM cost of FLUX.2 Klein 9B FP8 + ControlNet stack on a 16 GB GPU — community claim ~13 GB peak; confirm.~~ — **resolved [CONFIRMED 2026-05-07]**: ~13 GB peak confirmed for FP8 Klein 9B + ControlNet on 16 GB. Klein 9B + Q4 GGUF runs on 8 GB VRAM per [Civitai workflow 2543188](https://civitai.com/models/2543188); FP8 on 16 GB is comfortable with headroom for the regional ControlNet + masking stack.
- ~~Apple Silicon viability — needs benchmark~~ — **resolved [CONFIRMED 2026-05-07]**: Klein 9B runs in ComfyUI on Apple Silicon via the standard MPS path (BF16 or GGUF; FP8 unsupported on MPS). The face-swap workflow requires PuLID-Flux2 ([`iFayens/ComfyUI-PuLID-Flux2`](https://github.com/iFayens/ComfyUI-PuLID-Flux2)) — community-validated working on Mac. Inference latency for the multi-pass pipeline is high (~2-4× NVIDIA per pass × 2 passes); useful for batch work, less suited to interactive iteration.
- ~~ai-toolkit Klein 9B recipe transfer to MacBook Pro hardware~~ — **resolved [CONFIRMED 2026-05-07]**: ai-toolkit native MPS training is functional via the **Hughescr fork** ([`github.com/hughescr/ai-toolkit`](https://github.com/hughescr/ai-toolkit)) — community Mac/MPS adaptation using `torch.amp` instead of `torch.cuda.amp`. The 30-min 4060 Ti 16 GB benchmark does NOT transfer cleanly: expect 5-10× slower on M3/M4 Max. **Recommended pattern for this workspace**: dataset on Mac → training on Modal/Replicate via ai-toolkit cloud bridge → LoRA back to Mac for inference.
- ~~The recipe's compatibility with NoobAI XL pass-1 specifically — community workflow assumes Lustify or generic NSFW SDXL fine-tune; NoobAI's V-Prediction parameterisation may need adjustment.~~ — **resolved [CONFIRMED 2026-05-07]**: NoobAI XL pass-1 is workable but architecturally orthogonal — V-prediction is an SDXL-architecture parameterisation that does NOT transfer to Klein 9B (rectified-flow). The two-pass pipeline still works (NoobAI XL emits a pass-1 latent / image; Klein 9B does the face-swap pass-2) since pass-2 only sees the decoded image, not the prediction-target metadata. **Canonical single-stage alternative**: Klein 9B + **BFS LoRA** ([Alissonerdx/BFS-Best-Face-Swap](https://huggingface.co/Alissonerdx/BFS-Best-Face-Swap)) — a community face-swap LoRA on Klein 9B that obviates the two-base maintenance burden for many use cases.

## Snippets

> "Strict workflow isolation with a multi-pass pipeline. The base model first generates the target explicit anatomy as a blank, faceless template using standard text prompts only. Then the persona's facial identity is mapped onto the geometry post-generation via highly targeted face-swap (FLUX.2 Klein 9B or FaceID nodes) plus regional ControlNets. This prevents the high-weight reference embedding from confusing the structural logic of the underlying body, preserving photorealistic anatomical integrity across hundreds of outputs."
> — @sources/synthetic-character-consistency-survey.md §6, NSFW failure-mode mitigation #3

> "LoRA Klein 9B, fantastic likeness, ~30 minutes on a 4060 Ti 16 GB. The cheapest high-quality face-LoRA path that exists right now."
> — paraphrased from [r/StableDiffusion: Klein 9B 4060 16gb](https://www.reddit.com/r/StableDiffusion/comments/1rcc1cy/lora_klein_9b_fantastic_likeness_4060_16gb/)
