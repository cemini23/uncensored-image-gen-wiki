---
title: Comprehensive Survey of Uncensored Local Image Generation Models and Frameworks (May 2026)
type: source
tags: [survey, deep-research, uncensored, local-generation, model-catalog, dit, flux, pony, illustrious, eastern-models]
keywords: [Uncensored, DiT, U-Net pivot, FLUX.1, FLUX.2, Pony Diffusion, Illustrious XL, NoobAI-XL, Anima, Z-Image, Qwen-Image, ERNIE-Image, abliteration, censorship tiers, Apache 2.0]
related:
  - concepts/censorship-tier-taxonomy.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/pony-v6.md
  - entities/models/pony-v7.md
  - entities/models/illustrious-xl.md
  - entities/models/noobai-xl.md
  - concepts/de-censoring-techniques.md
  - entities/models/anima.md
  - entities/models/z-image-turbo.md
  - entities/models/qwen-image-2512.md
  - entities/models/ernie-image.md
  - entities/models/playground-v3.md
  - entities/models/kwai-kolors.md
  - entities/models/pixart-sigma.md
  - entities/models/sdxl-fine-tunes.md
  - entities/models/sd3-deprecated.md
maturity: validated
created: 2026-05-06
updated: 2026-05-06
read_status: deep-read
provenance:
  title: Comprehensive Survey of Uncensored Local Image Generation Models and Frameworks (May 2026)
  type: deep-research synthesis (claude.ai / Gemini / DeepSeek lineage; archived in `research to be indexed/processed/`)
  filename: Uncensored AI Image Generation Survey.docx
  size: 53,019 chars / 215 paragraphs
  retrieved: 2026-05-05 (drop date)
---

## Relations

@concepts/censorship-tier-taxonomy.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/models/pony-v6.md
@entities/models/pony-v7.md
@entities/models/illustrious-xl.md
@entities/models/noobai-xl.md
@concepts/de-censoring-techniques.md
@entities/models/anima.md
@entities/models/z-image-turbo.md
@entities/models/qwen-image-2512.md
@entities/models/ernie-image.md
@entities/models/playground-v3.md
@entities/models/kwai-kolors.md
@entities/models/pixart-sigma.md
@entities/models/sdxl-fine-tunes.md
@entities/models/sd3-deprecated.md

## Raw Concept

Deep-research synthesis dropped into the inbox alongside the persona-consistency / video-gen / persona-ops / monetization briefs. The fourth of five docx originals to be back-filled into the wiki under Path A. The companion brief lives at `briefs/uncensored-models.md` (LIGHT-mode era), and its prior-LIGHT-mode summary lives at [notes/models-catalog.md](../../notes/models-catalog.md).

This source is the **canonical model-catalog reference** for the wiki — every per-model entity page in `entities/models/` after step 2 of Path A traces back here. The survey is unusual in that it is fully cited (215 paragraphs, ~30 inline citations to CivitAI, Hugging Face, Reddit, GitHub, Stability AI, BFL, Alibaba research, BFL announcements, Florida statute text, EU AI Act, etc.).

Path A step 2 first ingest session covers §1.1 (Danbooru lineage) and the FLUX subset of §1.2 (FLUX.1 Dev/Schnell/Pro consolidation, FLUX.2 Klein 9B/4B). A second session will absorb §1.3 (Eastern Vanguard) and the rest of §1.2 (SDXL fine-tunes, SD3.5 deprecation note). The §4 de-censoring techniques concept folds into the second session. §5 hardware + §6 workflow defer to Path A step 5 (notes/hardware-optimization.md + notes/frameworks-tools.md migration). §7 legal/regulatory defers to Path A step 6 (monetization/ethics/law docx).

## Narrative

### Authorship and date

Anonymous deep-research output, May 2026. Self-identified as a "Comprehensive Survey." Internal dating is consistent: explicit references to FLUX.2 (released November 2025), Pony V7 deployment phase (early 2026), Anima release (early 2026), Florida HB 757 (effective 2025-10-01), EU AI Act transparency obligations (effective 2026-08), CivitAI's SD3.5 NSFW takedown enforcement (late 2025).

### Central thesis

