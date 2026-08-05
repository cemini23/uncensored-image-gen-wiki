---
title: "GROW — group-relative on-policy RL for flow-matching TTS (arXiv:2608.03215)"
type: source
tags: [paper, tts, rl, flow-matching, grpo]
keywords: [GROW, group-relative, advantage-weighted, F5-TTS, on-policy]
related:
  - entities/voice-models/grow-tts.md
  - concepts/grpo-i2v-post-training.md
  - entities/voice-models/f5-tts.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - sweeps/2026-08-05-daily.md
maturity: draft
read_status: read
created: 2026-08-05
updated: 2026-08-05
---

## Relations

@entities/voice-models/grow-tts.md @concepts/grpo-i2v-post-training.md @entities/voice-models/f5-tts.md @concepts/persona-audio-stack.md @sweeps/2026-08-05-daily.md

## Raw Concept

- **Title**: GROW: Group-Relative Advantage-Weighted On-Policy Reinforcement Learning of Autoregressive-Diffusion Text-to-Speech Model
- **Type**: arXiv:2608.03215
- **Claimed code**: github.com/yanghaha0908/GROW — **empty repo at ingest**
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.03215-grow-group-relative-advantage-weighted-on-policy.pdf`
- **URL**: https://arxiv.org/abs/2608.03215
- **Retrieved**: 2026-08-05

## Narrative

On-policy RL that reweights the **standard flow-matching objective** (no ODE→SDE likelihood tracking). Group-relative intelligibility + speaker-similarity advantages; W2 velocity penalty vs frozen pretrained ref.

**Phase-0: WATCH** — sibling to video GRPO (@concepts/grpo-i2v-post-training.md) for TTS. TipDrop when code lands for F5/Fish post-train on CUDA (consent + operator-owned refs only). Phase-1: `deferred`.

## Snippets

_(none)_
