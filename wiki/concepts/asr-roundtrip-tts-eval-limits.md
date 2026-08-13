---
title: ASR-roundtrip TTS evaluation limits (CDRD false negatives)
type: concept
tags: [tts, eval, asr-roundtrip, voice, persona-audio, methodology]
keywords: [ASR-roundtrip, CDRD, context-dependent reading decision, TTS intelligibility, reading errors, span-isolation, MiMo, CosyVoice, Qwen3-ASR, Paraformer]
related:
  - sources/arxiv-2608-10606-asr-roundtrip-tts-eval.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/cosyvoice2.md
  - sweeps/2026-08-13-daily.md
maturity: draft
created: 2026-08-13
updated: 2026-08-13
---

## Relations

@sources/arxiv-2608-10606-asr-roundtrip-tts-eval.md @concepts/persona-audio-stack.md @entities/voice-models/cosyvoice2.md @sweeps/2026-08-13-daily.md

## Raw Concept

Ingest 2026-08-13 from arXiv:2608.10606 (NetEase Cloud Music) — a 5-page evaluation-failure study for Chinese news TTS. Defines the **CDRD** failure family and quantifies how ASR-roundtrip screening masks real reading errors.

## Narrative

**ASR-roundtrip** (synthesize → transcribe → compare to reference) is cheap and scalable but produces **false negatives** for reading errors a listener would catch. The core failure family is **Context-Dependent Reading Decisions (CDRD)**: written spans whose correct reading depends on context beyond the local character sequence.

| Domain example | Written form | Correct reading | Wrong-but-plausible |
|----------------|--------------|-----------------|---------------------|
| Snooker score | `13-11` | 十三比十一 (score) | 十三至十一 (range) |
| Military report | `伊尔-76` | aircraft model | negative number |
| Tech/auto | `640kW`, `350Wh/kg`, `88VIP` | domain convention | literal reading |

The trap: the wrong spoken reading is **fluent**, and the ASR transcript normalizes back to the *surface-correct* text — so the roundtrip looks clean while the audio is wrong.

### Evidence (arXiv:2608.10606)

- **MiMo TTS targeted audit** (n=110 high-risk spans, complete denominator): 46 masked false negatives · 9 exposed TTS errors · 55 clean
- **Span-isolation diagnostic**: removing sentence context re-exposes **18/46** masked errors → context is what's masking them
- **CosyVoice raw-only audit** on the same pool: **51** masked cases (cross-TTS recurrence)
- **Evaluator dependence**: across 97 confirmed-masked files, Qwen3-ASR surface-recovers **40** cases vs Paraformer **2** — the choice of ASR changes the audit outcome dramatically

### Application to persona-audio ops

For persona voice notes / Chinese-news-adjacent TTS quality gates:

1. **ASR-roundtrip = screening only**, never standalone ground truth for reading-risk text.
2. Use a **human-audited span-isolation protocol** for high-risk spans (scores, units, codes, foreign/technical names).
3. Report **denominators** — masked-FN counts without a denominator are uninterpretable.
4. Pick the ASR evaluator deliberately: Qwen3-ASR recovers surface text far better than Paraformer on these cases, so a Paraformer roundtrip under-reports errors relative to Qwen3-ASR.
5. Applies to local pipeline TTS (CosyVoice, F5-TTS, MiMo-class) — the failure mode is not model-specific.

## Snippets

> "ASR-roundtrip is useful for screening but insufficient as standalone ground truth for Chinese news reading-risk evaluation." [Source: arXiv:2608.10606 Abstract]

## Dead Ends

- **Relying on roundtrip alone for persona TTS QA** — masked CDRD errors ship fluent-wrong audio that passes the transcript check.
