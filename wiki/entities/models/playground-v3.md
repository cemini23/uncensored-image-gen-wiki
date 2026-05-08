---
title: Playground v3 (Playground AI)
type: entity
tags: [model, playground, playground-v3, 16-channel-vae, expand-pe, partial-architectural-censorship, deep-fusion-llm]
keywords: [Playground v3, PGv3, Playground AI, 16-channel VAE, expand-PE positional embedding, deep-fusion LLM, Partial-Architectural censorship, safety alignment, community fine-tunes]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/de-censoring-techniques.md
  - entities/models/flux.md
  - entities/models/sd3-deprecated.md
  - entities/uis/comfyui.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/uncensored-image-generation-survey.md
@concepts/censorship-tier-taxonomy.md
@concepts/de-censoring-techniques.md
@entities/models/flux.md
@entities/models/sd3-deprecated.md

## Raw Concept

Entity page for **Playground v3** (PGv3) — the **Partial-Architectural-tier** Western model with significant architectural innovations (16-channel VAE, expand-PE positional embedding) but heavy alignment that pushes uncensored work onto community fine-tunes. The Western counterpart to the FLUX.2 Dev alignment posture; less aggressive than @entities/models/sd3-deprecated.md but tier-equivalent. Back-filled from @sources/uncensored-image-generation-survey.md §1.

## Narrative

### What it is

**Playground v3** (PGv3) — released by **Playground AI** with significant architectural changes from prior Playground generations:

- **Expand-PE positional embedding** rather than interpolating-PE — prevents the model from overfitting on specific training resolutions. The result: cleaner extrapolation to non-trained resolutions, fewer artifacts when generating at sizes outside the training distribution.
- **16-channel VAE** (up from the traditional 4-channel VAE used since SD 1.x) — built in-house by Playground. The wider latent allows much finer detail synthesis in **small faces, fine typography, and detail-dense regions**. This is one of the more meaningful VAE-architecture upgrades of the post-SDXL era.
- **Deep-fusion LLM text encoder** (per [Playground v3 paper, arXiv:2409.10695](https://arxiv.org/html/2409.10695v2)) — text-encoder integration deeper into the diffusion stack than standard CLIP / T5 conditioning.

Architecturally, Playground v3 is one of the more *interesting* Western models of the era. The censorship posture is what limits its uncensored-workflow viability.

### Why creators use it

[CONFIRMED, source @sources/uncensored-image-generation-survey.md §1]:

- **16-channel VAE quality wins** — small-face fidelity, fine typography rendering, detail-dense regions. Specific use cases (commercial product photography, ad creative, brand-typography work) reach for Playground v3 over FLUX.1 Dev for the VAE alone.
- **Expand-PE resolution flexibility** — generates well at non-trained resolutions; useful when output dimensions are dictated externally (display sizes, banner ad slots, print specs).
- **Strong prompt adherence** for non-explicit complex prompts due to the deep-fusion LLM encoder.

### Why creators avoid it

[CONFIRMED]:

- **Partial-Architectural censorship tier** — heavily aligned base. Generating uncensored content requires community fine-tunes that have attempted to undo the safety training. The de-censoring path is significantly more fragile than for FLUX.1 Dev (Minimal tier).
- **Western alignment posture** — Playground AI is a Western lab; the alignment decisions match the broader Western lab pattern (see @sources/uncensored-image-generation-survey.md geopolitical thesis). This makes Playground v3 less aligned with uncensored-workflow goals than Eastern Vanguard alternatives.
- **Smaller community fine-tune ecosystem than FLUX.1 Dev** — fewer creators target Playground v3 as a base for character LoRAs / NSFW LoRAs because the alignment is harder to overcome.
- **License ambiguity** — Playground AI's release terms have shifted across versions; verify current terms before commercial use.

### Censorship tier

**Partial / Architectural** — see @concepts/censorship-tier-taxonomy.md. The base models are heavily aligned; the latent space is **partially scrubbed** (not as aggressively as SD3 / SD3.5 — see @entities/models/sd3-deprecated.md — but more than FLUX.1 Dev).

De-censoring path (per @concepts/de-censoring-techniques.md):

1. **LoRA injection alone often fails** at this tier — the latent space lacks foundational structures the LoRA tries to reach. Modal pattern from FLUX.1 Dev does not transfer cleanly.
2. **Abliteration** — removes the refusal vectors but doesn't supply missing latent knowledge. Partial fix.
3. **Weight merging** with an uncensored donor (SLERP / TIES / DARE) is the modal community fix for Partial-tier models. The aesthetic strengths of Playground v3 (16-channel VAE quality) merge with the explicit-anatomy knowledge of an uncensored donor.
4. **Specific community fine-tunes** that have attempted to undo the safety training — the survey notes these exist but doesn't name canonical examples (in contrast to FLUX-UNCENSORED-Merged / Chroma1-HD / SNOFS for FLUX.1). `[NEEDS VERIFICATION 2026-05-06]`.

### Hardware profile

[TENTATIVE]:

- Parameter count not stated explicitly in the survey for v3 (v2.5 was ~2.5B; v3 is rumored larger). `[NEEDS VERIFICATION 2026-05-06]`.
- 16-channel VAE has higher decode-stage VRAM than 4-channel; budget extra ~1-2 GB for the VAE pass alone.
- 12-16 GB VRAM tier likely workable in FP8; 24 GB recommended for full-quality work.

### Role in 2026 production stack

[CONFIRMED, but limited]:

- **Niche** — when the workflow specifically needs 16-channel-VAE detail fidelity (small faces, commercial typography, detail-dense product shots) AND the user is willing to deal with the alignment / weight-merging path for any explicit content.
- **Not a default photoreal-NSFW base** — FLUX.1 Dev or Z-Image Turbo cover that role with cleaner alignment posture.
- **Not a default persona-consistency host** — adapter ecosystem (PuLID / InfiniteYou / Redux) targets FLUX, not Playground.

### Workspace TODO

- **`[NEEDS VERIFICATION 2026-05-06]`**: confirm Playground v3 parameter count, license terms, current revision.
- **`[NEEDS VERIFICATION 2026-05-06]`**: identify canonical de-censoring fine-tunes / merges for Playground v3 (the survey notes these exist but doesn't name them).
- **`[NEEDS VERIFICATION 2026-05-06]`**: confirm whether Playground v3 weights are publicly downloadable or API-only (Playground AI has historically had a hosted-API focus).
- Compare Playground v3 16-channel VAE detail vs FLUX.1 Dev / Z-Image on the same fine-detail prompt set (small faces, typography). Validate the VAE win claim.
- Document the exact deep-fusion LLM encoder pattern from the arXiv paper — useful general knowledge for the @concepts/llm-as-image-conditioning.md taxonomy.

## Snippets

### Architectural innovations

> "Playground v3 (PGv3) introduced significant architectural changes, opting for an 'expand-PE' positional embedding rather than 'interpolating-PE' to prevent the model from overfitting on specific training resolutions. It also upgraded the latent space by building an in-house 16-channel VAE (up from the traditional 4-channel VAEs), allowing for much finer detail synthesis in small faces and typography."

— @sources/uncensored-image-generation-survey.md §1

### Censorship posture

> "Playground maintains a relatively strict censorship stance compared to its Eastern counterparts. The base models are heavily aligned, and generating uncensored content requires users to seek out specific community fine-tunes that have attempted to undo the safety training."

— @sources/uncensored-image-generation-survey.md §1
