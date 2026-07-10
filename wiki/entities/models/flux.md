---
title: FLUX (FLUX.1, FLUX.2) — umbrella hub
type: entity
tags: [model, diffusion, mm-dit, t2i, black-forest-labs, flux, umbrella]
keywords: [FLUX.1, FLUX.2, FLUX.1-Dev, FLUX.1-Schnell, FLUX.1-Pro, FLUX.2-Dev, FLUX.2-Pro, FLUX.2-klein, FLUX.2-klein-9B, FLUX.2-klein-4B, Black Forest Labs, BFL, MMDiT, MM-DiT, flow-matching, T5 text encoder]
related:
  - sources/uncensored-image-generation-survey.md
  - sources/unireasoner.md
  - sources/synthetic-character-consistency-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/llm-as-image-conditioning.md
  - concepts/persona-consistency-methods.md
  - concepts/reference-plus-lora-stacking.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/adapters/pulid.md
  - entities/adapters/infinite-you.md
  - entities/adapters/flux-redux.md
  - entities/adapters/flux-kontext.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - entities/training-tools/ai-toolkit.md
  - entities/training-tools/fluxgym.md
  - concepts/de-censoring-techniques.md
  - entities/models/z-image-turbo.md
  - entities/models/qwen-image-2512.md
  - entities/models/ernie-image.md
  - entities/models/playground-v3.md
  - entities/models/kwai-kolors.md
  - entities/models/pixart-sigma.md
  - entities/models/sd3-deprecated.md
  - concepts/model-selection-workflow.md
  - entities/hardware/gpu-guide.md
  - entities/marketplaces/civitai.md
  - entities/uis/automatic1111.md
  - entities/uis/comfyui.md
  - entities/training-tools/heretic.md
maturity: validated
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/uncensored-image-generation-survey.md
@sources/unireasoner.md
@sources/synthetic-character-consistency-survey.md
@concepts/censorship-tier-taxonomy.md
@concepts/llm-as-image-conditioning.md
@concepts/persona-consistency-methods.md
@concepts/reference-plus-lora-stacking.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/adapters/pulid.md
@entities/adapters/infinite-you.md
@entities/adapters/flux-redux.md
@entities/adapters/flux-kontext.md
@entities/adapters/flux2-klein-9b-faceswap.md
@entities/training-tools/ai-toolkit.md
@entities/training-tools/fluxgym.md
@concepts/de-censoring-techniques.md
@entities/models/z-image-turbo.md
@entities/models/qwen-image-2512.md
@entities/models/ernie-image.md
@entities/models/playground-v3.md
@entities/models/kwai-kolors.md
@entities/models/pixart-sigma.md
@entities/models/sd3-deprecated.md
@concepts/model-selection-workflow.md
@entities/hardware/gpu-guide.md
@entities/marketplaces/civitai.md
@entities/uis/automatic1111.md

## Raw Concept

Umbrella hub for the FLUX family. Originally a thin stub created during the @sources/unireasoner.md ingest; promoted to umbrella when @sources/uncensored-image-generation-survey.md (Path A step 2) back-filled the per-version pages. The detailed coverage now lives at @entities/models/flux-1-dev.md (FLUX.1 Dev/Schnell/Pro) and @entities/models/flux-2-klein.md (FLUX.2 Klein 9B/4B). FLUX.2 Dev/Pro (32B titan) is documented inline below — no dedicated page since it's mostly out of reach for local consumer hardware (24 GB minimum with aggressive quantization; 90 GB unoptimized).

## Narrative

### Family overview

FLUX is the open-weight image-generation family from **Black Forest Labs (BFL)**. Two generations as of May 2026:

| Generation | Released | Architecture | Key innovation |
|---|---|---|---|
| **FLUX.1** | August 2024 | MMDiT flow-matching, 12B params, T5 + CLIP encoders | Eliminated SDXL-era spatial hallucinations and anatomical distortions; first DiT to land convincingly on consumer hardware |
| **FLUX.2** | November 2025 | MMDiT + expanded VLM backbone, scale-segmented (4B–32B) | Multi-reference conditioning, flawless typography, absolute photorealism |

### Per-variant navigation

| Variant | Page | Parameters | License | Use case |
|---|---|---|---|---|
| FLUX.1 Schnell | @entities/models/flux-1-dev.md | 12B distilled | Apache 2.0 | Commercial fast generation |
| FLUX.1 Dev | @entities/models/flux-1-dev.md | 12B | BFL Non-Commercial | Foundation of community fine-tuning + adapter ecosystem |
| FLUX.1 Pro | @entities/models/flux-1-dev.md | 12B (full) | Closed-source API | Out of scope for local |
| FLUX.2 Dev / Pro | (inline below) | 32B | BFL Non-Commercial / closed | Frontier; needs 24 GB+ even quantized |
| FLUX.2 Klein 9B | @entities/models/flux-2-klein.md | 9B | BFL Non-Commercial | Consumer sweet spot (12–16 GB) |
| FLUX.2 Klein 4B | @entities/models/flux-2-klein.md | 4B | BFL Non-Commercial | 8 GB tier bridge |

### FLUX.2 Dev / Pro (32B titan — inline)

