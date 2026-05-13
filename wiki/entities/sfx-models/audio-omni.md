---
title: "Audio-Omni (SIGGRAPH 2026 — unified audio understanding + generation + editing, research-future)"
type: entity
tags: [sfx, text-to-audio, audio-omni, unified-audio, siggraph-2026, research-future, sound-music-speech-unified]
keywords: [Audio-Omni, SIGGRAPH 2026, unified audio model, sound music speech, audio understanding generation editing, research future, omni audio]
related:
  - concepts/persona-audio-stack.md
  - entities/sfx-models/stable-audio-open.md
  - entities/sfx-models/audioldm.md
  - entities/sfx-models/tango-2.md
  - entities/voice-models/bark.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/sfx-models/stable-audio-open.md
@entities/sfx-models/audioldm.md
@entities/sfx-models/tango-2.md
@entities/voice-models/bark.md

## Raw Concept

Page prompted by the W4 Tier 3 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 4 alternates table ("Audio-Omni — New (SIGGRAPH 2026): unified understanding + generation + editing across sound, music, and speech. Research-future, not build-track today"). Logged as a forward-looking research signal rather than a current build-track tool — page exists for citation hygiene + horizon tracking.

## Narrative

### What it is

**Audio-Omni** is a SIGGRAPH 2026 paper / project (presented or pending May 2026) demonstrating a **unified audio model** spanning three traditionally separate tasks:

1. **Understanding** — audio captioning, classification, content extraction (closer to AudioLM / AudioMAE lineage)
2. **Generation** — text-to-audio across sound effects, music, and speech (closer to Stable Audio Open + Bark lineage)
3. **Editing** — audio inpainting, source separation, timbre transfer, length extension

The differentiator is the **single-model integration**: prior approaches required separate models per task (Whisper for understanding, MusicGen for music, Bark/Stable Audio Open for generation, Demucs for separation). Audio-Omni proposes a unified architecture trained jointly across all three task families.

### Key facts (May 2026)

- **Venue**: SIGGRAPH 2026 (presented / pending — confirm date) [NEEDS VERIFICATION 2026-05-13]
- **Code / weights status**: **research-future** — paper-stage as of writing; code/weights release timing unknown
- **Architecture**: unified transformer or DiT over discrete audio tokens [VERIFY 2026-05-13]
- **License** [NEEDS VERIFICATION 2026-05-13] — undetermined; depends on authors' release policy
- **Scope claim**: sound + music + speech unified
- **Distinctive feature**: in-model editing (audio inpainting / source separation / timbre transfer) without pipeline-stitching multiple models

### Positioning vs current build track

| Axis | Audio-Omni (research) | Stable Audio Open (build) | Tango 2 (build) | AudioLDM (build) | Bark (build, legacy) |
|------|------------------------|----------------------------|------------------|--------------------|------------------------|
| **Status** | **Research / not yet released** | Production-ready open weights | Production-ready open weights | Production-ready open weights | Released open weights, legacy |
| Modal coverage | **Sound + music + speech UNIFIED** | SFX + short music | SFX (top text-alignment) | SFX + music + speech | Speech + music + SFX + nonverbal |
| Editing surface | **In-model (inpaint, separate, transfer)** | None native | None native | None native | None native |
| Clip length | TBD | 47 s | Short | Short | Short |
| **Use today?** | **No — research future** | Yes (primary) | Yes (alt) | Yes (alt) | Niche (nonverbal inline) |

### Persona pipeline outlook (12-18 month horizon)

If Audio-Omni delivers on the unified-model claim and ships permissive weights:

```
Current 2026-05 pipeline:
  Fish-Speech (TTS) + Stable Audio Open (SFX) + ACE-Step (music) + Demucs (separate)
       ↓ pipeline stitching, FFmpeg mux
       ↓
  Output

Possible Audio-Omni pipeline (12-18 mo if release happens):
  Audio-Omni (single model — TTS + SFX + music + edit + separate)
       ↓
  Output
```

The integration win is **not** quality (current specialists likely win on per-task quality at release time) but **operator simplicity**: one model + one tokenizer + one inference path replaces 4-5 specialist models + stitching. For a single-operator persona pipeline running on consumer hardware, the integration win could outweigh per-task quality regression — depending on how much it regresses.

### Why this page exists despite no build-track use

Three reasons:
1. **Horizon tracking** — research-future signals shape 12-18 month capability planning; the persona-audio-stack survey explicitly names Audio-Omni as a directional reference. Citation hygiene requires a page.
2. **Lineage anchor** — if/when Audio-Omni or a similar unified model ships open weights, the persona stack flips from "stitch 4 specialists" to "one model + minor adapters." That's a workflow-level change worth pre-tracking.
3. **Honest dead-end label** — explicitly **not a build-track tool today**. Operators should not block current production work on Audio-Omni availability.

### Watch criteria (recheck 2026-08 / 2026-11 / 2027-05)

- Has code / weights shipped on Hugging Face or GitHub?
- License terms (commercial use, NSFW posture)?
- Quality vs current specialists on per-task benchmarks (TTS-Arena, AudioCaps, MusicCaps)?
- VRAM + inference speed on consumer GPU?
- Editing API surface — usable from Python / ComfyUI?

## Snippets

> "Audio-Omni — New (SIGGRAPH 2026): unified understanding + generation + editing across sound, music, and speech. Research-future, not build-track today."
[Source: @concepts/persona-audio-stack.md Layer 4 alternates table, retrieved 2026-05-13]

## Dead Ends

- **Adopting Audio-Omni today**: research-future, code / weights status unknown as of 2026-05-13. Stick to Stable Audio Open + Tango 2 + Bark (niche) for SFX/foley; ACE-Step + MusicGen for music; Fish-Speech / CosyVoice2 for TTS.
- **Treating Audio-Omni as a build-track substitute for the multi-model audio pipeline**: even at release, per-task quality will likely lag specialists at first. Re-evaluate at watch checkpoints.
- **Blocking persona-stack rollout on Audio-Omni availability**: ship with current specialists; revisit if/when a release lands and benchmarks support migration.
