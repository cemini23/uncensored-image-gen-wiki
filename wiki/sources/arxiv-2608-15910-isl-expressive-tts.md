---
title: "Iterative Self-Learning for expressive TTS (arXiv:2608.15910)"
type: source
tags: [paper, tts, voice, expressive, semi-supervised, watch]
keywords: [ISL, Invert-Classify, prominence, emotion, pseudo-label, flow matching, low-resource TTS]
related:
  - concepts/iterative-self-learning-expressive-tts.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/phoenix-tts.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-18-daily.md
maturity: draft
read_status: read
created: 2026-08-18
updated: 2026-08-18
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/iterative-self-learning-expressive-tts.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @entities/voice-models/phoenix-tts.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-18-daily.md

## Raw Concept

- **Title**: Iterative Self-Learning for Expressive Text-to-Speech Synthesis
- **Authors**: Nicholas Sanders, Gustav Eje Henter, Simon King, Korin Richmond (Edinburgh / KTH; UKRI CDT + Huawei + WASP)
- **Type**: arXiv:2608.15910 [cs.SD]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.15910-iterative-self-learning-for-expressive-text-to-s.pdf`
- **URL**: https://arxiv.org/abs/2608.15910
- **Retrieved**: 2026-08-18
- **Code**: none in PDF. GitHub search negative at ingest. No SPDX.

## Narrative

Edinburgh/KTH semi-supervised recipe for **explicit** expressive TTS labels (word-level prominence, utterance-level emotion) when those labels are scarce. Implicit control (reference clips, style embeddings, natural-language prompts) is popular after large-scale pretraining, but it is hard to predict and poorly disentangled from speaker and content. Explicit labels are interpretable — they just need annotation. Prior semi-supervised TTS work targeted missing transcripts or unpaired speech-text, not missing *expressivity* labels.

**Invert-Classify** recovers discrete labels by inverting a frozen generative model (classifier-free). **ISL** then loops: pseudo-label unlabeled speech with the current model, retrain on labeled + pseudo-labeled data, repeat. Iterative refinement beats single-pass pseudo-labeling; in the most data-scarce splits, ISL approaches fully-supervised label adherence and listening-test quality. Backbone is flow-matching TTS.

Persona hook: Fish-Speech / IndexTTS-2 emotion tags assume someone already labeled the training set. ISL is a way to bootstrap those tags from a small seed. Not a replacement for Layer-1 voice clone — a labeling / control-surface technique.

**Phase-0: WATCH.** On-domain (expressive TTS). No GitHub. No Image-gen Phase-1 local wire. `wire_status: deferred`.

## Snippets

> "In the most data-scarce conditions, ISL-trained models outperform single-pass pseudo-labeling and further approach fully supervised performance, demonstrating that gradient-based ISL is an effective solution to expressive label scarcity in low-resource TTS."

[Source: arxiv-2608.15910, abstract]
