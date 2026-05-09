---
title: Reference + LoRA stacking (modal 2026 production pattern)
type: concept
tags: [persona-consistency, production-pattern, lora-stacking, identity-adapter-stack, nsfw-mitigation, two-pass-pipeline]
keywords: [reference plus LoRA, stack, 0.85 LoRA + 0.45 adapter, modal 2026 stack, two-pass face inpaint, Klein 9B face-swap, Chroma1-HD, NSFW LoRA stack]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/prompt-engineering-uncensored.md
  - concepts/two-pass-generation-workflow.md
  - concepts/persona-consistency-methods.md
  - concepts/lora-taxonomy.md
  - concepts/character-dna-templates.md
  - entities/adapters/ip-adapter.md
  - entities/adapters/pulid.md
  - entities/adapters/instantid.md
  - entities/adapters/characonsist.md
  - entities/adapters/flux-redux.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/pony-v6.md
  - entities/models/pony-v7.md
  - concepts/de-censoring-techniques.md
  - entities/models/sdxl-fine-tunes.md
  - concepts/model-selection-workflow.md
  - entities/hardware/gpu-guide.md
  - entities/uis/comfyui.md
maturity: validated
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@concepts/lora-taxonomy.md
@concepts/character-dna-templates.md
@entities/adapters/ip-adapter.md
@entities/adapters/pulid.md
@entities/adapters/instantid.md
@entities/adapters/characonsist.md
@entities/adapters/flux-redux.md
@entities/adapters/flux2-klein-9b-faceswap.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/models/pony-v6.md
@entities/models/pony-v7.md
@concepts/de-censoring-techniques.md
@concepts/prompt-engineering-uncensored.md
@concepts/two-pass-generation-workflow.md
@entities/models/sdxl-fine-tunes.md
@concepts/model-selection-workflow.md
@entities/hardware/gpu-guide.md
@entities/uis/comfyui.md

## Raw Concept

Concept page from back-fill of @sources/synthetic-character-consistency-survey.md (Path A step 4). **Reference + LoRA stacking** is the **modal 2026 production pattern** for persona consistency, especially for adult-aligned content where the IP-Adapter-class semantic conflict on clothed-reference + nude-prompt is the primary failure mode.

## Narrative

### The pattern, in one line

Stack a **NSFW-trained character LoRA at 0.85 strength** under a **face identity adapter (PuLID II / IP-Adapter FaceID-Plus-V2 / InstantID) at 0.45 strength**. The LoRA carries the explicit anatomy and persona-specific style; the adapter only nudges face identity.

### Why stacking works (and standalone doesn't)

[CONFIRMED]

The two methods solve **different problems** and **fail in complementary ways**:

| Method alone | Solves | Fails on |
|---|---|---|
| Character LoRA only | Anatomy, body proportions, style, persona-specific signature features | Face fidelity drifts session-to-session; LoRA can't pin face exactly |
| Identity adapter only | Face fidelity (high) | Anatomy degrades on NSFW (semantic conflict on clothed-reference + nude-prompt) |
| **LoRA + adapter stack** | Both — anatomy from LoRA, face from adapter | None of the above failure modes; cost is workflow complexity |

The mechanism: the LoRA's weight delta carries the persona-specific anatomical and stylistic features in the model's diffusion-block weights. The identity adapter at *low strength* nudges the face cross-attention without forcibly overriding the LoRA-trained anatomy. At 0.85 / 0.45, the LoRA dominates body geometry; the adapter dominates face fingerprint.

### The strength-balance recipe

[CONFIRMED]

| Backbone | NSFW LoRA | Adapter | Adapter type | Refinement pass |
|---|---|---|---|---|
| FLUX.1 Dev / FLUX.1 Schnell | 0.85 | 0.45-0.55 | PuLID II | 0.15-0.25 denoise img2img colour-correct |
| FLUX.2 Klein 9B (multi-pass) | 0.85 (pass 1) | 0.85 (pass 2 face-swap) | Klein 9B face-swap | Optional ColorMatch |
| SDXL (Lustify, Cyberrealistic, Juggernaut) | 0.85 | 0.40-0.50 | IP-Adapter FaceID-Plus-V2 or InstantID | Optional |
| Pony V6 / Illustrious / NoobAI XL | 0.85 | 0.30-0.45 | IP-Adapter FaceID-Plus-V2 (less PuLID adoption on stylised bases) | Not usually needed |
| Z-Image Turbo | 0.80 | 0.40 | (Z-Image-specific PuLID port if available) | Recommended ColorMatch |
| Chroma1-HD (FLUX fine-tune, NSFW-friendly) | 0.80 | 0.50 | PuLID II + ClipVision | 0.15 denoise pass |

