---
title: Direction-Following TTS
type: entity
tags: [tts, voice, watch]
keywords: [direction-following tts, speaking style control, pseudo triplets, voice impression]
related:
  - sources/arxiv-2609-02623-direction-following-tts.md
  - concepts/persona-audio-stack.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
maturity: draft
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@sources/arxiv-2609-02623-direction-following-tts.md @concepts/persona-audio-stack.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.02623 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-02623-direction-following-tts.md

## Narrative

Direction-following TTS is a task from NTT, Inc. A user supplies a script, a reference utterance, and a natural language direction. The model then makes a new utterance that applies the direction and keeps the speaker identity and the words. The method trains on pseudo triplets. An impression-controllable TTS model makes the style change, and an LLM writes the direction text. The operator reported no public code repository, so this page is paper-only, operator evaluation is deferred, and Image-gen Phase-1: none. wire_status: deferred.
