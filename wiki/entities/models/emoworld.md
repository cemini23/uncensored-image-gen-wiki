---
title: EmoWorld — decoupled affective field for emotional video
type: entity
tags: [model, video, emotion, wan, watch, steering]
keywords: [EmoWorld, VAS, SAS, TAS, Wan2.2, frozen-DiT]
related:
  - sources/arxiv-2608-06231-emoworld.md
  - entities/models/wan-2-2.md
  - concepts/world-models-video-generation.md
  - concepts/activation-steering-video-generation.md
  - concepts/persona-ops-stack.md
  - sweeps/2026-08-07-daily.md
maturity: draft
created: 2026-08-07
updated: 2026-08-07
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-06231-emoworld.md @entities/models/wan-2-2.md @concepts/world-models-video-generation.md @concepts/activation-steering-video-generation.md @concepts/persona-ops-stack.md

## Raw Concept

Phase-0 from arXiv:2608.06231 ingest. Controllable emotional video via feature/prompt steering on frozen Video DiT — complements prompt-only emotion hacks for persona clips.

## Narrative

| Field | Value |
|-------|-------|
| Backbone | Wan2.2 (+ other Video-DiT claims) |
| Method | VAS / SAS / TAS decoupled affective field |
| Train | Frozen generator; prep extracts affect directions + cue library |
| Code | **None public** (2026-08-07) |
| Phase-0 | **WATCH** |
| Phase-1 | Image-gen local wire: none (`deferred`) |

When code lands: audit license (code vs any cue-library / panorama assets), VRAM on operator CUDA, NSFW emotion coverage, identity drift under SAS.

## Snippets

_(none)_
