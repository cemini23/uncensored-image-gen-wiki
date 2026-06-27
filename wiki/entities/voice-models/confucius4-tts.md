---
title: Confucius4-TTS (NetEase Youdao)
type: entity
tags: [entity, voice-cloning, tts, zero-shot, multilingual, netease]
keywords: [Confucius4-TTS, Youdao, 14 languages, cross-lingual, zero-shot, Apache-2.0, BigVGAN, Qwen3-TTS]
related:
  - entities/voice-models/cosyvoice2.md
  - entities/persona-ops/fish-speech.md
  - concepts/persona-audio-stack.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/n8n.md
  - sweeps/2026-06-27-daily.md
maturity: draft
created: 2026-06-27
updated: 2026-06-27
---

## Relations

@entities/voice-models/cosyvoice2.md @entities/persona-ops/fish-speech.md @concepts/persona-audio-stack.md

## Raw Concept

Entity for **Confucius4-TTS** — NetEase Youdao multilingual zero-shot TTS (sweep news R9–R11, 2026-06-27).

## Narrative

| Attribute | Value |
|-----------|-------|
| **Repo** | `netease-youdao/Confucius4-TTS` |
| **License** | **Apache-2.0** (LICENSE file) |
| **Stars** | ~463 |
| **Languages** | 14 (zh, en, ja, ko, de, fr, …) |
| **Reference audio** | ~3s, no transcript required |
| **Weights** | ~54GB full pack on HF |
| **Phase-0** | **CONDITIONAL-GO** — `briefs/2026-06-27_phase-0-navicache-lora-optimizer-confucius4.md` |

### Stack lineage

Builds on Qwen3-TTS encoder patterns, CosyVoice text norm, MaskGCT codec, BigVGAN vocoder — Eastern Vanguard competitor to @entities/persona-ops/fish-speech.md / @entities/voice-models/cosyvoice2.md.

### Build-track status

Audit NSFW prompt behavior + Apple Silicon viability before persona voice clone adoption. CUDA-first example script at ingest.

## Snippets

> "Unconstrained voice cloning without reference transcripts."

## Dead Ends

54GB download + VRAM footprint may exceed laptop persona batch defaults.
