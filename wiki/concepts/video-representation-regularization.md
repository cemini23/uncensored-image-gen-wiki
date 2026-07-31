---
title: Video representation regularization against AR compounding error
type: concept
tags: [concept, video-generation, autoregressive, regularization]
keywords: [erank, dimensional-collapse, compounding-error, long-video]
related:
  - sources/arxiv-2607-27036-video-repr-regularization.md
  - sources/arxiv-2607-27110-freqforcing.md
  - concepts/causal-clip-attention-long-video.md
  - entities/models/freqforcing.md
  - sweeps/2026-07-31-daily.md
maturity: draft
created: 2026-07-31
updated: 2026-07-31
---

## Relations

@sources/arxiv-2607-27036-video-repr-regularization.md @sources/arxiv-2607-27110-freqforcing.md @concepts/causal-clip-attention-long-video.md

## Raw Concept

Why do AR video world models collapse over long rollouts, and how to train against it?

## Narrative

PKU work ties drift onset to effective-rank collapse; FreqForcing attacks the same failure from the frequency domain at inference. Together they frame TipDrop long-Wan hardening: train-time erank regularizers + train-free spectral anchoring when code ships.

## Snippets

_(none)_
