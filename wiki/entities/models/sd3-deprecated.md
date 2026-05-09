---
title: SD3 / SD3.5 (Stability AI) — deprecated note
type: entity
tags: [model, sd3, sd3-5, sdxl-successor, stability-ai, strict-censorship, architectural-censorship, deprecated, civitai-takedown, openrail-m]
keywords: [SD3, SD3.5, SD3.5 Large, SD3.5 Medium, Stability AI, architectural censorship, CivitAI takedown, deprecated, 8.1B, 2B]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/de-censoring-techniques.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/playground-v3.md
  - entities/marketplaces/civitai.md
  - entities/uis/comfyui.md
maturity: validated
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/uncensored-image-generation-survey.md
@concepts/censorship-tier-taxonomy.md
@concepts/de-censoring-techniques.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/playground-v3.md
@entities/marketplaces/civitai.md

## Raw Concept

Deprecated-note entity page for **Stable Diffusion 3 / 3.5** family. Released by Stability AI in late 2024 to rectify SD3's widely-criticized launch; **as of May 2026, SD3.5 is largely viewed by the local generation community as deprecated**. The canonical case study of:

1. **Architectural censorship** — SD3's pre-training data was so aggressively scrubbed that the latent space lacks foundational anatomical structures, making LoRA-injection de-censoring ineffective.
2. **Platform-policy migration pressure** — Stability AI's strict alignment + CivitAI's enforced takedowns of SD3.5-derived NSFW content drove community migration to **FLUX variants and Eastern Vanguard models**.

Back-filled from @sources/uncensored-image-generation-survey.md §1 + §3 (community platforms).

## Narrative

### What SD3 / SD3.5 are

[CONFIRMED, source @sources/uncensored-image-generation-survey.md §1]:

- **SD3** (Stable Diffusion 3) — initially released by Stability AI; widely criticized at launch for architectural censorship symptoms (most famously, severe anatomy distortion when generating people). The pre-training dataset was heavily scrubbed of explicit anatomy, which manifested as broken outputs even on innocuous prompts that happened to involve human anatomy.
- **SD3.5 Large** — 8.1B parameters; released late 2024 as the rectification.
- **SD3.5 Medium** — 2B parameters.
- Permissive community licenses + excellent prompt adherence (Stability claimed parity with FLUX-class on compositional tasks).

### Why SD3.5 is deprecated as of May 2026

[CONFIRMED, source @sources/uncensored-image-generation-survey.md §1 + §3]:

The base SD3.5 censorship profile is **highly restrictive** in two compounding ways:

1. **Architectural censorship inherited from SD3** — even though SD3.5 fixed many of the body-distortion symptoms, the deeper latent-space scrubbing remained. The model's foundational structures still lack the explicit anatomy that natively-uncensored models possess. Per @concepts/de-censoring-techniques.md §4, this is the **architectural hard wall**: no amount of LoRA injection or weight merging fully recovers what isn't there.
2. **Platform-policy enforcement** — Stability AI's late-2025 updated Acceptable Use Policy effectively required hosting platforms to police SD3.5-derived NSFW content. **CivitAI is legally obligated to censor and remove NSFW content generated specifically using SD3.5 models** (per [r/civitai: Did Civitai silently remove SD 3.5 Large?](https://www.reddit.com/r/civitai/comments/1obcu5w/did_civitai_silently_remove_sd_35_large/)).

The combination — bad foundational fit for uncensored work + active platform enforcement — drove the community migration the survey documents:

> *"This aggressive moderation, coupled with a weaker aesthetic baseline compared to FLUX, prevented SD3.5 from capturing the uncensored market."*

> *"This policy enforcement has drastically accelerated the community's migration toward Eastern models and FLUX variants that lack such restrictive platform-level policing."*

### Censorship tier

**Strict** — see @concepts/censorship-tier-taxonomy.md. The "Strict" assignment captures both layers (architectural latent-space scrubbing + active platform/policy enforcement). The de-censoring path:

