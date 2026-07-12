---
title: Qwen3-TTS (Alibaba Qwen team — multilingual open-source TTS)
type: entity
tags: [voice-cloning, tts, qwen3, alibaba, qwen, multilingual, open-source, eastern-vanguard]
keywords: [Qwen3-TTS, Qwen-TTS, Alibaba Qwen, multilingual TTS, Tongyi Qianwen License, qwen3 backbone, persona-ops TTS]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - sources/persona-ops-stack-2026.md
  - entities/voice-models/barewave.md
  - concepts/persona-ops-stack.md
  - sweeps/2026-07-04-daily.md
  - entities/voice-models/nemotron-audex.md
  - entities/voice-models/nemotron-audex.md
  - sources/arxiv-2607-05196-nemotron-audex-unified-audio-intelligence.md
  - concepts/unified-audio-text-llm-no-text-regression.md
  - sweeps/2026-07-12-daily.md
maturity: draft
created: 2026-05-13
updated: 2026-07-12
---

## Relations

@concepts/persona-audio-stack.md
@entities/persona-ops/fish-speech.md
@entities/voice-models/cosyvoice2.md
@sources/persona-ops-stack-2026.md
@concepts/persona-ops-stack.md

## Raw Concept

Page prompted by the W4 Tier 2 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 1 alternates row as the "strong multilingual, open source" alternative to Fish-Speech; also surfaces in @sources/persona-ops-stack-2026.md keyword list. Previously no entity page.

## Narrative

### What it is

**Qwen3-TTS** is Alibaba Qwen team's open-source multilingual TTS, part of the broader Qwen3 family ecosystem (LLM + multimodal + audio). Built on top of the Qwen3 backbone for text understanding and pairs with a neural codec / vocoder for audio synthesis. Eastern Vanguard openness posture (Alibaba's Tongyi MAI direction): permissive weight release, no NSFW guardrails at the model level.

### Key facts (confirmed July 2026)

- **License**: Apache-2.0 for the public repo and released weights [CONFIRMED 2026-07-04]
- **Repo / HF**: `QwenLM/Qwen3-TTS`; released HF models under `Qwen/Qwen3-TTS-*` [CONFIRMED 2026-07-04]
- **Released models**: 12Hz tokenizer plus 0.6B and 1.7B Base / CustomVoice / VoiceDesign variants [CONFIRMED 2026-07-04]
- **Architecture**: discrete multi-codebook LM TTS stack with 12Hz tokenizer; supports streaming and non-streaming generation [CONFIRMED 2026-07-04]
- **Languages**: Chinese, English, Japanese, Korean, German, French, Russian, Portuguese, Spanish, Italian [CONFIRMED 2026-07-04]
- **Latency**: claims first audio packet as low as 97ms for streaming path [TENTATIVE 2026-07-04]
- **Strength**: multilingual quality consistency across languages; inherits Qwen3's strong text understanding
- **Weakness vs Fish-Speech**: less mature persona-ops ecosystem; 25Hz checkpoints from the technical report still appear unreleased on HF as of July 2026 [TENTATIVE 2026-07-04]

### Positioning vs other voice clones

| Axis | Qwen3-TTS | Fish-Speech S2 Pro | F5-TTS |
|------|-----------|-------------------|--------|
| Languages | Broad multilingual | 80+ languages | English-strong, limited others |
| Emotion control | Limited | ✅ inline natural-language | Limited |
| License | Open (terms VERIFY) | Open weights, commercial paid | CC-BY-NC weights typical |
| NSFW posture | Eastern Vanguard open | Open (PRC-jurisdiction trade-off) | Open research |
| Best for | Multilingual persona, no emotion need | Max quality + emotion | English quality benchmark |

### Operator notes

- **Multi-language persona** (e.g. content split between English + Spanish + Mandarin): Qwen3-TTS is now a credible fully open-source fallback, especially if 3-second cloning + streaming matters more than Fish's emotion tagging.
- **License risk**: May 2026 Tongyi-license uncertainty is resolved for the public Qwen3-TTS repo/weights: Apache-2.0.
- **Integration maturity**: lower than Fish-Speech / CosyVoice2 in SillyTavern / n8n connector libraries as of May 2026

### Qwen3-TTS Flash variants (2026-07-12)

Digest row R9 surfaces **Qwen3-TTS-VD-Flash** and **Qwen3-TTS-VC-Flash** (voice-design / voice-clone flash checkpoints with Russian among supported langs) [TENTATIVE — third-party blog, not yet verified on official Qwen HF org]. Treat as latency experiment candidates only; Fish-Speech S2 Pro remains default for NSFW emotion-tagged DMs until local A/B confirms parity.

### Audex training dependency

NVIDIA Audex uses **Qwen3-TTS-12Hz-1.7B-Base** for synthetic voice conversion in TTS training corpus — signals Qwen3-TTS maturity in frontier stacks (@entities/voice-models/nemotron-audex.md).

## Snippets

> "Qwen3-TTS — Strong multilingual, open source. Less emotion control than Fish."
[Source: @concepts/persona-audio-stack.md Layer 1 alternates table]

> "Qwen3-TTS covers 10 major languages ... and supports stable, expressive, and streaming speech generation, free-form voice design, and vivid voice cloning."
[Source: github.com/QwenLM/Qwen3-TTS (retrieved 2026-07-04)]

## Dead Ends

- **Qwen3-TTS for single-language English persona where emotional range matters**: pick Fish-Speech S2 Pro first — Qwen3-TTS's multilingual breadth is wasted unless Apache-2.0 purity or low-latency streaming is the binding constraint.
