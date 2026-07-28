---
title: "Singlish Can or Not? — accent fine-tune of Chatterbox + CosyVoice 3 (arXiv:2607.23027)"
type: source
tags: [paper, tts, accent, singlish, chatterbox, cosyvoice, peripheral]
keywords: [Singlish, Singapore-English, accent-adaptation, zero-shot-TTS, IMDA-NSC]
related:
  - entities/voice-models/chatterbox.md
  - entities/voice-models/cosyvoice2.md
  - concepts/persona-audio-stack.md
  - sweeps/2026-07-28-daily.md
maturity: draft
read_status: skimmed
created: 2026-07-28
updated: 2026-07-28
---

## Relations

@entities/voice-models/chatterbox.md @entities/voice-models/cosyvoice2.md @concepts/persona-audio-stack.md

## Raw Concept

- **Title**: Singlish, Can or Not? Fine-Tuning and Evaluating Zero-Shot TTS for Singapore English
- **Authors**: Ivan Kukanov, Zheng Xin Chai (KLASS Engineering & Solutions)
- **Type**: arXiv:2607.23027
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.23027-singlish-can-or-not-fine-tuning-and-evaluating-z.pdf`
- **URL**: https://arxiv.org/abs/2607.23027
- **Retrieved**: 2026-07-28

## Narrative

ZS-TTS (Chatterbox, CosyVoice 3) preserves timbre from Singlish prompts but flattens accent toward generic English. Fine-tuning on 50 IMDA NSC Singlish speakers raises accent similarity on in-domain and held-out speakers across naturalness / intelligibility / speaker / accent axes.

**Phase-0: SKIP (install)** — accent-research method paper; no new model release. Useful citation for CosyVoice/Chatterbox accent-transfer limits. Not TipDrop/poker/prod unless a SE-Asia persona needs Singlish A/B later.

## Snippets

_(none)_
