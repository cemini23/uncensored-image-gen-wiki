---
title: supertonic.embed (style-vector inversion for SupertonicTTS)
type: entity
tags: [voice-cloning, tts, style-vector, research-only, cuda]
keywords: [supertonic.embed, WavLM, inverse-optimization, Supertone]
related:
  - sources/arxiv-2607-25351-voice-style-inverse-opt.md
  - entities/persona-ops/supertonic.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - sweeps/2026-07-29-daily.md
maturity: draft
created: 2026-07-29
updated: 2026-07-29
---

## Relations

@sources/arxiv-2607-25351-voice-style-inverse-opt.md @entities/persona-ops/supertonic.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md

## Raw Concept

Phase-0 2026-07-29: github.com/kdrkdrkdr/supertonic.embed (~1.4 MB, 34★). Distinct from financial-speech @entities/persona-ops/supertonic.md.

## Narrative

| Field | Value |
|-------|--------|
| Purpose | Recover style JSON for SupertonicTTS when encoder is unreleased |
| Hardware | NVIDIA CUDA ≥4 GB |
| Models | HF Supertone/supertonic-2 (`onnx/` + `voice_styles/`) |
| License | No SPDX; research README + responsible-use terms |

### Phase-0

**CONDITIONAL-GO on David CUDA only**, operator-owned reference audio, consent required. Production TTS remains Fish-Speech.

## Snippets

_(none)_
