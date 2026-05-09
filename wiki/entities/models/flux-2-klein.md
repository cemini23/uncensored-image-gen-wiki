---
title: FLUX.2 Klein (9B / 4B distills)
type: entity
tags: [model, flux, flux-2, klein, mm-dit, dit, black-forest-labs, minimal-censorship, distilled, 8gb-vram, 9b, 4b]
keywords: [FLUX.2 Klein, FLUX.2 Klein 9B, FLUX.2 Klein 4B, Black Forest Labs, BFL, sub-second inference, 8-13GB VRAM, multi-reference conditioning, photorealism]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/prompt-engineering-uncensored.md
  - concepts/two-pass-generation-workflow.md
  - sources/synthetic-character-consistency-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/lora-taxonomy.md
  - concepts/character-dna-templates.md
  - concepts/reference-plus-lora-stacking.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - entities/adapters/pulid.md
  - entities/adapters/flux-redux.md
  - entities/adapters/flux-kontext.md
  - entities/training-tools/ai-toolkit.md
  - concepts/de-censoring-techniques.md
  - entities/models/z-image-turbo.md
  - sources/video-generation-survey-2026.md
  - concepts/video-identity-inheritance.md
  - concepts/multi-angle-dataset-prep.md
  - concepts/model-selection-workflow.md
  - entities/hardware/gpu-guide.md
  - entities/marketplaces/civitai.md
  - entities/uis/automatic1111.md
  - entities/uis/comfyui.md
  - entities/uis/forge.md
maturity: draft
created: 2026-05-06
updated: 2026-05-07
---

## Relations

@sources/uncensored-image-generation-survey.md
@sources/synthetic-character-consistency-survey.md
@concepts/censorship-tier-taxonomy.md
@concepts/lora-taxonomy.md
@concepts/character-dna-templates.md
@concepts/reference-plus-lora-stacking.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/adapters/flux2-klein-9b-faceswap.md
@entities/adapters/pulid.md
@entities/adapters/flux-redux.md
@entities/adapters/flux-kontext.md
@entities/training-tools/ai-toolkit.md
@concepts/de-censoring-techniques.md
@entities/models/z-image-turbo.md
@sources/video-generation-survey-2026.md
@concepts/video-identity-inheritance.md
@concepts/multi-angle-dataset-prep.md
@concepts/model-selection-workflow.md
@concepts/prompt-engineering-uncensored.md
@concepts/two-pass-generation-workflow.md
@entities/hardware/gpu-guide.md
@entities/marketplaces/civitai.md
@entities/uis/automatic1111.md
@entities/uis/forge.md

## Raw Concept

The consumer-hardware face of the FLUX.2 generation. **FLUX.2 Klein 9B** and **FLUX.2 Klein 4B** are distillations of the FLUX.2 architecture (the 32B Dev/Pro behemoth) tuned for sub-second inference on 8–16 GB consumer GPUs. The 4B specifically fits 8–13 GB VRAM, making it the bridge between the FLUX.2 capability ceiling and 8 GB-tier creators. Released **November 2025**. Back-filled from @sources/uncensored-image-generation-survey.md §1.2 (FLUX.2 segment).

## Narrative

### What it is

**FLUX.2 Klein** — distilled siblings of the FLUX.2 generation by **Black Forest Labs**. Released **November 2025**. Two parameter scales:

| Variant | Parameters | VRAM target | Speed |
|---|---|---|---|
| **FLUX.2 Klein 9B** | 9B | 12–16 GB consumer cards | Sub-second inference at 1024×1024 |
| **FLUX.2 Klein 4B** | 4B | 8–13 GB consumer cards | Sub-second; the 8 GB bridge |

Architecture: same MMDiT + VLM-backbone foundation as FLUX.1 (see @entities/models/flux-1-dev.md), but expanded — FLUX.2 added multi-reference conditioning, flawless typography, and stronger absolute photorealism. The Klein distills are quality-tradeoff variants of that capability for consumer-grade VRAM.

