---
title: SANA
type: entity
tags: [model, diffusion, t2i, linear-transformer, nvidia, mit]
keywords: [SANA, linear diffusion transformer, efficient T2I, high-resolution diffusion, ICLR 2025]
related:
  - sources/unireasoner.md
  - concepts/draft-evaluate-diffuse-pipeline.md
  - concepts/llm-as-image-conditioning.md
  - entities/models/pixart-sigma.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/unireasoner.md
@concepts/draft-evaluate-diffuse-pipeline.md
@concepts/llm-as-image-conditioning.md
@entities/models/pixart-sigma.md

## Raw Concept

Stub created during ingest of UniReasoner (@sources/unireasoner.md), where SANA serves as the diffusion backbone for all reported results. Standalone references are Xie et al., "SANA: Efficient high-resolution text-to-image synthesis with linear diffusion transformers", ICLR 2025.

## Narrative

### What it is

SANA is an efficient high-resolution text-to-image diffusion model built on a **linear-attention diffusion transformer**. Released at ICLR 2025 by Xie, Chen, Cai, Tang, Lin, Zhang, Li, Zhu, Lu et al. (NVIDIA + MIT lineage). It uses cross-attention to inject conditioning rather than the MM-DiT approach of SD3.

[CONFIRMED] [Source: Xie et al. 2025 referenced in arXiv:2605.04040v1 p.13]

### Headline benchmarks (as the UniReasoner baseline)

[CONFIRMED] [Source: arXiv:2605.04040v1 Tables 1–2]

- GenEval overall: **0.79** (vs SD3 0.71, FLUX.1-Dev 0.66, BLIP-3o 0.83, GPT-4o 0.84). Strongest pre-UniReasoner non-unified-LLM open model on GenEval.
- DPG-Bench overall: **84.50** (vs SD3 84.08, FLUX.1-Dev 83.84, Janus-Pro 84.19). Edges out all open competitors on this benchmark.
- Weakness profile: GenEval Position 0.62 (lower than Janus-Pro 0.75), GenEval Attribute Binding 0.57 (lower than BLIP-3o 0.67). Standard compositional-T2I failure modes.

### Why it matters in this workspace

- SANA is the **diffusion backbone UniReasoner builds on** — boosts GenEval 0.79 → 0.88 with no change to SANA itself, only the conditioning.
- The cross-attention conditioning style (rather than MM-DiT) is what UniReasoner targets when describing how `(p, d, e)` is injected.
- Workspace status: not yet covered in `notes/models-catalog.md`. Linear-DiT is a relatively niche architecture compared to FLUX/SDXL/SD3.5 which dominate local UI ecosystems.

### Open questions

[NEEDS VERIFICATION 2026-05-06]

- Local runtime feasibility on Apple Silicon and consumer NVIDIA cards. Linear attention is theoretically faster but ComfyUI / Forge support unknown.
- Censorship / NSFW profile of base SANA — not in scope of UniReasoner paper; needs separate model-card lookup on Hugging Face.
- Does any uncensored fine-tune ecosystem exist around SANA (analogous to the Pony/Illustrious ecosystems on SDXL)? Likely no — adoption seems limited to research benchmarks so far.

## Snippets

> "Crucially, UniReasoner improves upon SANA by +1.80 overall (84.50→86.30) using the identical diffusion generator, demonstrating that the performance gain stems directly from our reasoning framework rather than a more powerful diffusion backbone."
> [Source: arXiv:2605.04040v1 p.9]
