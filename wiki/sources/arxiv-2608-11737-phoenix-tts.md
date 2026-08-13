---
title: "Phoenix TTS: flow-matching-driven speech tokenization (arXiv:2608.11737)"
type: source
tags: [paper, tts, voice, flow-matching, tokenizer, watch]
keywords: [Phoenix TTS, Didi, L-Lab, flow-matching, speech-tokenization, zero-shot-TTS, voice-conversion]
related:
  - entities/voice-models/phoenix-tts.md
  - concepts/persona-audio-stack.md
  - concepts/waveform-native-flow-matching-tts.md
  - sweeps/2026-08-13-daily.md
maturity: draft
read_status: read
created: 2026-08-13
updated: 2026-08-13
---

## Relations

@entities/voice-models/phoenix-tts.md @concepts/persona-audio-stack.md @concepts/waveform-native-flow-matching-tts.md @sweeps/2026-08-13-daily.md

## Raw Concept

- **Title**: Phoenix TTS: High-Fidelity Synthesis and Voice Conversion via Flow-Matching-Driven Speech Tokenization
- **Authors**: L-Lab Phoenix-Audio Team (Didichuxing Co. Ltd)
- **Type**: arXiv:2608.11737 [cs.SD]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.11737-phoenix-tts-high-fidelity-synthesis-and-voice-co.pdf`
- **URL**: https://arxiv.org/abs/2608.11737
- **Retrieved**: 2026-08-13
- **Code**: none found (GH search negative; paper-only preprint)

## Narrative

Jointly optimizes the speech tokenizer with a Flow Matching training loss so discrete tokens preserve semantic richness AND natively align with the acoustic model's continuous space. Trained on 110K hours; reports WER below ground-truth recordings and zero-shot speaker similarity rivaling/outperforming large baselines; tokenizer adapts to zero-shot VC without fine-tuning.

**Phase-0: WATCH.** Persona-relevant (zero-shot clone + VC from one tokenizer, content-fidelity angle similar to SemBridge). No public repo/weights → no SPDX check possible; paper-only. Compare against Fish-Speech / CosyVoice2 / F5-TTS tokenizer stack when code lands. Phase-1: `deferred`.

## Snippets

> "ASR-based tokenizers discard acoustic details to focus on linguistic content... our speech tokenizer is optimized to reconstruct self-supervised features to maintain semantic richness, while simultaneously receiving direct supervision from a Flow Matching training loss."

_[Source: arxiv-2608.11737, abstract]_
