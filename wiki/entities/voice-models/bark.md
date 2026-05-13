---
title: "Bark (Suno — text-to-audio generative transformer, legacy)"
type: entity
tags: [text-to-audio, tts, bark, suno, mit-license, generative-audio, sound-effects, nonverbal, legacy]
keywords: [Bark, Suno, suno-bark, generative audio, nonverbal sounds, multilingual TTS, music in voice, MIT license, transformer audio, legacy, AudioCraft alternative]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/sfx-models/stable-audio-open.md
  - entities/sfx-models/tango-2.md
  - entities/sfx-models/audio-omni.md
  - entities/music-models/suno.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/persona-ops/fish-speech.md
@entities/sfx-models/stable-audio-open.md
@entities/sfx-models/tango-2.md
@entities/sfx-models/audio-omni.md
@entities/music-models/suno.md

## Raw Concept

Page prompted by the W4 Tier 3 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 4 alternates table ("Bark (Suno) — Text-to-audio including sound effects, but older and surpassed") and in the Dead Ends section ("Bark (Suno) for sound effects: surpassed by Stable Audio Open and Tango 2"). Previously no entity page — its **dual-position straddling TTS-and-SFX** plus its lineage as the open precursor to commercial Suno v4 warrants a reference page.

## Narrative

### What it is

**Bark** is Suno AI's open-weights generative-audio transformer (released April 2023) — the first open model to demonstrate **unified text-to-audio across speech, music, and sound effects in a single model**. Architecture: GPT-style transformer over EnCodec-style discrete audio tokens, no separate TTS / SFX / music heads. Released under **MIT** before Suno pivoted to closed cloud (@entities/music-models/suno.md), making Bark the **open lineage** of the Suno-family quality curve. Surpassed by 2024-2025 specialists (Stable Audio Open, Tango 2, Fish-Speech) but historically important.

### Key facts (May 2026)

- **License**: **MIT** [CONFIRMED — `suno-ai/bark` repo]
- **Release**: April 2023
- **Repo**: `github.com/suno-ai/bark`
- **Architecture**: GPT-style decoder transformer over discrete audio tokens; three sub-models (semantic / coarse / fine) over EnCodec-tokenized audio
- **Sizes**: small (~80 M total) / large (~370 M total) — both relatively small for the unified audio domain
- **Modalities in one model**:
  - **Speech** (multilingual, English-strong) with speaker presets
  - **Music** snippets (short, less coherent than dedicated music models)
  - **Nonverbal** sounds — laughter, sighs, throat-clear, gasps via inline tags (`[laughter]`, `[sighs]`)
  - **Sound effects** via descriptive prompts ("a dog barking, then footsteps")
- **VRAM**: ~4-8 GB inference (lightest in the unified-audio tier)
- **Sample rate**: 24 kHz
- **No voice cloning**: presets only (custom voice fine-tunes possible but not zero-shot)
- **Speed**: slow per-second-of-audio vs current specialists

### Positioning vs current voice / SFX tier

| Axis | Bark (2023, legacy) | Fish-Speech S2 Pro (TTS) | Stable Audio Open (SFX) | Tango 2 (SFX) |
|------|----------------------|---------------------------|--------------------------|----------------|
| **Modal coverage** | **Speech + music + SFX + nonverbal in one model** | Speech only (top-tier) | SFX + short music | SFX (top text-alignment) |
| Voice cloning | No (presets only) | Yes (10-30s zero-shot) | N/A | N/A |
| Speech quality | Surpassed | **Top** | N/A | N/A |
| SFX quality | Surpassed | N/A | **Top open-weights** | Strong (DPO-tuned) |
| **License** | **MIT** ✅ | Operator-controlled (paid commercial) | Stability Community (<$1M ARR free) | CC-BY-NC-SA likely |
| Sample rate | 24 kHz | 24-44.1 kHz | 44.1 kHz stereo | 16 kHz |
| **Niche where Bark still wins** | **Inline nonverbal injection (`[laughter]`, `[sighs]`) in narrative speech** | (Fish does in-line emotion tags but not "actual laughter audio") | — | — |

### Why Bark still matters as a reference

1. **Nonverbal-sound injection inline with speech** — Bark's `[laughter]`, `[sighs]`, `[gasps]` produces *actual laugh audio mixed into the speech track*, not a TTS reading of "haha." Current specialists separate speech from foley; reconstructing this with Fish-Speech + Stable Audio Open + FFmpeg mux requires more pipeline.
2. **Lineage trace** — Bark → closed Suno v3/v4/v4.5 quality curve. Understanding Bark grounds the Suno cloud-vs-local tradeoff
3. **MIT-license historical example** — Suno's permissive open release before pivoting to closed cloud is a recurring pattern (Bark MIT → Suno cloud, ElevenLabs research papers → ElevenLabs cloud). Useful for forecasting other vendors.

### Operator notes

- **Build-track posture: legacy for primary use cases**. Use Fish-Speech S2 Pro / CosyVoice2 / Chatterbox for TTS, Stable Audio Open / Tango 2 for SFX.
- **Niche-use Bark for**: persona content where inline natural laughter / nonverbal audio matters and you don't want to mux Stable Audio Open SFX over a Fish-Speech voice line in post. Niche but valid.
- **MIT-license clean** — commercial use unrestricted. The license is not the blocker; quality regression vs current specialists is.
- **No active development** as of mid-2024 [VERIFY 2026-05-13] — Suno's energy went to closed cloud. Treat Bark as frozen at 2023-2024 capability.
- **Apple Silicon (MPS)**: workable [VERIFY 2026-05-13]

## Snippets

> "Bark (Suno) — Text-to-audio including sound effects, but older and surpassed."
[Source: @concepts/persona-audio-stack.md Layer 4 — text-to-audio alternatives table, retrieved 2026-05-13]

> "Bark (Suno) for sound effects: surpassed by Stable Audio Open and Tango 2."
[Source: @concepts/persona-audio-stack.md Dead Ends, retrieved 2026-05-13]

## Dead Ends

- **Bark as a primary TTS for persona ops**: surpassed by Fish-Speech S2 Pro / CosyVoice2 / Chatterbox on quality and feature surface (zero-shot cloning, emotion control, language coverage).
- **Bark as a primary SFX/foley generator**: surpassed by @entities/sfx-models/stable-audio-open.md (44.1 kHz, longer clips, better quality) and @entities/sfx-models/tango-2.md (instruction-tuned alignment).
- **Treating Bark as the canonical Suno-family open model**: Suno's investment has fully migrated to the closed cloud product (@entities/music-models/suno.md). Bark is not on the upgrade path.
