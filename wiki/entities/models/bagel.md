---
title: BAGEL
type: entity
tags: [model, unified-multimodal, llm, diffusion, qwen, bytedance]
keywords: [BAGEL, unified multimodal model, understanding-generation gap, Qwen backbone, image gen + image understanding, single-LLM unified system]
related:
  - sources/unireasoner.md
  - concepts/understanding-generation-gap.md
  - entities/models/janus-pro.md
  - entities/models/blip3-o.md
  - sources/arxiv-2606-13289-hydra-x-unified-multimodal.md
  - entities/models/hydra-x.md
  - concepts/understanding-generation-gap.md
  - concepts/holistic-visual-tokenizer-umm.md
  - concepts/machine-mental-imagery.md
  - entities/benchmarks/mentisoculi.md
  - sources/arxiv-2602-02465-mentisoculi-visual-reasoning-limits-2026-06-13.md
maturity: draft
created: 2026-05-06
updated: 2026-06-15
---

## Relations

@sources/unireasoner.md
@concepts/understanding-generation-gap.md
@entities/models/janus-pro.md
@entities/models/blip3-o.md

## Raw Concept

Stub created during ingest of UniReasoner (@sources/unireasoner.md). BAGEL is the canonical example used in that paper to demonstrate the @concepts/understanding-generation-gap.md. Standalone reference: Deng et al., "Emerging properties in unified multimodal pretraining", arXiv:2505.14683 (2025).

## Narrative

### What it is

BAGEL is a unified multimodal foundation model that uses **a single LLM backbone (Qwen) for both visual understanding and visual generation**, blending autoregressive token modeling with diffusion / flow-matching components. Part of the 2024–2025 wave of unified models alongside Janus-Pro, BLIP-3o, Emu3, Qwen-Image.

[CONFIRMED] [Source: Deng et al. 2025, referenced in arXiv:2605.04040v1]

### Why it's the canonical understanding-generation-gap demo

UniReasoner Figure 1 uses BAGEL on Qwen for both ends:

- **Generation:** prompted "four apples in the tree", BAGEL produces 5 apples. Same with cup-left-of-umbrella (swapped), single-coin-top-left (placed at center), sodium-into-water (no reaction). Multiple compositional / physical failures.
- **Understanding (same model on its own outputs):** correctly counts 5 apples, correctly identifies "cup is to the right of umbrella", correctly diagnoses the spatial mismatch, correctly explains sodium reactivity.

The asymmetry — competent verifier, unreliable generator — is what UniReasoner labels the @concepts/understanding-generation-gap.md and what motivates Draft-Evaluate-Diffuse (@concepts/draft-evaluate-diffuse-pipeline.md).

### Where BAGEL sits in the unified-model field

[CONFIRMED] (cross-references in @sources/unireasoner.md §1, §2.1)

| Model | Role of LLM | Notes |
|-------|-------------|-------|
| BAGEL | Qwen as both generator and understander; AR + diffusion blend | Canonical "understanding-generation gap" example |
| Janus-Pro (@entities/models/janus-pro.md) | DeepSeek-Vision backbone; data + model scaling focus | GenEval 0.80, DPG 84.19 — strong unified competitor |
| BLIP-3o (@entities/models/blip3-o.md) | "Fully open" unified — open architecture, training, dataset | GenEval 0.83, DPG 82.27 |
| Emu3 | Next-token-prediction-only across modalities (no diffusion head) | GenEval 0.54 — earlier generation, weaker |
| Qwen-Image | Qwen LLM as primary conditioning backbone for diffusion (not strictly "unified" in BAGEL sense) | Distinct architecture; see notes/models-catalog.md for current local-workflow context |

### Workspace relevance

- BAGEL itself is not in `notes/models-catalog.md` as of 2026-05-06; the catalog focuses on locally-runnable image-gen models, and BAGEL's positioning is more "unified research model" than "local-rig daily driver". [NEEDS VERIFICATION 2026-05-06] whether BAGEL has open weights and runs in standard local stacks.
- For persona / character ops, the conceptual takeaway from BAGEL's failure modes is more important than running BAGEL locally: any unified-model architecture will exhibit the same gap unless mitigated (regional prompting, layout conditioning, post-hoc inpainting, or Draft-Evaluate-Diffuse-style additions).

### Open questions

[NEEDS VERIFICATION 2026-05-06]

- Open-weights status (Hugging Face availability, license)
- Local-hardware viability (parameter count, VRAM tier)
- Censorship / NSFW alignment profile in the released checkpoint
- Whether any community fine-tunes have started to appear

## Snippets

> "BAGEL employing the same LLM (Qwen) for image generation and understanding, exposes a striking asymmetry. During generation, the model violates explicit prompt constraints, resulting in incorrect object counts, swapped spatial relations, or physically/chemically implausible outcomes. However, when tasked with evaluating its own output, the exact same model accurately diagnoses these failures, demonstrating that its understanding strength exceeds its direct generative capabilities."
> [Source: arXiv:2605.04040v1 Figure 1 caption, p.2]
