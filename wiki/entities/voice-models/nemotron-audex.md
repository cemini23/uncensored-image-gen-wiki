---
title: Nemotron-Labs-Audex (NVIDIA unified audio-text LLM)
type: entity
tags: [voice-cloning, tts, audio-understanding, nvidia, nemotron, unified-llm, moe]
keywords: [Audex, Nemotron-Labs-Audex-30B-A3B, Nemotron-Labs-Audex-2B, speech-to-speech, text-to-audio, X-Codec2, vLLM, noncommercial]
related:
  - sources/arxiv-2607-05196-nemotron-audex-unified-audio-intelligence.md
  - concepts/unified-audio-text-llm-no-text-regression.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/qwen3-tts.md
  - entities/sfx-models/stable-audio-open.md
  - entities/persona-ops/sillytavern.md
  - entities/sfx-models/tango-2.md
  - concepts/persona-ops-stack.md
  - sweeps/2026-07-12-daily.md
  - entities/voice-models/speech-swift.md
  - sweeps/2026-07-13-daily.md
maturity: draft
created: 2026-07-12
updated: 2026-07-12
---

## Relations

@sources/arxiv-2607-05196-nemotron-audex-unified-audio-intelligence.md @concepts/unified-audio-text-llm-no-text-regression.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @entities/voice-models/qwen3-tts.md @entities/sfx-models/stable-audio-open.md @entities/persona-ops/sillytavern.md

## Raw Concept

Phase-0 audit 2026-07-12 on `nvidia/Nemotron-Labs-Audex-30B-A3B` + technical report arXiv:2607.05196 [Source: Hugging Face + arxiv (retrieved 2026-07-12)].

## Narrative

| Check | Result |
|-------|--------|
| **License** | **NVIDIA Oneway Noncommercial** — ❌ commercial persona monetization |
| **Weights** | HF: Audex-30B-A3B (~72GB), Audex-2B |
| **VRAM / ops** | vLLM 0.20; audio QA example **tensor-parallel-size 8**; not consumer-laptop primary |
| **Domain fit** | Unified ASR + TTS + TTA + speech-to-speech + text agent |
| **NSFW** | No platform filter; license is the blocker |
| **vs Fish-Speech** | Audex wins unified agent; Fish wins emotion tags + Apache ecosystem + proven NSFW persona ops |

**Phase-0 verdict: REFERENCE** — study architecture and benchmark against Qwen-Omni; **do not adopt** for monetized persona stack without NVIDIA commercial license.

### Codec stack

- Speech: **X-Codec2** (65k speech tokens) + optional causal speech decoder for streaming TTS
- General audio: **X-Codec** RVQ4 (Stable Audio Open–class TTA)
- Training borrows **Qwen3-TTS** for synthetic voice conversion in TTS corpus

### Operator notes

- **SFX layer:** Audex TTA competes with @entities/sfx-models/stable-audio-open.md for ambient/foley — still prefer Stable Audio Open (commercial-friendly license) for production.
- **DM voice:** Keep @entities/persona-ops/fish-speech.md as default; Audex speech-to-speech is experimental for @entities/persona-ops/sillytavern.md only on non-commercial test cards.

## Snippets

> "Audex-30B-A3B operates in both thinking and instruct (non-thinking) modes."

[Source: huggingface.co/nvidia/Nemotron-Labs-Audex-30B-A3B (retrieved 2026-07-12)]

## Dead Ends

- Replacing LatentSync — Audex has no video mouth sync.
- Single-GPU laptop deployment of 30B-A3B full checkpoint at production quality.
