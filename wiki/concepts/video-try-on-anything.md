---
title: Video try-on anything (OmniTryOn task)
type: concept
tags: [video-editing, virtual-try-on, persona, wardrobe, multi-object]
keywords: [Try-On Anything, OmniTryOn, TryAny-Bench, multi-garment VVT, mask-free try-on, STC-RoPE, wearable cache, persona wardrobe]
related:
  - sources/arxiv-2606-08514-omnitryon-video-try-on.md
  - entities/models/omnitryon.md
  - concepts/video-identity-inheritance.md
  - concepts/persona-consistency-methods.md
  - concepts/task-isolated-unified-video-editing.md
  - concepts/albedo-guided-instance-video-editing.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-10
updated: 2026-06-10
---

## Relations

@sources/arxiv-2606-08514-omnitryon-video-try-on.md @entities/models/omnitryon.md @concepts/video-identity-inheritance.md @concepts/persona-consistency-methods.md

## Raw Concept

Ingest 2026-06-10 — extends single-garment VVT to **multi-object simultaneous try-on** in one video pass, mask-free.

## Narrative

**Inputs:** source person video + reference wearables (clothing, shoes, bag, optional face). **Output:** same motion/background, new appearance on all wearables at once.

### vs legacy VVT stack

| | Single-garment VVT (MagicTryOn class) | Try-On Anything |
|--|--------------------------------------|-----------------|
| Objects per pass | 1 garment | Many wearables + face |
| External priors | Masks, dense pose | None (STC-RoPE anchors) |
| Training pairs | Masked/destructive refs | Genuine paired videos |

### Persona ops use cases

- Refresh wardrobe on **existing performance clips** (dance, walk cycle) without re-shooting Wan I2V
- A/B outfit variants for monetized persona feeds from one master motion take
- Face swap + outfit in unified pass (TryAny-Bench includes identity changes)

Complements **static** try-on (IDM-VTON image) and **generative** customization (OmniCustom joint A/V) — this is **video-preserving** appearance transfer.

## Snippets

> "Try-On Anything task, which aims to simultaneously transfer diverse wearable objects onto a person in a video in a single inference pass."

## Dead Ends

E-commerce pose prior — NSFW motion/clothing edge cases untested. GitHub typo `OminTryOn` in paper URL `[NEEDS VERIFICATION 2026-06-10]`.