[CONFIRMED, source @sources/uncensored-image-generation-survey.md §1.2]:

- **32B parameters.** ~90 GB VRAM in unoptimized FP16. Compresses to **24 GB** with SVDQ or GGUF quantization — the upper end of consumer hardware (RTX 3090/4090).
- **Excels at**: absolute photorealism, flawless typography, multi-reference conditioning.
- **Censorship tier**: Partial / Architectural — alignment is heavier than FLUX.1 Dev's; community LoRA injection alone may not suffice. Some users report needing weight-merging (TIES, DARE) with FLUX.1-uncensored donors.
- **License**: BFL Non-Commercial for Dev; closed API-only for Pro.
- **Hardware floor**: 24 GB. Below that, fall back to **Klein 9B** (12–16 GB) or **Klein 4B** (8–13 GB) — see @entities/models/flux-2-klein.md.

No dedicated page for FLUX.2 Dev/Pro because (a) it's not local-workflow viable for most readers, and (b) when it is, the Klein distills cover the same architectural lineage. Promote to a dedicated page if community 24 GB-tier workflows mature.

### Censorship overview (cross-version)

All FLUX variants sit at **Minimal** tier baseline (see @concepts/censorship-tier-taxonomy.md): no active refusal, but pre-training was sanitized of explicit anatomy. The de-censoring path:

- **LoRA injection** at 0.8–1.2 strength (modal pattern; see @concepts/reference-plus-lora-stacking.md).
- **Community merges** for FLUX.1: FLUX-UNCENSORED-Merged, Chroma1-HD, SNOFS.
- **Klein 9B as face-swap engine** for multi-pass NSFW pipelines — see @entities/adapters/flux2-klein-9b-faceswap.md.

The **non-commercial license** on Dev variants creates a downstream legal question for monetized NSFW workflows. Schnell-base merges (Apache 2.0) are the commercial-safe alternative.

### Adapter ecosystem (cross-version)

| Adapter | FLUX.1 status | FLUX.2 status |
|---|---|---|
| @entities/adapters/pulid.md (PuLID II) | Production | Port in development [NEEDS VERIFICATION 2026-05-06] |
| @entities/adapters/infinite-you.md | Production | Port unconfirmed [NEEDS VERIFICATION 2026-05-06] |
| @entities/adapters/flux-redux.md | Production | Production (FLUX.2 port shipped) |
| @entities/adapters/flux-kontext.md | Production | Production (FLUX.2 port shipped) |
| @entities/adapters/flux2-klein-9b-faceswap.md | n/a (FLUX.2-only role) | Production (uses Klein 9B as engine) |

### Role in UniReasoner

[CONFIRMED, source @sources/unireasoner.md]:

- **Benchmark competitor**: FLUX.1-Dev scores GenEval 0.66 / DPG-Bench 83.84. Strong on absolute photorealism categories (Single Obj. 0.98, DPG Relation 90.87), weak on compositional categories (Position 0.22, Attr. Binding 0.45) — the canonical understanding-generation-gap profile.
- **Hard-negative candidate generator**: UniReasoner's Stage-II finetuning uses FLUX.1-Dev to generate candidate images for prompts; Qwen-VL scores alignment; the *poorly-aligned* candidate becomes the visual draft `d`, the strictly-better real image becomes the target `I_t`. FLUX-Dev's known compositional failures are *useful* training signal in this context.

Per @concepts/llm-as-image-conditioning.md: FLUX uses T5 + CLIP as a high-capacity text encoder, but the conditioning signature is unchanged from the SD-1.x lineage — single dense embedding fed to the MM-DiT backbone. This is "stronger encoder, same conditioning shape" (role 2). UniReasoner's Draft-Evaluate-Diffuse pipeline (role 4) is what FLUX-class models would need to reach GenEval 0.88-class compositional faithfulness.

### Workspace TODO

- A dedicated `de-censoring-techniques.md` concept page should land in Path A step 2 session 2 (covering FLUX-UNCENSORED-Merged / Chroma1-HD / SNOFS / abliteration / TIES-DARE merging).
- A dedicated `flux-2-dev.md` page if 24 GB-tier workflows become a community focus.
- Confirm FLUX.2 port status of PuLID II, InfiniteYou — see @entities/adapters/pulid.md and @entities/adapters/infinite-you.md TODO blocks.

## Snippets

### FLUX architectural framing

> "FLUX models utilize a Multimodal Diffusion Transformer (MMDiT) flow-matching framework combined with a massive Vision-Language Model (VLM) backbone, virtually eliminating spatial hallucinations and anatomical distortions."

— @sources/uncensored-image-generation-survey.md §1.2

### FLUX-Dev as candidate generator (UniReasoner)

> "For a given prompt p, we generate a candidate image If using a state-of-the-art diffusion model FLUX. […] We use Qwen-VL to score semantic alignment between the prompt p and both the generated candidate If and the real image I. […] We select the poorly aligned candidate as the draft image Id (converted to tokens d) and the strictly better-aligned image as the final target It."

— @sources/unireasoner.md, Stage II Finetuning [Source: arXiv:2605.04040v1 p.7]
