---
title: CosyVoice 2 (FunAudioLLM / Alibaba Tongyi)
type: entity
tags: [voice-cloning, tts, streaming-tts, alibaba, funaudiollm, cosyvoice, apache-2-0, eastern-vanguard, zero-shot]
keywords: [CosyVoice2, CosyVoice2-0.5B, CosyVoice3, Fun-CosyVoice3-0.5B, streaming TTS, bidirectional streaming, 150ms latency, chunk-aware flow matching, FunAudioLLM, Tongyi, iic, vLLM, Seed-TTS]
related:
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - concepts/persona-ops-stack.md
  - concepts/model-selection-workflow.md
  - sources/persona-ops-stack-2026.md
  - entities/voice-models/indextts-2.md
  - entities/voice-models/qwen3-tts.md
  - entities/voice-models/chatterbox.md
  - entities/voice-models/xtts-v2.md
  - entities/voice-models/dia.md
  - entities/voice-models/elevenlabs.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/persona-ops/fish-speech.md
@concepts/persona-ops-stack.md
@concepts/model-selection-workflow.md
@sources/persona-ops-stack-2026.md
@entities/voice-models/indextts-2.md @entities/voice-models/qwen3-tts.md @entities/voice-models/chatterbox.md
@entities/voice-models/xtts-v2.md @entities/voice-models/dia.md @entities/voice-models/elevenlabs.md

## Raw Concept

Page prompted by the W4 voice/audio-gen backfill (scope expansion 2026-05-13). CosyVoice2 is named in @concepts/persona-audio-stack.md as the lightweight / low-latency alternative to @entities/persona-ops/fish-speech.md for real-time DM voice notes; previously no entity page existed.

## Narrative

### What it is

CosyVoice 2 (and now CosyVoice 3) is Alibaba Tongyi MAI's streaming text-to-speech / voice-cloning model family from the **FunAudioLLM** group (HF org `FunAudioLLM`, ModelScope org `iic` = Institute for Intelligent Computing). It integrates a pre-trained LLM backbone with a **chunk-aware causal flow matching** decoder for unified streaming + non-streaming synthesis in one model.

### Key facts (May 2026)

- **License**: Apache 2.0 (code + weights) [CONFIRMED]
- **Sizes**: CosyVoice2-0.5B (canonical), CosyVoice-300M / -SFT / -Instruct (legacy v1), Fun-CosyVoice3-0.5B (latest, 2512 release recommended by upstream)
- **First-packet latency**: ~150ms with bidirectional streaming [CONFIRMED — funaudiollm.github.io/cosyvoice2]
- **CER reduction**: 30-50% fewer pronunciation errors vs CosyVoice 1.0; lowest CER on Seed-TTS hard test set
- **Inference acceleration**: vLLM 0.11.x+ (V1 engine) and vLLM 0.9.0 legacy supported; TensorRT-LLM gives ~4× over HF transformers
- **Architecture**: text-speech LM (pre-trained LLM backbone) + chunk-aware causal flow matching decoder; supports both streaming and non-streaming in a single forward
- **Languages**: multilingual (strong Chinese + English); zero-shot cloning supported

### Positioning vs Fish-Speech S2 Pro

| Axis | CosyVoice2-0.5B | Fish-Speech S2 Pro |
|------|----------------|--------------------|
| Latency (TTFA) | ~150ms streaming | higher (batch-oriented) |
| Quality | Strong, lower CER than v1 | TTS-Arena2 leader |
| Emotion control | Yes, weaker than Fish | 50+ tag inline emotion |
| VRAM | 8 GB tier (0.5B) | 16-24 GB |
| Streaming | Native bidirectional | Not the focus |
| Languages | Multi (CN-strong) | 80+ languages |
| Commercial use | Apache 2.0 (clean) | Code open / weights paid license for commercial |

**Decision matrix entry**:
- Real-time / low-latency DM voice notes → CosyVoice2-0.5B
- Maximum emotional range + multi-language → Fish-Speech S2 Pro

### Operator notes

- 0.5B fits comfortably on 8 GB VRAM; Apple Silicon viability not yet verified [NEEDS VERIFICATION 2026-05-13]
- `ttsfrd` Chinese text-normalization resource is a separate download
- For NSFW persona-ops use: operator-controlled (Apache 2.0 means no platform NSFW filter at weights level), but reference-audio rights still apply per @concepts/persona-legal-landscape.md

## Snippets

> "Ultra-Low Latency: CosyVoice 2.0 introduces a large-scale voice generation model technology that integrates offline and streaming modeling, supporting bidirectional streaming speech synthesis. The first packet synthesis latency can reach 150ms with minimal loss in quality."
[Source: https://funaudiollm.github.io/cosyvoice2/ (retrieved 2026-05-13)]

> "Yes, CosyVoice's open-source nature under the Apache-2.0 license allows for tailored modifications."
[Source: https://cosyvoice.org/ (retrieved 2026-05-13)]

### Install

```bash
git clone https://github.com/FunAudioLLM/CosyVoice.git
cd CosyVoice && pip install -r requirements.txt
# weights
huggingface-cli download FunAudioLLM/CosyVoice2-0.5B --local-dir pretrained_models/CosyVoice2-0.5B
# or via ModelScope
# snapshot_download('iic/CosyVoice2-0.5B', local_dir='pretrained_models/CosyVoice2-0.5B')
```

[Source: github.com/FunAudioLLM/CosyVoice (retrieved 2026-05-13)]

## Dead Ends

- **CosyVoice 1.0 / 300M legacy variants**: superseded by 2.0 (lower CER) and 3.0 (recommended upstream). Use Fun-CosyVoice3-0.5B for new builds.
