---
title: TaoMate (Alibaba Taobao — long-form AV digital human)
type: entity
tags: [model, digital-human, audio-video, lipsync, long-form, alibaba, apache-2-0]
keywords: [TaoMate, LTX-2.3, anchor-memory, stage-parallel, 22B]
related:
  - sources/arxiv-2607-24359-taomate.md
  - entities/models/ltx-2.md
  - entities/lipsync/latentsync.md
  - entities/models/wan-2-2.md
  - concepts/persona-audio-stack.md
  - sweeps/2026-07-28-daily.md
  - concepts/causal-clip-attention-long-video.md
maturity: draft
created: 2026-07-28
updated: 2026-07-28
---

## Relations

@concepts/causal-clip-attention-long-video.md @sources/arxiv-2607-24359-taomate.md @entities/models/ltx-2.md @entities/lipsync/latentsync.md @concepts/persona-audio-stack.md

## Raw Concept

Entity from 2026-07-28 ingest. Inference on LTX-2.3 22B + Gemma 3 text encoder + TaoMate `model.pt`.

## Narrative

| Field | Value |
|-------|--------|
| Code license | Apache-2.0 (`TaoLiveAIGC/TaoMate`) |
| Hardware | Linux CUDA 12.8; reference 72 GB GPUs; 4 GPUs for interactive demo |
| Strength | Long-form appearance + AV sync; stage-parallel real-time claims |
| Weakness | Huge weight stack; not laptop-viable |

### Phase-0

**CONDITIONAL-GO on David CUDA RunPod only.** No clone on wiki laptop. Production stills/video path unchanged until A/B vs LatentSync+Wan.

## Snippets

_(none)_
