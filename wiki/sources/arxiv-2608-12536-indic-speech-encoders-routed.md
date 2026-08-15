---
title: "Indic speech encoders — OOD synthetic-speech generalisation (arXiv:2608.12536) — routed cybersec"
type: source
tags: [paper, routed, speech, deepfake, tts, sdd, cross-wiki]
keywords: [Indic, AST, Wav2vec2, Whisper, BEATs, ASVspoof, OOD-TTS]
related:
  - concepts/generative-ai-era-deepfake-landscape.md
  - concepts/persona-audio-stack.md
  - sources/arxiv-2608-05507-affectdf-routed.md
  - sweeps/2026-08-15-daily.md
maturity: draft
read_status: read
created: 2026-08-15
updated: 2026-08-15
---

## Relations

Primary: cybersecurity wiki brief `briefs/2026-08-15_indic-sdd-ood-tts-from-image-gen.md`. Dedup stub for image-gen digest.
@concepts/generative-ai-era-deepfake-landscape.md @concepts/persona-audio-stack.md @sources/arxiv-2608-05507-affectdf-routed.md @sweeps/2026-08-15-daily.md

## Raw Concept

- **Title**: Evaluating Pre-trained Speech Encoders for Spontaneous Speech Detection and Out of Domain Synthetic Speech Generalisation in Indic Languages
- **Type**: arXiv:2608.12536
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.12536-evaluating-pre-trained-speech-encoders-for-spont.pdf`
- **URL**: https://arxiv.org/abs/2608.12536
- **Code**: none in PDF → no SPDX check
- **Retrieved**: 2026-08-15

## Narrative

**Routed stub.** Five frozen transformer speech encoders (AST, Vaani-FastConformer, Wav2vec2, Whisper, BEATs) across 22 Indic languages; plus a four-TTS OOD generalisation experiment. Centroid analysis: OOD deepfake detection is predicted by proximity to *unseen TTS embeddings*, not distance from natural speech — training-data selection implication for SDD.

**Image-gen touchpoint:** persona TTS (Fish-Speech / CosyVoice / F5) can sit OOD vs English ASVspoof-trained detectors — same lesson as AffectDF (emotion) but language-axis.

**Phase-0: SKIP gen / ROUTE cybersec REFERENCE.** No code. Not atto/poker/guru/prod.

## Snippets

_(none)_