[Sources: @sources/synthetic-character-consistency-survey.md §6, [r/comfyui Chroma/IPAdapter NSFW workflow](https://www.reddit.com/r/comfyui/comments/1lengyg/consistent_characters_face_and_body_nsfw_chroma/)]

The 0.85/0.45 balance is the modal default; the higher and lower bands of the adapter strength column trade face fidelity against anatomy preservation. **Push adapter strength below 0.30 if anatomy is drifting** (LoRA needs more dominance); **push above 0.55 if face fidelity is drifting** (adapter needs more dominance) — but accept the trade-off in the other axis.

### The two-pass alternative

[CONFIRMED] When stacking still isn't enough — typically when the persona has very distinctive face features that the LoRA learns *too well* and over-rides what the adapter is trying to inject — switch to the **two-pass pattern**:

1. **Pass 1**: generate the explicit composition with the NSFW LoRA at 0.85 *without* an identity adapter. This produces correct anatomy + persona-style but no specific face fidelity.
2. **Pass 2**: face-only inpaint the masked face region with PuLID at 0.85-0.90 strength (or @entities/adapters/flux2-klein-9b-faceswap.md for the FLUX.2 path). This locks face fidelity without disturbing the body.

The two-pass pattern produces the highest documented face similarity for explicit content ([medium.com Wei Mao "100% face similarity"](https://medium.com/@wei_mao/100-face-similarity-the-ultimate-face-swap-workflow-better-than-any-pulid-instantid-b7fa2daa5659)). Cost: ~2x latency per output and additional ComfyUI workflow complexity.

### When to choose stacking vs two-pass

[CONFIRMED]

- **Stack** is the default for high-volume content production. One-pass workflow; ~50 % of the latency of two-pass; quality is "very good" not "perfect".
- **Two-pass** is the default for hero shots / batch portfolio generation / persona anchor images. Higher latency; quality is "perfect face fidelity".
- **Stack → two-pass on rejection** is the production loop: stack first, run face-similarity QA via @concepts/likeness-collision-verification.md (also useful for self-similarity, not just collision), if face drift exceeds threshold re-do as two-pass.

### Cross-base parallel-LoRA implication

The stacking pattern reinforces the **parallel-LoRA-per-base** pattern from @concepts/persona-consistency-methods.md axis 4. Maintain:

- **One FLUX LoRA per persona** (for SFW-and-soft-NSFW polish)
- **One Pony V7 / NoobAI / Lustify LoRA per persona** (for explicit)
- **One Wan 2.2 video LoRA per persona** (for clips)
- **One Klein 9B LoRA per persona** (for FLUX.2 face-swap)

The adapter (PuLID / IP-Adapter / InstantID) is shared across all bases; only the LoRA needs to be base-specific. The persona's *face dataset* is the canonical asset; the LoRAs are cheap, expendable derivatives that re-train when a new base lands or an adapter version updates.

### Failure modes specific to the stack

[CONFIRMED]

- **Adapter strength too high (≥ 0.6)**: face dominates over anatomy → semantic conflict re-emerges → "alien anatomy" returns.
- **LoRA strength too high (≥ 1.0)**: LoRA dominates the face → adapter influence vanishes → face fidelity drops to LoRA-only level.
- **Outfit drift between LoRA and adapter**: PuLID copies hair/clothing from reference; LoRA was trained on different hair/clothing. Mitigation: low-strength PuLID + Hyper LoRA for hair-specific control.
- **Lighting drift**: PuLID's skin-tone pollution propagates through the stack. Mitigation: end-of-pipeline ColorMatch / 0.15 denoise refinement pass (mandatory on PuLID stacks).
- **Long-session text-encoder drift**: shared FLUX text encoder across many generations accumulates float-error → identity shifts subtly over 100+ generations. Mitigation: reload workflow every ~50 generations; ComfyUI 0.3.39+ has the worst fixed.
- **CLIP-L vs T5 mismatch**: FLUX's dual encoders degrade ~50–75% when both receive identical text. Always write **separate** prompts: CLIP-L for keyword tags, T5-XXL for natural-language descriptions. See @concepts/prompt-engineering-uncensored.md §Dual-encoder models.

## Snippets

> "Stack a NSFW-trained character LoRA at 0.85 strength under PuLID/FaceID at 0.45 strength — the LoRA carries the explicit anatomy, the reference adapter only nudges face identity."
> — @sources/synthetic-character-consistency-survey.md §6, NSFW failure-mode mitigation #1

> "Two-pass generation: pass 1 generates the explicit composition with no reference adapter, pass 2 inpaints face only with PuLID/InstantID at high strength on the masked face region. This is the '100 % face similarity' pattern documented at medium.com Wei Mao."
> — @sources/synthetic-character-consistency-survey.md §6, mitigation #2

> "Even with a strong character LoRA, body proportions wobble between SDXL and FLUX outputs because the two bases have different latent body distributions. Fix: train a body LoRA separate from the face LoRA and stack them. The Reddit thread r/comfyui Chroma/IPAdapter NSFW workflow documents the two-LoRA stack with PuLID and ClipVision on Chroma1-HD specifically — Chroma is currently the most NSFW-friendly FLUX fine-tune for body-shape lock."
> — @sources/synthetic-character-consistency-survey.md §6, body inconsistency

## Dead Ends

- **Standalone identity adapter at 0.85 strength on a clothed-reference + nude-prompt** [RETRACTED]. The dominant failure mode of 2024-2025 NSFW persona work. Always pair with NSFW-trained LoRA at higher weight, OR switch to two-pass face-inpaint pattern.
- **Single character LoRA + heavy denoise on celebrity face** [RETRACTED for serious persona work]. Distortion is uneven; tag-cluster artefacts persist in the latent. Use synthesis methods that produce a novel persona from the start (latent face mixing, Nano Banana Pro 4K bootstrap, celebrity blends with PimEyes verification).
- **Adapter at strength 1.0 to "fix" a weak face**: the right fix is a stronger character LoRA (more training data, more steps) or a higher-quality reference image, not stronger adapter. Adapter ≥ 0.6 reintroduces semantic conflict.
