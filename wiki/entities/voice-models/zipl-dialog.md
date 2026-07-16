---
title: ZipL-Dialog (SNU/KT — latent flow-matching dialog TTS)
type: entity
tags: [voice-cloning, tts, dialog, flow-matching, efficient-inference]
keywords: [ZipL-Dialog, ZipFormer, long-form dialog, multi-speaker, CoVoMix2, latent mel]
related:
  - sources/arxiv-2607-12496-zipl-dialog-latent-flow-matching.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/dia.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/autosift.md
  - sweeps/2026-07-16-daily.md
maturity: draft
created: 2026-07-16
updated: 2026-07-16
---

## Relations

@sources/arxiv-2607-12496-zipl-dialog-latent-flow-matching.md @concepts/persona-audio-stack.md @entities/voice-models/dia.md @entities/persona-ops/fish-speech.md @entities/voice-models/autosift.md

## Raw Concept

Entity from 2026-07-16 ingest of arXiv:2607.12496. Memory-efficient **multi-turn dialog TTS** via latent flow matching.

## Narrative

| Field | Value |
|-------|--------|
| Paper | arXiv:2607.12496 |
| Code / weights | **Not released** — demos at speechdemos.github.io only |
| Niche | Minute-scale multi-speaker dialog, single-pass |
| vs Dia | Same dialog niche; ZipL claims large memory win over NAR mel baselines |
| vs Fish-Speech | Fish remains single-persona Layer-1 default; ZipL is multi-turn specialist if/when open |

### Phase-0

**WATCH** — no install path. Re-check for code when Interspeech camera-ready lands.

## Snippets

Demo peak-mem examples (paper/demo tables, [TENTATIVE]): ZipL-Dialog ~0.9–1.8 GB vs VibeVoice ~5.3 GB on CoVoMix2 dialogs.
