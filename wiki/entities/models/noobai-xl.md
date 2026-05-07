---
title: NoobAI-XL (Laxhar Lab)
type: entity
tags: [model, sdxl, illustrious-derivative, v-prediction, danbooru, anime, completely-uncensored]
keywords: [NoobAI-XL, Laxhar Lab, V-Prediction, EPS-Prediction, Chenkin Noob v.03, NoobAI-XL-XIN, anime]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/character-dna-templates.md
  - concepts/persona-consistency-methods.md
  - entities/models/pony-v6.md
  - entities/models/illustrious-xl.md
  - entities/training-tools/kohya-sd-scripts.md
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
@entities/models/illustrious-xl.md
@entities/training-tools/kohya-sd-scripts.md
@concepts/de-censoring-techniques.md
@entities/models/anima.md
@entities/models/sdxl-fine-tunes.md

## Raw Concept

Community-darling fine-tune of @entities/models/illustrious-xl.md by **Laxhar Lab**, distinguished from its base by training under **V-Prediction** (rather than SDXL's standard EPS-Prediction). Yields measurably better prompt adherence and stylistic range. Most recent variants (Chenkin Noob v.03, NoobAI-XL-XIN) widely considered the pinnacle of the SDXL anime era. Back-filled from @sources/uncensored-image-generation-survey.md §1.1.

## Narrative

### What it is

**NoobAI-XL** — fine-tune of @entities/models/illustrious-xl.md by **Laxhar Lab**. Built using **V-Prediction** rather than the standard EPS-Prediction methodology that base SDXL uses. Tier: **Completely Uncensored**. The V-Prediction shift is the architectural distinction — same SDXL backbone, different training objective.

V-Prediction (sometimes written `v_pred` in config files) is an alternative noise-prediction parameterization used during diffusion training. Compared to EPS-Prediction, it tends to produce **less mathematical loss during training**, which manifests as superior prompt adherence and broader stylistic range without sacrificing the base model's stability.

Most recent variants:
- **Chenkin Noob v.03** — updated with datasets through January 2026. Considered the current quality leader.
- **NoobAI-XL-XIN** — alternate fine-tune emphasizing stylistic variety.

### Why creators use it

[CONFIRMED] (community-consensus per @sources/uncensored-image-generation-survey.md):

- **Sharper prompt adherence than base Illustrious or base SDXL** — the V-Prediction training tightens the link between prompt tokens and visual targets.
- **Wider stylistic range** without losing aesthetic coherence — variants apply NoobAI's training methodology to different aesthetic objectives.
- **Cross-compatible with the SDXL/Pony/Illustrious LoRA ecosystem** — anime LoRAs largely carry across.
- **Considered "the pinnacle of the SDXL era for anime generation"** in the community consensus the survey reports.

### Limits

[CONFIRMED] / [TENTATIVE]:

- **V-Prediction sampler requirement** — inference UIs must use a V-Prediction-compatible sampler config (`v_parameterization: true` in Kohya configs; `prediction_type: v_prediction` in Diffusers). Mismatched sampler config produces garbled output. [CONFIRMED] — well-known SDXL-tinkerer issue.
- **Same SDXL hardware floor**: 8 GB VRAM at 1024×1024, FP16.
- **Same SDXL ceiling**: native 1024×1024, iterative upscaling for higher resolutions.
- **Inherits the artist-tag licensing question** from @entities/models/illustrious-xl.md.
- **License: derivative of Illustrious / SDXL OpenRAIL-M chain**.

### Role in 2026 production stack

[CONFIRMED]:

- **Top-tier anime generation on consumer hardware** in 2026 — commonly the first model to reach for studio-anime work.
- **LoRA training base** when the goal is anime-aesthetic personas; LoRAs trained against NoobAI generally carry to base Illustrious and base SDXL.
- **Captioning conventions** mostly inherit Illustrious's: `[character_tag], by [artist], [scene tags], masterpiece, very_aesthetic, highres`. The score-tag system from Pony is optional and often unnecessary.

### Workspace TODO

- **`[NEEDS VERIFICATION 2026-05-06]`**: confirm the canonical Chenkin Noob v.03 version hash on CivitAI; the model has had silent updates.
- **`[NEEDS VERIFICATION 2026-05-06]`**: confirm V-Prediction sampler config snippets for the major UIs (ComfyUI, Forge Neo, SwarmUI) — needed for the `notes/frameworks-tools.md` migration that lands at Path A step 5.
- Confirm whether NoobAI's training objective (V-Prediction) is reachable from base SDXL via `prediction_type: v_prediction` in Diffusers without retraining.
- Confirm the relationship between Chenkin Noob v.03 and NoobAI-XL-XIN — are they Laxhar Lab's twin tracks, or community offshoots?

## Snippets

### V-Prediction training advantage

> "NoobAI-XL, developed by Laxhar Lab, emerged as a community darling by fine-tuning the Illustrious XL base using a novel V-Prediction methodology rather than the standard EPS-Prediction utilized by base SDXL. This architectural tweak resulted in less mathematical loss during training, yielding superior prompt adherence and stylistic range."

— @sources/uncensored-image-generation-survey.md §1.1

### Community status

> "The most recent variants, such as Chenkin Noob v.03 (updated with datasets through January 2026) and NoobAI-XL-XIN, are widely considered the pinnacle of the SDXL era for anime generation. Both model families are fully uncensored and boast cross-compatibility with a vast array of existing SDXL anime LoRAs."

— @sources/uncensored-image-generation-survey.md §1.1
