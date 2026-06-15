---
title: FLUX.1 Kontext
type: entity
tags: [adapter, image-edit, prompt-driven-edit, flux, black-forest-labs]
keywords: [FLUX.1 Kontext, FLUX Kontext, image edit, prompt-driven edit, BFL Kontext, hair override, post-hoc edit, Character Turnaround Sheet LoRA]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - concepts/multi-angle-dataset-prep.md
  - entities/adapters/pulid.md
  - entities/adapters/flux-redux.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/uis/comfyui.md
  - concepts/causal-multi-turn-image-editing.md
  - sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md
  - entities/models/anchoredit.md
  - concepts/two-pass-generation-workflow.md
maturity: draft
created: 2026-05-06
updated: 2026-06-15
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@concepts/multi-angle-dataset-prep.md
@entities/adapters/pulid.md
@entities/adapters/flux-redux.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md (Path A step 4). **FLUX.1 Kontext** is Black Forest Labs' prompt-driven image-edit model — distinct from @entities/adapters/flux-redux.md (variation/composition) by being **edit-by-prompt**: take an existing image, apply a textual change, preserve everything else.

## Narrative

### What it is

**FLUX.1 Kontext** — BFL image-edit model. Accepts an input image plus an edit instruction in natural language ("change her hair to blonde", "remove the background", "add a coffee cup to the left hand") and emits a modified image with surgical changes applied to the targeted region while preserving the rest. Same FLUX.1-Dev backbone, specialised conditioning head.

The "Character Turnaround Sheet LoRA" by reverentelusarca ([RunComfy workflow](https://www.runcomfy.com/comfyui-workflows/flux-kontext-character-turnaround-sheet-lora)) is a *Kontext-trained LoRA* — same backbone, fine-tuned on turnaround-sheet pairs to emit five distinct angle views from a single input.

### Why creators use it

[CONFIRMED]

- **Hair override after PuLID**: PuLID preserves the reference hairstyle; running a Kontext edit pass after PuLID generation is the canonical fix for "PuLID gave me the wrong hair" ([myaiforce hyperlora comparison](https://myaiforce.com/hyperlora-vs-instantid-vs-pulid-vs-ace-plus/)).
- **Outfit iteration without re-rolling**: Kontext "swap outfit" prompts on a polished base persona shot are faster than full re-generation with prompt variation.
- **Character turnaround generation**: Kontext-LoRA + reference image emits 5 angles in one pass — faster than Wan 2.2 I2V frame extraction, lossier on subtle facial geometry but cleaner backgrounds.
- **Background swap / removal**: trivial via prompt; cleaner than ComfyUI background-swap inpaint chains.

### Limits

[CONFIRMED]

- **FLUX.1 only**: no FLUX.2 Kontext yet from BFL.
- **Edit precision varies**: simple swaps (hair, outfit, background) are reliable; physically meaningful edits (pose change, anatomy swap) regress to full-rerender behaviour and identity drift accelerates.
- **NSFW alignment**: same SFW-pretraining caveat as the FLUX.1 family. Use for SFW post-processing on persona shots; don't expect Kontext to handle explicit edits without custom LoRA support.

### Role in 2026 production stack

[CONFIRMED]

- **Post-hoc edit pass**: end-of-pipeline Kontext step for hair/outfit/background corrections. Pairs cleanly with the PuLID + LoRA stack.
- **Multi-angle dataset prep (faster path)**: Kontext-LoRA Character Turnaround Sheet emits 5 angles per pass; faster than Wan I2V (Section 4 of @sources/synthetic-character-consistency-survey.md).
- **Outfit variation (single-input)**: paired with `wildcards` extension for randomised outfit slots while skin-tone stays pinned.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- ~~VRAM cost on FLUX.1-Dev FP8 + Kontext on a 12 GB GPU — community claim ~10 GB peak; confirm.~~ — **resolved [CONFIRMED 2026-05-07]**: 12 GB confirmed sufficient for FLUX.1-Dev FP8 + Kontext (community reports: "It runs fine in 12 GB"); peak ~10-11 GB with standard ComfyUI Kontext workflows.
- ~~Whether the Character Turnaround Sheet LoRA covers all the angle classes documented in the Mickmumpitz 3.8 96-angle pipeline (it covers 5; Mickmumpitz covers 96).~~ — **resolved [CONFIRMED 2026-05-07]**: no — the Character Turnaround Sheet LoRA is a 5-angle composition (front, ¾ left, profile-left, ¾ right, profile-right); Mickmumpitz's 96-angle pipeline is a different workflow (Wan-2.2 I2V frame extraction across continuous orbit). The two are complementary, not equivalent: Kontext-LoRA for fast 5-angle dataset prep, Wan I2V for dense angle coverage.
- ~~FLUX.2 Kontext release roadmap — would change the 2026 edit-pipeline default if shipped.~~ — **resolved [CONFIRMED 2026-05-07]**: no FLUX.2 Kontext variant has shipped from Black Forest Labs as of 2026-05. Multi-reference editing is now native to FLUX.2 dev / klein (the FLUX.2 release subsumes Kontext-style edit-by-prompt as a core capability rather than a separate variant). The 2026 edit-pipeline default is therefore: FLUX.1 Kontext for FLUX.1-Dev workflows; native FLUX.2 dev/klein edits for FLUX.2 workflows.
- ~~Apple Silicon viability — same FP8 ComfyUI path~~ — **resolved [CONFIRMED 2026-05-07]**: FLUX.1 Kontext runs on Apple Silicon ComfyUI with standard MPS caveats (fp32 over fp16 for LayerNormKernelImpl, `PYTORCH_ENABLE_MPS_FALLBACK=1`). Note that **FP8 is not supported on MPS** — Apple Silicon users run the BF16 base or GGUF Q5/Q4 quantisations instead. Latency is 2-4× NVIDIA; image-edit pass quality unchanged.

## Snippets

> "FLUX Kontext Character Turnaround Sheet LoRA by reverentelusarca — a specialised LoRA trained on turnaround-sheet pairs that takes a single illustration and emits five distinct angle views as one composition. Trained with Ostris ai-toolkit. Faster than Wan extraction, cleaner backgrounds, but lossier on subtle facial geometry."
> — @sources/synthetic-character-consistency-survey.md §4, multi-angle dataset prep

> "For hairstyle changes, run a Kontext edit pass after PuLID generation to override hair specifically."
> — @sources/synthetic-character-consistency-survey.md §6, hair and clothing copy-paste from reference
