---
title: "Direction-Following TTS (arXiv:2609.02623)"
type: source
tags: [paper, tts, voice, watch]
keywords: [direction-following tts, pseudo triplets, speaking style, zero-shot tts]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/direction-following-tts.md
maturity: draft
read_status: read
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @concepts/persona-audio-stack.md @entities/voice-models/direction-following-tts.md

## Raw Concept

- **Title**: Scalable Direction-Following TTS via Voice Impression-Guided Pseudo Triplet Construction
- **Type**: arXiv:2609.02623 [cs.CV]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.02623
- **Code**: none found
- **Retrieved**: 2026-09-11

## Narrative

Fujita and Ijima (NTT, Inc.) define direction-following TTS: the system reads a fixed script again and changes the delivery as a natural language direction requests. It keeps the speaker identity and the words. The paper is at INTERSPEECH 2026. The method builds pseudo triplets of (pre-mod utterance, direction text, post-mod utterance). An impression-controllable TTS model makes the style variations, and an LLM writes the direction text. The paper reports that pseudo triplets alone give stable speaker-preserving modification, and that pseudo data plus recorded data improves direction alignment. Image-gen Phase-1: none.

## Snippets

"we propose a scalable pseudo-triplet construction pipeline that generates (reference utterance, direction text, modified utterance) triplets." [Source: arxiv-2609.02623]
