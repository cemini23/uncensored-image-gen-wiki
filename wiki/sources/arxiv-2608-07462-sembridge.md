---
title: "SemBridge semantic-token anchoring for continuous-latent TTS (arXiv:2608.07462)"
type: source
tags: [paper, tts, voice, continuous-latent, autoregressive]
keywords: [SemBridge, semantic-token, continuous-latent, zero-shot-TTS, SVS, ASLP]
related:
  - entities/voice-models/sembridge.md
  - concepts/persona-audio-stack.md
  - concepts/waveform-native-flow-matching-tts.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - sweeps/2026-08-10-daily.md
maturity: draft
read_status: read
created: 2026-08-10
updated: 2026-08-10
---

## Relations

@entities/voice-models/sembridge.md @concepts/persona-audio-stack.md @concepts/waveform-native-flow-matching-tts.md @entities/persona-ops/fish-speech.md @sweeps/2026-08-10-daily.md

## Raw Concept

- **Title**: SemBridge: Semantic Token Anchoring for Continuous-Latent Autoregressive Speech Generation
- **Type**: arXiv:2608.07462
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.07462-sembridge-semantic-token-anchoring-for-continuou.pdf`
- **URL**: https://arxiv.org/abs/2608.07462
- **Demo**: https://tiamojames.github.io/SemBridge_Demo/
- **Code**: https://github.com/ASLP-lab/SemBridge (skeleton: readme + asset; **LICENSE file 404** despite Apache-2.0 badge)
- **Retrieved**: 2026-08-10

## Narrative

Training-only discrete semantic-token supervision of AR LM states + Semantic-Aligned Acoustic VAE for continuous latents; inference stays fully continuous. Claims better WER/CER on zero-shot TTS and score-conditioned SVS while holding speaker similarity / perceptual quality.

**Phase-0: WATCH.** Persona-relevant (content fidelity for voice clone / singing). Repo is **pre-code** (160 KB, no training/inference tree); SPDX mismatch (badge vs missing LICENSE). Weights TBA. Re-check when code+LICENSE land. Phase-1: `deferred` — no Image-gen local wire; no clone of empty skeleton as "adoption."

## Snippets

_(none)_
