---
title: "Phantom Gains self-improvement audit (arXiv:2608.20290) — routed CCC"
type: source
tags: [paper, skip, routed, eval, self-improvement]
keywords: [Phantom Gains, measured null, LoRA self-training, Qwen3-8B, Apache-2.0]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-21-daily.md
maturity: draft
read_status: read
created: 2026-08-21
updated: 2026-08-21
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@sweeps/2026-08-21-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: Phantom Gains: Auditing Self-Improvement Against a Measured Null
- **Authors**: Cheng Xu, Nan Yan, Liming Chen, M-Tahar Kechadi (UCD / Georgia Tech / DUT)
- **Type**: arXiv:2608.20290 [cs.AI]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.20290-phantom-gains-auditing-self-improvement-against.pdf`
- **URL**: https://arxiv.org/abs/2608.20290
- **Code**: `chengxuphd/phantom-gains` **Apache-2.0 CONFIRMED** (LICENSE file). **Not cloned in Image-gen.**
- **Retrieved**: 2026-08-21

## Narrative

**Phase-0: SKIP gen / ROUTE CCC.** Audits rank-32 LoRA self-training on Qwen3-8B against a frozen control in the same pipeline. Seven measurement failures each invert a reported finding when the control is absent (greedy-decode ledgers, inference-batching artifacts, expansion statistics with non-zero nulls). Distillation acquires rare problems; three self-training arms do not; self-training corrupts baseline-solved items above the measured floor.

Harness-relevant (measured null for self-improve claims; pairs CCC K162 closed self-eval / K277 measurement integrity). Brief: `briefs/2026-08-21_phantom-gains-from-image-gen.md`. Do not clone the Apache-2.0 audit kit onto this wiki laptop. Image-gen `wont_wire`.

## Snippets

> "Auditing three rounds of rank-32 LoRA self-training on Qwen3-8B against a frozen control pushed through the identical pipeline, we identify seven measurement failures, each of which inverts a reported finding when its control is absent."

[Source: arxiv-2608.20290, abstract]
