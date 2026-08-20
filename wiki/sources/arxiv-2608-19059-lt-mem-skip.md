---
title: "LT-Mem lifelong scene-understanding memory (arXiv:2608.19059) — skip robotics"
type: source
tags: [paper, skip, robotics, embodied-ai, scene-understanding, memory]
keywords: [LT-Mem, Tri-Memory, multi-session SLAM, MASt3R, LT-VQA, DGIST]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-20-daily.md
maturity: draft
read_status: read
created: 2026-08-20
updated: 2026-08-20
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@sweeps/2026-08-20-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: LT-Mem: Volatility-Aware Spatio-Temporal Memory for Lifelong Scene Understanding
- **Authors**: Yumin Lee, Hyoseok Ju, Giseop Kim (DGIST, Daegu — Robotics & Mechatronics Engineering)
- **Type**: arXiv:2608.19059 [cs.RO]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.19059-lt-mem-volatility-aware-spatio-temporal-memory-f.pdf`
- **URL**: https://arxiv.org/abs/2608.19059
- **Retrieved**: 2026-08-20
- **Code**: none at ingest.

## Narrative

**Phase-0: SKIP robotics.** LT-Mem attacks "temporal amnesia" in long-horizon robot operation: a multi-session MASt3R-SLAM backbone supplies spatially aligned per-object observations, and a volatility-conditioned reasoning layer (deterministic evidence scoring E1–E5, constrained LLM only for ambiguity) selects overwrite / hold / multi-hypothesis updates into a **Tri-Memory** structure (Live / Delta / Meta). Evaluated on **LT-VQA** (multi-session recordings + persistent identity + temporal QA), with order-of-magnitude lower token cost.

The "spatio-temporal memory" here is robot map management, not a video-DiT attention cache or a world-model memory head. Image-gen `wont_wire`. No sibling ROUTE.

## Snippets

> "We propose LT-Mem, a volatility-aware memory evolution framework that unifies spatially aligned instance-level 3D perception with volatility-conditioned temporal reasoning."

[Source: arxiv-2608.19059, abstract]
