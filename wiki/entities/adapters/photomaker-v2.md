---
title: PhotoMaker V2 (TencentARC)
type: entity
tags: [adapter, identity-injection, photomaker, photomaker-v2, sdxl, tencentarc]
keywords: [PhotoMaker, PhotoMaker V2, TencentARC, identity-aware embedding, stack-IDs, stacked ID embeddings]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - entities/adapters/ip-adapter.md
  - entities/adapters/pulid.md
  - entities/models/pony-v6.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@entities/adapters/ip-adapter.md
@entities/adapters/pulid.md
@entities/models/pony-v6.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md. **PhotoMaker V2** is the **TencentARC** identity adapter from 2024; older than PuLID/InfiniteYou but distinctive for its stacked-ID embedding approach. Still useful for specific patterns (age progression, styling preservation).

## Narrative

### What it is

**PhotoMaker V2** — identity-aware adapter from **TencentARC** ([github.com/TencentARC/PhotoMaker](https://github.com/TencentARC/PhotoMaker)). The signature design choice is **stacked ID embeddings**: rather than projecting a single identity vector, PhotoMaker accepts multiple reference images and stacks their embeddings into a sequence consumed by the cross-attention layers as a multi-token identity prompt. Launched 2024; V2 brought improved fidelity and SDXL compatibility.

### Why creators use it

[CONFIRMED, but limited 2026 adoption]

- **Aging / styling preservation** — the stacked embedding lets the model interpolate identity across age, expression, hair changes more naturally than single-vector adapters. The model card framing is "realistic human photos in any style".
- **Photo-realistic preservation** of skin texture, fine facial detail across compositional variation.
- **Tencent provenance** — same lab as IP-Adapter; integrates well in stacks with IP-Adapter Plus.

### Limits

[CONFIRMED]

- **SDXL only** — no FLUX port shipped by TencentARC as of 2026-05. The FLUX path is PuLID II / FLUX.2 Klein 9B.
- **Older than PuLID/InfiniteYou** — community has migrated photoreal SDXL face work toward PuLID and InstantID; PhotoMaker V2 holds a niche for aging / styling specifically.
- **NSFW alignment** — same SFW-pretraining issue. Expect comparable failure on clothed-reference + nude-prompt.
- **Multi-image preprocessing** — the stacked-embedding workflow needs each reference cropped and aligned, which is more setup than single-image PuLID/InstantID.

### Role in 2026 production stack

[TENTATIVE]

- **Aging / multi-life-stage persona work** — PhotoMaker V2 is still the SDXL pick. PuLID II is single-canonical-pose.
- **Standard persona work** — PuLID II / InstantID / IP-Adapter FaceID-Plus-V2 have largely displaced PhotoMaker V2 for everyday SDXL face injection.
- **Style + identity stack** — PhotoMaker V2 + IP-Adapter Plus (style) + character LoRA is a viable SDXL pipeline for stylised persona work, but most 2026 creators stack IP-Adapter Plus + InstantID + LoRA instead.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- VRAM cost on a 12 GB SDXL setup with stacked references — community reports.
- ~~Apple Silicon (MPS) viability~~ — **resolved [CONFIRMED 2026-05-07]**: PhotoMaker V2 runs on macOS via [`shiimizu/ComfyUI-PhotoMaker-Plus`](https://github.com/shiimizu/ComfyUI-PhotoMaker-Plus) (the canonical 2025-2026 port). Apple Silicon path additionally supports the **CoreML provider** for the InsightFace face-feature step (`onnxruntime-silicon` exposes `CoreMLExecutionProvider`) — measurably faster than CPU fallback. Standard MPS caveats apply for the diffusion backbone (fp32 fallback for LayerNorm).
- Whether TencentARC plans a FLUX port; if not, this adapter slowly ages out.
- Comparison vs InstantID on aging-preservation specifically — head-to-head data needed before recommending.

## Snippets

> "PhotoMaker V2 (TencentARC) — Aging / styling preservation — TencentARC; older."
> — @sources/synthetic-character-consistency-survey.md §3, identity-adapter taxonomy
