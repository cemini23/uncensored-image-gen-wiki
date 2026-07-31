---
title: "Face-to-Speech via StyleTTS 2 latent adaptation (arXiv:2607.26742)"
type: source
tags: [paper, tts, face-to-speech, styletts2, zero-shot]
keywords: [F2S, Face-Adapter, StyleTTS2, LRS3, cross-lingual]
related:
  - concepts/face-to-speech-synthesis.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/kokoro.md
  - sweeps/2026-07-31-daily.md
maturity: draft
read_status: read
created: 2026-07-31
updated: 2026-07-31
---

## Relations

@concepts/face-to-speech-synthesis.md @concepts/persona-audio-stack.md @sweeps/2026-07-31-daily.md

## Raw Concept

- **Title**: Zero-Shot Face-to-Speech Synthesis via Latent Space Adaptation of a Style-Diffusion TTS Model
- **Authors**: Carlos Muñoz-Romero, Jose A. Gonzalez-Lopez
- **Type**: arXiv:2607.26742
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.26742-zero-shot-face-to-speech-synthesis-via-latent-sp.pdf`
- **URL**: https://arxiv.org/abs/2607.26742
- **Code**: none public at ingest (InsightFace cited as face encoder)
- **Retrieved**: 2026-07-31

## Narrative

Lightweight Face Adapter + soft-tune of face-encoder upper blocks maps face-recognition features into frozen StyleTTS 2 style space. LRS3 held-out: UTMOS 3.7–4.0; face→voice retrieval above chance; English adapter transfers to Spanish without retraining.

**Phase-0: WATCH** — no installable repo. Interesting for still-only persona voice bootstrap; production remains Fish-Speech with operator-owned audio refs. Right-of-publicity risk if face≠owned likeness.

## Snippets

_(none)_
