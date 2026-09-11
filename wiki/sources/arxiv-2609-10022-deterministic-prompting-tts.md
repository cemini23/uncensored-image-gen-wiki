---
title: "Deterministic prompting for speaker-stable low-resource TTS (arXiv:2609.10022)"
type: source
tags: [paper, tts, voice, low-resource, watch]
keywords: [low-resource tts, greek, deterministic prompting, lora]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/deterministic-prompting-tts.md
maturity: draft
read_status: read
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @concepts/persona-audio-stack.md @entities/voice-models/deterministic-prompting-tts.md

## Raw Concept

- **Title**: Deterministic Prompting for Speaker-Stable Low-Resource Greek TTS
- **Type**: arXiv:2609.10022 [cs.SD]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.10022
- **Code**: none found
- **Retrieved**: 2026-09-11

## Narrative

This paper adapts Parler-TTS (880M) to Modern Greek with limited clean speech data. A curation recipe turns audiobook and community recordings into TTS-ready clips with WhisperX alignment and filtering. A two-stage recipe follows: full fine-tuning, then a speaker-specific LoRA stage on 3.5 h of single-speaker data that updates about 5% of parameters. The work reports that LLM-generated style prompts cause speaker drift, and that deterministic human-designed prompts remove this instability. This is useful for this wiki as a low-resource voice-cloning and prompting lesson. Image-gen Phase-1: none.

## Snippets

> Replacing stochastic LLM prompts with deterministic, human-designed style prompts resolves this instability. [Source: arxiv-2609.10022]
