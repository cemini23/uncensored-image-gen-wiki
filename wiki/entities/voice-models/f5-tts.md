---
title: F5-TTS (SWivid — flow-matching English TTS reference)
type: entity
tags: [voice-cloning, tts, f5-tts, flow-matching, swivid, non-autoregressive, conditional-flow-matching, english-tts]
keywords: [F5-TTS, E2-TTS, SWivid, Yushen Chen, conditional flow matching, CFM, non-autoregressive TTS, Emilia dataset, CC-BY-NC]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - sources/persona-ops-stack-2026.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/persona-ops/fish-speech.md
@sources/persona-ops-stack-2026.md

## Raw Concept

Page prompted by the W4 Tier 2 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 1 alternates row ("strong English quality, limited language support") and in @sources/persona-ops-stack-2026.md keyword list. Previously no entity page.

## Narrative

### What it is

**F5-TTS** is SWivid (Yushen Chen et al.)'s open-source **non-autoregressive** TTS built on **Conditional Flow Matching (CFM)**. Successor to E2-TTS, F5 means "Faster, Fairer, Friendlier, Fuller, Fantastic" — emphasis on parallel decoding (vs autoregressive Fish-Speech / IndexTTS) for higher throughput on consumer GPUs. Strong English quality benchmark; widely used as a baseline in 2025-2026 TTS papers.

### Key facts (May 2026)

- **License**: code typically MIT; **weights CC-BY-NC 4.0** [NEEDS VERIFICATION 2026-05-13] — inherits non-commercial restriction from Emilia dataset license; same license-split pattern as @entities/music-models/musicgen.md (research-only for build-track persona ops if confirmed)
- **Repo**: `github.com/SWivid/F5-TTS`
- **Architecture**: DiT-style transformer + Conditional Flow Matching (non-autoregressive)
- **Size**: ~336M parameters [NEEDS VERIFICATION 2026-05-13]
- **Languages**: English primary; Chinese supported; broader multilingual limited [Source: @concepts/persona-audio-stack.md]
- **Training data**: Emilia (100k+ hours, multilingual)
- **Strength**: high English quality, fast parallel inference (no token-by-token autoregression)
- **VRAM**: ~8-12 GB

### Positioning vs Fish-Speech / IndexTTS-2

| Axis | F5-TTS | Fish-Speech S2 Pro | IndexTTS-2 |
|------|--------|-------------------|-----------|
| Decode | **Non-autoregressive** (CFM) | Autoregressive | Autoregressive |
| Speed | Fast (parallel) | Slower (token-by-token) | Slower (token-by-token) |
| Language coverage | English-strong | 80+ languages | Chinese + English |
| Commercial-use weights | **CC-BY-NC** ❌ likely | Open weights, paid commercial | VERIFY (probably open) |
| Emotion control | Limited | ✅ inline natural-language | ✅ inline |
| Best for | English quality benchmark, research | Production persona voice | Length-pinned dubbing |

### Operator notes

- **Build-track posture**: if the CC-BY-NC 4.0 weight license is confirmed, F5-TTS is **research-only for monetized persona content** — same blocker as @entities/music-models/musicgen.md. Validate before deploying for revenue-generating voice notes.
- **TTS-Arena context**: F5-TTS is a common ELO-benchmark reference but doesn't lead TTS-Arena2 (Fish-Speech S2 Pro does)
- **Why mention it then**: parallel CFM decode is genuinely faster on consumer GPUs than autoregressive alternatives — useful for bulk pre-rendering of audio assets where commercial-use license can be respected (research, prototyping, fully-licensed reference audio)

## Snippets

> "F5-TTS — Strong English quality. Limited language support."
[Source: @concepts/persona-audio-stack.md Layer 1 alternates table]

## Dead Ends

- **F5-TTS for monetized persona content** (pending license confirmation): if CC-BY-NC 4.0 weights confirmed, use Fish-Speech (open weights + paid commercial path) or CosyVoice2 (Apache 2.0) for revenue-generating output.
- **F5-TTS for multi-language persona**: English-strong but other languages limited — use Fish-Speech (80+ languages) or Qwen3-TTS.
