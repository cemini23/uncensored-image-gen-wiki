---
title: "TaoMate — anchor-guided long-form AV digital human (arXiv:2607.24359)"
type: source
tags: [paper, digital-human, audio-video, lipsync, long-form, alibaba]
keywords: [TaoMate, anchor-guided-memory, LTX-2.3, stage-parallel, real-time]
related:
  - entities/models/taomate.md
  - entities/models/ltx-2.md
  - entities/lipsync/latentsync.md
  - concepts/persona-audio-stack.md
  - concepts/causal-clip-attention-long-video.md
  - sweeps/2026-07-28-daily.md
maturity: draft
read_status: read
created: 2026-07-28
updated: 2026-07-28
---

## Relations

@entities/models/taomate.md @entities/models/ltx-2.md @entities/lipsync/latentsync.md @concepts/persona-audio-stack.md

## Raw Concept

- **Title**: TaoMate: Anchor-Guided Memory Bridging Evolving and Reference States for Real-Time Audio-Video Digital Human Generation
- **Authors**: Qijun Gan et al. (Taobao & Tmall Group / Nanjing University)
- **Type**: arXiv:2607.24359
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.24359-taomate-anchor-guided-memory-bridging-evolving-a.pdf`
- **URL**: https://arxiv.org/abs/2607.24359
- **Project**: https://taoliveaigc.github.io/TaoMate
- **Code**: github.com/TaoLiveAIGC/TaoMate (Apache-2.0)
- **Weights**: huggingface.co/TaoLiveAIGC/TaoMate (+ LTX-2.3 22B + Gemma 3 12B)
- **Retrieved**: 2026-07-28

## Narrative

Immutable visual anchor + fixed-capacity persistent audio/video memory + stage-parallel few-step AR on a 22.1B LTX-lineage backbone. Claims LipSync 5.773, >30 min uninterrupted, ~16–35 FPS DiT/stage-parallel on multi-GPU. Requires Linux + CUDA 12.8 + **72 GB-class GPUs** for reference configs.

**Phase-0: CONDITIONAL-GO (code on David CUDA host only)** — Apache-2.0 inference runtime ~209 MB repo. Weights + LTX-2.3 + Gemma >>500 MB — **do not clone on wiki laptop**. Does not replace Fish-Speech → LatentSync → Wan/LTX production until A/B on RunPod. TipDrop brief carries install path.

## Snippets

> By separating persistent memory from stage-local denoising dependencies, TaoMate further admits stage-parallel execution across blocks

[Source: arXiv:2607.24359 abstract]
