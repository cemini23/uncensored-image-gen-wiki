---
title: "voicemode — Whisper.cpp + Kokoro voice MCP (M-series accelerated)"
type: entity
tags: [persona-ops, voice, mcp, whisper, kokoro, claude-code, m-series-mac, core-ml]
keywords: [voicemode, mbailey, whisper.cpp, kokoro tts, core ml, m-series, bidirectional voice, mcp-native]
related:
  - @osint-wiki/entities/tools/voicemode.md
  - @osint-wiki/sources/evaluating-github-repos-trading-stack-2026-05-12.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/kokoro.md
maturity: draft
created: 2026-05-12
updated: 2026-05-13
osint_eval_origin: doc1-url-19 (cross-routed; image-gen persona-ops angle)
---

## Relations

- `@osint-wiki/entities/tools/voicemode.md` — OSINT cross-route (workflow primary)
- `@osint-wiki/sources/evaluating-github-repos-trading-stack-2026-05-12.md` — origin eval (URL 19)
- `@entities/persona-ops/fish-speech.md` — alt TTS for persona voice
- `@entities/voice-models/kokoro.md` — Kokoro-82M TTS engine inside voicemode

## Raw Concept

- **License**: MIT
- **Tier**: Adopt (workflow primary, persona-ops secondary)

## Narrative

Bidirectional voice MCP server: Whisper.cpp (STT) + Kokoro (TTS), Core ML accelerated on M-series Mac. Designed for Claude Code bidirectional voice loops; cross-relevant to persona-ops as a fully-local pipeline that doesn't depend on ElevenLabs / cloud-API quotas. Kokoro voice set is smaller than ElevenLabs but covers most persona-voice needs.

### Comparison vs fish-speech / ElevenLabs

- **Latency**: Core ML acceleration drives sub-second voice response on M2+
- **Quality**: Kokoro voice quality is ~Fish-Speech tier; below ElevenLabs commercial voice quality
- **Local-first**: No API costs, no quota, no privacy leakage to cloud
