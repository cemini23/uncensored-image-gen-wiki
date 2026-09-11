---
title: "KABURI-TTS phoneme-keyed activity-conditioned TTS (arXiv:2609.07200)"
type: source
tags: [paper, tts, voice, watch]
keywords: [two-channel dialogue TTS, phoneme raster, simultaneous speech, Japanese TTS]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - entities/voice-models/kaburi-tts.md
maturity: draft
read_status: read
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @entities/voice-models/kaburi-tts.md

## Raw Concept

- **Title**: KABURI-TTS: Phoneme-Keyed Activity-conditioned Bi-channel Utterance Rendering for Interaction
- **Type**: arXiv:2609.07200 [cs.SD]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.07200
- **Code**: repo llm-jp/kaburi-tts, SPDX Apache-2.0 CONFIRMED, 6 stars, ~47 MB API size. Cloned to .local/adopts/kaburi-tts.
- **Retrieved**: 2026-09-11

## Narrative

The paper proposes KABURI-TTS. The model takes a per-speaker phoneme raster as input. It renders the speech of two speakers on separate channels, conditioned on per-frame phonemes and voice activity. This work matters for this wiki because it gives controllable two-party overlap for Japanese dialogue data. Image-gen Phase-1: none.

## Snippets

"KABURI-TTS takes a per-speaker phoneme raster as input and renders the speech of the two speakers on separate channels, conditioned on the per-frame phonemes and the voice activity derived from them." [Source: arxiv-2609.07200]
