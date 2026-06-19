---
title: FLUX.1 Dev (Black Forest Labs)
type: entity
tags: [model, flux, flux-1, mm-dit, dit, black-forest-labs, minimal-censorship, t5-encoder, 12b, non-commercial-license]
keywords: [FLUX.1 Dev, FLUX.1 Schnell, FLUX.1 Pro, Black Forest Labs, BFL, MMDiT, flow-matching, T5 encoder, FLUX-UNCENSORED-Merged, Chroma1-HD, SNOFS, abliteration]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/prompt-engineering-uncensored.md
  - concepts/synthetic-media-compute-economics.md
  - concepts/two-pass-generation-workflow.md
  - sources/synthetic-character-consistency-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/lora-taxonomy.md
  - concepts/character-dna-templates.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/persona-consistency-methods.md
  - entities/models/flux.md
  - entities/models/flux-2-klein.md
  - entities/adapters/pulid.md
  - entities/adapters/infinite-you.md
  - entities/adapters/flux-redux.md
  - entities/adapters/flux-kontext.md
  - entities/training-tools/ai-toolkit.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/onetrainer.md
  - entities/training-tools/fluxgym.md
  - concepts/de-censoring-techniques.md
  - entities/models/z-image-turbo.md
  - entities/models/qwen-image-2512.md
  - entities/models/pixart-sigma.md
  - entities/models/sd3-deprecated.md
  - entities/uis/comfyui.md
  - entities/marketplaces/civitai.md
  - entities/hardware/gpu-guide.md
  - concepts/model-selection-workflow.md
  - entities/uis/automatic1111.md
  - entities/uis/forge.md
  - concepts/t2i-model-ownership-verification.md
  - sources/arxiv-2605-29809-cert-las-t2i-mov.md
  - concepts/cross-model-safety-steering.md
  - sources/arxiv-2606-05290-cross-model-safety-steering.md
  - sources/arxiv-2606-06060-recache-diffusion-caching.md
  - sources/arxiv-2606-13496-budcache-diffusion-caching.md
  - concepts/budget-aware-diffusion-caching.md
  - concepts/product-identity-instruction-editing.md
  - sources/arxiv-2606-19103-productconsistency-product-identity-editing.md
maturity: validated
created: 2026-05-06
updated: 2026-06-19
---

## Relations

@sources/uncensored-image-generation-survey.md
@sources/synthetic-character-consistency-survey.md
@concepts/censorship-tier-taxonomy.md
@concepts/lora-taxonomy.md
@concepts/character-dna-templates.md
@concepts/reference-plus-lora-stacking.md
@concepts/persona-consistency-methods.md
@entities/models/flux.md
@entities/models/flux-2-klein.md
@entities/adapters/pulid.md
@entities/adapters/infinite-you.md
@entities/adapters/flux-redux.md
@entities/adapters/flux-kontext.md
@entities/training-tools/ai-toolkit.md
@entities/training-tools/kohya-sd-scripts.md
@entities/training-tools/onetrainer.md
@entities/training-tools/fluxgym.md
@concepts/de-censoring-techniques.md
@entities/models/z-image-turbo.md
@entities/models/qwen-image-2512.md
@entities/models/pixart-sigma.md
@entities/models/sd3-deprecated.md
@entities/uis/comfyui.md
@entities/marketplaces/civitai.md
@entities/hardware/gpu-guide.md
@concepts/model-selection-workflow.md
@concepts/prompt-engineering-uncensored.md
@concepts/synthetic-media-compute-economics.md
@concepts/two-pass-generation-workflow.md
@entities/models/anima.md
@entities/models/ernie-image.md
@entities/uis/automatic1111.md
@entities/uis/forge.md

## Raw Concept

The FLUX.1 generation in detail. Released August 2024 by Black Forest Labs. The 12B FLUX.1 Dev is the foundation of the modern FLUX-based persona-consistency stack (PuLID II, InfiniteYou, Redux, Kontext all assume FLUX.1 Dev as host). FLUX.1 Schnell is the Apache-2.0 distilled sibling; FLUX.1 Pro is the closed-source API-only variant. This page consolidates the FLUX.1 family because Schnell and Pro have substantively similar architecture and the per-variant differences are licensing + distillation step count rather than capability. The umbrella @entities/models/flux.md remains the navigation hub. Back-fills @sources/uncensored-image-generation-survey.md §1.2 (FLUX.1 segment) and links the FLUX-side persona-consistency stack from @sources/synthetic-character-consistency-survey.md.

## Narrative

### What it is

**FLUX.1** — image-generation foundation released **August 2024** by **Black Forest Labs** (BFL). Architecture: **Multimodal Diffusion Transformer (MMDiT)** with flow-matching, paired with a massive **Vision-Language Model (VLM)** backbone. T5 + CLIP dual encoder. **Eliminated** the spatial hallucinations and anatomical distortions that plagued the SDXL generation — the genuine architectural-quality jump that made the DiT pivot inevitable.

