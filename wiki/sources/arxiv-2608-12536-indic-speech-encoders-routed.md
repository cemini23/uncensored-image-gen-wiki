---
title: "Indic speech encoders — OOD synthetic-speech generalisation (arXiv:2608.12536) — routed cybersec"
type: source
tags: [paper, routed, speech, deepfake, tts, sdd, cross-wiki]
keywords: [Indic, AST, Wav2vec2, Whisper, BEATs, ASVspoof, OOD-TTS]
related:
  - concepts/generative-ai-era-deepfake-landscape.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/f5-tts.md
  - entities/voice-models/xtts-v2.md
  - sources/arxiv-2608-05507-affectdf-routed.md
  - sweeps/2026-08-15-daily.md
maturity: draft
read_status: read
created: 2026-08-15
updated: 2026-08-15
---

## Relations

Primary: cybersecurity wiki brief `briefs/2026-08-15_indic-sdd-ood-tts-from-image-gen.md`. Dedup stub for image-gen digest.
@concepts/generative-ai-era-deepfake-landscape.md @concepts/persona-audio-stack.md @sources/arxiv-2608-05507-affectdf-routed.md @sweeps/2026-08-15-daily.md @entities/voice-models/f5-tts.md @entities/voice-models/xtts-v2.md

## Raw Concept

- **Title**: Evaluating Pre-trained Speech Encoders for Spontaneous Speech Detection and Out of Domain Synthetic Speech Generalisation in Indic Languages
- **Authors**: Rai et al. (IIT Guwahati / ARTPARK)
- **Type**: arXiv:2608.12536
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.12536-evaluating-pre-trained-speech-encoders-for-spont.pdf`
- **URL**: https://arxiv.org/abs/2608.12536
- **Code**: none in PDF → no SPDX check
- **Retrieved**: 2026-08-15

## Narrative

**Routed stub.** Frozen-encoder SDD + spontaneity detection across **22 scheduled Indic languages** (IndicVoices), plus a four-TTS OOD experiment. Encoders: AST, Vaani-FastConformer, Wav2vec2, Whisper, BEATs. In-pool TTS: Indic F5, Indic VITS, OmniVoice, Meta M4. Held-out OOD: freevc24 + **XTTS-v2** (IndicSynth). Classifier is a tiny DNN on frozen embeddings (not a full AASIST/RawNet2 retrain).

Centroid analysis: OOD deepfake recall is predicted by a training TTS’s **proximity to unseen TTS embeddings**, not distance from natural speech. Expanding the training pool from one to four Indic TTS systems lifts OOD synthetic recall **7% → 51%** `[TENTATIVE, single source]`. Prior AASIST/RawNet2 on IndicSynth was near-chance / EER >50% vs sub-1% on ASVspoof 2019.

**Image-gen touchpoint:** persona TTS (Fish-Speech / CosyVoice / F5 / XTTS lineage) can sit OOD vs English ASVspoof-trained detectors — language axis, sibling to AffectDF’s emotion axis (@sources/arxiv-2608-05507-affectdf-routed.md).

**Phase-0: SKIP gen / ROUTE cybersec REFERENCE.** No code in PDF. Not atto/poker/guru/prod.

## Snippets

> "Centroid analysis shows that out-of-domain generalisation is predicted by a training system’s proximity to unseen TTS embeddings, not its distance from natural speech, a finding with direct implications for training data selection in real-world deepfake detectors."

[Source: https://arxiv.org/abs/2608.12536 (retrieved 2026-08-15)]
