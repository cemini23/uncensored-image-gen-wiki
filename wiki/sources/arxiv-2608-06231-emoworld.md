---
title: "EmoWorld controllable emotional video generation (arXiv:2608.06231)"
type: source
tags: [paper, video, emotion, wan, dit, steering]
keywords: [EmoWorld, VAS, SAS, TAS, affective-field, Wan2.2]
related:
  - entities/models/emoworld.md
  - entities/models/wan-2-2.md
  - concepts/world-models-video-generation.md
  - concepts/activation-steering-video-generation.md
  - concepts/persona-ops-stack.md
  - sweeps/2026-08-07-daily.md
maturity: draft
read_status: read
created: 2026-08-07
updated: 2026-08-07
---

## Relations

@entities/models/emoworld.md @entities/models/wan-2-2.md @concepts/world-models-video-generation.md @concepts/activation-steering-video-generation.md @sweeps/2026-08-07-daily.md

## Raw Concept

- **Title**: EmoWorld: A Decoupled Affective Field for Controllable Emotional Video Generation
- **Type**: arXiv:2608.06231
- **Location**: `raw-sources/pending-egress-2026-08-07/arxiv-2608.06231-emoworld-a-decoupled-affective-field-for-control.pdf` (egress-fi SSH timeout 2026-08-07; intended `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.06231-emoworld-a-decoupled-affective-field-for-control.pdf`)
- **URL**: https://arxiv.org/abs/2608.06231
- **Code**: none public at ingest (no matching GitHub)
- **Retrieved**: 2026-08-07

## Narrative

Frozen flow-matching Video DiT (evals on **Wan2.2**) with a decoupled affective field: Visual Atmosphere Steering (VAS), Semantic Affective Steering (SAS), Temporal Affective Steering (TAS). One-time prep from geometry-preserving neutral/emotion panorama pairs; inference-time steering without updating generator weights. 27 emotion categories; T2V + I2V; portable across Video-DiT backbones; camera-conditioned composition supported.

**Phase-0: WATCH.** High persona value (emotion-controllable Wan clips) but **no public code/weights** at ingest. Re-check weekly. Phase-1: `deferred` — no Image-gen local wire.

## Snippets

_(none)_
