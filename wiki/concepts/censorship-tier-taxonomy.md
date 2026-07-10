---
title: Censorship-tier taxonomy (5-tier framework)
type: concept
tags: [censorship, taxonomy, alignment, nsfw, model-classification, de-censoring]
keywords: [Unbound, WTF, Completely Uncensored, Minimal, Partial, Architectural, Strict, alignment, refusal, latent-space-scrubbing, abliteration]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/prompt-engineering-uncensored.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/pony-v6.md
  - entities/models/pony-v7.md
  - entities/models/illustrious-xl.md
  - entities/models/noobai-xl.md
  - concepts/lora-taxonomy.md
  - concepts/de-censoring-techniques.md
  - concepts/pluralistic-safety-alignment.md
  - sources/arxiv-2606-00369-geo-cultural-safety-alignment.md
  - concepts/activation-steering-video-generation.md
  - sources/arxiv-activation-steering-video-gen-2606.04775-2026-06-05.md
  - entities/models/anima.md
  - entities/models/z-image-turbo.md
  - entities/models/qwen-image-2512.md
  - entities/models/ernie-image.md
  - entities/models/playground-v3.md
  - entities/models/kwai-kolors.md
  - entities/models/pixart-sigma.md
  - entities/models/sdxl-fine-tunes.md
  - entities/models/sd3-deprecated.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/ltx-2.md
  - entities/models/mochi-1.md
  - entities/models/cogvideox-1-5.md
  - concepts/model-selection-workflow.md
  - entities/marketplaces/civitai.md
  - concepts/cross-model-safety-steering.md
  - sources/arxiv-2606-05290-cross-model-safety-steering.md
  - sources/arxiv-2606-09701-advgrpo-red-teaming-routed.md
  - sources/arxiv-2606-17257-reins-video-safety-representation-steering.md
  - concepts/representation-space-video-safety-steering.md
  - entities/models/hunyuanimage-3-0.md
  - sources/arxiv-2606-28643-obliviate-autoregressive-concept-erasure.md
  - concepts/autoregressive-concept-erasure-obliviate.md
  - sources/arxiv-2509-23951-hunyuanimage-3-0-technical-report.md
  - entities/training-tools/heretic.md
maturity: draft
created: 2026-05-06
updated: 2026-07-02
---

## Relations

@sources/uncensored-image-generation-survey.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/models/pony-v6.md
@entities/models/pony-v7.md
@entities/models/illustrious-xl.md
@entities/models/noobai-xl.md
@concepts/lora-taxonomy.md
@concepts/de-censoring-techniques.md
@concepts/activation-steering-video-generation.md
@entities/models/anima.md
@entities/models/z-image-turbo.md
@entities/models/qwen-image-2512.md
@entities/models/ernie-image.md
@entities/models/playground-v3.md
@entities/models/kwai-kolors.md
@entities/models/pixart-sigma.md
@entities/models/sdxl-fine-tunes.md
@entities/models/sd3-deprecated.md
@sources/video-generation-survey-2026.md
@entities/models/wan-2-2.md
@entities/models/hunyuanvideo-1-5.md
@entities/models/ltx-2.md
@entities/models/mochi-1.md
@entities/models/cogvideox-1-5.md
@concepts/model-selection-workflow.md
@concepts/prompt-engineering-uncensored.md
@entities/marketplaces/civitai.md

## Raw Concept

The wiki needs a working classification of how a foundation model behaves around explicit content, because **the de-censoring path depends on the tier** — abliteration, LoRA injection, full fine-tune, and platform-clone are not interchangeable. The 5-tier framework below is contributed by @sources/uncensored-image-generation-survey.md §1 opening and is adopted as the wiki's canonical taxonomy.

## Narrative

### The five tiers

| Tier | Refusal behavior | Latent space | Fix path |
|---|---|---|---|
| **Unbound / "WTF"** | None — hallucinates explicit content even when not prompted | Trained on uncurated explicit-rich data | No fix needed; sometimes the **opposite** problem (need negative prompts to suppress) |
| **Completely Uncensored** | None | Latent space contains explicit anatomy | No fix needed |
| **Minimal** | None (no active refusal) | Pre-training dataset **scrubbed** of explicit anatomy → cannot accurately render | LoRA injection at high strength (0.8–1.2); occasionally model surgery |
| **Partial / "Architectural"** | Sometimes (aggressive safety classifiers) | Latent space **deeply** scrubbed; explicit generation mathematically impossible | Abliteration (vector subtraction), TIES/DARE merging with uncensored donor, or full fine-tune |
| **Strict** | Active refusal based on hardcoded blocklists | Often Minimal/Partial latent space + refusal head | Cannot be fixed locally without removing the refusal head; clone-to-unaligned-platform usually preferred |

