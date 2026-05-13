---
title: MaskGCT (Amphion — masked generative codec transformer)
type: entity
tags: [voice-cloning, tts, maskgct, amphion, non-autoregressive, masked-generative-transformer, neural-codec, in-context-tts]
keywords: [MaskGCT, Masked Generative Codec Transformer, Amphion, open-mmlab, CMU, non-autoregressive TTS, in-context cloning, Emilia dataset, parallel decoding]
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

Page prompted by the W4 Tier 2 voice/audio backfill (2026-05-13). Surfaces in @sources/persona-ops-stack-2026.md keyword list ("ElevenLabs, Fish-Speech, Qwen3-TTS, F5-TTS, MaskGCT, Coqui XTTS") as one of the canonical 2026 open-source TTS reference points. Previously no entity page.

## Narrative

### What it is

**MaskGCT** (Masked Generative Codec Transformer) is the Amphion team's (CMU + collaborators) non-autoregressive TTS architecture. Uses masked-prediction decoding over neural-codec audio tokens (analogous to MaskGIT for images): masks codec tokens and predicts them in parallel iterations, achieving fast inference without the token-by-token autoregression that bottlenecks Fish-Speech / IndexTTS-style models. Strong zero-shot **in-context** voice cloning — provide a reference audio + transcript, MaskGCT clones in one forward pass.

### Key facts (May 2026)

- **License**: code typically MIT (Amphion); **weights CC-BY-NC 4.0** [NEEDS VERIFICATION 2026-05-13] — inherits non-commercial restriction from Emilia dataset license (same blocker pattern as @entities/music-models/musicgen.md / @entities/voice-models/f5-tts.md)
- **Repo**: `github.com/open-mmlab/Amphion/tree/main/models/tts/maskgct`
- **Size**: ~1.1B parameters [NEEDS VERIFICATION 2026-05-13]
- **Architecture**: two-stage — (1) text-to-semantic masked transformer over semantic tokens, (2) semantic-to-acoustic masked transformer over codec tokens
- **Training data**: Emilia (100k+ hours, multilingual)
- **Decoding**: non-autoregressive, iterative parallel masked decoding (typically 25-50 steps)
- **Strength**: parallel decode → fast generation; in-context zero-shot cloning quality competitive with autoregressive TTS
- **VRAM**: 12-16 GB inference [VERIFY]

### Positioning vs F5-TTS / Fish-Speech

| Axis | MaskGCT | F5-TTS | Fish-Speech S2 Pro |
|------|---------|--------|-------------------|
| Decode | Non-autoregressive (masked) | Non-autoregressive (CFM) | Autoregressive |
| Speed | Fast (parallel iterations) | Fast (parallel CFM) | Slower (token-by-token) |
| Quality (TTS-Arena2) | Competitive | Competitive | Leader |
| Weight license | CC-BY-NC likely | CC-BY-NC likely | Open weights, paid commercial |
| Two-stage architecture | ✅ semantic + acoustic | ❌ single-stage | ❌ single-stage |
| Best for | Research, parallel-decode benchmarking | English quality benchmark | Production persona voice |

### Operator notes

- **Build-track posture**: same as F5-TTS — if Emilia / CC-BY-NC 4.0 weight license is confirmed, MaskGCT is **research-only for monetized persona content**. Validate before deploying for revenue.
- **Why mention it**: parallel masked-decode is a faster inference paradigm than autoregressive Fish-Speech for bulk pre-rendering; useful in research-pipeline contexts where the license is respected
- **Amphion umbrella**: MaskGCT is one model in the broader Amphion toolkit (VALL-E, NaturalSpeech, VITS variants, codec experiments) — useful as a TTS-research playground but not a single-purpose production system

## Snippets

> "ElevenLabs, Fish-Speech, Qwen3-TTS, F5-TTS, MaskGCT, Coqui XTTS"
[Source: @sources/persona-ops-stack-2026.md frontmatter keywords]

## Dead Ends

- **MaskGCT for monetized persona content** (pending license confirmation): if CC-BY-NC 4.0 weights confirmed, migrate to Fish-Speech (paid commercial path) or CosyVoice2 (Apache 2.0) for revenue-generating output.
- **MaskGCT as a single-stage drop-in for Fish-Speech**: two-stage architecture adds pipeline complexity — only justified when parallel-decode speed is needed and license fits.
