---
title: "OmniTryOn — video try-on anything (arXiv:2606.08514)"
type: source
tags: [paper, video-editing, virtual-try-on, persona, multi-object, dataset]
keywords: [OmniTryOn, Try-On Anything, TryAny-Bench, First Frame Wearable Cache, STC-RoPE, Gradual Try-On, GTO, multi-garment, mask-free, VVT]
related:
  - concepts/video-try-on-anything.md
  - entities/models/omnitryon.md
  - concepts/video-identity-inheritance.md
  - concepts/persona-consistency-methods.md
  - concepts/albedo-guided-instance-video-editing.md
  - concepts/task-isolated-unified-video-editing.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
maturity: draft
read_status: read
created: 2026-06-10
updated: 2026-06-10
---

## Relations

@concepts/video-try-on-anything.md @entities/models/omnitryon.md @concepts/video-identity-inheritance.md @concepts/persona-consistency-methods.md

## Raw Concept

- **Title**: OmniTryOn: Video Try-On Anything at Once!
- **Authors**: Changliang Xia, Chengyou Jia, Keshuo Xing, et al. (Xi'an Jiaotong University)
- **Type**: arXiv:2606.08514
- **URL**: https://arxiv.org/abs/2606.08514 · https://github.com/xcltql666/OminTryOn
- **Location**: `raw-sources/arxiv-2606.08514-omnitryon-video-try-on-anything-at-once.pdf`
- **Retrieved**: 2026-06-10
- **Read status**: read (abstract + TryAny-Bench + method)

## Narrative

Introduces **Try-On Anything** — simultaneous transfer of **multiple wearable objects** (garments, shoes, bags, face) onto a person in video in **one pass**, without garment masks / pose priors.

**TryAny-Bench:** 1,460 paired e-commerce videos (1,243 train / 217 test); genuine reference↔target pairs preserving motion + background (vs destructive masking in ViViD/EEVEE). **MLLM multidimensional eval:** video quality, try-on stability, physical realism.

**OmniTryOn:** DiT framework with **First Frame Wearable Cache** (all wearables in frame 0 propagate via attention), **STC-RoPE** (shared 3D coords for reference + target tokens → motion/background lock), **Gradual Try-On (GTO)** curriculum (garments → diverse objects).

Beats single-garment VVT baselines and general video editors on TryAny-Bench `[TENTATIVE]`.

### Workspace relevance

Direct **persona wardrobe refresh** on existing motion clips — change outfit + accessories while keeping dance/walk performance (@concepts/persona-consistency-methods.md). Mask-free = simpler Comfy graph vs MagicTryOn-style aux pipelines `[NEEDS VERIFICATION 2026-06-10]`.

## Snippets

> "Existing frameworks heavily rely on explicit external priors (e.g., garment-agnostic masks and dense human poses) … disrupting spatiotemporal coherence."

> "TryAny-Bench is the only benchmark to introduce a tailored, multidimensional evaluation protocol for comprehensive assessment."

## Dead Ends

E-commerce training bias — may struggle on NSFW anatomy or non-upright poses. Data pipeline uses MagicTryOn + CAPYBARA + face-swap — inherits their failure modes.
