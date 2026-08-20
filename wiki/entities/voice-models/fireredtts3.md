---
title: FireRedTTS3 (Xiaohongshu continuous AR TTS + Instruct edit)
type: entity
tags: [voice-cloning, tts, speech-editing, xiaohongshu, apache-2-0, watch]
keywords: [FireRedTTS3, FireRedTTS3-Base, FireRedTTS3-Instruct, 24 languages, 21 dialects, voice design]
related:
  - sources/arxiv-2608-17492-fireredtts3.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/qwen3-tts.md
  - entities/voice-models/x2streaming-tts.md
  - sources/arxiv-2608-18661-x2streaming-tts.md
  - sweeps/2026-08-19-daily.md
maturity: draft
created: 2026-08-19
updated: 2026-08-20
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-17492-fireredtts3.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @entities/voice-models/qwen3-tts.md @sweeps/2026-08-19-daily.md

## Raw Concept

Entity from 2026-08-19 ingest of arXiv:2608.17492. Code clone GO-sized; cloning use is research-disclaimer; no Image-gen Phase-1.

## Narrative

Unified **generation + editing** TTS. Base = multilingual/multi-dialect zero-shot clone. Instruct = text-planned voice design (no reference audio) plus semantic and templated acoustic edits. Semantic teacher is a frozen speech-understanding Audio Encoder on continuous latents.

| Check | Result |
| --- | --- |
| Code | `FireRedTeam/FireRedTTS3` Apache-2.0; `.local/adopts/FireRedTTS3` **1.5 MB** |
| Weights | HF `FireRedTeam/FireRedTTS3` **not fetched** |
| Disclaimer | README: zero-shot cloning **academic research only** |
| vs Fish-Speech | Fish stays Layer-1 NSFW-friendly clone; FireRed is WATCH for 24-lang / Instruct edit |
| vs Qwen3-TTS | Same multilingual table; FireRed reports stronger Seed-TTS-eval average in the paper |

**Phase-1:** none (`deferred`). Do not put API keys from README `.env.example` (LLM TN) into git.

## Snippets

_(see source page)_
