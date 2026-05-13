---
title: Chatterbox (Resemble AI — permissive-licensed real-time TTS)
type: entity
tags: [voice-cloning, tts, chatterbox, resemble-ai, real-time-tts, mit-license, perth-watermark, lightweight-tts]
keywords: [Chatterbox, Resemble AI, MIT license, watermarked TTS, PerTH watermarker, real-time TTS, lightweight voice cloning, persona-ops]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - entities/voice-models/xtts-v2.md
  - entities/voice-models/dia.md
  - entities/voice-models/elevenlabs.md
  - concepts/model-selection-workflow.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/persona-ops/fish-speech.md
@entities/voice-models/cosyvoice2.md
@entities/voice-models/xtts-v2.md @entities/voice-models/dia.md @entities/voice-models/elevenlabs.md
@concepts/model-selection-workflow.md

## Raw Concept

Page prompted by the W4 Tier 2 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 1 alternates row ("permissive license, real-time, lightweight"); the most license-clean Western alternative when Fish-Speech's commercial paid license is undesirable. Previously no entity page.

## Narrative

### What it is

**Chatterbox** is Resemble AI's open-source TTS, released May 2025. **MIT-licensed** weights and code — the most permissively-licensed major voice-clone TTS as of May 2026 (cleaner posture than Fish-Speech's paid commercial split, CosyVoice2's Apache-but-PRC-jurisdiction, or F5-TTS's likely-CC-BY-NC weights). Includes built-in **PerTH watermarking** (Perceptual Threshold Hashing) — every generated audio includes an inaudible watermark for provenance verification.

### Key facts (May 2026)

- **License**: **MIT** (code + weights) [NEEDS VERIFICATION 2026-05-13 — confirm current weight license]
- **Repo**: `github.com/resemble-ai/chatterbox`
- **Size**: ~500M parameters [NEEDS VERIFICATION 2026-05-13]
- **Architecture**: LLaMA-class transformer backbone + neural codec audio tokens [NEEDS VERIFICATION 2026-05-13]
- **Watermarking**: PerTH inaudible perceptual watermark on every output — provenance trail by design
- **Speed**: real-time capable on consumer GPU
- **VRAM**: ~8 GB (fits on the same tier as CosyVoice2-0.5B)
- **Languages**: English primary [VERIFY breadth]
- **Distinctive features**:
  - Most permissive license among major open TTS
  - Built-in watermarking (compliance-friendly for some use cases)
  - Real-time inference on commodity GPU

### Positioning vs Fish-Speech / CosyVoice2

| Axis | Chatterbox | Fish-Speech S2 Pro | CosyVoice2-0.5B |
|------|-----------|-------------------|-----------------|
| License | **MIT** ✅ cleanest | Paid commercial | Apache 2.0 |
| Speed | Real-time | ~100 ms TTFA (H200) | ~150 ms streaming |
| Quality (May 2026) | Strong | TTS-Arena2 leader | Strong, low-latency |
| Watermark | **Built-in PerTH** | None | None |
| Emotion control | Limited [VERIFY] | ✅ inline natural-language | Limited |
| VRAM | ~8 GB | 16-24 GB | 8 GB |
| Community | Newer, smaller | Largest | Mid (Alibaba-backed) |

### Operator notes

- **License-cleanest pick** for build-track persona ops where any commercial-license ambiguity is undesirable. MIT eliminates the Fish-Speech "paid commercial" gate.
- **Watermark trade-off**: PerTH is inaudible by design, but its presence is a *known signal* that audio classification tools (deepfake detectors, platform anti-AI screening) could be tuned to detect. Operationally this could be a feature (provenance for legit IP claims) or a bug (detectability on platforms that block AI audio). Test before committing.
- **Smaller emotional range vs Fish-Speech**: Fish-Speech's inline `[whisper in small voice]` / `[excited and fast]` is broader. Chatterbox's emotion control surface is narrower [VERIFY 2026-05-13].
- **No NSFW guardrails at model level** (open source); platform-ToS risk lives on the publishing side, not the synthesis side

## Snippets

> "Chatterbox (Resemble AI) — Permissive license, real-time, lightweight. Newer, smaller ecosystem."
[Source: @concepts/persona-audio-stack.md Layer 1 alternates table]

## Dead Ends

- **Chatterbox where audio-anti-detect on platforms is critical**: PerTH watermark is a known-signal; if platforms tune for it, output becomes detectable as AI-generated even when other signals are clean. Use unwatermarked open TTS (CosyVoice2, F5-TTS) for that posture.
- **Chatterbox for maximum emotional range**: Fish-Speech inline-emotion control is still ahead. Use Chatterbox for license-clean baseline + Fish-Speech for high-impact emotion-heavy posts.
