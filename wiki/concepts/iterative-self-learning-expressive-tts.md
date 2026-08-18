---
title: Iterative Self-Learning for expressive TTS labels
type: concept
tags: [concept, tts, expressive, semi-supervised, voice]
keywords: [ISL, Invert-Classify, prominence, emotion labels, pseudo-label, Fish-Speech]
related:
  - sources/arxiv-2608-15910-isl-expressive-tts.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/phoenix-tts.md
  - sweeps/2026-08-18-daily.md
maturity: draft
created: 2026-08-18
updated: 2026-08-18
---

## Relations

@sources/arxiv-2608-15910-isl-expressive-tts.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @entities/voice-models/phoenix-tts.md @sweeps/2026-08-18-daily.md

## Raw Concept

The question: how do you get explicit prominence / emotion labels for TTS when annotation is the bottleneck, not paired speech-text?

## Narrative

Two control families exist for expressive TTS.

1. **Implicit** — reference audio, learned style embeddings, natural-language prompts. Flexible, hard to predict, leaks speaker into style.
2. **Explicit** — discrete tags (emotion category, word-level prominence). Interpretable, needs labels.

Fish-Speech and IndexTTS-2 already ship an emotion-tag surface. Those tags are only as good as the labeled set. Phoenix TTS is a tokenizer + flow-matching stack, not a labeling loop. Semi-supervised TTS literature mostly fills missing *transcripts*, not missing *expressivity*.

**Invert-Classify** (Sanders et al., arXiv:2608.15910) recovers discrete labels by inverting a frozen generative TTS model — no extra classifier head. **ISL** wraps that in a loop: pseudo-label unlabeled speech → retrain on seed + pseudo → repeat. In low-resource splits the loop beats single-pass pseudo-labeling and approaches fully-supervised listening-test quality.

**Operator takeaway.** If a persona voice needs controllable emotion *without* paying for a fully labeled corpus, ISL is the watch. Layer-1 production stays Fish-Speech (already labeled / prompt-driven). Do not swap the clone model for ISL; use ISL to grow the *control labels* if a small seed exists. No public code at ingest.

## Snippets

> "The framework iteratively pseudo-labels unlabeled speech using the current model, retrains on the combined labeled and pseudo-labeled data, and repeats, progressively refining label quality and synthesis."

[Source: arxiv-2608.15910, abstract]
