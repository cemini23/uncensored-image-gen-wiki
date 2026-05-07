---
title: Illustrious XL (OnomaAI Research)
type: entity
tags: [model, sdxl, illustrious, danbooru, anime, lora-base, completely-uncensored, artist-style]
keywords: [Illustrious XL, OnomaAI Research, Danbooru 2023, 16000 artist styles, anime, character traits, Japan]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/character-dna-templates.md
  - concepts/persona-consistency-methods.md
  - entities/models/pony-v6.md
  - entities/models/pony-v7.md
  - entities/models/noobai-xl.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/adapters/ip-adapter.md
  - concepts/de-censoring-techniques.md
  - entities/models/anima.md
  - entities/models/sdxl-fine-tunes.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/uncensored-image-generation-survey.md
@concepts/censorship-tier-taxonomy.md
@concepts/character-dna-templates.md
@concepts/persona-consistency-methods.md
@entities/models/pony-v6.md
@entities/models/pony-v7.md
@entities/models/noobai-xl.md
@entities/training-tools/kohya-sd-scripts.md
@entities/adapters/ip-adapter.md
@concepts/de-censoring-techniques.md
@entities/models/anima.md
@entities/models/sdxl-fine-tunes.md

## Raw Concept

The dominant **studio-anime aesthetic** SDXL fine-tune of 2024–2026, complementary to @entities/models/pony-v6.md (which dominates explicit-anatomy versatility). Authored by **OnomaAI Research**, trained heavily on the Danbooru 2023 dataset. The **base** for the @entities/models/noobai-xl.md fine-tune that pushed the V-Prediction methodology. Back-filled from @sources/uncensored-image-generation-survey.md §1.1.

## Narrative

### What it is

**Illustrious XL** — community-trained SDXL fine-tune by **OnomaAI Research** (Japan). SDXL 1.0 base, heavily trained on the Danbooru 2023 dataset. Tier: **Completely Uncensored**. Latent space carries explicit Danbooru tagging directly.

The standout feature is **deep latent understanding of 16,000+ artist styles and character traits** — far more granular than Pony V6's score-tag system. Where Pony bins quality into 5 score tiers, Illustrious encodes specific artist names + character names as first-class conditioning.

### Why creators use it

[CONFIRMED]:

- **Studio-anime aesthetic at fidelity Pony V6 can't match.** Pony is versatile and explicit-friendly; Illustrious is *prettier* in the precise high-line-art sense. Different aesthetic objective.
- **Artist-style first-class** — `by [artist_tag], [character_tag], [scene description]` produces convincing artist-emulation directly. The fine-tuning made artist tags into native conditioning rather than bag-of-words tokens.
- **Character-trait coverage** — covers tens of thousands of named characters from Danbooru, often without requiring a character LoRA.
- **Cross-compatible with the SDXL/Pony LoRA ecosystem** — anime LoRAs trained on Pony or SDXL 1.0 mostly carry across.

### Limits

[CONFIRMED] / [TENTATIVE]:

- **Aesthetic objective is anime / line-art**. Photorealism is weaker than Pony V6 + photographic LoRAs and far weaker than FLUX or Z-Image. [CONFIRMED]
- **Artist-tag licensing risk** — using "by [living-artist-name]" prompts to mimic a specific commercial artist's style is **not legally protected** in most jurisdictions and could expose commercial users. The community treats this as an open question; budget for legal review before monetizing artist-style outputs. [TENTATIVE]
- **8 GB VRAM compatible** at 1024×1024, FP16 — same SDXL hardware floor as Pony V6.
- **Native resolution capped at 1024×1024** — same SDXL limitation; iterative upscaling required for higher.
- **License: SDXL OpenRAIL-M derivative** — see @sources/uncensored-image-generation-survey.md §7.4 for restrictions.

### Role in 2026 production stack

[CONFIRMED]:

- **Default for studio-anime / illustration / line-art work**. Pony V6 is for versatile explicit; Illustrious is for pretty.
- **NoobAI-XL fine-tune** (V-Prediction) uses Illustrious as its base — see @entities/models/noobai-xl.md.
- **Persona-consistency workflows** for anime-aesthetic personas often layer a custom character LoRA on top of Illustrious, using the artist-tag conditioning to lock the visual style first. Captioning convention: `by [aesthetic-anchor-artist], [character-anchor-tag], score_9, [scene]` (the score tag is borrowed from Pony but optional on Illustrious).
- **Adapter compatibility**: works with @entities/adapters/ip-adapter.md and SDXL-family adapters.

### Captioning conventions

[TENTATIVE]:

```
[character_tag or 1girl/1boy], by [artist_1], by [artist_2], [setting and pose tags], masterpiece, very_aesthetic, highres
```

Quality tags differ from Pony's score-tag system. Illustrious uses `masterpiece`, `very_aesthetic`, `absurdres`, `highres`, `quality:high` — Danbooru-native quality tags rather than the Pony-introduced score system.

### Workspace TODO

- **`[NEEDS VERIFICATION 2026-05-06]`**: confirm latest Illustrious XL hash and version on CivitAI / Hugging Face. The model has had multiple revisions.
- Confirm OnomaAI Research's release cadence — are V2/V3 in flight?
- Confirm artist-tag list — are there community tools to enumerate the 16k tags and their per-artist quality? (Civitai's Style Explorer is one such tool; verify its coverage.)
- Compare directly against NoobAI-XL on a fixed reference set; validate the V-Prediction / EPS-Prediction tradeoff claim from §1.1.

## Snippets

### Aesthetic positioning vs Pony V6

> "While Pony Diffusion excels in versatility and explicit anatomical interaction, the Illustrious XL family, authored by OnomaAI Research, dominates the pure, high-fidelity studio anime aesthetic."

— @sources/uncensored-image-generation-survey.md §1.1

### Artist-tag depth

> "Based on the SDXL architecture and trained heavily on the Danbooru 2023 dataset, Illustrious XL possesses a deep latent understanding of over 16,000 specific artist styles and character traits."

— @sources/uncensored-image-generation-survey.md §1.1
