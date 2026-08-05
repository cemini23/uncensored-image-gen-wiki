---
title: "DAIEN-TTS — environment-aware zero-shot TTS on F5 (arXiv:2608.03011)"
type: source
tags: [paper, tts, zero-shot, f5-tts, environment-aware]
keywords: [DAIEN-TTS, F5-TTS, speech-environment-separation, reverberation, SNR]
related:
  - entities/voice-models/daien-tts.md
  - entities/voice-models/f5-tts.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - sweeps/2026-08-05-daily.md
maturity: draft
read_status: read
created: 2026-08-05
updated: 2026-08-05
---

## Relations

@entities/voice-models/daien-tts.md @entities/voice-models/f5-tts.md @concepts/persona-audio-stack.md @sweeps/2026-08-05-daily.md

## Raw Concept

- **Title**: Towards Real-world Environment-aware Zero-shot Text-to-speech Synthesis via Disentangled Audio Infilling
- **Authors**: Ye-Xin Lu et al.
- **Type**: arXiv:2608.03011
- **Demo repo**: github.com/yxlu-0102/DAIEN-TTS (demo site / samples only; no SPDX)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.03011-towards-real-world-environment-aware-zero-shot-t.pdf`
- **URL**: https://arxiv.org/abs/2608.03011
- **Retrieved**: 2026-08-05

## Narrative

Extended DAIEN-TTS on flow-matching **F5-TTS**: disentangle speech / noise / reverb; independent speaker prompt vs environment prompt. Training via simulated mix + RIR + cross-speaker conditioning.

**Phase-0: WATCH** — demo site only (~100 MB audio pages); no installable inference code. Useful if persona DMs need room/noise matching without baking env into Fish-Speech clone. F5 weights remain CC-BY-NC-likely — not a Fish-Speech replace. Phase-1: `deferred`.

## Snippets

_(none)_
