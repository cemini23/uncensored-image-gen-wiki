---
title: "X-Translator — real-time multilingual speaker-aware S2ST (arXiv:2607.17544)"
type: source
tags: [paper, speech, translation, tts, streaming, persona-ops]
keywords: [X-Translator, S2ST, speaker-prompt, OpenSTBench, SJTU]
related:
  - entities/voice-models/x-translator.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - entities/voice-models/indextts-2.md
  - sweeps/2026-07-22-daily.md
maturity: draft
read_status: read
created: 2026-07-22
updated: 2026-07-22
---

## Relations

@entities/voice-models/x-translator.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @entities/voice-models/cosyvoice2.md

## Raw Concept

- **Title**: X-Translator: A Real-Time Multilingual Speaker-Aware Speech-to-Speech Translation System
- **Authors**: Yuxiang Zhao et al. (SJTU X-LANCE / SII / Microsoft / AISpeech)
- **Type**: arXiv:2607.17544
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.17544-x-translator-a-real-time-multilingual-speaker-aw.pdf`
- **URL**: https://arxiv.org/abs/2607.17544
- **Code**: https://github.com/zhaoyx239/X-Translator — demo + adapters; **no SPDX LICENSE file**
- **Demo**: https://translate.sjtuxlance.com/
- **Retrieved**: 2026-07-22

## Narrative

Modular cascaded **S2ST**: streaming ASR → MT → prompt-conditioned TTS with session runtime, incremental segment commitment, and online speaker-prompt manager for multi-speaker / long-form voice stability. OpenSTBench eval vs proprietary APIs.

**Phase-0: CONDITIONAL-GO (demo code only)** — shallow clone `~/Desktop/projects/X-Translator` (~2 MB). TTS backends include IndexTTS-class providers. **License unknown** (no LICENSE / no pyproject license) → research/demo only until clarified; do not Fanvue-monetize the stack. Useful pattern for multilingual persona voice notes / live DM translation.

## Snippets

> "Code and demo are available at https://github.com/zhaoyx239/X-Translator."

[Source: arXiv:2607.17544 abstract (retrieved 2026-07-22)]
