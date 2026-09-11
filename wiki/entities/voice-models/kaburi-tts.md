---
title: KABURI-TTS
type: entity
tags: [tts, voice, dialogue, watch]
keywords: [two-channel TTS, phoneme raster, simultaneous speech, Japanese]
related:
  - sources/arxiv-2609-07200-kaburi-tts.md
  - concepts/persona-audio-stack.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
maturity: draft
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH / GO clone
wire_status: deferred
---

## Relations

@sources/arxiv-2609-07200-kaburi-tts.md @concepts/persona-audio-stack.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.07200 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-07200-kaburi-tts.md

## Narrative

KABURI-TTS is a Japanese activity-conditioned TTS model for two-party dialogue. It takes a per-speaker phoneme raster and renders each speaker on a separate channel. A separate module supplies the phoneme raster, so the operator can control the overlap and the turn-taking. The model builds on an existing single-channel, single-speaker synthesis engine. License fact: Apache-2.0 CONFIRMED. Clone status: DONE at .local/adopts/kaburi-tts (depth 1, 65 MB on disk with its test ref-pack assets). No weights pull. This is Japanese activity-conditioned TTS, so it does NOT relate to the Thai G2P page. Image-gen Phase-1: none. wire_status: deferred.
