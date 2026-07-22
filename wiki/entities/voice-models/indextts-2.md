---
title: IndexTTS-2 (Bilibili Index — zero-shot TTS with emotion + duration control)
type: entity
tags: [voice-cloning, tts, indextts, bilibili, zero-shot, emotion-control, duration-control, eastern-vanguard]
keywords: [IndexTTS, IndexTTS-2, Bilibili Index, zero-shot voice cloning, emotion control, duration control, Index-TTS, GPT-style TTS, neural codec, bilibili-index]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - concepts/model-selection-workflow.md
  - sources/arxiv-2607-17544-x-translator-s2st.md
  - entities/voice-models/x-translator.md
maturity: draft
created: 2026-05-13
updated: 2026-07-22
---

## Relations

@concepts/persona-audio-stack.md
@entities/persona-ops/fish-speech.md
@entities/voice-models/cosyvoice2.md
@concepts/model-selection-workflow.md

## Raw Concept

Page prompted by the W4 Tier 2 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 1 alternates row as the TTS with **explicit duration control** in addition to zero-shot cloning + emotion — a unique capability not in Fish-Speech or CosyVoice2. Previously no entity page.

## Narrative

### What it is

**IndexTTS-2** is Bilibili's Index team open-source TTS engine. GPT-style autoregressive transformer over a neural-codec token sequence, trained on internal Bilibili-scale Chinese + English data. Distinctive feature: **explicit duration control** — operator can specify total speech duration, useful for dubbing fixed-length video clips (lipsync alignment, ad-spot fitting).

### Key facts (May 2026)

- **License**: open weights — exact terms [NEEDS VERIFICATION 2026-05-13]; expected Apache-2.0-class but Index team historically uses custom community-license patterns
- **Repo**: `github.com/index-tts/index-tts` [NEEDS VERIFICATION 2026-05-13]
- **Architecture**: autoregressive transformer + neural audio codec (GPT-style next-token prediction over codec tokens)
- **Size**: ~1.7B parameters [NEEDS VERIFICATION 2026-05-13]
- **Languages**: Chinese, English [VERIFY breadth]
- **Distinctive features**:
  - Zero-shot voice cloning from short reference audio (~10-30 s)
  - Inline emotion control
  - **Duration control** — pin total speech length (unique vs Fish-Speech / CosyVoice2)
- **Best for**: dubbing fixed-length video where output duration must match input clip length

### Positioning vs Fish-Speech / CosyVoice2

| Axis | IndexTTS-2 | Fish-Speech S2 Pro | CosyVoice2-0.5B |
|------|-----------|-------------------|-----------------|
| Zero-shot cloning | ✅ | ✅ (best on TTS-Arena2) | ✅ |
| Emotion control | ✅ inline | ✅ inline natural-language | Limited |
| **Duration control** | ✅ unique | ❌ | ❌ |
| Streaming latency | Moderate | ~100 ms TTFA (H200) | ~150 ms (chunk-aware) |
| Community size | Smaller | Largest | Mid (Alibaba-backed) |
| Best for | Length-pinned dubbing, lipsync alignment | Max quality / emotional range | Real-time DM voice notes |

### Operator notes

- **Lipsync alignment**: duration control is genuinely useful when pre-rendering audio to match a known-length video — avoids the trim/stretch dance of variable-length TTS output
- **NSFW posture**: Eastern Vanguard openness; no platform-level NSFW ban (unlike ElevenLabs)
- **Maturity caveat**: smaller community than Fish-Speech / CosyVoice2 — fewer ComfyUI / SillyTavern integrations as of May 2026

## Snippets

> "IndexTTS-2 — Zero-shot + emotion + duration control. Smaller community [than Fish-Speech]."
[Source: @concepts/persona-audio-stack.md Layer 1 alternates table]

## Dead Ends

- **IndexTTS-2 for primary persona voice when no duration constraint exists**: use Fish-Speech S2 Pro (better emotional range, larger community) or CosyVoice2 (lower latency).
