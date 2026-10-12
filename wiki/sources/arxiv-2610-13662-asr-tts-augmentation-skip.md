---
title: ""ASR improvement via TTS and voice-conversion augmentation (arXiv:2610.13662) — SKIP""
type: source
tags: [paper, asr, data-augmentation, out-of-domain, skip]
keywords: [ASR augmentation, voice conversion, kNN-VC, Seed-VC, vec2wav2, Azure TTS, Conformer, Zipformer, icefall, WER, NISQA, Turkish]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-12-daily.md
  - concepts/asr-roundtrip-tts-eval-limits.md
maturity: draft
read_status: skimmed
created: 2026-10-12
updated: 2026-10-12
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-12-daily.md @concepts/asr-roundtrip-tts-eval-limits.md

## Raw Concept

- **Title**: Enhancing Speech Recognition through Text-to-Speech and Voice Conversion Augmentation
- **Type**: arXiv:2610.13662 (Sestek, Istanbul; Yunus Emre Ozkose, Ali Haznedaroglu)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.13662-enhancing-speech-recognition-through-text-to-spe.pdf (archived 2026-10-12)
- **URL**: https://arxiv.org/abs/2610.13662
- **Retrieved**: 2026-10-12

## Narrative

**"Uses TTS" is not "is about TTS."** The subject is ASR word-error rate; TTS and voice conversion appear only as augmentation tools feeding an ASR trainer.

**What it does.** Compares real audio against synthetic audio from Azure-TTS and three voice-conversion models (kNN-VC, Seed-VC, vec2wav2) cloning 1,281 LibriSpeech speakers, for Turkish call-centre and banking speech. Voice-conversion augmentation beats plain TTS, and beats both when mixed with real data. Gains shrink as real data grows: roughly 19-21% relative at 10 hours, only 1-3% at 50 hours. Multiple VC passes hurt.

**Why SKIP.** The deliverable is an ASR accuracy delta, and **nothing ships** — no code, no weights, the corpus is proprietary. Its only marginal value is one line of corroboration for `@concepts/asr-roundtrip-tts-eval-limits.md`: NISQA shows voice-conversion distributions track real audio far better than TTS does. That is a reinforcement, not an ingest. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.13662 (retrieved 2026-10-12)]
