---
title: Janus-Pro
type: entity
tags: [model, unified-multimodal, llm, diffusion, deepseek]
keywords: [Janus-Pro, DeepSeek, unified multimodal model, image generation, image understanding]
related:
  - sources/unireasoner.md
  - entities/models/bagel.md
  - entities/models/blip3-o.md
  - sources/arxiv-2606-13289-hydra-x-unified-multimodal.md
  - entities/models/hydra-x.md
  - concepts/understanding-generation-gap.md
  - concepts/holistic-visual-tokenizer-umm.md
  - concepts/machine-mental-imagery.md
  - entities/benchmarks/mentisoculi.md
  - sources/arxiv-2602-02465-mentisoculi-visual-reasoning-limits-2026-06-13.md
  - sources/arxiv-2606-18249-uniar-shared-context-visual-tokenizer.md
  - concepts/shared-context-single-tokenizer-umm.md
  - entities/models/uniar.md
maturity: draft
created: 2026-05-06
updated: 2026-06-21
---

## Relations

@sources/unireasoner.md
@entities/models/bagel.md
@entities/models/blip3-o.md

## Raw Concept

Stub created during ingest of UniReasoner (@sources/unireasoner.md), where Janus-Pro appears as a unified-multimodal benchmark competitor. Standalone reference: Chen et al., "Janus-Pro: Unified multimodal understanding and generation with data and model scaling", arXiv:2501.17811 (2025), DeepSeek-AI authorship.

## Narrative

### What it is

Janus-Pro is a unified multimodal model from DeepSeek-AI focused on **scaling unified understanding-and-generation via data and model scaling**. Successor to the earlier Janus line. Architecturally similar in spirit to BAGEL (@entities/models/bagel.md) and BLIP-3o (@entities/models/blip3-o.md): single backbone, both visual understanding and visual generation supported.

[CONFIRMED] [Source: Chen et al. 2025c, referenced in arXiv:2605.04040v1]

### Headline benchmarks (UniReasoner Tables 1–2)

[CONFIRMED] [Source: arXiv:2605.04040v1 Tables 1–2]

- GenEval overall: **0.80** (Single Obj. 0.99 / Two Obj. 0.92 / Counting 0.85 / Colors 0.91 / Position 0.75 / Attr. Binding 0.66)
- DPG-Bench overall: **84.19** (Global 86.90 / Entity 88.90 / Attribute 89.40 / Relation 89.32 / Other 89.48)

Notably strong on **Position 0.75** — beats SD3 (0.34), FLUX.1-Dev (0.22), DALL·E 3 (0.43), and matches GPT-4o (0.75). Spatial reasoning is a Janus-Pro strength, plausibly because the unified-model training mixes in grounded VQA / spatial-reasoning supervision that pure-diffusion models lack.

### Workspace relevance

- Janus-Pro is not yet in `notes/models-catalog.md`. [NEEDS VERIFICATION 2026-05-06] whether weights are open, whether it runs in standard local UIs (ComfyUI / Forge), what the VRAM tier is, and what its NSFW alignment profile looks like.
- For persona / character ops: the strong Position score is interesting — spatial relationship faithfulness is exactly what gets violated in multi-character scenes. If Janus-Pro is locally runnable and reasonably uncensored, it deserves direct testing against Pony V7 / Z-Image Turbo / FLUX-class models on multi-subject prompts.

### Where it sits relative to peers

Pre-UniReasoner ranking on GenEval (Table 1): GPT-4o 0.84 > BLIP-3o 0.83 > Janus-Pro 0.80 > SANA 0.79 > SD3 0.71. Janus-Pro is the strongest open unified model after BLIP-3o on this metric.

### Open questions

[NEEDS VERIFICATION 2026-05-06]

- Open-weights availability on Hugging Face, license terms (DeepSeek typically permissive)
- Parameter count and quantization paths (GGUF / SVDQ)
- Censorship / refusal behavior on NSFW / violence prompts
- Compatibility with existing LoRAs (almost certainly not — different architecture from SDXL/FLUX ecosystems)

## Snippets

(none yet — stub. Populate with Janus-Pro paper / model-card excerpts on next deep-read.)
