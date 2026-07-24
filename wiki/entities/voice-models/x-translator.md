---
title: X-Translator (SJTU — real-time speaker-aware S2ST)
type: entity
tags: [voice, translation, streaming, s2st, watch]
keywords: [X-Translator, S2ST, OpenSTBench, IndexTTS, speaker-prompt]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - entities/voice-models/indextts-2.md
  - sources/arxiv-2607-17544-x-translator-s2st.md
  - sources/arxiv-2607-21042-faster-indextts-2.md
  - sweeps/2026-07-22-daily.md
  - sweeps/2026-07-24-daily.md
maturity: draft
created: 2026-07-22
updated: 2026-07-24
---

## Relations

@sources/arxiv-2607-17544-x-translator-s2st.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @entities/voice-models/indextts-2.md

## Raw Concept

Entity from 2026-07-22 Phase-0 of arXiv:2607.17544 / github.com/zhaoyx239/X-Translator.

## Narrative

| Field | Value |
|-------|--------|
| Paper | arXiv:2607.17544 |
| Code | `github.com/zhaoyx239/X-Translator` — **license unknown** (no LICENSE) |
| Local clone | `~/Desktop/projects/X-Translator` (~2 MB, 2026-07-22) |
| Demo | https://translate.sjtuxlance.com/ |

### Phase-0

**CONDITIONAL-GO (demo/research)** — clone + `start.sh` path ready once ASR/MT/TTS backends configured. Clarify SPDX before any monetized persona use. Not a Fish-Speech replacement — orchestration pattern for multilingual live voice.

## Dead Ends

- Commercial Fanvue use while license unknown.
