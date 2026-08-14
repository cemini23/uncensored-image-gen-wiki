---
title: FastThaiG2P — Thai grapheme-to-phoneme for TTS pipelines (AWS)
type: entity
tags: [tts, g2p, thai, voice, aws, conditional]
keywords: [FastThaiG2P, Thai G2P, grapheme-to-phoneme, Kokoro-TTS, StyleTTS, PyThaiNLP, phonemizer, voice-agent]
related:
  - sources/arxiv-2608-12814-fastthaig2p.md
  - entities/voice-models/kokoro.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - sweeps/2026-08-14-daily.md
maturity: draft
created: 2026-08-14
updated: 2026-08-14
wire_status: deferred
phase0_verdict: CONDITIONAL
---

## Relations

@sources/arxiv-2608-12814-fastthaig2p.md @entities/voice-models/kokoro.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md

## Raw Concept

Phase-0 from arXiv:2608.12814. AWS G2P phonemizer solving the Thai TTS bottleneck (word boundaries, 5 tones, discontinuous vowels, code-switching) — outputs IPA + Kokoro-TTS conventions.

## Narrative

| Field | Value |
|-------|-------|
| Org | AWS (Charin Polpanumas) |
| Method | PyThaiNLP-tokenized dictionary + normalization rules; extensible; OOV fallback |
| Output | IPA + Kokoro-TTS phoneme conventions |
| Latency | 0.15 ms/utterance (27,242-utterance bench; 0.5% OOV) |
| Demo | Som-TTS (20 h) phonemized → 82M StyleTTS 2 on Kokoro recipe → 0.25 RTF ONNX CPU |
| Code | `awslabs/FastThaiG2P` — **Apache-2.0** ✅, ~13 MB |
| Phase-0 | **CONDITIONAL** (Thai-persona-gated) |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Enable condition: a Thai persona voice (Kokoro / StyleTTS 2). Code is Apache-2.0 + small → eligible for local adopt, but per `LESSONS.md` the operator doesn't run the gen stack locally, so no clone this session — install path lives in the adoption brief. Compare against other G2P/phonemizer stages in the Kokoro pipeline when a Thai persona starts.

## Snippets

_(none)_
