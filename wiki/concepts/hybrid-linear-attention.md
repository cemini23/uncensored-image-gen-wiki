---
title: Hybrid Linear Attention (Gated DeltaNet + Softmax)
type: concept
tags: [concept, linear-attention, long-context, efficient-inference, architecture]
keywords: [hybrid linear attention, Gated DeltaNet, GDN, softmax attention, linear attention, long-context modeling, recurrent context aggregation, exact long-range recall, minute-scale context, quadratic attention]
related:
  - sources/sana-wm-minute-scale-world-model.md
  - entities/models/sana-wm.md
  - entities/models/sana.md
  - concepts/world-models-video-generation.md
maturity: draft
created: 2026-05-16
updated: 2026-05-17
---

## Relations

@sources/sana-wm-minute-scale-world-model.md @entities/models/sana-wm.md @entities/models/sana.md — the SANA T2I family is itself built on a linear diffusion transformer
@concepts/world-models-video-generation.md — the canonical 2026 use case for hybrid linear attention (minute-scale context tractability)

## Raw Concept

Stub created during the cross-wiki ingest of NVIDIA's SANA-WM paper (@sources/sana-wm-minute-scale-world-model.md), routed from the OSINT workspace 2026-05-16. Anchors the long-context architecture pattern that makes minute-scale video generation tractable.

## Narrative

**Hybrid linear attention** interleaves linear-attention blocks with periodic full softmax-attention layers to model very long sequences without the quadratic memory cost of full attention. Pure linear attention is memory-efficient (recurrent context aggregation) but loses exact long-range recall; periodic softmax layers restore it. In SANA-WM the linear blocks are frame-wise **Gated DeltaNet (GDN)** blocks, interleaved with softmax-attention layers — the combination is what makes one-minute (minute-scale) video context tractable on a single GPU. Related lineage: the SANA T2I family is itself built on a linear diffusion transformer (→ @entities/models/sana.md), and SANA-WM carries that efficiency-first philosophy into video. → @entities/models/sana-wm.md
