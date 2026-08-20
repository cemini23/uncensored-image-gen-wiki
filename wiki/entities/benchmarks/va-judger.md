---
title: VA-Judger — joint video-audio reward model + VAPref-10K
type: entity
tags: [benchmark, reward-model, audio-video, rl, ltx, watch]
keywords: [VA-Judger, VAPref-10K, VA-Judger-Bench, LTX-2 RL, OmniNFT]
related:
  - concepts/multi-shot-audio-video-evaluation.md
  - concepts/persona-audio-stack.md
  - entities/models/ltx-2.md
  - sources/arxiv-2608-18607-va-judger.md
  - sweeps/2026-08-20-daily.md
maturity: draft
created: 2026-08-20
updated: 2026-08-20
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-18607-va-judger.md @concepts/multi-shot-audio-video-evaluation.md @entities/models/ltx-2.md @concepts/persona-audio-stack.md @sweeps/2026-08-20-daily.md

## Raw Concept

Entity from 2026-08-20 ingest. First RM for joint AV gen. **No clone** (null SPDX / no LICENSE).

## Narrative

Omni CoT reward model trained on human pairwise AV preference, not a linear combo of VideoAlign/HPSv3/Audiobox/CLAP/DeSync. Dataset VAPref-10K; bench VA-Judger-Bench (ID + OOD closed AV models). Used as RL reward on **LTX-2**.

| Stack | Role |
| --- | --- |
| MSAVBench | Multi-shot AV eval prompts — complementary, not a substitute RM |
| LTX-2 | Open AV generator the paper post-trains |
| OmniNFT | Metric-stitched RL foil (reward hacking) |

**WATCH.** `ShareLab-SII/VA-Judger` not cloned. Dataset not downloaded. `wire_status: deferred`.

## Snippets

_(see source page)_
