---
title: SDXL fine-tunes (Lustify, Juggernaut, Cyberrealistic, Epicrealism, BigAsp-v2.5) — umbrella
type: entity
tags: [model, sdxl, sdxl-fine-tune, umbrella, lustify, juggernaut, cyberrealistic, epicrealism, bigasp, completely-uncensored, 8gb-vram, photorealism, 2-6b]
keywords: [SDXL fine-tune, Lustify, Juggernaut XL, Cyberrealistic, Epicrealism, BigAsp-v2.5, flow-matching SDXL, photorealism, NSFW SDXL, 8GB VRAM, 2.6B parameters, hardware economics]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/de-censoring-techniques.md
  - concepts/lora-taxonomy.md
  - concepts/reference-plus-lora-stacking.md
  - entities/models/pony-v6.md
  - entities/models/illustrious-xl.md
  - entities/models/noobai-xl.md
  - entities/training-tools/kohya-sd-scripts.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/uncensored-image-generation-survey.md
@concepts/censorship-tier-taxonomy.md
@concepts/de-censoring-techniques.md
@concepts/lora-taxonomy.md
@concepts/reference-plus-lora-stacking.md
@entities/models/pony-v6.md
@entities/models/illustrious-xl.md
@entities/models/noobai-xl.md
@entities/training-tools/kohya-sd-scripts.md

## Raw Concept

Umbrella entity page for the **photorealistic / cinematic SDXL fine-tunes** that anchor the 8 GB VRAM tier in 2026: **Juggernaut XL** (cinematic realism), **Cyberrealistic** + **Epicrealism** (photographic outputs), **Lustify** (dedicated NSFW), **BigAsp-v2.5** (flow-matching on SDXL base). Complementary to the Danbooru lineage page family (Pony V6 / Illustrious / NoobAI) which covers the *anime/stylized* SDXL fine-tunes — this page covers the *photorealistic* SDXL fine-tunes. Back-filled from @sources/uncensored-image-generation-survey.md §1.

## Narrative

### Why SDXL fine-tunes still matter in 2026

[CONFIRMED, source @sources/uncensored-image-generation-survey.md §1]:

> "Despite its age, the 2.6B parameter SDXL 1.0 architecture remains highly relevant in 2026 purely due to hardware economics."

The driver is **hardware economics**: users with 8 GB VRAM cannot run 32B FLUX.2 Dev/Pro and find heavily quantized DiT alternatives (FLUX.2 Klein 4B at GGUF Q4, Z-Image at Q4) noticeably degraded vs full-precision SDXL fine-tunes. SDXL 1.0 at 2.6B FP16 fits 8 GB cleanly with no quality compromise.

This makes the *photorealistic* SDXL fine-tunes the primary photoreal-NSFW path for the 8 GB tier. The Danbooru-lineage SDXL fine-tunes (Pony V6 / Illustrious XL / NoobAI XL) cover the same VRAM bracket for stylized anime; this umbrella covers photorealism.

### Censorship — base SDXL vs community fine-tunes

[CONFIRMED]:

