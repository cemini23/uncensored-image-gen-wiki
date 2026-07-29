---
title: "Voice style extraction from frozen TTS via inverse optimization (arXiv:2607.25351)"
type: source
tags: [paper, tts, voice-cloning, style-vector, inversion]
keywords: [SupertonicTTS, style-vector, WavLM, inverse-optimization, kdrkdrkdr]
related:
  - entities/voice-models/supertonic-embed.md
  - entities/persona-ops/supertonic.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - sweeps/2026-07-29-daily.md
maturity: draft
read_status: read
created: 2026-07-29
updated: 2026-07-29
---

## Relations

@entities/voice-models/supertonic-embed.md @entities/persona-ops/supertonic.md @concepts/persona-audio-stack.md @sweeps/2026-07-29-daily.md

## Raw Concept

- **Title**: Extracting Voice Styles from Frozen TTS Models via Gradient-Based Inverse Optimization
- **Authors**: Gyeongmin Kim (Hanyang University)
- **Type**: arXiv:2607.25351
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.25351-extracting-voice-styles-from-frozen-tts-models-v.pdf`
- **URL**: https://arxiv.org/abs/2607.25351
- **Code**: github.com/kdrkdrkdr/supertonic.embed
- **Retrieved**: 2026-07-29

## Narrative

When a TTS release ships synthesizer + preset style vectors but **withholds the reference encoder**, recover the style vector by freezing all weights and optimizing only the style input against time-pooled WavLM stats of one recording (no transcript/alignment). On 154 speakers, ECAPA similarity 0.132→0.413; EER verifier accepts 53% vs 1% for presets.

**Phase-0: CONDITIONAL-GO (research / operator-owned refs only)** — code ~1.4 MB; needs NVIDIA CUDA + Supertone/supertonic-2 HF models. No SPDX LICENSE file; README is academic/research with strict responsible-use terms (consent, no non-consensual clone). **Not** a Fish-Speech replacement. Distinct from financial-speech @entities/persona-ops/supertonic.md. TipDrop CUDA only; no wiki-laptop clone.

## Snippets

_(none)_
