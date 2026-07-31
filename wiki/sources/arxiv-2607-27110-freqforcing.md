---
title: "FreqForcing — spectral self-anchoring for long AR video (arXiv:2607.27110)"
type: source
tags: [paper, video-generation, autoregressive, self-forcing, training-free]
keywords: [FreqForcing, SSA, Spectral-Self-Anchoring, Wan, HunyuanVideo, 24x-extrapolation]
related:
  - entities/models/freqforcing.md
  - concepts/causal-clip-attention-long-video.md
  - concepts/video-representation-regularization.md
  - entities/models/wan-2-2.md
  - concepts/seam-stitching-strategies.md
  - sweeps/2026-07-31-daily.md
  - sources/arxiv-2607-27036-video-repr-regularization.md
maturity: draft
read_status: read
created: 2026-07-31
updated: 2026-07-31
---

## Relations

@entities/models/freqforcing.md @concepts/causal-clip-attention-long-video.md @concepts/video-representation-regularization.md @entities/models/wan-2-2.md @sweeps/2026-07-31-daily.md @sources/arxiv-2607-27036-video-repr-regularization.md

## Raw Concept

- **Title**: FreqForcing: Autoregressive Long Video Generation via Spectral Self-Anchoring
- **Authors**: Jiatong Li, Leo Liang (Tencent HY), Linghe Kong, Yulun Zhang (SJTU)
- **Type**: arXiv:2607.27110
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.27110-freqforcing-autoregressive-long-video-generation.pdf`
- **URL**: https://arxiv.org/abs/2607.27110
- **Project**: https://jiatongli2024.github.io/freqforcing.github.io/
- **Code**: github.com/jiatongli2024/FreqForcing (Apache-2.0; **inference TODO**)
- **Retrieved**: 2026-07-31

## Narrative

Training-free Spectral Self-Anchoring: low-frequency anchor attention for long-horizon stability + high-frequency local attention for motion. Extends Self-Forcing 5s → ~2 min (24×). Characterizes AR drift as low-frequency spectral energy drift.

**Phase-0: WATCH → CONDITIONAL-GO when inference code lands** — repo Apache but README TODO “Release inference code”. No laptop clone until runnable. High-value TipDrop path for Wan long persona clips.

## Snippets

_(none)_
