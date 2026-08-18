---
title: Phoenix TTS — flow-matching-driven speech tokenization (Didi)
type: entity
tags: [voice-cloning, tts, flow-matching, tokenizer, watch]
keywords: [Phoenix TTS, Didi, L-Lab, flow-matching, speech-tokenization, zero-shot-TTS, voice-conversion]
related:
  - sources/arxiv-2608-11737-phoenix-tts.md
  - concepts/iterative-self-learning-expressive-tts.md
  - concepts/persona-audio-stack.md
  - concepts/waveform-native-flow-matching-tts.md
  - entities/persona-ops/fish-speech.md
  - entities/sfx-models/voxaudio.md
  - sources/arxiv-2608-15910-isl-expressive-tts.md
maturity: draft
created: 2026-08-13
updated: 2026-08-18
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-11737-phoenix-tts.md @concepts/persona-audio-stack.md @concepts/waveform-native-flow-matching-tts.md @entities/persona-ops/fish-speech.md @concepts/iterative-self-learning-expressive-tts.md @sources/arxiv-2608-15910-isl-expressive-tts.md

## Raw Concept

Phase-0 from arXiv:2608.11737. Joint tokenizer + Flow Matching training so discrete speech tokens preserve semantics AND natively align with the acoustic model's continuous space — zero-shot TTS + voice conversion from one tokenizer.

## Narrative

| Field | Value |
|-------|-------|
| Org | Didichuxing (Didi) — L-Lab Phoenix-Audio Team |
| Method | Tokenizer supervised by SSL-feature reconstruction + direct Flow Matching loss; joint with acoustic model |
| Tasks | Zero-shot TTS + zero-shot VC (no task-specific fine-tuning) |
| Data | 110K hours |
| Results | WER below ground-truth; speaker similarity rivals/beats large baselines |
| Code | none found (paper-only preprint) |
| Phase-0 | **WATCH** |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Watch list: repo/weights release, VRAM + Apple-Silicon MPS viability, and how tokenizer compares to Fish-Speech / CosyVoice2 / F5-TTS tokenizers on persona-voice content fidelity. VC-without-fine-tuning is the distinctive angle vs SemBridge.

## Snippets

_(none)_