### Why the tier matters for the de-censoring path

- **Unbound / Completely Uncensored**: skip de-censoring; tune the **negative** prompt or blend with a more aligned model if you want occasional restraint.
- **Minimal**: an explicit-anatomy LoRA at strength 0.8–1.2 is the modal fix. The model's text encoder still understands explicit prompts; the LoRA just supplies the missing visual targets. Cost: ~1 hour to train, ~50 MB on disk per LoRA. See @concepts/lora-taxonomy.md for LoRA variant choice.
- **Partial / Architectural**: LoRA injection alone fails — the latent space lacks the foundational structures the LoRA tries to reach. Requires abliteration (mathematical excision of refusal/safety vectors from attention matrices) OR weight-merging techniques (SLERP, TIES-Merging, DARE) that fuse the aesthetic strengths of the partial-tier model with the uncensored anatomical knowledge of a fully-uncensored donor. See abliteration discussion in @sources/uncensored-image-generation-survey.md §4.1.
- **Strict**: typically not viable to fix locally. The community's pragmatic answer is to migrate workflows to Minimal/Uncensored alternatives. CivitAI's SD3.5 enforcement loop is the canonical case study — Stability AI's strict policy plus CivitAI's enforced takedowns drove migration to FLUX and Eastern Vanguard models.

### Per-model tier assignment (May 2026)

| Tier | Models in this tier |
|---|---|
| Unbound | Anima *(deferred — session 2)* |
| Completely Uncensored | @entities/models/pony-v6.md, @entities/models/pony-v7.md, Illustrious XL, NoobAI-XL, Z-Image *(deferred)*, Zeta Chroma *(deferred)* |
| Minimal | @entities/models/flux-1-dev.md, @entities/models/flux-2-klein.md, Qwen-Image *(deferred)*, ERNIE-Image *(deferred)*, PixArt-Σ *(deferred)*, Kwai Kolors *(deferred)* |
| Partial / Architectural | SD3 / SD3.5 baseline *(deferred)*, Playground v3 *(deferred)*, FLUX.2 Dev (heavily aligned out of the box) |
| Strict | Closed-source APIs (FLUX.1 Pro, FLUX.2 Pro API, OpenAI Images API), SD3.5-on-CivitAI enforcement boundary |

### Spectrum vs binary

The survey explicitly frames censorship as a **spectrum, not a binary**. This matters because:

- A model can be **Minimal** at the architecture level but **Strict** at the inference-code level (HunyuanVideo 1.5 — base weights unrestricted, official inference code adds hardcoded blocklists). The community fix is "cosy" UI builds that strip the safety classifiers.
- A model can be **Architectural** for some content classes and **Minimal** for others (Playground v3 — heavily aligned for explicit anatomy but freely generates violence/gore).
- The tier can shift mid-version (FLUX.1 → FLUX.2 added stronger alignment; Pony V6 → V7 mostly preserved Completely Uncensored status by deliberate captioning effort).

### Confidence

- The 5-tier framework itself is **`[TENTATIVE]`** — single-source from this survey. It is internally coherent and matches community usage, but the wiki should treat the per-tier model assignments as needing cross-validation against direct testing or a second source.
- The de-censoring path correspondence (which fix works on which tier) is **`[CONFIRMED]`** — multiple corroborating sources in the survey + @sources/synthetic-character-consistency-survey.md mention abliteration / LoRA strength conventions.

## Snippets

### Origin of the framework

> "The concept of censorship within artificial intelligence image generation operates along a complex spectrum rather than a binary toggle. In the current community consensus, censorship profiles are categorized into distinct tiers."

— @sources/uncensored-image-generation-survey.md §1, opening

### Architectural-tier hard wall

> "If a corporate laboratory aggressively scrubs its pre-training dataset of all explicit imagery to avoid copyright infringement or public relations issues, the resulting model suffers from architectural censorship. The model does not simply refuse to draw a specific anatomical feature; it literally does not possess the latent knowledge of what that feature looks like. No amount of prompt engineering or basic LoRA injection can easily fix this."

— @sources/uncensored-image-generation-survey.md §4.4

## Dead Ends

- **Treating "is X censored?" as a yes/no question** — leads to wasted effort. The right question is "what tier is X, and what fix works on that tier?". A user who tries LoRA injection on a Partial-tier model will get poor results and may incorrectly conclude the LoRA is broken (it isn't — the model's latent space simply can't reach the LoRA's targets).
- **Conflating "Minimal" and "Completely Uncensored"** — produces the trap of buying into FLUX.1 Dev as a drop-in replacement for Pony V6 and being surprised when explicit anatomy renders poorly. They are different tiers and require different add-ons.