Three variants:

| Variant | Parameters | License | Distillation | Use case |
|---|---|---|---|---|
| **FLUX.1 Schnell** | 12B (distilled to 4 steps) | **Apache 2.0** | Heavy distillation; faster but lower quality | Commercial-friendly fast generation; thin LoRA ecosystem |
| **FLUX.1 Dev** | 12B | **BFL Non-Commercial** | None (full denoising trajectory) | The community fine-tuning foundation; thickest adapter / LoRA library |
| **FLUX.1 Pro** | 12B (full quality) | **Closed-source, API-only** | None | Enterprise / managed API path; out of scope for local workflows |

This page focuses primarily on **Dev** because Dev is the local-workflow target. Schnell and Pro are noted as comparative siblings.

### Why creators use FLUX.1 Dev

[CONFIRMED]:

- **Best-in-class prompt adherence and spatial coherence on consumer hardware** prior to FLUX.2's release. Multi-subject scenes, complex compositions, and natural-language prompts all work in ways SDXL/Pony/Illustrious cannot match.
- **Strong text rendering** — readable typography in generated images was a FLUX.1-class capability, not an SDXL-class one.
- **Mature adapter ecosystem** — PuLID II, InfiniteYou, FLUX.1 Redux, FLUX.1 Kontext, plus older PuLID-FLUX-v0.9.1 all target FLUX.1 Dev. See @entities/adapters/pulid.md, @entities/adapters/infinite-you.md, @entities/adapters/flux-redux.md, @entities/adapters/flux-kontext.md.
- **Mature LoRA training tooling** — @entities/training-tools/ai-toolkit.md (FLUX-first), @entities/training-tools/onetrainer.md (8 GB recipe), @entities/training-tools/fluxgym.md (lowest-friction GUI), @entities/training-tools/kohya-sd-scripts.md (sd-scripts FLUX support).
- **Quantization paths well-explored** — FP8 (1:1 quality), GGUF Q8 (1:1), Q6/Q4 (degraded but 8 GB-runnable), Nunchaku/SVDQ-int4 (NVIDIA-only, 2× faster than FP8 at Q4 quality).

### Why creators use FLUX.1 Schnell

[CONFIRMED]:

- **Apache 2.0 license** — only FLUX variant that permits commercial use / SaaS deployment. Critical for monetized persona workflows where the Dev license forbids it.
- **4-step inference** — significantly faster than Dev's full denoising trajectory.
- **Worse quality than Dev** — distillation cost shows in fine details, anatomy, complex prompts. Generally not the right pick for hero-shot persona work.
- **Thin LoRA ecosystem** compared to Dev — most community LoRAs train on Dev as host.

### Why creators avoid FLUX.1 Pro

[CONFIRMED]:

- Closed-source API only. Out of scope for local workflows. Mentioned for completeness only.

### Censorship and the de-censoring path

Tier: **Minimal** (see @concepts/censorship-tier-taxonomy.md). FLUX.1 Dev does not actively refuse explicit prompts — but the pre-training dataset was sanitized of explicit anatomy, so the latent space lacks the foundational structures to render genitalia, sexual interaction, or extreme NSFW scenes accurately.

The de-censoring fix path:

1. **LoRA injection at high strength (0.8–1.2)** with explicit-anatomy-trained LoRAs. Modal pattern. See @concepts/reference-plus-lora-stacking.md for the 0.85 LoRA + 0.45 PuLID dual-stack recipe.
2. **Use a community merge** — **FLUX-UNCENSORED-Merged**, **Chroma1-HD**, **SNOFS** are named in the survey (§1.2) as the canonical merges that overwrite FLUX.1 Dev's safety alignment via deeper weight surgery.
3. **License caveat**: the Dev non-commercial license technically restricts what you can do with explicit outputs even if you reach the de-censored state. Commercial NSFW workflows on FLUX should use Schnell-base merges where possible, or accept the legal exposure.

### Hardware profile

[CONFIRMED]:

| Precision | VRAM (estimate) | Notes |
|---|---|---|
| FP16 / BF16 | ~24 GB | Reference quality; 24 GB cards (RTX 3090/4090) recommended |
| FP8 | ~12 GB | Modal quality/VRAM tradeoff for 12–16 GB tier (RTX 4060 Ti / 4070 Ti) |
| GGUF Q8_0 | ~12 GB | Visually identical to FP16 at ~20% VRAM savings |
| GGUF Q4_K_S | ~8 GB | Runs on 8 GB cards; noticeable quality degradation in fine details, skin textures, prompt adherence |
| Nunchaku / SVDQ int4 | ~5–8 GB, 3.6× memory reduction + 8.7× speedup on 16 GB GPUs over BF16 | [CONFIRMED 2026-05-06] released; canonical repo `nunchaku-tech/nunchaku-flux.1-dev` (legacy `mit-han-lab/svdq-int4-flux.1-dev` redirects). NVIDIA RTX 30xx/40xx (INT4) or RTX 50xx Blackwell (NVFP4). Nunchaku v1.0 shipped; Kontext + Krea variants also available. |

