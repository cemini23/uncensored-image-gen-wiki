---
title: Face-to-Speech synthesis (image→voice without audio refs)
type: concept
tags: [concept, tts, face-to-speech, persona-ops]
keywords: [F2S, StyleTTS2, Face-Adapter, likeness]
related:
  - sources/arxiv-2607-26742-face-to-speech.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - sweeps/2026-07-31-daily.md
  - entities/voice-models/kokoro.md
maturity: draft
created: 2026-07-31
updated: 2026-07-31
---

## Relations

@sources/arxiv-2607-26742-face-to-speech.md @concepts/persona-audio-stack.md @entities/voice-models/kokoro.md

## Raw Concept

How to invent a plausible voice when only a face still exists?

## Narrative

F2S maps face-recognition embeddings into TTS style latents (StyleTTS 2 in arXiv:2607.26742). Research-interesting for NPC/historical cases; **not** default for monetized NSFW personas (prefer operator-owned audio + Fish-Speech). Publicity risk if face is a real non-consenting person.

## Snippets

_(none)_