The FLUX.2 generation segments by **parameter scale** rather than just license:

| FLUX.2 variant | Parameters | VRAM (FP16) | Use case |
|---|---|---|---|
| **FLUX.2 Dev / Pro** | 32B | 90 GB unoptimized; 24 GB with SVDQ/GGUF | Frontier photorealism, multi-reference, typography |
| **FLUX.2 Klein 9B** | 9B | 12–16 GB | Consumer sweet spot |
| **FLUX.2 Klein 4B** | 4B | 8–13 GB | 8 GB tier bridge |

This page covers the Klein distills. Klein 9B has its own role as the **face-swap engine** in NSFW workflows — see @entities/adapters/flux2-klein-9b-faceswap.md.

### Why creators use it

[CONFIRMED]:

- **Sub-second inference** at 1024×1024 on consumer cards. Inference latency budget shrinks the gap between "draft" and "finished" so much that workflows shift from sequential to interactive.
- **8 GB VRAM compatibility** (Klein 4B) — keeps low-end users on the FLUX.2 capability curve without dropping back to SDXL/Pony.
- **Multi-reference conditioning carries from FLUX.2** — give the model 2–4 reference images and it composes them, not just one. Important for persona work that needs identity + outfit + scene from separate references.
- **Better typography than FLUX.1** — generates readable text-in-image at FLUX.2-class quality, rare for distilled-variants.

### Why creators avoid it (relative to FLUX.1 Dev)

[TENTATIVE]:

