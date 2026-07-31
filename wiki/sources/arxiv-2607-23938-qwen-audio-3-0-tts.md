---
title: "Qwen-Audio-3.0-TTS — hosted Flash/Plus production TTS (arXiv:2607.23938)"
type: source
tags: [paper, tts, qwen, alibaba, hosted-api, voice-cloning]
keywords: [Qwen-Audio-3.0-TTS, DashScope, Artificial-Analysis, Flash, Plus, inline-tags]
related:
  - entities/voice-models/qwen-audio-3-tts.md
  - entities/voice-models/qwen3-tts.md
  - entities/voice-models/cosyvoice2.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - sweeps/2026-07-28-daily.md
  - sources/arxiv-2607-27011-qwen-audio-3-gen.md
  - entities/voice-models/qwen-audio-3-gen.md
maturity: draft
read_status: read
created: 2026-07-28
updated: 2026-07-31
---

## Relations

@entities/voice-models/qwen-audio-3-tts.md @entities/voice-models/qwen3-tts.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @sources/arxiv-2607-27011-qwen-audio-3-gen.md @entities/voice-models/qwen-audio-3-gen.md

## Raw Concept

- **Title**: Qwen-Audio-3.0-TTS: Freely Controllable and Highly Robust Speech Synthesis with Multi-Stage Training Paradigm
- **Authors**: Alibaba Token Foundry / Tongyi Lab
- **Type**: arXiv:2607.23938
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.23938-qwen-audio-3-0-tts-freely-controllable-and-highl.pdf`
- **URL**: https://arxiv.org/abs/2607.23938
- **Demo / API**: funaudiollm.github.io/qwen-audio-3.0 · Alibaba Cloud Model Studio (DashScope)
- **Retrieved**: 2026-07-28

## Narrative

Production TTS with 12.5 Hz tokenizer + five-stage LM/flow-matching training. Claims SOTA / #1 Artificial Analysis TTS leaderboard (as of 2026-07-16 snapshot). 16 languages, 20 Chinese dialect regions, NL instructions + inline tags, one-pass long-form ≤3 min, robust to noisy refs. Ships as **Flash** (latency) and **Plus** (quality) hosted APIs — **no downloadable weights** [CONFIRMED via multi-source coverage 2026-07-28]. Distinct from open-weight Apache **Qwen3-TTS**.

**Phase-0: SKIP (local) / WATCH (open weights)** — API-only; NSFW + right-of-publicity risk on hosted Alibaba stack. Production local path stays Fish-Speech → LatentSync. TipDrop: do not replace local TTS with DashScope for monetized NSFW personas.

## Snippets

> Freely Controllable and Highly Robust Speech Synthesis with Multi-Stage Training Paradigm

[Source: arXiv:2607.23938 abstract]
