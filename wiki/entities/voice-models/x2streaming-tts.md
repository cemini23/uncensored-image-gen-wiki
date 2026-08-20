---
title: X2Streaming-TTS — causal token-level streaming TTS
type: entity
tags: [voice-cloning, tts, streaming, qwen3, watch]
keywords: [X2Streaming-TTS, causal commitment, speech-state inheritance, TTFT, X Square Robot]
related:
  - concepts/persona-audio-stack.md
  - entities/voice-models/fireredtts3.md
  - entities/voice-models/qwen3-tts.md
  - entities/voice-models/voicechat-tts.md
  - sources/arxiv-2608-18661-x2streaming-tts.md
  - sweeps/2026-08-20-daily.md
maturity: draft
created: 2026-08-20
updated: 2026-08-20
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-18661-x2streaming-tts.md @concepts/persona-audio-stack.md @entities/voice-models/voicechat-tts.md @entities/voice-models/fireredtts3.md @entities/voice-models/qwen3-tts.md @sweeps/2026-08-20-daily.md

## Raw Concept

Entity from 2026-08-20 ingest. Paper cites `X-Square-Robot/X2Streaming-TTS` → **404**. No clone.

## Narrative

Zero-lookahead token-level TTS on a Qwen3-TTS Talker + Code2Wav stack. Causal commitment holds ambiguous prefixes; speech-state inheritance carries decoder + selected Talker state across segments. Median TTFT 15.8 ms (1 req) / 260.8 ms (128 concurrent).

| Stack | Role |
| --- | --- |
| Fish-Speech | Layer-1 NSFW-friendly clone (production) |
| VoiceChat-TTS | NVIDIA streamable TTS from LLM tokens + barge-in; different control surface |
| FireRedTTS3 | Unified gen + Instruct edit; not token-level streaming |
| Qwen3-TTS | Backbone the paper wraps |

**WATCH.** Repo 404. `deferred`. No Image-gen Phase-1.

## Snippets

_(see source page)_
