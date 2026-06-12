---
title: BareWave (Tongyi — waveform-native TTS)
type: entity
tags: [voice-cloning, tts, flow-matching, waveform-native, alibaba, tongyi, zero-shot]
keywords: [BareWave, Tongyi Fun, Alibaba, waveform-native, flow matching, zero-shot voice cloning, no vocoder, REPA, VAPA]
related:
  - sources/arxiv-2606-09048-barewave-waveform-native-tts.md
  - concepts/waveform-native-flow-matching-tts.md
  - entities/voice-models/f5-tts.md
  - entities/voice-models/cosyvoice2.md
  - entities/voice-models/qwen3-tts.md
  - concepts/persona-audio-stack.md
maturity: draft
created: 2026-06-11
updated: 2026-06-11
---

## Relations

@sources/arxiv-2606-09048-barewave-waveform-native-tts.md @concepts/waveform-native-flow-matching-tts.md @entities/voice-models/f5-tts.md @entities/voice-models/cosyvoice2.md @concepts/persona-audio-stack.md

## Raw Concept

Entity stub from 2026-06-11 ingest — BareWave (arXiv:2606.09048), Tongyi Fun Team / USTC. Project: https://barewave.github.io/

## Narrative

**BareWave** — Alibaba Tongyi lineage **waveform-native** zero-shot TTS. Single DiT generator over waveform patches; flow matching with training-only SSL alignment + VAPA perceptual refinement. **No vocoder or codec at inference.**

| Axis | BareWave | CosyVoice2 | F5-TTS |
|------|----------|------------|--------|
| Inference path | Text + ref wave → raw wave | Codec tokens + flow | Mel/latent + vocoder-style decode |
| Open weights | Promised, not yet released | Yes (Apache 2.0) | Yes (likely CC-BY-NC) |
| Streaming | Not emphasized | 150 ms chunk streaming | Non-AR parallel decode |
| Persona fit | Pending license + release | Primary build-track TTS | English benchmark / research |

### Phase-0 posture

**Watchlist** until code + checkpoints drop. Validate: (1) license for monetized persona use, (2) reference-audio length requirement, (3) Apple Silicon / MPS path, (4) NSFW content policy (operator-controlled vs platform). If Apache/MIT-class, becomes candidate to simplify @concepts/persona-audio-stack.md Layer 1 (drop separate vocoder stage).

## Snippets

(See @sources/arxiv-2606-09048-barewave-waveform-native-tts.md)

## Dead Ends

Cannot adopt pre-release — no Hugging Face / GitHub repo verified 2026-06-11.
