---
title: Avatar-Forever — real-time infinite audio-driven avatars (PolyU + ByteDance)
type: entity
tags: [avatar, lipsync, video-generation, streaming, watch]
keywords: [Avatar-Forever, PolyU, ByteDance, RRT, ForeverCache, streaming-avatar, audio-driven, real-time]
related:
  - sources/arxiv-2608-12107-avatar-forever.md
  - entities/lipsync/latentsync.md
  - concepts/budget-aware-diffusion-caching.md
maturity: draft
created: 2026-08-13
updated: 2026-08-13
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-12107-avatar-forever.md @entities/lipsync/latentsync.md @concepts/budget-aware-diffusion-caching.md

## Raw Concept

Phase-0 from arXiv:2608.12107. Decoupled parallel training for infinite interactive avatars: distillation branch (efficient high-quality generator) + RRT long-horizon adapter, with ForeverCache chunk-wise feature caching.

## Narrative

| Field | Value |
|-------|-------|
| Org | PolyU (Lei Zhang) + ByteDance + AMD |
| Method | Full-parameter distillation (few-step generator) ∥ Recovery-oriented Rollout Training (long-horizon adapter); ForeverCache |
| Tasks | Unbounded audio-driven avatar (identity + motion + lip-sync consistency) |
| Base | 22B video foundation model |
| Throughput | 768×512 @ 27.2 FPS on one H100 |
| Code | github.com/leeruibin/avatarforever — paper repo only (README/assets, no LICENSE) |
| Phase-0 | **WATCH** |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Code+weights not released (no SPDX). 22B base + H100 real-time is far from laptop-local. Portable value: RRT (long-horizon robustness via rollout training) and ForeverCache (chunk-wise feature caching) as techniques for the avatar/lipsync stack — relevant to @entities/lipsync/latentsync.md streaming extensions.

## Snippets

_(none)_
