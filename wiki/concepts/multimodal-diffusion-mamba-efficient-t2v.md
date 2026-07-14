---
title: Multimodal Diffusion Mamba for Efficient T2V (MM-DiM / M4V)
type: concept
tags: [concept, video-generation, mamba, ssm, efficient-inference, architecture]
keywords: [MM-DiM, M4V, multimodal token re-composition, visual registers, temporal branch, PyramidFlow, Wan2.1, linear-time T2V]
related:
  - sources/arxiv-2506-10915-m4v-multimodal-mamba-t2v.md
  - entities/models/m4v.md
  - entities/models/wan-2-2.md
  - concepts/hybrid-linear-attention.md
  - concepts/video-generation-energy-scaling-laws.md
  - concepts/synthetic-media-compute-economics.md
  - concepts/budget-aware-diffusion-caching.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-07-14-daily.md
maturity: draft
created: 2026-07-14
updated: 2026-07-14
---

## Relations

@sources/arxiv-2506-10915-m4v-multimodal-mamba-t2v.md @entities/models/m4v.md @entities/models/wan-2-2.md @concepts/hybrid-linear-attention.md @concepts/video-generation-energy-scaling-laws.md @concepts/synthetic-media-compute-economics.md @concepts/budget-aware-diffusion-caching.md

## Raw Concept

Synthesized from @sources/arxiv-2506-10915-m4v-multimodal-mamba-t2v.md — how to make **Mamba** work for multimodal spatiotemporal diffusion without falling back to cross-attention for text control.

## Narrative

Video DiTs pay quadratic cost in spatiotemporal token count. Two 2026 efficiency lineages attack that:

| Lineage | Mechanism | Anchor |
|---------|-----------|--------|
| Hybrid linear attention | Interleave GDN/linear attn with periodic softmax | @concepts/hybrid-linear-attention.md (SANA-WM) |
| Multimodal Diffusion Mamba | Selective SSM + token re-composition + light temporal attn | **This page** (M4V / MM-DiM) |

### MM-DiM recipe (operator-readable)

1. **Keep early dual-stream MM-DiT** for modality alignment (paper: L=8 on PyramidFlow).
2. **Replace unified self-attn mixers** with Mamba after **MM-Token Re-Composition**: pad + prefix text, append visual (with per-frame registers), suffix text again so SSM hidden state carries bidirectional multimodal context without QKV.
3. Add a **cheap temporal attention branch** on spatially downsampled condition frames — hybrid at branch level, not full Parallel Mamba∥Attn (which paper shows is FLOP-expensive for tiny quality gain).
4. Optional **reward post-train** (HPSv2 + CLIP on one-step decoded latents) for AR long-clip drift.

Ablation signal: Text re-composition lifts text–video consistency; registers lift visual metrics; temporal branch completes the stack. Pure Full-Mamba without temporal branch is cheapest but underperforms Full+Temp-Branch.

### When it matters for persona ops

- **Long / high-res clips** where attention TFLOPs dominate RunPod cost (see energy scaling laws).
- **Wan graft** is the interesting product path if weights ship — paper reports M4V\* Wan2.1 above proprietary Wan2.1 on VBench Total while faster.
- Orthogonal to **feature caching** (@concepts/budget-aware-diffusion-caching.md) and **step distillation** — can stack once released.

Phase-0 posture: **WATCH / REFERENCE** until open weights + ComfyUI path exist. Production stays Wan 2.2.

## Snippets

> "Unlike attention mechanisms that utilize explicit query-key-value (QKV) interactions to integrate context, Mamba faces challenges in handling text conditioning integration."

[Source: arxiv-2506.10915 §3.3]
