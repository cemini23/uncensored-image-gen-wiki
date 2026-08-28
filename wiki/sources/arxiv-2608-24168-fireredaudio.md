---
title: "FireRedAudio general-purpose audio LM (arXiv:2608.24168)"
type: source
tags: [paper, audio, voice, speech-understanding, apache-2-0, watch]
keywords: [FireRedAudio, Xiaohongshu, unified audio LM, speech synthesis, speech editing]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/fireredaudio.md
  - sources/arxiv-2608-17492-fireredtts3.md
  - entities/voice-models/fireredtts3.md
  - entities/persona-ops/fish-speech.md
  - sweeps/2026-08-28-daily.md
maturity: draft
read_status: read
created: 2026-08-28
updated: 2026-08-28
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/voice-models/fireredaudio.md @entities/voice-models/fireredtts3.md @sources/arxiv-2608-17492-fireredtts3.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-28-daily.md

## Raw Concept

- **Title**: FireRedAudio: A General-Purpose Audio Language Model with Decoupled Continuous Representations for Understanding and Generation
- **Authors**: Junjie Li, Xuelong Geng, et al. (Xiaohongshu)
- **Type**: arXiv:2608.24168 [cs.SD]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.24168-fireredaudio-a-general-purpose-audio-language-mo.pdf`
- **URL**: https://arxiv.org/abs/2608.24168
- **Retrieved**: 2026-08-28
- **Code**: `FireRedTeam/FireRedAudio` **Apache-2.0 CONFIRMED**. Cloned `.local/adopts/FireRedAudio` (~8.7 MB). HF weights **not fetched**.

## Narrative

Unified **9B** audio-language model: decoupled continuous representations for understanding vs generation on a shared LLM backbone. Sibling stack to FireRedTTS3 — broader audio LM (recognition + synthesis + editing) vs TTS-only.

**WATCH HIGH / GO code.** Fish-Speech stays Layer-1 for NSFW persona clone. Image-gen Phase-1: none (`deferred`).

## Snippets

> "We introduce FireRedAudio, a general-purpose audio language model with a shared 9B-parameter LLM."

[Source: arxiv-2608.24168, abstract]