The 2026 local open-weight ecosystem has undergone two simultaneous shifts:

1. **Architectural** — pivot away from CNN/U-Net (SD1.5/SDXL era) toward **Diffusion Transformers (DiTs)**. Flagship models swelled from 2B to 20B–32B parameters. Higher prompt adherence, stronger text rendering, better spatial coherence, but punishing VRAM requirements that drive aggressive quantization (FP8, GGUF, SVDQ/Nunchaku).

2. **Geopolitical** — Western labs (Stability AI, BFL, Playground) ship aligned-and-restrictive models with restrictive licenses; Eastern labs (Alibaba Tongyi MAI, Alibaba-Qwen, Baidu, Tencent, Kuaishou) ship Apache 2.0, minimally-aligned, highly-capable foundation models. Eastern foundations are **inherently uncensored at the architectural level** — Western foundations require community surgery (LoRA, abliteration, merging) to reach the same baseline.

The community navigates this bifurcation through a **decentralized counter-ecosystem** with two tracks: (a) abliterated/merged Western foundations (e.g. FLUX-UNCENSORED-Merged, Chroma1-HD, SNOFS, SD1.5 dreambooth lineage), and (b) Eastern foundations downloaded directly with no surgery needed (Z-Image, Qwen-Image, ERNIE).

### Censorship spectrum framework

The survey contributes a **5-tier classification** of censorship that the wiki adopts as its working taxonomy. See @concepts/censorship-tier-taxonomy.md.

| Tier | Behavior | Examples |
|---|---|---|
| Unbound / "WTF" | Hallucinates explicit content even unprompted | Anima |
| Completely Uncensored | Generates exactly what's prompted, NSFW or otherwise, without quality degradation | Pony V6, Pony V7, Z-Image |
| Minimal | No active refusal, but pre-training scrubbed of explicit anatomy → requires LoRA assistance for accuracy | FLUX.1 Dev (base), FLUX.2, Qwen-Image, ERNIE |
| Partial / "Architectural" | Aggressive safety classifiers OR latent space scrubbed deeply enough that explicit generation is mathematically impossible | SD3 (early), Playground v3 |
| Strict | Active refusal based on hardcoded blocklists | Closed-source APIs, SD3.5 + CivitAI enforcement |

This framework matters because **the de-censoring path depends on the tier**: Minimal-tier models respond to LoRA injection; Partial-tier models require either abliteration (vector subtraction) or aggressive merging; Strict-tier models cannot be fixed without cloning to an unaligned platform.

### Model catalog (back-filled in step 2)

The survey's §1 catalog is what step 2 of Path A back-fills into entity pages.

**§1.1 Danbooru lineage** — Pony V6 (SDXL base), Pony V7 (AuraFlow base), Illustrious XL (SDXL base, 16k+ artist styles), NoobAI-XL (V-Prediction Illustrious fine-tune), Anima (2B DiT modified from Cosmos-Predict, "WTF" tier).

**§1.2 Transformer Heavyweights** — FLUX.1 (Schnell/Dev/Pro), FLUX.2 (Dev 32B / Klein 9B-4B), SD3.5 (deprecated 8.1B + 2B), SDXL fine-tunes (Juggernaut, Epicrealism, Cyberrealistic, Lustify, BigAsp-v2.5).

**§1.3 Eastern Vanguard** *(deferred to session 2)* — Z-Image Turbo / Zeta Chroma, Qwen-Image-2512 (20B+), ERNIE-Image (Baidu 8B DiT), Playground v3, Kwai Kolors, PixArt-Σ, HunyuanVideo 1.5 *(video → step 3)*.

### Why this source matters for the wiki

- Establishes the **modal 2026 model landscape** — which models are alive, which are deprecated, which are essential.
- Provides the **per-model VRAM + censorship + license matrix** that downstream brief writing depends on.
- Surfaces the **de-censoring technique taxonomy** (abliteration / LoRA-based / prompt engineering / architectural) which is its own concept page once session 2 lands.
- Documents the **Eastern-vs-Western lab dichotomy** as a first-class organising principle (rather than an incidental observation) — explains why the Apache 2.0 licensing axis matters at least as much as the parameter-count axis.

