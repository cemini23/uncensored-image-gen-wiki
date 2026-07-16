---
title: "Dia (Nari Labs — dialogue-focused open-weights TTS)"
type: entity
tags: [voice-cloning, tts, dia, nari-labs, dialogue-tts, apache-2-0, multi-speaker, korean-startup]
keywords: [Dia, Nari Labs, dialogue TTS, 1.6B, multi-speaker, conversational TTS, Apache 2.0 likely, two-speaker tag, ⓘ-tag emotion, nonverbal sounds]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - entities/voice-models/chatterbox.md
  - entities/voice-models/zipl-dialog.md
  - sources/persona-ops-stack-2026.md
  - sources/arxiv-2607-12496-zipl-dialog-latent-flow-matching.md
maturity: draft
created: 2026-05-13
updated: 2026-07-16
---

## Relations

@concepts/persona-audio-stack.md
@entities/persona-ops/fish-speech.md
@entities/voice-models/cosyvoice2.md
@entities/voice-models/chatterbox.md
@entities/voice-models/zipl-dialog.md
@sources/persona-ops-stack-2026.md

## Raw Concept

Page prompted by the W4 Tier 3 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 1 alternates table ("Dia (Nari Labs) — Dialogue-focused TTS, conversational — Purpose-built for chat, not broadcast"); the **only** open-weights TTS in the table built specifically for multi-speaker dialogue generation rather than single-voice cloning. Previously no entity page.

## Narrative

### What it is

**Dia** is Nari Labs' open-weights text-to-speech model built specifically for **conversational dialogue** — multi-speaker turns, interruptions, laughter, sighs, and other nonverbal sounds embedded inline in the prompt. Released by a small Korean team in 2025 [VERIFY exact release date 2026-05-13] under a permissive license; quickly trended on Hugging Face as the open answer to NotebookLM-style "podcast from text" use cases.

### Key facts (May 2026)

- **License**: **Apache 2.0** [NEEDS VERIFICATION 2026-05-13] — verify against repo
- **Size**: ~1.6B parameters [NEEDS VERIFICATION 2026-05-13]
- **Repo**: `github.com/nari-labs/dia` [NEEDS VERIFICATION 2026-05-13]
- **Hugging Face**: `nari-labs/Dia-1.6B` (or similar) [NEEDS VERIFICATION 2026-05-13]
- **Architecture**: GPT-style decoder over discrete audio tokens, multi-speaker conditioning [VERIFY]
- **Distinguishing feature**: **inline two-speaker tagging** (`[S1] Hi there. [S2] Hey, how are you?`) generates natural multi-turn dialogue in a single pass — not stitched mono-speaker clips
- **Nonverbal control**: inline tags for laughter, sighs, throat-clear, etc. (e.g. `(laughs)`, `(sighs)`)
- **Voice cloning**: zero-shot single-speaker clone supported via reference clip [VERIFY clip length requirement]
- **VRAM**: ~8-12 GB inference [VERIFY]
- **Quality**: competitive with current open-weights leaders for **dialogue**, weaker than Fish-Speech S2 Pro for single-voice broadcast/voiceover

### Positioning vs voice tier

| Axis | Dia | Fish-Speech S2 Pro | CosyVoice2-0.5B | Chatterbox |
|------|-----|---------------------|------------------|------------|
| **Primary use case** | **Multi-speaker dialogue** (podcast, chat) | Single-voice broadcast / voiceover | Real-time streaming TTS | Real-time real-time clone |
| Inline speaker tagging | **Yes — `[S1]/[S2]`** | No (per-segment switching) | No | No |
| Nonverbal sounds inline | **Yes — `(laughs)`, `(sighs)`** | Emotion tag at word-level | Limited | Limited |
| Voice cloning | Yes (single-speaker zero-shot) | Yes (10-30s ref) | Yes (few-s ref) | Yes (few-s ref) |
| TTS-Arena2 standing | Strong (dialogue specialist) | **Leader** | Strong | Strong |
| **License (weights)** | Apache 2.0 likely [VERIFY] | Operator-controlled (paid commercial) | Apache 2.0 | MIT |
| VRAM | ~8-12 GB | 16-24 GB | 8 GB | 8 GB |
| **Best for** | **Two-character dialog content, podcast generation, character-character DMs** | Single-voice persona broadcast | Real-time DM voice notes | Permissive-license production |

### Persona pipeline integration

Dia fits the persona pipeline when the content needs **two voices in conversation**:

1. **Persona-X-fan back-and-forth narrative content** — generate a single audio file containing both sides of a roleplay scene; faster + more natural prosody than mono-speaker clip stitching
2. **Podcast-style content for distribution** — NotebookLM-style "two AI hosts discuss X" formats; cheap content unit when only audio is the deliverable
3. **Multi-persona reels** — character-to-character dialog where two operator-controlled personas converse, then both halves are routed through separate lipsync passes (@entities/lipsync/latentsync.md / @entities/lipsync/musetalk.md)

For **single-voice DM voice notes / single-character voiceover**, Fish-Speech S2 Pro or CosyVoice2 still dominate — Dia's dialogue strength is a premium that doesn't help a mono-speaker prompt.

### Operator notes

- **Verification pending**: as of 2026-05-13 I haven't directly retrieved the Dia repo README / model card; license + parameter count + clone-clip length are NEEDS VERIFICATION. Pull on next ingest cycle (W5) and update.
- **Build-track viability** depends on Apache 2.0 confirmation. If confirmed, Dia is **commercial-license-clean** for monetized persona dialogue content. If a more restrictive license surfaces, defer until alternate (CosyVoice2 dialogue prompting + clip stitching) is benchmarked.
- **Korean origin**: Nari Labs is small-team / academic-lineage — assume slower update cadence than Alibaba (CosyVoice) or Fish Audio (Fish-Speech). Active development as of mid-2025; status May 2026 [VERIFY]
- **Apple Silicon (MPS)** viability [NEEDS VERIFICATION 2026-05-13]

## Snippets

> "Dia (Nari Labs) — Dialogue-focused TTS, conversational — Purpose-built for chat, not broadcast."
[Source: @concepts/persona-audio-stack.md Layer 1 alternates table, retrieved 2026-05-13]

## Dead Ends

- **Dia as a single-voice broadcast / voiceover primary**: built for dialogue. Single-voice quality is fine but doesn't beat Fish-Speech S2 Pro for solo persona voiceover. Reserve Dia for two-speaker formats.
- **Adopting Dia without license verification**: NEEDS VERIFICATION on the weights license. Do not commit Dia-generated content to a monetized stream until Apache 2.0 (or other permissive) license is confirmed.
