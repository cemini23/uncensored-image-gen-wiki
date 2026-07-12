---
title: Unified audio-text LLM without text regression
type: concept
tags: [concept, voice, tts, audio-understanding, multimodal-llm, persona-ops]
keywords: [Audex, Qwen-Omni, unified audio LLM, text regression, speech-to-speech, codec tokens, MoE]
related:
  - sources/arxiv-2607-05196-nemotron-audex-unified-audio-intelligence.md
  - entities/voice-models/nemotron-audex.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/qwen3-tts.md
  - entities/persona-ops/sillytavern.md
  - concepts/retrieval-agent-safety-degradation.md
  - entities/sfx-models/stable-audio-open.md
  - concepts/persona-ops-stack.md
  - sweeps/2026-07-12-daily.md
maturity: draft
created: 2026-07-12
updated: 2026-07-12
---

## Relations

@sources/arxiv-2607-05196-nemotron-audex-unified-audio-intelligence.md @entities/voice-models/nemotron-audex.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @entities/voice-models/qwen3-tts.md @entities/persona-ops/sillytavern.md @entities/sfx-models/stable-audio-open.md

## Raw Concept

Ingest 2026-07-12 from NVIDIA **Audex** technical report — unified audio in/out on a strong text MoE backbone without the reasoning collapse seen in Qwen3-Omni family.

## Narrative

**Problem:** Multimodal LLMs with audio (and vision) outputs often **degrade text benchmarks** — reasoning, knowledge, agentic tool use encoded in text suffer when audio codec heads are co-trained.

**Audex pattern:** Keep **full text post-training mix** (SFT + Cascade RL) alongside audio-text data; single decoder treats text tokens and RVQ speech/audio codec tokens uniformly; audio encoder + MLP projects continuous audio into text embedding space.

### vs modular persona-audio stack

| Approach | Pros | Cons |
|----------|------|------|
| **Modular** (Fish-Speech → LatentSync → FFmpeg) | Best-in-class per stage; Apache/MIT components | Pipeline glue, VRAM stacking |
| **Unified** (Audex, Qwen-Omni) | One vLLM endpoint; speech-to-speech agents | License (Audex NC), GPU count, emotion control immature vs Fish |

### Persona-ops posture (2026-07-12)

**Do not migrate production voice notes** from Fish-Speech S2 Pro to Audex — NVIDIA noncommercial license + no inline emotion-tag surface comparable to Fish.

**Watch** Audex-2B for research on **speech-to-speech SillyTavern** experiments on non-monetized test personas only.

## Snippets

> "Qwen3-Omni … show degradation on key benchmarks relative to their text-only counterparts."

[Source: arxiv-2607.05196 §1 — motivation]
