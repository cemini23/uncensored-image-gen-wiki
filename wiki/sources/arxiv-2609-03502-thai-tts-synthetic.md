---
title: "Fixed-voice Thai TTS from synthetic speech (arXiv:2609.03502)"
type: source
tags: [paper, tts, thai, data, watch]
keywords: [Thai TTS, synthetic speech, knowledge distillation, fixed voice]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - entities/voice-models/fastthaig2p.md
  - concepts/persona-audio-stack.md
maturity: draft
read_status: skimmed
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @entities/voice-models/fastthaig2p.md @concepts/persona-audio-stack.md

## Raw Concept

- **Title**: Building and Evaluating Fixed-Voice Thai TTS from Synthetic Speech
- **Type**: arXiv:2609.03502 [cs.CL]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.03502
- **Code**: github.com/wayu-research/thai-tts-eval
- **Retrieved**: 2026-09-11

## Narrative

The paper turns a short voice reference (about 15 seconds) into a compact fixed-voice Thai TTS student. A large zero-shot voice-cloning teacher (OmniVoice) generates synthetic speech, a quality filter and rejection sampling select the data, and an 82M-parameter Kokoro student trains on the result. The authors release Wayu-Paxa-TTS-Edge and a Thai TTS evaluation framework that separates CER, keyword accuracy, pause placement, speaker similarity, and speaking rate. The route needs no speaker-specific corpus, but teacher errors become training targets. FastThaiG2P use not stated. Image-gen Phase-1: none.

## Snippets

> We study a third route: using a large voice-cloning model as a programmable data source to turn a short voice reference (e.g., 15 seconds) into a compact fixed-voice student trained entirely on synthetic speech. [Source: arxiv-2609.03502]
