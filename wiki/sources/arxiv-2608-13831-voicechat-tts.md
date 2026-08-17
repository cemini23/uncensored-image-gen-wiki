---
title: "VoiceChat-TTS: low-latency continuous speech synthesis (arXiv:2608.13831)"
type: source
tags: [paper, tts, voice, streaming, nvidia, watch]
keywords: [VoiceChat-TTS, NVIDIA, streaming TTS, barge-in, control tokens, KV cache, duplex]
related:
  - entities/voice-models/voicechat-tts.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/nemotron-audex.md
  - concepts/waveform-native-flow-matching-tts.md
  - sweeps/2026-08-17-daily.md
maturity: draft
read_status: read
created: 2026-08-17
updated: 2026-08-17
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/voice-models/voicechat-tts.md @concepts/persona-audio-stack.md @entities/voice-models/nemotron-audex.md @concepts/waveform-native-flow-matching-tts.md @sweeps/2026-08-17-daily.md

## Raw Concept

- **Title**: VoiceChat-TTS: A Low-Latency Continuous Speech Synthesis Model for Interactive Agents
- **Authors**: Edresson Casanova, Jaehyeon Kim, et al. (NVIDIA Corporation)
- **Type**: arXiv:2608.13831 [cs.SD]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.13831-voicechat-tts-a-low-latency-continuous-speech-sy.pdf`
- **URL**: https://arxiv.org/abs/2608.13831
- **Retrieved**: 2026-08-17
- **Code**: `NVIDIA-NeMo/Speech` Apache-2.0; GitHub size ≈ 518 MB (over 500 MB local-adopt cap). Weights: `nvidia/NVIDIA-NemotronLabs-VoiceChat-11B` (11B duplex sibling; OpenMDW / research-only reported). Distinguish the modular VoiceChat-TTS paper from the 11B full-duplex S2S stack.

## Narrative

NVIDIA streaming TTS driven directly by an LLM text-token stream. The model stays always-on: it synthesizes as tokens arrive, emits silence when the text stream is empty, and handles mid-utterance barge-in via explicit control tokens **without resetting the KV cache**. That last point is the persona-audio hook — CosyVoice2 / Qwen3-TTS already do incremental TTFA, but they are still single-response streamers. VoiceChat-TTS is built for duplex agents that must keep the decoder hot across conversational time.

The paper is modular on purpose. End-to-end duplex S2S models jointly optimize ASR, interruption, and synthesis and often lose speech quality; VoiceChat-TTS keeps TTS as a separate streamable decoder so quality and barge-in can be debugged independently. Related NVIDIA family: Nemotron Audex is a unified audio-text LLM (TTS/ASR/TTA/S2S MoE); VoiceChat-TTS is the streaming-TTS / barge-in slice, with a separate 11B duplex S2S sibling on HF.

**Phase-0: WATCH.** Persona-relevant (streaming + barge-in for live DM / talk-track). `NVIDIA-NeMo/Speech` is Apache-2.0 but **529913 KB ≈ 518 MB** — over the 500 MB clone cap. Weights are 11B and reported OpenMDW / research-only. No Image-gen Phase-1 local wire. `wire_status: deferred`.

## Snippets

> "VoiceChat-TTS is driven directly by LLM text-token streams, supports explicit interruption via control tokens, and produces silence when no textual input is available. The model enables always-on, responsive speech generation while preserving modularity and high speech quality, and it supports mid-utterance interruptions without resetting the KV cache."

[Source: arxiv-2608.13831, abstract]
