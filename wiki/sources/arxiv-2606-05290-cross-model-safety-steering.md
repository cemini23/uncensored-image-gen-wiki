---
title: "Cross-model safety steering for visual generation (arXiv:2606.05290)"
type: source
tags: [paper, safety, steering, alignment, cross-model, t2i, t2v, inference-time]
keywords: [cross-model steering, safety direction, representation transfer, Platonic hypothesis, LLM to diffusion, Wan2.2, Qwen-Image, FLUX, benign alignment, ASR]
related:
  - concepts/cross-model-safety-steering.md
  - concepts/activation-steering-video-generation.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/de-censoring-techniques.md
  - concepts/pluralistic-safety-alignment.md
  - sources/arxiv-activation-steering-video-gen-2606.04775-2026-06-05.md
  - entities/models/wan-2-2.md
  - entities/models/flux-1-dev.md
  - entities/models/qwen-image-2512.md
  - entities/models/z-image-turbo.md
maturity: draft
read_status: read
created: 2026-06-06
updated: 2026-06-06
---

## Relations

@concepts/cross-model-safety-steering.md @concepts/activation-steering-video-generation.md @concepts/censorship-tier-taxonomy.md @concepts/de-censoring-techniques.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: Do Models Share Safety Representations? Cross-Model Steering for Safe Visual Generation
- **Authors**: Tobia Poppi, Silvia Cappelletti, Sara Sarto, Florian Schiffers, Garin Kessler, Marcella Cornia, Lorenzo Baraldi, Rita Cucchiara (UniMoRe, Uni Pisa, Amazon Prime Video)
- **Type**: arXiv:2606.05290
- **Location**: `raw-sources/arxiv-2606.05290-do-models-share-safety-representations-cross-mod.pdf`
- **URL**: https://arxiv.org/abs/2606.05290 · https://aimagelab.github.io/cross-model-safety-representations/
- **Retrieved**: 2026-06-06
- **Read status**: read (abstract + method formulation)
- **Content warning:** paper figures include harmful/explicit eval examples

## Narrative

Asks whether **safety is a portable latent direction** across heterogeneous generators. Framework:

1. Estimate **source safety vector** in an LLM (Llama3.1 / Mistral / Qwen3.5) from paired safe–unsafe prompts (mean-pooled hidden-state deltas)
2. Learn lightweight **cross-model alignment** T_{s→t} on **benign anchors only** (SVD orthogonal, ridge linear, or small MLP)
3. Transport direction to target T2I/T2V (FLUX Schnell/Dev, Qwen-Image, Z-Image-Turbo, **Wan2.2**) and apply at inference with strength α
4. **Multi-vector extension** — category-specific safety directions for selective control

**Key claim:** transferred directions match **native target-side** safety vectors (which require unsafe target data) on ASR vs CLIP/FID trade-offs — safety geometry is partially **shared across modalities** `[TENTATIVE]`.

### Workspace relevance

- **Suppression axis:** documents how operators *could* add safety to local Wan/FLUX — inverse concern for uncensored persona ops (understand attack surface)
- **De-censoring mirror:** if safety directions transfer *in*, understanding geometry may inform **abliteration / refusal-direction removal** on Eastern Vanguard bases (@concepts/de-censoring-techniques.md) — speculative, not validated for NSFW unlock
- Pairs with LA-LQR (@sources/arxiv-activation-steering-video-gen-2606.04775-2026-06-05.md) as complementary inference-time control literature

## Snippets

> "Safety-relevant behavior may be encoded as structured directions in representation space."

> "Transferred safety directions achieve ASR reduction … comparable to directions learned natively on the target model using unsafe data, while requiring no target-side unsafe data."

## Dead Ends

Paper goal is **increase** safety, not remove it. Amazon-affiliated; no open ComfyUI hook verified. Eval content is disturbing — handle as research artifact only.
