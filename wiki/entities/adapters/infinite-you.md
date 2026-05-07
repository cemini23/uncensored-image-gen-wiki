---
title: InfiniteYou (ByteDance)
type: entity
tags: [adapter, identity-injection, infinite-you, infiniteyou, flux, bytedance, iccv-2025]
keywords: [InfiniteYou, ByteDance, FLUX identity, flexible photo recreation, ID-aware projection, ICCV 2025 Highlight]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - entities/adapters/pulid.md
  - entities/adapters/ip-adapter.md
  - entities/adapters/flux-redux.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@entities/adapters/pulid.md
@entities/adapters/ip-adapter.md
@entities/adapters/flux-redux.md
@entities/models/flux.md
@entities/models/flux-1-dev.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md. **InfiniteYou** is a ByteDance-led FLUX-native identity adapter that earned an ICCV 2025 Highlight; competes with PuLID II on the FLUX face-injection axis with a different design objective (multi-aspect identity, not single-attribute fidelity).

## Narrative

### What it is

**InfiniteYou** — identity-preserving generation method from **ByteDance** (same lab as @entities/adapters/pulid.md). Targets **FLUX backbones**. ICCV 2025 Highlight ([github.com/bytedance/InfiniteYou](https://github.com/bytedance/InfiniteYou)). Architectural distinction from PuLID: InfiniteYou aims for **multi-aspect identity** — preserving identity across pose, age progression, hairstyle change, expression, and partial occlusion — rather than maximum single-frame face fidelity.

The mechanism is an ID-aware projection layer that decomposes the input identity vector into pose-invariant and pose-variant components, conditioning the FLUX cross-attention on only the pose-invariant subspace.

### Why creators use it

[TENTATIVE]

- **Cross-pose identity stability** — claimed to handle profile / extreme angle better than PuLID II, which sometimes drifts on side-views.
- **Age and styling robustness** — identity holds up under prompts that ask for different age, different hair length / colour. PuLID II copies the reference hairstyle; InfiniteYou is designed not to.
- **FLUX-native** — built for FLUX from the start, no SDXL legacy.

### Limits

[TENTATIVE]

- **Newer than PuLID II** — community workflows still consolidating.
- **NSFW behaviour** — same SFW-pretraining caveat as the broader family; the multi-aspect framing does not solve the semantic-conflict failure on clothed-reference + nude-prompt.
- **No SDXL port** — FLUX only. SDXL persona work continues to use PuLID/InstantID/ConsistentID.

### Role in 2026 production stack

[TENTATIVE]

- The likely landing zone is **persona work that needs hair / age / pose flexibility**: marketing copy, multi-shot narrative scenes, "the same persona at three life stages". PuLID II is fidelity-first; InfiniteYou is flexibility-first.
- For **maximum face fidelity at one canonical pose**, PuLID II remains the pick.
- For the FLUX **face-swap workflow** (existing scene, swap face), FLUX.2 Klein 9B face-swap is currently the modal pick rather than InfiniteYou.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- Production-tier VRAM cost on FLUX.1-Dev FP8 + InfiniteYou — community reports.
- ~~Apple Silicon (MPS) status~~ — **resolved [CONFIRMED 2026-05-07]**: **active MPS blocker**. Issue [#11 in `bytedance/InfiniteYou`](https://github.com/bytedance/InfiniteYou/issues/11) confirms `IDEmbeddingModelLoader` fails during arcface initialisation on Apple Silicon (MPS-incompatible NumPy / arcface kernel paths). Workarounds: cloud rental (recommended), or run InfiniteYou on CPU (very slow, exploratory only). For Apple-Silicon-friendly persona work, use @entities/adapters/pulid.md as the substitute until upstream patches.
- Head-to-head with PuLID II on a fixed reference set spanning multiple poses — needed before recommending as default for narrative work.
- Whether the ByteDance team has shipped a FLUX.2 port.

## Snippets

> "InfiniteYou (ByteDance) — Multi-aspect identity — ByteDance, ICCV 2025 Highlight."
> — @sources/synthetic-character-consistency-survey.md §3, identity-adapter taxonomy
