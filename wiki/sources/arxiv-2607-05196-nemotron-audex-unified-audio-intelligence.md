---
title: "Nemotron Audex — unified audio-text LLM (arXiv:2607.05196)"
type: source
tags: [paper, voice, tts, audio-understanding, nvidia, nemotron, unified-llm]
keywords: [Audex, Nemotron-Labs-Audex, unified audio-text LLM, speech-to-speech, text-to-speech, audio generation, MoE, Nemotron-Cascade-2, no text regression]
related:
  - concepts/unified-audio-text-llm-no-text-regression.md
  - entities/voice-models/nemotron-audex.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/qwen3-tts.md
  - entities/sfx-models/stable-audio-open.md
  - entities/persona-ops/sillytavern.md
  - concepts/persona-ops-stack.md
  - sweeps/2026-07-12-daily.md
maturity: draft
read_status: read
created: 2026-07-12
updated: 2026-07-12
---

## Relations

@concepts/unified-audio-text-llm-no-text-regression.md @entities/voice-models/nemotron-audex.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @entities/voice-models/qwen3-tts.md @entities/sfx-models/stable-audio-open.md @entities/persona-ops/sillytavern.md

## Raw Concept

- **Title**: Unified Audio Intelligence Without Regressing on Text Intelligence
- **Authors**: Zhifeng Kong, Sang-gil Lee, Jaehyeon Kim, Boxin Wang, et al. (NVIDIA)
- **Type**: arXiv:2607.05196 (8 Jun 2026)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.05196-2607-05196v1-unified-audio-intelligence-without.pdf`
- **URL**: https://arxiv.org/abs/2607.05196
- **Weights**: `nvidia/Nemotron-Labs-Audex-30B-A3B`, `nvidia/Nemotron-Labs-Audex-2B` on Hugging Face
- **Retrieved**: 2026-07-12
- **Read status**: read (abstract, architecture, training data, main benchmarks, license)

## Narrative

**Nemotron-Labs-Audex** (Audex) is a **unified audio–text MoE LLM** on **Nemotron-Cascade-2-30B-A3B** (30B total / 3B active). Single decoder: audio encoder → text embedding space; text + discrete speech/audio codec tokens generated autoregressively.

Capabilities in one checkpoint:

| Mode | Tasks |
|------|--------|
| In | Audio understanding, ASR, speech translation |
| Out | TTS, text-to-audio (SFX/ambient), speech-to-speech |
| Text | Reasoning, alignment, long-context, agentic — **marginal/no regression** vs text backbone |

Training mix: **157.4B audio tokens + 320.5B text tokens**; TTA curation follows Stable Audio Open / Tango-AF methods; TTS pipeline uses **Qwen3-TTS-12Hz-1.7B-Base** for partial voice conversion in training data.

**Phase-0 verdict: REFERENCE** — weights released but **NVIDIA Oneway Noncommercial License** blocks commercial Fanvue/OnlyFans persona monetization without separate NVIDIA grant. Inference recipes assume **multi-GPU vLLM** (e.g. TP=8 for audio QA); ~72GB checkpoint — not laptop-primary.

## Snippets

> "Audex delivers state-of-the-art audio understanding, speech recognition and translation, text-to-speech, audio generation, and speech-to-speech generation, while preserving very compelling reasoning … of its text-only LLM backbone with marginal or no regression."

[Source: arxiv-2607.05196 abstract]

> "Your use of this model is governed by the NVIDIA Oneway Noncommercial License"

[Source: huggingface.co/nvidia/Nemotron-Labs-Audex-30B-A3B (retrieved 2026-07-12)]

## Dead Ends

- Not a drop-in replacement for **Fish-Speech + LatentSync** video persona pipeline — no video lipsync; speech-to-speech is agent/DM oriented.
- Commercial persona ops disqualified by license unless operator obtains NVIDIA commercial terms.
