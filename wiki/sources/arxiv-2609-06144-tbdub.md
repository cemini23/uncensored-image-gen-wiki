---
title: "TBDub production-oriented visual dubbing (arXiv:2609.06144)"
type: source
tags: [paper, lipsync, dubbing, video, watch]
keywords: [visual dubbing, lipsync, distillation, video DiT]
maturity: draft
read_status: read
created: 2026-09-11
updated: 2026-09-23
phase0_verdict: WATCH HIGH
wire_status: deferred
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - sweeps/2026-09-23-daily.md
  - entities/lipsync/tbdub.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/musetalk.md
  - concepts/persona-audio-stack.md
  - entities/lipsync/not-quite-my-tempo.md
  - sources/arxiv-2609-26486-not-quite-my-tempo.md
---


## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @sweeps/2026-09-23-daily.md @entities/lipsync/tbdub.md @entities/lipsync/latentsync.md @entities/lipsync/musetalk.md @concepts/persona-audio-stack.md @entities/lipsync/not-quite-my-tempo.md @sources/arxiv-2609-26486-not-quite-my-tempo.md

## Raw Concept

- **Title**: TBDub: Production-Oriented Visual Dubbing
- **Type**: arXiv:2609.06144 [cs.CV]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.06144
- **Code**: github.com/TaoLiveAIGC/TBDub, SPDX Apache-2.0 CONFIRMED, 12 stars, ~214 MB API size, has a checkpoints/ dir. Clone gate: abort if du -sm >= 500.
- **Retrieved**: 2026-09-11

## Narrative

TBDub is a production-oriented extension of X-Dub for visual dubbing. It uses task-adaptive post-training to build a 30-step Teacher, then applies DMD/DMD2 few-step distillation to compress the Teacher into a two-step Student. The paper reports stronger robustness on complex production inputs, with better visual quality and identity preservation. The code and the Teacher and Student weights are public. Image-gen Phase-1: none.

## Snippets

"The code is available on GitHub at https://github.com/TaoLiveAIGC/TBDub, and the 30-step Teacher and two-step Student weights are available on Hugging Face at https://huggingface.co/TaoLiveAIGC/TBDub." [Source: arxiv-2609.06144]