- **Adapter ecosystem still catching up.** PuLID, InfiniteYou, Redux, Kontext all originally targeted FLUX.1; FLUX.2-port status varies as of May 2026:
  - **PuLID II** — [CONFIRMED 2026-05-06] **first PuLID port to FLUX.2 is shipped** via `iFayens/ComfyUI-PuLID-Flux2` ([github.com/iFayens/ComfyUI-PuLID-Flux2](https://github.com/iFayens/ComfyUI-PuLID-Flux2)). Auto-detects Klein 4B / Klein 9B / FLUX.2 Dev. InsightFace + EVA-CLIP pipeline. Note: FLUX.2 has a different block structure (Klein: 5 double / 20 single vs FLUX.1's 19/38), shared modulation, hidden dim 3072 (Klein 4B) vs 4096 (FLUX.1), and Qwen3 text encoder (vs T5) — so the injection system was rebuilt from scratch. Some users report Klein 9B's native multi-reference conditioning matches PuLID for likeness, making PuLID II most useful when needing tighter identity lock under stylized prompts. Weights at [huggingface.co/Fayens/Pulid-Flux2](https://huggingface.co/Fayens/Pulid-Flux2).
  - **InfiniteYou** — [CONFIRMED 2026-05-06] **FLUX.2 port NOT yet released** as of May 2026. Existing `ComfyUI_InfiniteYou` (ByteDance) is FLUX.1-only. ByteDance has not announced a FLUX.2 timeline.
  - **Redux / Kontext** — FLUX.2 ports are reportedly available (see @entities/adapters/flux-redux.md, @entities/adapters/flux-kontext.md).
  - **Implication for the stack:** PuLID II works on Klein 4B/9B/Dev today; InfiniteYou users must stay on FLUX.1 Dev or wait. For a Klein-only persona pipeline, PuLID II + Klein 9B native multi-reference is the production-ready path.
- **LoRA tooling support varies.** @entities/training-tools/ai-toolkit.md leads on FLUX.2 LoRA training (FLUX-first lab); other trainers tracking. **`[NEEDS VERIFICATION 2026-05-06]`**.
- **Quality vs FLUX.1 Dev for explicit anatomy: not yet validated**. Smaller distilled model may need more aggressive de-censoring LoRAs.

### Censorship and the de-censoring path

Tier: **Minimal** (inherited from FLUX.2 base) — see @concepts/censorship-tier-taxonomy.md. Survey notes FLUX.2 inherits the same SFW-pretraining caveat as FLUX.1: no active refusal, but pre-training scrubbed of explicit anatomy.

Fix path:

1. **LoRA injection** with explicit-anatomy-trained LoRAs at strength 0.8–1.2 — same modal pattern as FLUX.1, but the LoRAs themselves need to be trained against FLUX.2 (FLUX.1 LoRAs do not transfer cleanly to FLUX.2).
2. **Klein 9B as face-swap engine** for NSFW workflows — see @entities/adapters/flux2-klein-9b-faceswap.md. Multi-pass pipeline: generate base image with explicit-anatomy LoRA on FLUX.1 or Pony, then use Klein 9B as the face-swap stage to override the face with the persona identity. Modal mitigation #3 for NSFW anatomy degradation per @concepts/reference-plus-lora-stacking.md.
3. **Community merges for FLUX.2** are still emerging as of May 2026; FLUX.1's FLUX-UNCENSORED-Merged / Chroma1-HD / SNOFS lineage is FLUX.1-specific.

### Role in 2026 production stack

[CONFIRMED]:

- **Default modern host** when the workflow can fit a 9B/4B model and wants FLUX.2-class quality.
- **8 GB tier persona work that needs DiT** — Klein 4B is the answer; Pony V6 (SDXL) is the alternative, depending on whether the persona aesthetic is photorealistic (use Klein 4B) or stylized (use Pony V6).
- **Face-swap stage** in multi-pass NSFW pipelines — Klein 9B is the modal pick per @entities/adapters/flux2-klein-9b-faceswap.md.
- **Sub-second iteration cycles** unlock interactive workflows (e.g., real-time prompt iteration, "instant draft" modes in UIs).

### Captioning conventions

Same as @entities/models/flux-1-dev.md: natural-language prose with logical structure (subject → environment → lighting → styling). T5/VLM encoder requires sentences, not tag soup. Multi-reference inputs slot into the workflow node graph rather than the prompt text.

### Workspace TODO

- ~~PuLID II FLUX.2 port status~~ — **resolved [CONFIRMED 2026-05-06]**: shipped via `iFayens/ComfyUI-PuLID-Flux2`; supports Klein 4B/9B + Dev with auto-detection.
- ~~InfiniteYou FLUX.2 port status~~ — **resolved [CONFIRMED 2026-05-06]**: NOT yet ported as of May 2026; remains FLUX.1-only. Reassess at next persona-consistency-touch (~Q3 2026).
- **`[NEEDS VERIFICATION 2026-05-06]`**: ai-toolkit FLUX.2 LoRA training path — is it production-ready, or still experimental?
- **`[NEEDS VERIFICATION 2026-05-06]`**: confirm Klein 4B 8 GB VRAM claim — what quantization (FP8? GGUF Q4? native FP16?) is needed, and what speed?
- Compare Klein 9B vs Klein 4B head-to-head on a fixed prompt set; document the quality drop the 4B path costs.
- Confirm community "FLUX.2 uncensored merge" releases — are there equivalents of FLUX-UNCENSORED-Merged for Klein yet?

## Snippets

### FLUX.2 segmentation by scale

> "The subsequent FLUX.2 release expanded the architecture significantly, segmenting by parameter scale rather than just licensing: FLUX.2 [dev] / [pro]: A 32-billion parameter titan requiring up to 90GB of VRAM in unoptimized FP16, though it can be compressed into 24GB GPUs using advanced SVDQ or GGUF quantization. It excels in absolute photorealism, flawless typography, and multi-reference conditioning. FLUX.2 [klein]: Distilled 9B and 4B variants designed for sub-second inference on consumer hardware. The 4B model fits comfortably in 8-13GB VRAM, providing a vital bridge for local users."

— @sources/uncensored-image-generation-survey.md §1.2
