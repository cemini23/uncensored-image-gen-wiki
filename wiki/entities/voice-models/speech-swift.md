---
title: speech-swift (Soniqo — Apple Silicon speech toolkit)
type: entity
tags: [voice-cloning, tts, apple-silicon, mlx, coreml, open-source]
keywords: [speech-swift, soniqo, MLX, CoreML, CosyVoice, Qwen3-TTS, Fish Audio S2, Mac TTS, Apache-2.0]
related:
  - entities/voice-models/qwen3-tts.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - concepts/persona-audio-stack.md
  - concepts/david-adoption-brief-routing.md
  - entities/voice-models/nemotron-audex.md
  - sweeps/2026-07-13-daily.md
maturity: draft
created: 2026-07-13
updated: 2026-07-13
---

## Relations

@entities/voice-models/qwen3-tts.md @entities/persona-ops/fish-speech.md @entities/voice-models/cosyvoice2.md @concepts/persona-audio-stack.md @concepts/david-adoption-brief-routing.md

## Raw Concept

Entity from 2026-07-13 digest news row **R9** (`soniqo/speech-swift`) + Phase-0 audit. Native Swift speech toolkit for **Apple Silicon** — ASR, TTS, speech-to-speech, VAD, diarization via **MLX + CoreML**.

## Narrative

### Phase-0 audit (2026-07-13)

| Check | Result |
|-------|--------|
| Repo | `soniqo/speech-swift` |
| License | **Apache-2.0** [CONFIRMED via `gh api`] |
| Activity | 1016★ · pushed 2026-07-13 |
| Backends | CosyVoice TTS, Qwen3-TTS (CoreML), MagpieTTS, Nemotron streaming ASR, **Fish Audio S2 (experimental)** |
| Companion UI | `soniqo/speech-studio` (Apache-2.0, Tauri) — desktop voice-cloning studio |

### Fit for David

| Use case | Verdict |
|----------|---------|
| **Production Fanvue voice notes + lipsync** | **No** — keep **Fish-Speech S2 Pro → LatentSync** on CUDA RunPod |
| **MacBook offline voice-clone experiments** | **WATCH (smoke-test)** — Apache-2.0, emotion tags via CosyVoice/Qwen3 paths |
| **Replace Audex / cloud TTS** | **No** — Audex already REFERENCE (NC license); speech-swift is Mac-local |

**Verdict: WATCH** — install on Mac for latency/license sandbox only; do not migrate monetized personas until A/B matches Fish-Speech identity metrics on 30s reference clips.

## Snippets

> "AI speech toolkit for Apple Silicon — ASR, TTS, speech-to-speech, VAD, and diarization powered by MLX and CoreML"

[Source: github.com/soniqo/speech-swift README (retrieved 2026-07-13)]

> "CosyVoice TTS — Streaming TTS with voice cloning, multi-speaker dialogue, emotion tags (9 languages)"

[Source: github.com/soniqo/speech-swift README backends list]
