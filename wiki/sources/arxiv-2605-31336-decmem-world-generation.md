---
title: "DecMem — Minute-Long Consistent World Generation (arXiv:2605.31336)"
type: source
tags: [paper, world-model, video-generation, long-horizon, memory, kling]
keywords: [DecMem, decoupled memory, sparse global memory, anchored local memory, minute-scale video, world generation, revisit consistency, Kling]
related:
  - concepts/world-models-video-generation.md
  - entities/models/decmem.md
  - entities/models/sana-wm.md
  - entities/models/wan-2-2.md
  - sources/sana-wm-minute-scale-world-model.md
  - sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md
maturity: draft
read_status: read
created: 2026-06-03
updated: 2026-06-03
---

## Relations

@concepts/world-models-video-generation.md @entities/models/decmem.md @entities/models/sana-wm.md @entities/models/wan-2-2.md @sources/sana-wm-minute-scale-world-model.md

## Raw Concept

- **Title**: DecMem: Towards Minute-Long Consistent World Generation with Decoupled Memory
- **Authors**: Zhenhao Yang, Xiaoshi Wu, Zhengyao Lv, Xiaoyu Shi, Xintao Wang, Pengfei Wan, Kun Gai, Kwan-Yee K. Wong (HKU + Kling Team, Kuaishou)
- **Type**: arXiv:2605.31336
- **Location**: `raw-sources/arxiv-2605.31336-decmem-towards-minute-long-consistent-world-gene.pdf`
- **URL**: https://arxiv.org/abs/2605.31336
- **Retrieved**: 2026-06-03
- **Read status**: read (abstract + intro)
- **Project**: https://jeffreyyzh.github.io/DecMem-Page

## Narrative

Long-horizon **controllable world generation** with fine-grained spatio-temporal consistency. Identifies two failure modes of naïve learnable memory at long extrapolation: **computational inefficiency** and **attention dispersion**.

**DecMem architecture** — decoupled memory:

| Component | Role |
|-----------|------|
| **Sparse Global Memory** | Efficient fine-grained access to full history |
| **Anchored Local Memory** | Stable, high-quality extrapolation |

Contrasts with **explicit 3D memory** (bounded by 3D estimator quality, overhead) and early **implicit frame-level memory** (sliding windows, attention sinks). Targets **revisit scenarios** where models fail to recall prior scenes as inference extends — core world-model consistency requirement per @concepts/world-models-video-generation.md.

Claims minute-level controllable long video with high fidelity; SOTA vs prior methods in paper benchmarks `[TENTATIVE]` (single-source until independent eval).

### Workspace relevance

Industrial world-model signal from **Kling Team** (same org as Kwai Kolors lineage). Research reference for persona **explorable environments** and long-form identity-stable rolls — not open weights as of ingest date `[NEEDS VERIFICATION 2026-06-03]`. Complements open **SANA-WM** (@entities/models/sana-wm.md) on the memory-architecture axis.

## Snippets

> "We move beyond explicit 3D memory and coarse frame-level implicit modeling, and propose a fine-grained, learnable, and scalable memory for consistent world generation."

> "DecMem employs Sparse Global Memory for efficient fine-grained access to global history and Anchored Local Memory for stable and high-quality extrapolation."

## Dead Ends

Kling/Kuaishou industrial stack — no confirmed local weights or ComfyUI nodes at ingest. Wait for open release or API access before build-track promotion.
