---
title: "ZipL-Dialog — memory-efficient long-form spoken dialog TTS (arXiv:2607.12496)"
type: source
tags: [paper, voice, tts, dialog, flow-matching, efficient-inference]
keywords: [ZipL-Dialog, ZipFormer, latent flow matching, long-form dialog TTS, CoVoMix2, multi-speaker, Interspeech]
related:
  - entities/voice-models/zipl-dialog.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/dia.md
  - entities/persona-ops/fish-speech.md
  - sweeps/2026-07-16-daily.md
maturity: draft
read_status: read
created: 2026-07-16
updated: 2026-07-16
---

## Relations

@entities/voice-models/zipl-dialog.md @concepts/persona-audio-stack.md @entities/voice-models/dia.md @entities/persona-ops/fish-speech.md

## Raw Concept

- **Title**: ZipL-Dialog: Memory-Efficient Long-Form Spoken Dialog Synthesis via Latent Flow Matching
- **Authors**: Jihwan Kim, Nam Soo Kim (SNU + KT)
- **Type**: arXiv:2607.12496 (Interspeech 2026 anonymous demo page)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.12496-zipl-dialog-memory-efficient-long-form-spoken-di.pdf`
- **URL**: https://arxiv.org/abs/2607.12496
- **Demo**: https://speechdemos.github.io/
- **Retrieved**: 2026-07-16
- **Read status**: read (abstract, method claims, demo tables)

## Narrative

**ZipL-Dialog** runs zero-shot **multi-speaker dialog TTS** with conditional flow-matching in a **4× time-compressed (25 Hz) mel latent**, claiming **11.22× peak GPU memory cut** and **2.23× faster** inference vs dense-mel ZipVoice-Dialog baseline — enabling single-pass multi-minute dialogs instead of chunked synthesis. Uses deterministic mel autoencoder + ZipFormer hierarchical downsampling.

Demo tables (CoVoMix2 / OpenDialog) show ~0.9–1.8 GB peak vs 5+ GB VibeVoice AR and up to 15 GB ZipVoice-Dialog on long samples. Compares qualitatively to Dia and Mooncast on OpenDialog.

**Phase-0: WATCH** — audio demos only; no public inference code/weights found 2026-07-16. Persona production stays Fish-Speech (+ Dia for multi-turn experiments). Interesting when open: long DM-style multi-speaker podcasts on commodity GPU.

## Snippets

> "ZipL-Dialog reduces maximum peak GPU memory by 11.22x and accelerates inference by 2.23x over the baseline."

[Source: arxiv-2607.12496 abstract]

## Dead Ends

- No GitHub/HF release at ingest — demos ≠ adoptable artifact.