- **Cannot be fixed locally** without massive full-parameter fine-tuning (see @concepts/de-censoring-techniques.md §4 — architectural hard wall).
- **Migration is the pragmatic answer**. The community has moved to FLUX.1 Dev / FLUX.2 Klein / Z-Image Turbo / Pony V6-V7 / Eastern Vanguard alternatives.

This makes SD3.5 a useful **counter-example** when explaining the censorship-tier taxonomy: a Western-lab Strict-tier model whose architectural and policy choices created a market opening that FLUX and the Eastern Vanguard filled.

### Why this entry exists despite deprecation

[CONFIRMED]:

- **Conceptual reference** — every discussion of architectural censorship vs latent-knowledge gap eventually points at SD3 as the canonical example. The wiki needs a place to point.
- **License lineage** — earlier SDXL fine-tunes inherit from SDXL 1.0's OpenRAIL-M chain, not SD3. SD3.5 has its own permissive license but the platform enforcement on outputs is the bind. Documenting this prevents license-chain confusion.
- **Strategic / market context** — the SD3.5 → FLUX + Eastern Vanguard migration is a major 2025-2026 trend and informs every decision about what model family to invest community effort in. SD3.5's failure is part of the Eastern Vanguard's success story.

### What "deprecated" means here

[CONFIRMED]:

Not "model removed from Hugging Face" — the weights remain available under permissive licenses. *Deprecated* in this context means:

- Community fine-tuning effort has shifted away (almost zero new SD3.5 fine-tunes shipped in 2026).
- New persona-consistency adapters / tooling don't target SD3.5.
- CivitAI hosts older SD3.5 LoRAs under increasing friction; new ones face takedown risk.
- Tutorials and workflows produced in 2026 default to FLUX or Eastern Vanguard alternatives.

If a user has an existing SD3.5-based workflow and it's not generating policy-flagged content, the model continues to work. The deprecation is in the *forward* direction (new investment), not in the *legacy* direction (existing workflow viability).

### Workspace TODO

- **`[NEEDS VERIFICATION 2026-05-06]`**: confirm exact text of Stability AI's late-2025 Acceptable Use Policy and the CivitAI compliance mechanism. The survey paraphrases; primary sources are needed for any commercial-decision documentation.
- **`[NEEDS VERIFICATION 2026-05-06]`**: are there any SD3.5 community fine-tunes that shipped in 2026 that are *not* deprecated? The survey makes a sweeping claim; spot-check via CivitAI search.
- Document the architectural-censorship symptoms specifically — what does an SD3 "broken anatomy" output look like? Useful for explaining the latent-space-scrubbing failure mode in @concepts/de-censoring-techniques.md.
- Track Stability AI's roadmap — any signs of an SD4 / direction shift on alignment posture? Affects whether to write off the entire Stability lineage or only this specific generation.

## Snippets

### SD3.5 deprecation framing

> "Stable Diffusion 3.5 (SD3.5 Large / Medium) Released by Stability AI in late 2024 to rectify the widely criticized launch of SD3, SD3.5 Large (8.1B parameters) and Medium (2B parameters) feature permissive community licenses and excellent prompt adherence. However, as of May 2026, the SD3.5 architecture is largely viewed by the local generation community as deprecated."

— @sources/uncensored-image-generation-survey.md §1

### CivitAI enforcement loop

> "Note: Due to Stability AI's updated Acceptable Use Policy in late 2025, CivitAI is legally obligated to censor and remove NSFW content generated specifically using SD3.5 models. This policy enforcement has drastically accelerated the community's migration toward Eastern models and FLUX variants that lack such restrictive platform-level policing."

— @sources/uncensored-image-generation-survey.md §3

### Architectural censorship — SD3 as the canonical example

> "If a corporate laboratory aggressively scrubs its pre-training dataset of all explicit imagery to avoid copyright infringement or public relations issues, the resulting model suffers from architectural censorship. […] Early SD3 models suffered heavily from this flaw. […] In these instances, massive, highly destructive full-parameter fine-tunes are required, driving users toward natively uncensored models like Z-Image or Pony V7 instead."

— @sources/uncensored-image-generation-survey.md §4.4
