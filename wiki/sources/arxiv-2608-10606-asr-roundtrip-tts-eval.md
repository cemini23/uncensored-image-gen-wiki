---
title: "ASR-roundtrip eval masks context-dependent reading errors in Chinese news TTS (arXiv:2608.10606)"
type: source
tags: [paper, tts, eval, voice, watch, asr-roundtrip]
keywords: [ASR-roundtrip, CDRD, Chinese news TTS, MiMo, CosyVoice, Qwen3-ASR, Paraformer, intelligibility, false negatives]
related:
  - concepts/asr-roundtrip-tts-eval-limits.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/cosyvoice2.md
  - sweeps/2026-08-13-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-08-13
updated: 2026-08-13
---

## Relations

@concepts/asr-roundtrip-tts-eval-limits.md @concepts/persona-audio-stack.md @entities/voice-models/cosyvoice2.md @sweeps/2026-08-13-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: ASR-Roundtrip Evaluation Can Mask Context- and Convention-Dependent Reading Errors in Chinese News TTS
- **Authors**: Shijun Luo, Lizhi Wan (NetEase Cloud Music)
- **Type**: arXiv:2608.10606 (5 pp)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.10606-asr-roundtrip-evaluation-can-mask-context-and-co.pdf`
- **URL**: https://arxiv.org/abs/2608.10606
- **Retrieved**: 2026-08-13

## Narrative

**Phase-0: WATCH / REFERENCE (TTS eval methodology).** ASR-roundtrip is a cheap, scalable TTS-intelligibility proxy but produces **false negatives** for reading errors that listeners perceive. Core failure family: **Context-Dependent Reading Decisions (CDRD)** — written spans whose correct reading depends on context beyond the local character sequence (sports scores, aircraft models, technical units, membership names, abbreviations, foreign names).

Evidence (all reported with denominators):
- MiMo TTS targeted audit: 46 masked false negatives / 9 exposed TTS errors / 55 clean (n=110 high-risk spans)
- Span-isolation diagnostic re-exposes 18/46 previously masked errors
- Raw-only CosyVoice audit on the same pool: 51 masked cases
- Across 97 confirmed-masked audio files: **Qwen3-ASR surface-recovers 40**, Paraformer only 2 → evaluator dependence is extreme

**Image-gen/voice relevance:** persona TTS voice notes + Chinese news TTS quality gates. ASR-roundtrip alone under-counts real reading errors; a human-audited span-isolation protocol is needed for high-risk text. Directly relevant to evaluating local voice pipeline (Fish-Speech / CosyVoice / MiMo-class models) against written text with domain conventions.

## Snippets

> "ASR-roundtrip is useful for screening but insufficient as standalone ground truth for Chinese news reading-risk evaluation." [Source: arXiv:2608.10606 Abstract]
