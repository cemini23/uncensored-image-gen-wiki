---
title: "EMOSH — expressive motion and shape disentanglement for human animation (arXiv:2606.28026)"
type: source
tags: [paper, human-animation, avatar, motion-disentanglement, wan, tencent, eccv-2026]
keywords: [EMOSH, EHM, Expressive Human Model, motion-shape disentanglement, cross-driven animation, Wan2.1-I2V, SMPL-X, FLAME, WeChat Vision]
related:
  - concepts/motion-shape-disentangled-human-animation.md
  - entities/models/emosh.md
  - entities/models/wan-2-2.md
  - concepts/video-reference-avatar-generation.md
  - concepts/persona-consistency-methods.md
  - concepts/persona-ops-stack.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-29-daily.md
maturity: draft
read_status: read
created: 2026-06-29
updated: 2026-06-29
---

## Relations

@concepts/motion-shape-disentangled-human-animation.md @entities/models/emosh.md @entities/models/wan-2-2.md @concepts/video-reference-avatar-generation.md

## Raw Concept

- **Title**: EMOSH: Expressive Motion and Shape Disentanglement for Human Animation
- **Authors**: Dongbin Zhang, Hao Liu, et al. (Tsinghua + WeChat Vision, Tencent)
- **Type**: arXiv:2606.28026 · ECCV 2026
- **Location**: `raw-sources/arxiv-2606.28026-expressive-motion-and-shape-disentanglement-for.pdf`
- **URL**: https://arxiv.org/abs/2606.28026 · https://eastbeanzhang.github.io/EMOSH/
- **Retrieved**: 2026-06-29
- **Read status**: read (abstract + method overview)

## Narrative

**EMOSH** — mesh-guided **human video animation** on **Wan2.1-I2V** baseline resolving the expressiveness vs disentanglement tradeoff.

**Core representation:** **Expressive Human Model (EHM)** — SMPL-X + FLAME; decouples body shape $\beta_b$, head shape $\beta_f$, expression $\psi$, pose $\theta$.

**Pipeline:**

| Stage | Mechanism |
|-------|-----------|
| Tracking | Confidence-aware joint EHM + camera optimization from monocular video |
| Control | Coarse-to-fine hybrid motion injection (semantic mesh render + 2D keypoints) |
| Cross-subject | Explicit retarget: driving pose/expression + reference shape |
| Long video | Chunked AR with fixed reference latent anchor + spatially-aligned conditioning |

Compares favorably vs UniAnimate-DiT, HyperMotion, **Wan-Animate** on cross-driven identity `[TENTATIVE]`.

Phase-0: **Skipped** — no public code at ingest — `briefs/2026-06-29_phase-0-emosh-prob-bbdm.md`.

## Snippets

> "By explicitly disentangling shape and pose parameters, we fundamentally resolve the body shape leakage issue."

## Dead Ends

Tencent/WeChat Vision — watch for open-weight release; until then reference-only for persona dance/motion-transfer R&D.
