---
title: Deterministic Prompting TTS
type: entity
tags: [tts, voice, low-resource, watch]
keywords: [low-resource tts, deterministic prompting, parler-tts, lora]
related:
  - sources/arxiv-2609-10022-deterministic-prompting-tts.md
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

@sources/arxiv-2609-10022-deterministic-prompting-tts.md @concepts/persona-audio-stack.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.10022 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-10022-deterministic-prompting-tts.md

## Narrative

Deterministic Prompting TTS is the Greek single-speaker system from arXiv:2609.10022. The method fine-tunes Parler-TTS (880M) on curated Greek data, then adds a speaker-specific LoRA stage on 3.5 h of single-speaker audio. The paper reports that LLM-generated style prompts cause speaker drift, and that fixed human-designed prompts keep the speaker stable. The adoption posture for this wiki is watch only. Code: none found. No clone. Image-gen Phase-1: none. wire_status: deferred.
