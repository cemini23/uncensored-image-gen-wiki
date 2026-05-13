---
title: Kokoro-82M (Hexgrad / StyleTTS2-derived TTS)
type: entity
tags: [tts, voice-models, kokoro, hexgrad, apache-2-0, styletts2, lightweight-tts, no-voice-cloning, m-series-mac]
keywords: [Kokoro, Kokoro-82M, hexgrad, StyleTTS2-LJSpeech, misaki, G2P, 82M parameters, af_heart, af_bella, single-speaker, voicemode, Core ML, pip install kokoro]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/voicemode.md
  - entities/persona-ops/fish-speech.md
  - concepts/model-selection-workflow.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/persona-ops/voicemode.md
@entities/persona-ops/fish-speech.md
@concepts/model-selection-workflow.md

## Raw Concept

Page prompted by the W4 voice/audio-gen backfill (scope expansion 2026-05-13). Kokoro is the TTS engine inside @entities/persona-ops/voicemode.md (Whisper.cpp + Kokoro MCP) and previously had no entity page of its own; named in @concepts/persona-audio-stack.md voice-clone alternates row.

## Narrative

### What it is

**Kokoro-82M** is an Apache-2.0 open-weight TTS model with 82 million parameters developed by **hexgrad**. Derived from `yl4579/StyleTTS2-LJSpeech` base. Pip-installable (`pip install kokoro`); v1.0 released. Despite its tiny footprint (82M) it delivers quality comparable to 1-3B-class TTS models, making it the canonical pick for laptop-side / Apple-Silicon TTS where VRAM is scarce.

**Important distinction**: Kokoro is a **TTS engine with single-speaker voice presets** (e.g. `af_heart`, `af_bella`), not a zero-shot voice clone. The training corpus explicitly excludes custom voice clones and copyrighted material — per the model card, training data was permissive/non-copyrighted audio + synthetic audio from closed TTS providers + CC-BY audio. **No reference-audio cloning is supported**.

### Key facts (May 2026)

- **License**: Apache 2.0 (weights + code) [CONFIRMED]
- **Parameters**: 82M (8.2 × 10⁷) — fits in <500 MB on disk in fp16
- **Base architecture**: StyleTTS2-LJSpeech derivative
- **G2P**: misaki library (`github.com/hexgrad/misaki`)
- **Voice presets**: pre-baked named speakers (`af_heart`, `af_bella`, others) — no operator voice cloning
- **Sample rate**: 24 kHz output
- **Inference**: `pip install kokoro`; Core ML acceleration on Apple Silicon (used inside @entities/persona-ops/voicemode.md)
- **Commercial use**: open — deployed in numerous commercial APIs at $0.06-$1 per million chars (April 2025 market rate)

### Positioning vs Fish-Speech S2 Pro / CosyVoice2

| Axis | Kokoro-82M | CosyVoice2-0.5B | Fish-Speech S2 Pro |
|------|------------|-----------------|--------------------|
| Size | 82M | 500M | larger (16-24 GB VRAM) |
| Voice cloning | ❌ no | ✅ zero-shot | ✅ zero-shot |
| Speaker variety | preset voices only | unlimited (clone) | unlimited (clone) |
| Apple Silicon | ✅ Core ML accelerated | TBD | ✅ MPS fork |
| Latency | sub-second on M2+ | 150ms streaming | higher |
| Best for | Bidirectional voice MCP, narration, Claude Code | DM voice notes (clone) | Persona voice (clone + emotion) |

### Decision matrix entry

- **Generic narration / assistant voice / no persona identity** → Kokoro (fastest, smallest, Apache 2.0)
- **Specific persona voice + cloning needed** → Fish-Speech S2 Pro or CosyVoice2 — NOT Kokoro

### Operator notes

- For persona-ops, Kokoro is unsuitable as the persona's "speaking voice" because no clone path exists. It's a good fallback for non-persona-attached narration (interstitial voiceovers, accessibility readouts).
- Used inside @entities/persona-ops/voicemode.md for Claude Code bidirectional voice — workspace tooling layer, not persona content layer.
- "Scam-site" warning on the official model card: `kokorottsai_com` / `kokorotts_net` are unaffiliated; the canonical HF repo is `hexgrad/Kokoro-82M`.

## Snippets

> "Kokoro is an open-weight TTS model with 82 million parameters. Despite its lightweight architecture, it delivers comparable quality to larger models while being significantly faster and more cost-efficient. With Apache-licensed weights, Kokoro can be deployed anywhere from production environments to personal projects."
[Source: https://huggingface.co/hexgrad/Kokoro-82M (retrieved 2026-05-13)]

> "Kokoro was trained exclusively on permissive/non-copyrighted audio data and IPA phoneme labels. No synthetic audio from open TTS models or 'custom voice clones'."
[Source: hexgrad/Kokoro-82M model card (retrieved 2026-05-13)]

### Install

```bash
pip install kokoro
# minimal use
python -c "
from kokoro import KPipeline
pipeline = KPipeline(lang_code='a')  # American English
generator = pipeline('Hello world.', voice='af_heart')
for i, (gs, ps, audio) in enumerate(generator):
    import soundfile as sf; sf.write(f'{i}.wav', audio, 24000)
"
```

## Dead Ends

- **Kokoro for persona voice cloning**: architectural — no reference-audio path. Use Fish-Speech S2 Pro / CosyVoice2 / F5-TTS for cloning.
- **Kokoro for high-emotion expressive speech**: voice presets are neutral-to-warm; no inline emotion tags. Use Fish-Speech S2 Pro for `[whisper]` / `[excited]` / `[breathy]` control.