### Limits / caveats

- **Citation density skews toward Reddit and CivitAI** — strong on community-consensus claims, weaker on academic/arXiv grounding. Most NSFW capability claims are from r/StableDiffusion, r/comfyui, r/LocalLLaMA threads. Treat single-Reddit-citation claims as `[TENTATIVE]`.
- ~~**Pony V7 status as of survey-write was "deployment phase"** — citation 8 actually contradicts this (Reddit post titled "Pony v7 model weights won't be released")~~ — **resolved [CONFIRMED 2026-05-06]**: citation 7 wins. Pony V7 weights ARE publicly released as of May 2026 — `purplesmartai/pony-v7-base` on Hugging Face + [civitai.com/models/1901521/pony-v7-base](https://civitai.com/models/1901521/pony-v7-base). 7B params, AuraFlow base, Apache 2 (with restrictions), GGUF quants available. Citation 8 was pre-release confusion that got superseded. See @entities/models/pony-v7.md for the resolved discussion + verified primary sources.
- **HunyuanVideo claim of being "uncensored at base weights but filtered at inference code"** — survey cites two Reddit posts (55, 56) and one academic poster (182) for this. This is a critical claim because it determines whether HunyuanVideo is reachable on Apple Silicon (where the official inference code may be the only path). **`[NEEDS VERIFICATION 2026-05-06]`** — should be resolved during step 3 video-survey ingest.
- **No first-party hardware testing** — all VRAM / iteration-time claims are aggregated from community reports. Treat as `[TENTATIVE]` until tested locally.

## Snippets

### Architectural-pivot framing

> "The industry has largely pivoted away from the Convolutional Neural Network (CNN) paradigms—specifically the U-Net architectures that defined the Stable Diffusion 1.5 and SDXL eras—toward highly scalable Diffusion Transformers (DiTs)."

— §Executive Summary

### Eastern-vs-Western dichotomy

> "Western laboratories, facing increasing regulatory scrutiny and commercial pressures, have adopted stringent safety alignments, restrictive content filters, and licensing frameworks that explicitly prohibit the generation of mature, explicit, or legally sensitive content. In direct response to these guardrails, a robust, decentralized counter-ecosystem has flourished."

— §Executive Summary

### Censorship-tier framework

> "Censorship profiles are categorized into distinct tiers. At the most unrestricted end lies the 'Unbound' or 'WTF' tier, wherein an extreme lack of alignment causes the model to hallucinate explicit or inappropriate content even without explicit prompting. The 'Completely Uncensored' tier generates exactly what is prompted, including Not Safe For Work (NSFW) content, gore, or political satire, without hesitation or quality degradation. The 'Minimal' tier lacks active refusal mechanisms, but because its pre-training dataset was cleansed of explicit anatomy, it requires community fine-tuning to generate such concepts accurately. 'Partial' or 'Architectural' censorship indicates the presence of aggressive safety classifiers or a latent space so thoroughly scrubbed that generating specific concepts is nearly impossible. Finally, the 'Strict' tier involves models that actively refuse prompts based on hardcoded blocklists."

— §1, opening

### Apache-2.0 strategy as Eastern lab market move

> "Highly permissive, allowing full commercial use and modification. This licensing strategy is heavily utilized by Chinese tech firms to capture market share and developer mindshare from restrictive Western equivalents."

— §7.4 (Apache 2.0 entry)

### Architectural censorship as a hard wall

> "There is a hard mathematical limit to de-censoring. If a corporate laboratory aggressively scrubs its pre-training dataset of all explicit imagery to avoid copyright infringement or public relations issues, the resulting model suffers from architectural censorship. The model does not simply refuse to draw a specific anatomical feature; it literally does not possess the latent knowledge of what that feature looks like."

— §4.4

### CivitAI / SD3.5 enforcement loop

> "Due to Stability AI's updated Acceptable Use Policy in late 2025, CivitAI is legally obligated to censor and remove NSFW content generated specifically using SD3.5 models. This policy enforcement has drastically accelerated the community's migration toward Eastern models and FLUX variants that lack such restrictive platform-level policing."

— §3 (CivitAI entry)
