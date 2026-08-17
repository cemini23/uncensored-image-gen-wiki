---
title: Hybrid-policy self-distillation for TI2V (HPSD)
type: concept
tags: [concept, video-generation, ti2v, self-distillation, distillation, teacher-student]
keywords: [HPSD, hybrid-policy self-distillation, TI2V, I2V capability internalization, off-policy, on-policy, base T2V quality]
related:
  - sources/arxiv-2608-13205-hpsd.md
  - concepts/score-gradient-matching-video-distillation.md
  - concepts/parallel-decoding-distillation.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - sweeps/2026-08-14-daily.md
  - entities/models/forgewm.md
  - sources/arxiv-2608-14022-forgewm.md
maturity: draft
created: 2026-08-14
updated: 2026-08-17
---

## Relations

@sources/arxiv-2608-13205-hpsd.md @concepts/score-gradient-matching-video-distillation.md @concepts/parallel-decoding-distillation.md @entities/models/wan-2-2.md @entities/models/hunyuanvideo-1-5.md @sweeps/2026-08-14-daily.md

## Raw Concept

Concept from 2026-08-14 ingest of arXiv:2608.13205. TI2V model self-distillation — internalize I2V-mode quality into base T2V generation.

## Narrative

**Problem:** TI2V models generate far better video given a high-quality first frame (I2V) than from text alone (T2V). Why not internalize the privileged-condition capability into the model's own base generation ability?

**Failure of naive SFT:** supervised fine-tuning is **off-policy** — supervision is confined to teacher-generated endpoints from a fixed offline distribution, so the student only imitates what the teacher already emits under those conditions.

**HPSD pattern (per paper):** a **hybrid-policy self-distillation** that mixes on-policy + off-policy supervision to close the gap — the student learns from its own rollout conditions as well as the teacher's fixed endpoints, letting the base (T2V) mode inherit I2V-conditioned quality.

Joins the distillation cluster (`score-gradient-matching`, `parallel-decoding-distillation`, `one-step-autoregressive-video-distillation`), but the **capability-internalization** framing is distinct: it upgrades base-mode quality, not just inference speed. Watch for repo/weights to validate against Wan/HunyuanVideo TI2V stacks.

## Snippets

> "Can the capability elicited by such privileged conditions be internalized into the model's own base generation ability?"

_[Source: arxiv-2608.13205, abstract]_
