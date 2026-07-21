---
title: OmniTryOn (Try-On Anything)
type: entity
tags: [model, video-editing, virtual-try-on, research]
keywords: [OmniTryOn, TryAny-Bench, STC-RoPE, First Frame Wearable Cache, GTO, XJTU, mask-free VVT]
related:
  - sources/arxiv-2606-08514-omnitryon-video-try-on.md
  - concepts/video-try-on-anything.md
  - concepts/video-identity-inheritance.md
  - concepts/persona-consistency-methods.md
  - entities/models/wan-2-2.md
  - entities/models/tamf-vton.md
  - sources/arxiv-2607-14807-tamf-vton-mask-free-virtual-try-on.md
  - sweeps/2026-07-17-daily.md
  - sources/arxiv-2607-18227-flowmimic-mask-free-editing.md
maturity: draft
created: 2026-06-10
updated: 2026-07-21
---

## Relations

@sources/arxiv-2606-08514-omnitryon-video-try-on.md @concepts/video-try-on-anything.md @concepts/persona-consistency-methods.md

## Raw Concept

Entity stub from 2026-06-10 ingest — OmniTryOn mask-free multi-object video try-on.

## Narrative

**OmniTryOn** — DiT model for **Try-On Anything**: multiple wearables + optional face in one pass. **TryAny-Bench** dataset (1.4K paired clips) + code promised at https://github.com/xcltql666/OminTryOn .

**Persona relevance:** wardrobe swap on existing motion video without mask/pose aux graph.

**Status:** `[NEEDS VERIFICATION 2026-06-10]` — VRAM, base DiT backbone (Wan/LTX/other), license, NSFW.

→ @concepts/video-try-on-anything.md

## Snippets

(See @sources/arxiv-2606-08514-omnitryon-video-try-on.md)

## Dead Ends

E-commerce training distribution.
