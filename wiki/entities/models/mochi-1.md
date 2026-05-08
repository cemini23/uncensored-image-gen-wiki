---
title: Mochi 1 (Genmo)
type: entity
tags: [model, video, dit, asymmdit, mochi, genmo, apache-2-0, strict-at-base]
keywords: [mochi, mochi-1, genmo, asymmetric-diffusion-transformer, asymmdit, 10b, t5-xxl, 30fps, apache-2.0, automatic-nsfw-filter, fp8-comfyui]
related:
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - concepts/seam-stitching-strategies.md
  - concepts/de-censoring-techniques.md
  - concepts/censorship-tier-taxonomy.md
  - entities/uis/comfyui.md
maturity: draft
created: 2026-05-07
updated: 2026-05-07
---

## Relations

@sources/video-generation-survey-2026.md @entities/models/wan-2-2.md @concepts/seam-stitching-strategies.md @concepts/de-censoring-techniques.md @concepts/censorship-tier-taxonomy.md

## Raw Concept

Page prompted by the May 2026 video survey ingest. Mochi 1 (Genmo, October 2024) introduced the Asymmetric Diffusion Transformer (AsymmDiT) paradigm — the architectural ancestor of the asymmetric-resource-allocation pattern later refined by LTX-2. Apache 2.0 license but notoriously aggressive automatic NSFW filter that flags innocuous prompts.

Synthesized from @sources/video-generation-survey-2026.md.

## Narrative

### Architecture — AsymmDiT

- **10B parameters** (Asymmetric Diffusion Transformer)
- **Resource allocation**: ~75% computational parameters on visual stream / 25% on text — Genmo's discovery that symmetric text/vision allocation constrained physical realism
- **Text encoder**: single T5-XXL language model
- **Output**: 30 fps fluid motion with strong adherence to complex physical prompts

[CONFIRMED] [Source: Video Generation Models Survey 2026.docx p.2, citing medium.com/@cognidownunder/mochi-1-open-source-text-to-video-generation-to-run-locally-beb0f137a00c]

### Licensing — Apache 2.0

Fully open-source under Apache 2.0 — most permissive license among the 2026 video foundation models. [CONFIRMED]

### Censorship tier — Strict-Filter at base

Mochi incorporates a **notoriously strict automatic censorship filter that frequently flags innocuous prompts** (e.g., standard action sequences) as NSFW. Local users typically bypass these safety classifiers entirely rather than trying to thread the moderation needle. [CONFIRMED]

This is **filter-based**, not architectural-scrub (unlike Wan 2.2 / HunyuanVideo which lack the underlying anatomy representations). Mochi's weights retain the necessary mathematical features — the bypass mechanism is classifier disabling rather than LoRA-injected representation reconstruction. → @concepts/de-censoring-techniques.md → @concepts/censorship-tier-taxonomy.md

### Hardware viability

| Tier | Variant | Notes |
|------|---------|-------|
| Native | 4× 80 GB GPUs | Prohibitive — flagship configuration |
| 24 GB+ | Mochi FP8 (ComfyUI scaled wrappers) | Workstation tier; significant generation-time penalty vs native |
| 16 GB | (not viable) | Mochi 1 is a 24 GB+ minimum tier even at FP8 |

[CONFIRMED] [Source: Video Generation Models Survey 2026.docx p.4, citing huggingface.co/genmo/mochi-1-preview/discussions/8]

### Failure modes

DiT-architecture failure modes apply: extended generation past native length produces **subject scale distortion** (persona shrinks/grows relative to background) and **severe background warping during high-velocity camera pans**. Mitigate via Latent Chaining + Overlap Deduplication. → @concepts/seam-stitching-strategies.md [CONFIRMED]

## Snippets

> "Genmo discovered that allocating resources symmetrically between text and vision constrained physical realism. Consequently, Mochi dedicates approximately 75% of its computational parameters to visual stream processing and limits text processing to 25%, utilizing a single T5-XXL language model for prompt encoding."
[Source: Video Generation Models Survey 2026.docx p.2, citing medium.com/@cognidownunder/mochi-1-open-source-text-to-video-generation-to-run-locally-beb0f137a00c (retrieved 2026-05-06)]

> "the model incorporates a notoriously strict automatic censorship filter that frequently flags innocuous prompts (e.g., standard action sequences) as NSFW, forcing local users to bypass these safety classifiers entirely."
[Source: Video Generation Models Survey 2026.docx p.2, citing remio.ai/post/mochi-1-ai-video-generation-complete-technical-analysis-comparison-guide]

> "Unquantized, the model demands prohibitive VRAM capacities—often requiring four 80 GB GPUs—but community adaptations via ComfyUI and FP8 scaled wrappers have successfully compressed the model to run on 24 GB workstations, albeit with significant generation time penalties."
[Source: Video Generation Models Survey 2026.docx p.2]
