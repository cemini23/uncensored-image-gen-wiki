---
title: SQuad — sub-quadratic attention distillation for Wan 2.2 5B
type: entity
tags: [model, video, wan, attention, distillation, efficiency, watch]
keywords: [SQuad, DMD2, Wan 2.2 5B, O(n√n), NFE 6, Qualcomm]
related:
  - sources/arxiv-2608-16585-squad-attention-distillation.md
  - entities/models/wan-2-2.md
  - entities/models/token-radius-attention.md
  - entities/models/spade.md
  - concepts/budget-aware-diffusion-caching.md
  - concepts/context-matched-video-distillation.md
  - sweeps/2026-08-18-daily.md
maturity: draft
created: 2026-08-18
updated: 2026-08-18
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-16585-squad-attention-distillation.md @entities/models/wan-2-2.md @entities/models/token-radius-attention.md @entities/models/spade.md @concepts/budget-aware-diffusion-caching.md @concepts/context-matched-video-distillation.md @sweeps/2026-08-18-daily.md

## Raw Concept

Phase-0 from arXiv:2608.16585. Distill Wan 2.2 5B full-softmax Self-Attention into an O(n√n) SQuad-Attention plus 6-NFE sampling via SFT + DMD2.

## Narrative

| Field | Value |
|-------|-------|
| Org | Qualcomm AI Research (Karnewar / Korzhenkov / Habibian / Ghafoorian) |
| Teacher | Wan 2.2 5B T2V, full softmax, 100 NFE |
| Student attn | Local `O(√n)` windows + global across windows = `O(n√n)`, true softmax throughout |
| Recipe | Flow-Matching SFT → DMD2 (quality + fewer steps) |
| VBench | 83.08 → **83.20** |
| Attn latency | 47.10 ms → **4.27 ms** (~11×) |
| Attn TFLOPs | 4.205 → 0.063 (~67×) |
| NFE | 100 → **6** |
| E2E DiT | ~2× faster |
| Code | none. Do not hunt Qualcomm internals |
| Phase-0 | **WATCH HIGH** efficiency |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Siblings: Token-Radius / SPADE skip tokens at inference; ReCache / BudCache skip by reuse; CMD / ForgeWM match the student's information set while cutting steps. SQuad changes the **kernel** and the **step count**. Watch for an open reimplementation before any Wan 5B local trial.

## Snippets

> "SQuad factorizes it into a local pass within O(√n) windows followed by a global pass across the windows, giving a full receptive field at O(n√n) complexity with a true softmax throughout."

[Source: arxiv-2608.16585, Fig. 2 caption]
