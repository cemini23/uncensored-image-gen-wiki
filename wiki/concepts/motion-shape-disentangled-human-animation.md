---
title: Motion-shape disentangled human animation (EMOSH)
type: concept
tags: [concept, human-animation, avatar, motion-disentanglement, persona-ops]
keywords: [EMOSH, EHM, motion-shape entanglement, cross-driven animation, mesh-guided video, Wan I2V]
related:
  - sources/arxiv-2606-28026-emosh-expressive-motion-shape-disentanglement.md
  - entities/models/emosh.md
  - entities/models/wan-2-2.md
  - concepts/video-reference-avatar-generation.md
  - concepts/persona-consistency-methods.md
  - concepts/persona-ops-stack.md
  - entities/lipsync/liveportrait.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-29
updated: 2026-06-29
---

## Relations

@sources/arxiv-2606-28026-emosh-expressive-motion-shape-disentanglement.md @entities/models/emosh.md @concepts/video-reference-avatar-generation.md

## Raw Concept

Ingest 2026-06-29 from Zhang et al. (arXiv:2606.28026, ECCV 2026) — EHM mesh retargeting on Wan2.1-I2V.

## Narrative

### The entanglement problem

| Control signal | Expressiveness | Shape leakage on cross-drive |
|----------------|----------------|------------------------------|
| 2D pose | High (face/hands) | **Severe** — driver body proportions leak |
| SMPL mesh render | Low (rigid face) | Low |
| **EHM + hybrid injection** | High | **Low** — explicit shape retarget |

### Persona ops mapping

Dance Reels / motion-transfer clips: reference **persona still** + driver TikTok without copying driver's physique — same problem class as @concepts/video-reference-avatar-generation.md but **full-body** not talking-head.

**Retarget rule:** $M_{ehm}^{target} = M_{ehm}(\theta^d, \psi^d, \beta_b^r, \beta_f^r)$ — driving motion + reference identity shape.

### Build-track note

No open weights at ingest. Monitor Tencent release; baseline is Wan2.1-I2V — stacks with existing Wan persona graphs when code drops.

## Snippets

> "Mainstream 2D pose-conditioned approaches suffer from motion-shape entanglement."

## Dead Ends

Closed Tencent research until code/weights publish.
