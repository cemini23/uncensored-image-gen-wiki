---
title: "Avatar-Forever: decoupled parallel training for real-time infinite avatars (arXiv:2608.12107)"
type: source
tags: [paper, avatar, lipsync, video, streaming, watch]
keywords: [Avatar-Forever, PolyU, ByteDance, RRT, ForeverCache, streaming-avatar, audio-driven, real-time]
related:
  - entities/models/avatar-forever.md
  - entities/lipsync/latentsync.md
  - concepts/budget-aware-diffusion-caching.md
  - sweeps/2026-08-13-daily.md
maturity: draft
read_status: read
created: 2026-08-13
updated: 2026-08-13
---

## Relations

@entities/models/avatar-forever.md @entities/lipsync/latentsync.md @concepts/budget-aware-diffusion-caching.md @sweeps/2026-08-13-daily.md

## Raw Concept

- **Title**: Avatar-Forever: Decoupled Parallel Training for High-Quality Real-Time Infinite Avatars
- **Authors**: Ruibin Li, Tao Yang, Zhiyuan Ma, Fangzhou Ai, Shilei Wen, Lei Zhang (PolyU + ByteDance + AMD)
- **Type**: arXiv:2608.12107 (PolyU VCLAB preprint)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.12107-avatar-forever-decoupled-parallel-training-for-h.pdf`
- **URL**: https://arxiv.org/abs/2608.12107
- **Project page**: https://leeruibin.github.io/avatarforever-project-page/
- **Code**: https://github.com/leeruibin/avatarforever (paper repo — README + assets only, no LICENSE yet)
- **Retrieved**: 2026-08-13

## Narrative

Decoupled parallel training for infinite interactive avatars: one branch full-parameter distillation (efficient high-quality few-step generator), another trains a lightweight long-horizon adapter via Recovery-oriented Rollout Training (RRT). Introduces ForeverCache chunk-wise feature caching to cut redundant history computation during streaming. Built on a 22B video foundation model; 768×512 @ 27.2 FPS on one H100.

**Phase-0: WATCH.** Persona-relevant (infinite audio-driven digital humans with identity consistency + lip-sync). Code repo is pre-code (README/assets only, no LICENSE → no SPDX). 22B model + H100 throughput is far from laptop-local; architecture ideas (RRT, ForeverCache) are the portable value. Phase-1: `deferred`.

## Snippets

> "ForeverCache, a chunk-wise feature caching mechanism to substantially reduce redundant history computation during streaming inference."

_[Source: arxiv-2608.12107, abstract]_
