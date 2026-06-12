---
title: Waveform-native flow-matching TTS
type: concept
tags: [concept, tts, voice-cloning, flow-matching, waveform-native]
keywords: [waveform-native TTS, direct text-to-wave, flow matching, no vocoder inference, REPA, VAPA, zero-shot cloning, training-only auxiliary]
related:
  - sources/arxiv-2606-09048-barewave-waveform-native-tts.md
  - entities/voice-models/barewave.md
  - entities/voice-models/f5-tts.md
  - entities/voice-models/cosyvoice2.md
  - concepts/persona-audio-stack.md
maturity: draft
created: 2026-06-11
updated: 2026-06-11
---

## Relations

@sources/arxiv-2606-09048-barewave-waveform-native-tts.md @entities/voice-models/barewave.md @entities/voice-models/f5-tts.md @concepts/persona-audio-stack.md

## Raw Concept

Ingest 2026-06-11 from BareWave (arXiv:2606.09048) — the TTS analogue of "pixel-native" image generation: skip latent/codec interfaces at **inference**, keep training-time priors only.

## Narrative

**Waveform-native TTS** generates audio samples directly in raw wave space from text (+ optional reference clip), without invoking a separately trained vocoder or neural codec decoder at test time. The generative backbone (typically a DiT over waveform patches) is trained with flow matching; missing structure in raw wave space is injected via **training-only** branches:

| Training support | Purpose | At inference |
|----------------|---------|--------------|
| SSL representation alignment (REPA-style) | Speech prior without mel/codec scaffold | Discarded |
| Staged noise-level schedule | Early convergence → late detail refinement | N/A |
| Velocity-aware perceptual loss (VAPA) | Spectral quality aligned to flow velocity scaling | N/A |

### vs latent/codec zero-shot TTS

Dominant 2025–2026 open stacks (CosyVoice, Fish-Speech, F5-TTS) still route through discrete codec tokens or mel + vocoder at inference. Waveform-native path trades **deployment simplicity** (one model, one ODE solve) for **harder optimization** — BareWave is the first open recipe claiming strong zero-shot cloning under this constraint `[TENTATIVE]`.

### Persona stack implication

If weights land with permissive license, waveform-native TTS removes vocoder failure modes (phase artifacts, codec band-limiting) from persona voice pipelines (@concepts/persona-audio-stack.md). Latency profile depends on ODE step count — not yet benchmarked against streaming CosyVoice2.

## Snippets

> "The inference path is kept unchanged, while the extra support is introduced only during training through representation alignment, staged noise scheduling, and velocity-aware perceptual alignment."

## Dead Ends

BareWave checkpoints not yet public (2026-06-11). E3-TTS / Wave-Tacotron lineage showed waveform routes work but needed heavy structural support — BareWave's training recipe may not transfer without full reproduction.