Apple Silicon (MPS) viability: workable via Draw Things on M-series with Unified Memory; iteration-time on M5 Pro ~3.5–5 sec/iter. ComfyUI/MPS path also exists but is slower.

### Role in 2026 production stack

[CONFIRMED]:

- **Default photorealistic / complex-composition base** when the workflow is on FLUX.1 generation tooling.
- **PuLID II + Redux + Kontext stack lives here** — see @entities/adapters/pulid.md and @concepts/reference-plus-lora-stacking.md. The dual-pass workflow (Dev base + 0.45 PuLID + face-swap with @entities/adapters/flux-kontext.md) is the canonical FLUX persona pipeline.
- **LoRA training default** for persona work targeting FLUX-host workflows. AdamW8bit @ 5e-5 is the working learning-rate per @concepts/lora-taxonomy.md (Prodigy fails on FLUX).
- **The community "FLUX persona stack" assumes Dev** — Schnell can't host most adapters at full fidelity; Pro is API-only.

### Captioning conventions

[CONFIRMED]:

Natural-language prose, structured logically:

```
[Subject and pose], [environment + spatial relationships], [lighting], [styling commands].
```

Example from §6.2:

> "A photorealistic portrait of a young woman with short dark hair standing outdoors. Warm sunlight filters through trees in the background. Shot on 35mm lens."

No score tags, no Danbooru tags. T5's grammatical comprehension means tag-soup prompts produce inferior results compared to coherent prose.

### Workspace TODO

- ~~SVDQ/Nunchaku release status~~ — **resolved [CONFIRMED 2026-05-06]**: Nunchaku v1.0 shipped; canonical repo at [`nunchaku-tech/nunchaku-flux.1-dev`](https://huggingface.co/nunchaku-tech/nunchaku-flux.1-dev) (HF), legacy `mit-han-lab/svdq-int4-flux.1-dev` paths now redirect. Kontext + Krea variants available. ICLR 2025 paper: arXiv:2411.05007. Real-world community benchmarks: ~3.5 it/s on a 4060 16 GB at 1 MP (vs ~1.3 it/s for FP8+TeaCache). See [DeepWiki: SVDQuant](https://deepwiki.com/mit-han-lab/nunchaku/2-svdquant-quantization).
- ~~Chroma1-HD canonical hash~~ — **resolved [CONFIRMED 2026-05-06]**: Chroma1-HD lives at [`lodestones/Chroma1-HD`](https://huggingface.co/lodestones/Chroma1-HD) — 8.9B FLUX.1-schnell base, Apache 2.0, deliberately uncensored (no safety alignment). GGUF quants at `QuantStack/Chroma1-HD-GGUF` and `silveroxides/Chroma1-HD-GGUF`. See @concepts/de-censoring-techniques.md for full path. **SNOFS** is a LoRA, not a base model — see @concepts/de-censoring-techniques.md for the corrected categorization.
- Whether the BFL license-enforcement posture has tightened in 2026 — community claim is "they don't enforce against hobbyists." Surface a primary source on the actual enforcement record before underwriting that claim.
- Per-version migration cost: when does it make sense to move from FLUX.1 Dev → FLUX.2 Klein 9B / @entities/models/flux-2-klein.md? Define the decision tree.

## Snippets

### Architectural framing

> "FLUX models utilize a Multimodal Diffusion Transformer (MMDiT) flow-matching framework combined with a massive Vision-Language Model (VLM) backbone, virtually eliminating spatial hallucinations and anatomical distortions."

— @sources/uncensored-image-generation-survey.md §1.2

### License-segmentation

> "The FLUX.1 generation was segmented into three primary variants: Schnell — A distilled, highly optimized variant licensed under Apache 2.0, allowing for unrestricted commercial use. Dev — An open-weight, 12B parameter model restricted by a non-commercial license, which became the foundation for community fine-tuning. Pro — A closed-source, API-only model optimized for enterprise applications."

— @sources/uncensored-image-generation-survey.md §1.2

### Censorship state and fix path

> "The official FLUX base models are 'aligned' and feature minimal censorship. They rarely output direct text-based refusals, but their pre-training data was sanitized, meaning they lack the latent knowledge to generate accurate genitalia or extreme NSFW scenarios out of the box. Furthermore, the restrictive non-commercial licenses on the Dev variants prohibit the generation of legally sensitive content. To achieve true uncensored generation, the community relies heavily on models like FLUX-UNCENSORED-Merged or specific massive fine-tunes (such as Chroma1-HD or SNOFS) that forcibly overwrite the safety alignments via LoRAs or deep model surgery."

— @sources/uncensored-image-generation-survey.md §1.2
