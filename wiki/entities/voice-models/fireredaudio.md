---
title: FireRedAudio — unified 9B audio language model
type: entity
tags: [voice-cloning, tts, audio-lm, apache-2-0, watch]
keywords: [FireRedAudio, Xiaohongshu, speech understanding, speech generation]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/fireredtts3.md
  - sources/arxiv-2608-24168-fireredaudio.md
  - sources/arxiv-2608-17492-fireredtts3.md
  - sweeps/2026-08-28-daily.md
maturity: draft
created: 2026-08-28
updated: 2026-08-28
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-24168-fireredaudio.md @entities/voice-models/fireredtts3.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @sweeps/2026-08-28-daily.md

## Raw Concept

Entity from 2026-08-28 ingest of arXiv:2608.24168. Apache-2.0 code cloned; weights not fetched.

## Narrative

| Check | Result |
| --- | --- |
| Code | `FireRedTeam/FireRedAudio` Apache-2.0; `.local/adopts/FireRedAudio` |
| vs FireRedTTS3 | TTS3 = continuous AR TTS + Instruct edit; FireRedAudio = unified audio LM (understand + generate) |
| vs Fish-Speech | Fish stays Layer-1 NSFW-friendly clone |
| Production | Fish-Speech → LatentSync unchanged |

**Phase-1:** none (`deferred`).

## Snippets

_(see source page)_
