---
title: SemBridge — semantic-token anchoring for continuous-latent AR speech
type: entity
tags: [voice-cloning, tts, continuous-latent, autoregressive, watch]
keywords: [SemBridge, ASLP, Soul-AI, semantic-token, zero-shot-TTS, SVS]
related:
  - sources/arxiv-2608-07462-sembridge.md
  - concepts/persona-audio-stack.md
  - concepts/waveform-native-flow-matching-tts.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - sweeps/2026-08-10-daily.md
maturity: draft
created: 2026-08-10
updated: 2026-08-10
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-07462-sembridge.md @concepts/persona-audio-stack.md @concepts/waveform-native-flow-matching-tts.md @entities/persona-ops/fish-speech.md @entities/voice-models/cosyvoice2.md

## Raw Concept

Phase-0 from arXiv:2608.07462. Continuous-latent AR TTS with training-only semantic-token bridge — content-fidelity lever for persona voice / singing.

## Narrative

| Field | Value |
|-------|-------|
| Org | ASLP@NPU + Soul AI Lab |
| Method | Discrete semantic tokens supervise AR LM states; Semantic-Aligned Acoustic VAE; inference continuous-only |
| Tasks | Zero-shot TTS + score-conditioned SVS |
| Code | github.com/ASLP-lab/SemBridge — **skeleton only** (readme+asset); LICENSE file missing despite Apache-2.0 badge |
| Weights | TBA |
| Phase-0 | **WATCH** |
| Phase-1 | Image-gen local wire: none (`deferred`) |

When code+LICENSE+weights land: verify SPDX, Apple Silicon / CUDA VRAM, NSFW/operator-owned reference-audio posture vs Fish-Speech Layer-1.

## Snippets

_(none)_
