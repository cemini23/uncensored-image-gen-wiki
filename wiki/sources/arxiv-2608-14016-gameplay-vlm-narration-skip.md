---
title: "Gameplay VLM narration + TTS (arXiv:2608.14016) — skip gen / route game-dev"
type: source
tags: [paper, skip, routed, video, tts, gameplay]
keywords: [gameplay narration, VLM, mosaic, duration-conditioned TTS, esports commentary]
related:
  - sweeps/2026-08-17-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-08-17
updated: 2026-08-17
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

Primary: game-dev wiki brief `briefs/2026-08-17_gameplay-vlm-narration-from-image-gen.md`.
@sweeps/2026-08-17-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: Content Based Video Narration of Gameplay with Vision Language Models
- **Authors**: Mathew Varghese (University of Washington; independent work)
- **Type**: arXiv:2608.14016 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.14016-content-based-video-narration-of-gameplay-with-v.pdf`
- **URL**: https://arxiv.org/abs/2608.14016
- **Code**: PDF links `mathewvarghesemanu/Content-based-video-narration-using-deep-learning` — **404** at ingest. User page only. No SPDX.
- **Retrieved**: 2026-08-17

## Narrative

**Phase-0: SKIP gen / ROUTE game-dev.** Pipeline turns silent gameplay recordings into esports-style spoken commentary with no engine telemetry and no task-specific training. Three cheap fixes: pack nine frames into a 3×3 mosaic so an image-native VLM sees motion at one image payload; replay the last K narrations as assistant history to kill per-segment repetition; duration-condition the prompt then time-scale or pad TTS so each utterance fills its slot. Cloud TTS or a 6-bit quantized 4B on-device TTS on Apple silicon.

No persona / T2I / identity / lipsync hook — this is game-commentary tooling, not a character voice stack. Linked repo is 404. Not atto / poker / guruwatcher / prod. Image-gen local wire: none (`wont_wire`).

## Snippets

> "Temporal mosaic packing arranges nine uniformly sampled frames into a single 3 × 3 image, letting an image-native VLM reason about motion while consuming one image payload per segment instead of nine."

[Source: arxiv-2608.14016, abstract]
