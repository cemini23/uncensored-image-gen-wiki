---
title: "Faster IndexTTS-2 — streaming GPU-accelerated TTS (arXiv:2607.21042)"
type: source
tags: [paper, tts, streaming, nvidia, indextts, tensorrt]
keywords: [Faster-IndexTTS-2, IndexTTS-2, Triton, TensorRT-LLM, TTFA, streaming]
related:
  - entities/voice-models/indextts-2.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - entities/voice-models/cosyvoice2.md
  - entities/voice-models/x-translator.md
  - sweeps/2026-07-24-daily.md
maturity: draft
read_status: read
created: 2026-07-24
updated: 2026-07-24
---

## Relations

@entities/voice-models/indextts-2.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md

## Raw Concept

- **Title**: Faster IndexTTS-2: Accelerating and Streaming Autoregressive Zero-Shot Text-to-Speech Synthesis on GPUs
- **Authors**: Muyang Du, Shuang Yu, Junjie Lai (NVIDIA Shanghai)
- **Type**: arXiv:2607.21042
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.21042-faster-indextts-2-accelerating-and-streaming-aut.pdf`
- **URL**: https://arxiv.org/abs/2607.21042
- **Demo**: https://faster-indextts-2.github.io
- **Code**: `github.com/MuyangDu/index-tts` `deploy/` (fork of index-tts; TensorRT + Triton streaming)
- **Retrieved**: 2026-07-24

## Narrative

NVIDIA deploy stack for IndexTTS-2: TensorRT / TensorRT-LLM + Triton, chunked streaming with low TTFA. Requires CUDA Docker + IndexTTS-2 checkpoints.

**Phase-0: CONDITIONAL-GO (deploy code only)** — local clone `~/Desktop/projects/faster-indextts-2` (~69 MB). Weights/checkpoints deferred (>>500 MB). **License**: Bilibili Model Use License (NOASSERTION / custom) — research/demo OK under MAU/revenue caps; do not use to improve competing TTS models. Production voice path remains Fish-Speech until A/B on CUDA host.

## Snippets

> Real-time Streaming: Chunked audio generation with low time-to-first-audio (TTFA)

[Source: deploy/README.md @ MuyangDu/index-tts]
