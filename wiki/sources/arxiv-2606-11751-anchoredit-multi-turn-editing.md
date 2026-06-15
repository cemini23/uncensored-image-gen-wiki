---
title: "AnchorEdit — causal multi-turn image editing (arXiv:2606.11751)"
type: source
tags: [paper, image-editing, multi-turn, autoregressive, video-prior, wan, consistency]
keywords: [AnchorEdit, multi-turn editing, causal memory, self-rollout, diffusion forcing, RoPE extrapolation, identity drift, JD Explore Academy, USTC]
related:
  - concepts/causal-multi-turn-image-editing.md
  - entities/models/anchoredit.md
  - entities/models/wan-2-2.md
  - entities/adapters/flux-kontext.md
  - concepts/persona-consistency-methods.md
  - concepts/two-pass-generation-workflow.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-15-daily.md
maturity: draft
read_status: read
created: 2026-06-15
updated: 2026-06-15
---

## Relations

@concepts/causal-multi-turn-image-editing.md @entities/models/anchoredit.md @entities/models/wan-2-2.md @entities/adapters/flux-kontext.md

## Raw Concept

- **Title**: AnchorEdit: Maintaining Temporal Consistency in Multi-turn Image Editing via Causal Memory
- **Authors**: Hang Xu et al. (USTC + JD Explore Academy)
- **Type**: arXiv:2606.11751
- **Location**: `raw-sources/arxiv-2606.11751-anchoredit-maintaining-temporal-consistency-in-m.pdf`
- **URL**: https://arxiv.org/abs/2606.11751 · https://github.com/xuhang07/AnchorEdit
- **Retrieved**: 2026-06-15
- **Read status**: read (abstract + three-stage training + inference memory)

## Narrative

**Problem:** Multi-turn NL image editing (iterative refine) suffers **identity drift** and error accumulation. Video-prior methods (ChronoEdit, CoF-T2I, VINCIE) use **bidirectional** attention — misaligned with causal interactive editing where turn t cannot see future instructions.

**AnchorEdit:** First **autoregressive diffusion** framework for **1024p long-horizon** multi-turn editing on a video backbone.

### Three-stage training

| Stage | Goal | Key mechanisms |
|-------|------|----------------|
| 1 — Single-turn pretrain | Identity-preserving editor | Two-frame sequence (source→edit); **expanded RoPE stride** S>1 for discrete edits; **identity mapping** loss (null instruction reconstructs source) |
| 2 — Causal multi-turn | Sequential consistency | Frame-level causal mask; **synthetic degradation** on history; **self-rollout** (replace GT history with model preds); temporally-progressive loss weights |
| 3 — Distillation | Speed | Adversarial consistency distillation → **4-step** generator |

### Inference memory

- Anchor **initial frame** as global identity reference
- **Sliding-window** historical KV cache
- **Manifold-constrained RoPE** — indices stay within trained range regardless of sequence length
- Stable **10+ interaction rounds** claimed

**Backbone:** Wan2.1-T2V-14B (per released code). New multi-turn editing benchmark at 1024p with varied sequence depths.

### Workspace relevance

Fills gap vs **single-turn** @entities/adapters/flux-kontext.md in persona img2img loops (@concepts/two-pass-generation-workflow.md). Build-track blocked by **40GB+ VRAM** and Wan finetune cost — watch weights release `[NEEDS VERIFICATION 2026-06-15]`.

## Snippets

> "Each edit should depend only on the source image and previous states, whereas earlier results cannot incorporate future instructions."

> "We are the first to introduce self-rollout forcing and historical memory mechanisms into the multi-turn editing paradigm."

## Dead Ends

Not a de-censoring path — inherits Wan base moderation. Too heavy for laptop-only operator today; research reference for multi-turn persona edit pipelines.
