---
title: "AutoSIFT — category-level style editing for controllable TTS (arXiv:2607.12706)"
type: source
tags: [paper, voice, tts, style-control, prosody]
keywords: [AutoSIFT, Arbitrary Style Infilling, style disentangler, emotion, age, gender, reference speech, Adobe]
related:
  - entities/voice-models/autosift.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - sweeps/2026-07-16-daily.md
maturity: draft
read_status: skimmed
created: 2026-07-16
updated: 2026-07-16
---

## Relations

@entities/voice-models/autosift.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @entities/voice-models/cosyvoice2.md

## Raw Concept

- **Title**: AutoSIFT: Automatic Style Sifting for Controllable Speech Generation with Arbitrary Style Infilling
- **Authors**: Haowei Lou et al. (UNSW, UCSD, Macquarie, Adobe Research)
- **Type**: arXiv:2607.12706
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.12706-autosift-automatic-style-sifting-for-controllabl.pdf`
- **URL**: https://arxiv.org/abs/2607.12706
- **Retrieved**: 2026-07-16
- **Read status**: skimmed (abstract, ASI formulation, demo figure note)

## Narrative

**AutoSIFT** frames controllable TTS as **Arbitrary Style Infilling (ASI)**: text specifies an arbitrary subset of style categories (emotion / age / gender / …); reference speech supplies residual unspecified styles (timbre, micro-prosody). **Style Disentangler** + **Arbitrary Style Infiller** replace only text-specified categories.

Operator hook: film-dub / game VO / persona clips where you want "same speaker, happier" without wiping identity. Complements CosyVoice emotion tags and Fish-Speech emotion tags with category-surgery framing.

**Phase-0: WATCH** — supplementary audio demo mentioned in paper; no public code/weights found 2026-07-16.

## Snippets

> "By replacing only text-specified style categories while preserving residual speech-derived styles, AutoSIFT enables natural, expressive, and highly customizable speech generation."

[Source: arxiv-2607.12706 abstract]
