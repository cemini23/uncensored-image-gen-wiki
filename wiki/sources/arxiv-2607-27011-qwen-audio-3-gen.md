---
title: "Qwen-Audio-3.0-Gen-Preview — unified speech/music/SFX DiT (arXiv:2607.27011)"
type: source
tags: [paper, audio-gen, qwen, alibaba, dit, unified-audio]
keywords: [Qwen-Audio-3.0-Gen, DiT, VAE-48kHz, Seed-TTS-Eval, SongBench]
related:
  - entities/voice-models/qwen-audio-3-tts.md
  - entities/voice-models/qwen-audio-3-gen.md
  - concepts/persona-audio-stack.md
  - entities/music-models/ace-step.md
  - entities/sfx-models/stable-audio-open.md
  - sources/arxiv-2607-23938-qwen-audio-3-0-tts.md
  - sweeps/2026-07-31-daily.md
maturity: draft
read_status: read
created: 2026-07-31
updated: 2026-07-31
---

## Relations

@entities/voice-models/qwen-audio-3-gen.md @entities/voice-models/qwen-audio-3-tts.md @concepts/persona-audio-stack.md @sweeps/2026-07-31-daily.md

## Raw Concept

- **Title**: Qwen-Audio-3.0-Gen-Preview Technical Report
- **Authors**: Alibaba Token Foundry
- **Type**: arXiv:2607.27011
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.27011-qwen-audio-3-0-gen-preview-technical-report.pdf`
- **URL**: https://arxiv.org/abs/2607.27011
- **Retrieved**: 2026-07-31

## Narrative

Unified **non-autoregressive DiT + shared VAE** that generates the full mixed waveform (speech, music, SFX, ambience, multi-role) from structured temporal prompt records. 48 kHz stereo → 25 Hz latents with semantic supervision. Strong speaker SIM on Seed-TTS-Eval; competitive SongBench with ~0.1× music data vs dedicated in-house model.

**Phase-0: SKIP local / WATCH open weights** — Preview tech report; Alibaba Model Studio lineage (sibling to hosted Qwen-Audio-3.0-TTS). No downloadable weights confirmed. Do not replace local Fish-Speech + ACE-Step + Stable Audio Open stack for NSFW persona mux.

## Snippets

_(none)_
