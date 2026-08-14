---
title: "FastThaiG2P: lightning-fast Thai G2P for voice-agent pipelines (arXiv:2608.12814)"
type: source
tags: [paper, tts, g2p, thai, voice, watch]
keywords: [FastThaiG2P, Thai, grapheme-to-phoneme, G2P, Kokoro-TTS, StyleTTS, PyThaiNLP, AWS, voice-agent]
related:
  - entities/voice-models/fastthaig2p.md
  - entities/voice-models/kokoro.md
  - concepts/persona-audio-stack.md
  - sweeps/2026-08-14-daily.md
maturity: draft
read_status: read
created: 2026-08-14
updated: 2026-08-14
---

## Relations

@entities/voice-models/fastthaig2p.md @entities/voice-models/kokoro.md @concepts/persona-audio-stack.md @sweeps/2026-08-14-daily.md

## Raw Concept

- **Title**: FastThaiG2P: Lightning-fast Thai Grapheme-to-phoneme Conversion for Voice Agent Pipelines
- **Authors**: Charin Polpanumas (AWS)
- **Type**: arXiv:2608.12814 [cs.CL]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.12814-fastthaig2p-lightning-fast-thai-grapheme-to-phon.pdf`
- **URL**: https://arxiv.org/abs/2608.12814
- **Retrieved**: 2026-08-14
- **Code**: `github.com/awslabs/FastThaiG2P` — **Apache-2.0** ✅, ~13 MB, pushed 2026-08-14

## Narrative

Sub-millisecond Thai grapheme-to-phoneme (G2P) for TTS pipelines — outputs **IPA and Kokoro-TTS conventions**. PyThaiNLP-tokenized, extensible dictionary + normalization rules for Central Thai. 0.15 ms avg latency/utterance on 27,242-utterance benchmark (30% tokenization, 12% normalization, 58% OOV fallback; 0.5% OOV rate). Demo: phonemized Som-TTS (20 h grapheme+audio pairs) → trained 82M-param **StyleTTS 2** on a Kokoro-TTS recipe → intelligible Thai at 0.25 RTF (4× real-time) with ONNX on CPU.

**Phase-0: CONDITIONAL** (Thai-persona-gated) — code Apache-2.0 + small (13 MB) → eligible for local adopt, but **no local clone** per `LESSONS.md` (operator doesn't run gen stack locally); install path documented in adoption brief. G2P quality is the Thai TTS bottleneck (word boundaries, 5 tones, discontinuous vowels, code-switching); this is the missing phonemizer step for a Kokoro/StyleTTS Thai persona voice. Phase-1: Image-gen local wire `deferred`.

## Snippets

> "FastThaiG2P provides sub-millisecond Thai grapheme-to-phoneme conversion for text-to-speech pipelines (International Phonetic Alphabet and Kokoro-TTS conventions)."

_[Source: arxiv-2608.12814, abstract]_
