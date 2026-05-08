---
title: Kwai Kolors (Kuaishou Technology)
type: entity
tags: [model, kolors, kwai-kolors, kuaishou, latent-diffusion, eastern, aesthetic, commercial-registration-required, partial-censorship]
keywords: [Kwai Kolors, Kolors, Kuaishou Technology, latent diffusion, large-scale T2I, commercial registration, no native uncensored, aesthetics-strong]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/de-censoring-techniques.md
  - entities/models/flux.md
  - entities/models/z-image-turbo.md
  - entities/models/qwen-image-2512.md
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
@entities/models/z-image-turbo.md
@entities/models/qwen-image-2512.md

## Raw Concept

Entity page for **Kwai Kolors** (often "Kolors") — Kuaishou Technology's large-scale latent-diffusion T2I model. Notable as an *Eastern* model that doesn't fit cleanly into the Eastern Vanguard "Apache-2.0 + uncensored" pattern: strong aesthetics, weak prompt adherence, **commercial registration required**, **no native uncensored variants**. The exception that complicates the survey's geopolitical thesis. Back-filled from @sources/uncensored-image-generation-survey.md §1.

## Narrative

### What it is

**Kwai Kolors** (sometimes "Kolors") — large-scale text-to-image model by **Kuaishou Technology** (the Chinese short-video lab; Kuaishou is the parent of the TikTok competitor Kwai). **Latent diffusion architecture** — not DiT — placing it in the same architectural class as SDXL despite being a more recent release.

[Hugging Face: Kwai-Kolors/Kolors](https://huggingface.co/Kwai-Kolors/Kolors)

### Why creators use it

[CONFIRMED, source @sources/uncensored-image-generation-survey.md §1]:

- **Exceptional aesthetics** — produces highly stylized output with strong visual appeal. Per the survey's framing, Kolors is *aesthetics-strong but adherence-weak* — the inverse of the FLUX / Qwen-Image profile.
- **Cinematic / illustrative styling** is the natural fit; the model leans toward visually-curated outputs over literal prompt following.
- Per [r/StableDiffusion: Kwai Kolors is really good!](https://www.reddit.com/r/StableDiffusion/comments/1e02em4/kwai_kolors_is_really_good/) — community has pockets of enthusiasm for the aesthetic specifically.

### Why creators avoid it

[CONFIRMED]:

- **Weak prompt adherence** vs DiT alternatives — struggles with strict prompt adherence and extreme realism compared to DiT models. The survey explicitly notes this against Z-Image Turbo, Qwen-Image, and the FLUX family.
- **Commercial registration required** — even though open-source, the license requires commercial users to **register formally** with Kuaishou. This adds friction that Apache-2.0 alternatives (ERNIE-Image, Z-Image-class) don't.
- **No native uncensored variants** — the model lacks the natively-uncensored lineage that defines the Eastern Vanguard tier (Z-Image, Anima, Pony V7). Generating explicit content via Kolors requires community fine-tunes / weight merging on a model that wasn't designed for it.
- **Latent-diffusion architecture is dated** — the 2026 community has largely moved to DiT bases for new fine-tuning work; Kolors lacks the ecosystem momentum of FLUX / Z-Image / Qwen-Image / SDXL.
- **Persona-consistency adapter availability** — none of PuLID II, InfiniteYou, Redux, Kontext target Kolors. Persona work via Kolors is character-LoRA-only and likely fragile.

### Censorship tier

**Partial-Architectural** — see @concepts/censorship-tier-taxonomy.md. The model is not Strict (it doesn't actively refuse) but lacks the natively-uncensored latent space of the Eastern Vanguard models. De-censoring path requires community fine-tunes / weight merging — see @concepts/de-censoring-techniques.md §1-2.

This puts Kolors in an awkward position: Eastern lineage, but doesn't get the "Eastern Vanguard advantage" (uncensored at base + permissive license) that defines Z-Image / Qwen / ERNIE.

### Hardware profile

[TENTATIVE]:

- Parameter count and exact architecture details `[NEEDS VERIFICATION 2026-05-06]` — survey says "large-scale" without specifics. Hugging Face model card check needed.
- Latent diffusion likely puts VRAM in SDXL-class territory (8-12 GB FP16); aggressive quantization should fit 8 GB.

### Role in 2026 production stack

[CONFIRMED, but limited]:

- **Niche** — only when the user explicitly wants the Kolors aesthetic and is willing to deal with weaker prompt adherence and the commercial-registration requirement.
- **Not a default base** for any of the workspace's primary tracks (uncensored, persona-consistency, NSFW, photorealism).
- **Mention-only in the model catalog** — represents the Eastern-but-not-Vanguard exception.

### Workspace TODO

- ~~Kwai-Kolors/Kolors license terms~~ — **resolved [CONFIRMED 2026-05-06]**: **split-license model**. CODE under Apache 2.0; **WEIGHTS under non-commercial research license** with explicit commercial-use registration requirement. Full quote from the official HF model card: *"Kolors weights are fully open for academic research. If you intend to use the Kolors model or its derivatives for commercial purposes under the licensing terms and conditions, please send the questionnaire to kwai-kolors@kuaishou.com to register with the licensor."* Reddit community characterization: *"NON-COMMERCIAL LICENCE, WORSE THEN SD3'S."* Architectural details: **U-Net backbone** (not DiT) + **ChatGLM3** as text encoder (Chinese-bilingual focus). Diffusers-format mirror at `Kwai-Kolors/Kolors-diffusers`; ControlNet variants (Canny / Depth / Pose) at `Kwai-Kolors/Kolors-ControlNet-*`. Implication: Kolors is **not** Eastern Vanguard "open + permissive" — it's Eastern but with a Stability-class restrictive license.
- **`[NEEDS VERIFICATION 2026-05-06]`**: identify community fine-tunes / weight merges that successfully de-censor Kolors, if any. Survey doesn't name canonical examples; HF org has Kolors-Portrait-with-Flux + Kolors-Character-With-Flux + Kolors-Virtual-Try-On spaces, suggesting the official maintainer's focus is identity / try-on rather than NSFW.
- **`[NEEDS VERIFICATION 2026-05-06]`**: persona-consistency adapter port status — likely none, but confirm. The Kolors team appears to be building their own adapter ecosystem (Kolors-Character-With-Flux is a Flux-based character system, not a Kolors adapter).
- Document the aesthetic-specific use cases where Kolors is genuinely the right pick (vs Z-Image or FLUX with stylistic LoRAs achieving similar output). Photorealism + Chinese signage is the most-likely niche given U-Net + ChatGLM3 design.

## Snippets

### Kolors positioning

> "Kwai Kolors, developed by Kuaishou Technology, is a large-scale text-to-image model based on latent diffusion. While it produces exceptional aesthetics and highly stylized outputs, the community notes that it struggles with strict prompt adherence and extreme realism compared to DiT models. Furthermore, while open-source, its license requires commercial users to register formally, and it lacks natively uncensored variants."

— @sources/uncensored-image-generation-survey.md §1
