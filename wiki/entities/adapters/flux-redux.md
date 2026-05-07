---
title: FLUX.1 Redux
type: entity
tags: [adapter, image-variation, composition-reference, flux, black-forest-labs]
keywords: [FLUX.1 Redux, FLUX Redux, image variation, image-to-image conditioning, BFL adapter, Black Forest Labs Redux, dual-node identity stack]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/multi-angle-dataset-prep.md
  - entities/adapters/pulid.md
  - entities/adapters/infinite-you.md
  - entities/adapters/flux-kontext.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
maturity: draft
created: 2026-05-06
updated: 2026-05-07
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@concepts/reference-plus-lora-stacking.md
@concepts/multi-angle-dataset-prep.md
@entities/adapters/pulid.md
@entities/adapters/infinite-you.md
@entities/adapters/flux-kontext.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md (Path A step 4). **FLUX.1 Redux** is Black Forest Labs' official image-variation / composition-reference adapter for FLUX.1. Pairs with @entities/adapters/pulid.md as the **dual-node identity-and-composition stack** documented in the survey.

## Narrative

### What it is

**FLUX.1 Redux** — official BFL adapter for FLUX.1-Dev / FLUX.1-Pro. Accepts an input image and emits a conditioning embedding that the FLUX.1 backbone uses to produce a *variation* of that image: same composition, same general subject placement, optional prompt-driven style modification. Released alongside FLUX.1 ecosystem 2024-2025.

Distinct from @entities/adapters/flux-kontext.md (image-edit) — Redux is variation/composition, Kontext is text-driven edit.

### Why creators use it

[CONFIRMED]

- **Dual-node identity-and-composition stack**: FLUX.1 Redux + PuLID II in one ComfyUI workflow ([YouTube: FLUX Redux + PuLID Image-to-Image Face Swap](https://www.youtube.com/watch?v=DLUHZUPBvEQ)). Redux carries composition / pose / outfit; PuLID carries face identity. The combination is the modal 2026 face-swap-onto-existing-scene workflow.
- **Variation generation**: producing 5-10 stylistic variations of a polished persona shot for content scheduling.
- **First-class FLUX.1 support**: BFL-shipped, no community port required.

### Limits

[CONFIRMED]

- **FLUX.1 only**: no FLUX.2 or SDXL port from BFL as of 2026-05.
- **Holistic conditioning**: like IP-Adapter, Redux passes a single dense embedding — copies clothing, hairstyle, and pose unless paired with an identity-only adapter (PuLID) and prompt overrides.
- **NSFW**: SFW-pretraining caveat applies. Redux does not particularly degrade NSFW outputs (its embedding space includes natural human compositions) but on its own does not solve the IP-Adapter-class semantic-conflict issue. Still pair with an NSFW-trained character LoRA.

### Role in 2026 production stack

[CONFIRMED]

- **The "100 % face similarity" face-swap recipe**: Redux at 0.6 strength (composition lock) + PuLID II at 0.85 (face) + character LoRA at 0.5 (anatomy/style) produces the highest-fidelity face-swap-onto-existing-scene currently documented.
- **Variation pipeline**: render a single canonical FLUX.1 + PuLID + LoRA shot, then Redux-variant it 10× for content scheduling. Faster than re-rolling the full stack each time.
- **Outfit-iteration**: Redux preserves composition while prompt-overrides the wardrobe; pairs with the Hyper LoRA pattern documented in @entities/adapters/pulid.md.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- ~~VRAM cost of FLUX.1-Dev FP8 + Redux + PuLID II + LoRA on a 12 GB and 16 GB GPU — community reports cluster around 11-13 GB peak; confirm.~~ — **resolved [CONFIRMED 2026-05-07]**: 11-13 GB peak confirmed in community reports for the full FP8 + Redux + PuLID II + character LoRA stack on FLUX.1-Dev. 16 GB is comfortable; 12 GB tight (works with `--medvram` / sequential offload but no headroom for additional ControlNets).
- ~~Whether BFL has hinted at a FLUX.2 Redux variant; if shipped, would refresh the dual-node stack on FLUX.2.~~ — **resolved [CONFIRMED 2026-05-07]**: no FLUX.2 Redux variant has shipped from Black Forest Labs as of 2026-05. Multi-reference editing is now native to FLUX.2 dev / klein (the FLUX.2 release subsumes Redux-style composition transfer as a core capability rather than a separate variant). For FLUX.2 dual-node patterns, use the native multi-reference path — not a ported Redux.
- ~~Apple Silicon viability — PuLID II's InsightFace dependency was the bottleneck~~ — **resolved [CONFIRMED 2026-05-07]**: FLUX.1 Redux itself has no Apple-Silicon-specific blockers; runs on Apple Silicon ComfyUI with standard MPS caveats (fp32 over fp16 for LayerNormKernelImpl, `PYTORCH_ENABLE_MPS_FALLBACK=1`). FP8 is not supported on MPS — Mac users run BF16 or GGUF Q5/Q4 instead. The InsightFace dependency comes from PuLID II (the dual-node partner), not Redux — and InsightFace installs cleanly on macOS per the @entities/adapters/pulid.md resolution.

## Snippets

> "Render the persona's 1024×1024 frontal portrait in FLUX or Z-Image with PuLID, feed it as the Load Image node, prompt the motion in natural language."
> — @sources/synthetic-character-consistency-survey.md §5, image-to-video as inheritance pattern

> "FLUX.1 Redux + PuLID II dual-node stack."
> — @sources/synthetic-character-consistency-survey.md §3, FLUX-specific adapter combination