- **Base SDXL 1.0** is **Partial-tier** — heavily restricts explicit anatomy via dataset sanitization (similar to FLUX.1 Dev's Minimal-tier latent-knowledge gap, but worse).
- **Years of community fine-tuning** have **completely shattered these guardrails**. The result: the listed fine-tunes below are all **Completely Uncensored** in practice. See @concepts/censorship-tier-taxonomy.md.
- The de-censoring path was historically **massive fine-tunes**, not LoRA injection (per @concepts/de-censoring-techniques.md §3-4). Lustify, BigAsp, and the photoreal-NSFW community fine-tunes were trained on explicit content directly, supplying the latent knowledge base SDXL lacked.

### The named fine-tunes

[CONFIRMED, source @sources/uncensored-image-generation-survey.md §1]:

| Fine-tune | Aesthetic objective | Explicit-anatomy native | Notable distinguishing feature |
|---|---|---|---|
| **Juggernaut XL** | Cinematic realism — film-look photorealism with strong lighting and color grading | Generally yes (community-built) | Most-recognized photoreal SDXL fine-tune; broad baseline workflow choice |
| **Epicrealism** | Photographic outputs — naturalistic skin, textures, lighting | Yes | Photographic-skin-fidelity specialist |
| **Cyberrealistic** | Photographic outputs (overlapping with Epicrealism) | Yes | Often paired with Epicrealism in workflow comparisons |
| **Lustify** | Dedicated NSFW generation | Yes (training objective) | The canonical "explicit-anatomy-first" SDXL fine-tune; trained on explicit content with anatomy-fidelity as primary loss |
| **BigAsp-v2.5** | Realistic body-type-diverse output; integrates flow-matching | Yes | Notable for **flow-matching integration into the SDXL base** — bridge between SDXL's standard EPS-prediction and FLUX-class flow-matching objectives |

The flow-matching detail on BigAsp-v2.5 is significant: it means the SDXL base trained on the BigAsp-v2.5 path uses sampling closer to FLUX-style than standard SDXL. Inference UIs need flow-matching-compatible sampler config, similar to @entities/models/noobai-xl.md's V-Prediction sampler requirement.

### Why creators use SDXL photoreal fine-tunes

[CONFIRMED]:

- **8 GB VRAM compatibility** at full FP16 — no quantization quality compromise. The cleanest 8 GB photoreal-NSFW workflow.
- **Mature LoRA / adapter ecosystem** — every identity adapter (IP-Adapter, PuLID original, InstantID, ConsistentID, PhotoMaker V2) targets SDXL natively. The full persona-consistency stack runs on SDXL fine-tunes.
- **Lowest training cost** for character LoRAs — 2.6B base parameters trains in ~30-60 min on a 4060 Ti 16 GB.
- **Years of community refinement** — production-tested workflows, well-known prompt-engineering patterns, exhaustive comparative evaluation.

### Why creators move off them

[TENTATIVE]:

- **Quality ceiling is below 2026 DiT frontier** — FLUX.1 Dev / Z-Image Turbo / FLUX.2 Klein outclass SDXL on prompt adherence, complex composition, and text rendering.
- **Native resolution capped at 1024×1024** — iterative upscaling required for higher resolutions; FLUX / Qwen-Image / Z-Image native at 1024 with cleaner upscaling paths.
- **U-Net architecture is the past** — the 2024-2026 community has shifted training investment toward DiT bases. New character LoRAs / new persona-consistency techniques increasingly target FLUX / Z-Image / Qwen-Image.
- **License chain** — base SDXL 1.0 is OpenRAIL-M; the community fine-tunes inherit OpenRAIL-M's commercial-use restrictions on certain content categories. See @sources/uncensored-image-generation-survey.md §7.4.

### Captioning conventions

[TENTATIVE]:

These fine-tunes use **standard SDXL token-style** prompts (NOT Pony's score_9 system, NOT FLUX's natural-language prose):

```
[1girl/1boy or specific subject], [pose], [outfit], [setting], [lighting], [camera details], 8k, masterpiece, best quality
```

Booru-style tag soup works because these fine-tunes train on captioned datasets that mix natural language with tags. Per-fine-tune optimal prompt patterns vary; check the model card on CivitAI for each.

### Role in 2026 production stack

[CONFIRMED]:

- **Default photoreal-NSFW base for the 8 GB tier** — when DiT alternatives don't fit the hardware budget. Lustify or Juggernaut + character LoRA + identity adapter is a working modal stack.
- **The photoreal complement** to the Danbooru-lineage anime stack (@entities/models/pony-v6.md / @entities/models/illustrious-xl.md / @entities/models/noobai-xl.md) — same VRAM tier, same identity-adapter ecosystem, different aesthetic objective.
- **Reference + LoRA stacking host** — see @concepts/reference-plus-lora-stacking.md. The 0.85 NSFW LoRA + 0.45 IP-Adapter FaceID-Plus-V2 stack on Lustify is the modal SDXL-photoreal-NSFW persona-consistency workflow.
- **LoRA training base** for photoreal-aesthetic personas. Trains on @entities/training-tools/kohya-sd-scripts.md / @entities/training-tools/onetrainer.md / @entities/training-tools/kohya-ss-gui.md cleanly.

### Workspace TODO

- ~~Confirm canonical CivitAI status of all four/five fine-tune families — takedown risk assessment~~ — **resolved [CONFIRMED 2026-05-06]**: **all five fine-tune families remain available on CivitAI as of May 2026**. No major takedown wave reported. Specific landing pages:
  - **Juggernaut XL** — flagship at [civitai.com/models/133005/juggernaut-xl](https://civitai.com/models/133005/juggernaut-xl), latest **Ragnarok_by_RunDiffusion** variant (KandooAI / RunDiffusion). Author has signaled SDXL-line continuation through 2026 ("I think 2026 is going to be an amazing year") after wrapping up the Flux-line ports. Mirrored at civarchive.com (CivitAI Archive) for download persistence; community-active with ongoing version bumps.
  - **Lustify** — by Coyotte, available on CivitAI; the canonical "explicit-anatomy-first" SDXL fine-tune. (OLT) Fixed Textures version is the community-recommended pick per r/LocalLLM 2026 thread. Direct CivitAI URL still lookup-pending.
  - **BigASP / Big Lust** — Big Lust v1.6 at 438k+ downloads / 2,597+ reviews per offlinecreator's 2026 SDXL NSFW guide. Marketed as "merge of bigASP × LUSTIFY line per creator." The BigASP V2 / V2.5 base is the recommended LoRA-training base for character work per several Reddit 2026 threads.
  - **CyberRealistic XL** — v6.0 community-recommended. Pony-base variant ("Cyberrealistic Pony") also active. Available on CivitAI.
  - **Epicrealism XL** — listed as "go-to SDXL realism" model in 2026 Reddit threads. Available on CivitAI.
  - **Practical takeaway**: CivitAI takedown risk has been **moderation-churn rather than wholesale-takedown** in 2026. The historical SDXL NSFW ecosystem is stable; downstream workflows can commit to these fine-tunes for the 8 GB tier.
- **`[NEEDS VERIFICATION 2026-05-06]`**: BigAsp-v2.5 flow-matching sampler config — what sampler / scheduler combination produces the right results in ComfyUI / Forge? Reddit references suggest **DMD2 4-step LoRA + PAG at 0.20 scale** unlocks BigAsp v2's full potential at 6-8 steps.
- **`[NEEDS VERIFICATION 2026-05-06]`**: License inheritance chain — does each fine-tune carry the SDXL OpenRAIL-M restrictions? Are any fine-tune authors more permissive than the base license allows? Note: Juggernaut XL Ragnarok civarchive entry mentions Apache 2.0 ambition for future fine-tunes — needs direct-license verification per fine-tune.
- Compare Lustify vs Juggernaut + NSFW LoRA at 0.85 head-to-head for explicit-anatomy fidelity. Is Lustify's training-objective-NSFW-first design measurably better, or is Juggernaut + LoRA equivalent? (Reddit 2026 consensus: BigASP-trained character LoRAs run with DMD2 4-step on Lustify is the current modal stack.)
- Document per-fine-tune optimal prompt patterns — Lustify, Juggernaut, Epicrealism, Cyberrealistic each have different aesthetic biases that benefit from different captioning conventions.
- Eventually: split this umbrella into per-fine-tune dedicated pages if the community workflows diverge enough to justify separation.

## Snippets

### Hardware-economics motivation

> "Despite its age, the 2.6B parameter SDXL 1.0 architecture remains highly relevant in 2026 purely due to hardware economics. Users with 8GB VRAM GPUs who cannot run 32B FLUX models rely on SDXL fine-tunes."

— @sources/uncensored-image-generation-survey.md §1

### The named photoreal fine-tunes

> "The base SDXL model contains partial censorship, heavily restricting explicit anatomy. However, years of community fine-tuning have completely shattered these guardrails. Major uncensored fine-tunes include Juggernaut XL (for cinematic realism), Epicrealism and Cyberrealistic (for photographic outputs), Lustify (for dedicated NSFW generation), and BigAsp-v2.5 (which integrates flow-matching techniques into the SDXL base)."

— @sources/uncensored-image-generation-survey.md §1
