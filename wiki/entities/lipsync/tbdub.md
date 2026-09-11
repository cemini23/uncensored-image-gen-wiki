---
title: TBDub
type: entity
tags: [lipsync, dubbing, video, watch]
keywords: [visual dubbing, lipsync, distillation, X-Dub]
related:
  - sources/arxiv-2609-06144-tbdub.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/musetalk.md
  - concepts/persona-audio-stack.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
maturity: draft
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH HIGH / GO clone
wire_status: deferred
---

## Relations

@sources/arxiv-2609-06144-tbdub.md @entities/lipsync/latentsync.md @entities/lipsync/musetalk.md @concepts/persona-audio-stack.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.06144 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-06144-tbdub.md

## Narrative

TBDub is a production-oriented visual dubbing system from TaoLive AIGC. It extends the X-Dub mask-free video-editing baseline with production-domain post-training and task-aware few-step distillation. The method builds a 30-step Teacher, then compresses it into a two-step Student with DMD/DMD2. The repo is TaoLiveAIGC/TBDub, SPDX Apache-2.0 CONFIRMED. It has 12 stars and ~214 MB API size. Clone status: DONE at .local/adopts/TBDub. The depth-1 disk size is 1 MB and the checkpoints/ dir holds pointers only, so the du -sm < 500 gate passed with no weight download. Local CUDA eval is a follow-up. Image-gen Phase-1: none. wire_status: deferred.
