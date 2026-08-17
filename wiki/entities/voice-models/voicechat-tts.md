---
title: VoiceChat-TTS — NVIDIA streamable TTS from LLM token streams
type: entity
tags: [voice-cloning, tts, streaming, nvidia, barge-in, watch]
keywords: [VoiceChat-TTS, NVIDIA, barge-in, control tokens, KV cache, NeMo, OpenMDW]
related:
  - sources/arxiv-2608-13831-voicechat-tts.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/nemotron-audex.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/chatterbox.md
  - concepts/waveform-native-flow-matching-tts.md
maturity: draft
created: 2026-08-17
updated: 2026-08-17
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-13831-voicechat-tts.md @concepts/persona-audio-stack.md @entities/voice-models/nemotron-audex.md @entities/persona-ops/fish-speech.md @entities/voice-models/chatterbox.md @concepts/waveform-native-flow-matching-tts.md

## Raw Concept

Phase-0 from arXiv:2608.13831. Modular streaming TTS that consumes an LLM token stream, barges in via control tokens without a KV-cache reset, and emits silence when the text stream is empty.

## Narrative

| Field | Value |
|-------|-------|
| Org | NVIDIA |
| Method | Streamable TTS driven by LLM text tokens; explicit barge-in control tokens; no KV-cache reset on interrupt |
| Tasks | Always-on interactive-agent speech; mid-utterance interruption |
| Distinct vs Audex | Audex = unified audio-text MoE (TTS/ASR/TTA/S2S). VoiceChat-TTS = modular streaming TTS. 11B HF sibling is the full-duplex S2S stack — do not conflate. |
| Distinct vs Fish-Speech | Fish = batch / DM-note quality + emotion tags. VoiceChat = live duplex / barge-in. |
| Code | `NVIDIA-NeMo/Speech` Apache-2.0, **≈ 518 MB** (over 500 MB clone cap) |
| Weights | `nvidia/NVIDIA-NemotronLabs-VoiceChat-11B` — OpenMDW / research-only reported [TENTATIVE] |
| Phase-0 | **WATCH** |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Watch list: a standalone VoiceChat-TTS checkpoint under 500 MB; commercial license on weights; Apple Silicon / consumer VRAM; whether barge-in tokens can be driven from a local LLM without the 11B duplex sibling.

## Snippets

> "The model enables always-on, responsive speech generation while preserving modularity and high speech quality, and it supports mid-utterance interruptions without resetting the KV cache."

[Source: arxiv-2608.13831, abstract]
