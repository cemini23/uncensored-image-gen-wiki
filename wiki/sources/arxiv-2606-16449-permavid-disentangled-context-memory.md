---
related:
  - concepts/disentangled-context-memory-video-edits.md
  - entities/models/permavid.md
  - concepts/camera-controlled-video-generation.md
  - concepts/latent-spatial-memory-video-world-models.md
  - concepts/world-models-video-generation.md
  - entities/models/mirage.md
  - sources/video-generation-survey-2026.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-06-17-daily.md
  - concepts/causal-clip-attention-long-video.md
  - sources/arxiv-2606-22370-error-free-long-video-generation.md
title: "PermaVid — disentangled context memory for edited video (arXiv:2606.16449)"
type: source
tags: [paper, video-generation, memory, video-editing, camera-control, consistency]
keywords: [PermaVid, RGB memory, depth memory, edit-aware retrieval, global edits, local edits, camera-controlled, SJTU, Stanford, NTU]
maturity: draft
read_status: read
created: 2026-06-17
updated: 2026-06-24
---

## Relations

@concepts/disentangled-context-memory-video-edits.md @entities/models/permavid.md @concepts/camera-controlled-video-generation.md @concepts/latent-spatial-memory-video-world-models.md

## Raw Concept

- **Title**: PermaVid: Consistent Video Generation Across Edits via Disentangled Context Memory
- **Authors**: Shuai Yang, Bingjie Gao, Ziwei Liu, Jiaqi Wang, Dahua Lin, Tong Wu (SJTU, Stanford, NTU, CUHK, SII)
- **Type**: arXiv:2606.16449
- **Location**: `raw-sources/arxiv-2606.16449-permavid-consistent-video-generation-across-edit.pdf`
- **URL**: https://arxiv.org/abs/2606.16449 · https://ys-imtech.github.io/projects/PermaVid · https://github.com/YS-IMTech/PermaVid
- **Retrieved**: 2026-06-17
- **Read status**: read (abstract + memory design)

## Narrative

**Problem:** Camera-controlled video + editing breaks unified memory — after style/object edits, stale RGB context causes **reversion to pre-edit** appearance when revisiting viewpoints.

**PermaVid** disentangles spatial context:

| Memory bank | Stores | Update on global edit | Update on local edit |
|-------------|--------|----------------------|----------------------|
| **RGB** | Semantic appearance (+ implicit geometry) | Invalidate all RGB; bump global semantic version | Invalidate overlapping view footprints only |
| **Depth** | Geometry-only structure | Retain (geometry stable) | Regional invalidation if geometry changes |

**Generation:** DiT blocks fuse mixed-modality memory references under target camera poses + edit instructions.

**Repo:** `YS-IMTech/PermaVid` — code + `diffsynth` training/inference; no LICENSE at Phase-0 audit.

### Workspace relevance

Interactive **world roaming + live edits** (style swap, object replace) without losing cross-view consistency — extends memory WM cluster (@concepts/latent-spatial-memory-video-world-models.md) with **edit-aware invalidation**. Persona sets: change outfit globally while preserving room geometry across camera paths.

## Snippets

> "Spatial context can be decomposed into two fundamentally different components—semantic appearance and geometric structure."

> "For a global edit, all previously stored RGB contexts become semantically outdated, so PermaVid invalidates the RGB memory… The depth memory is retained because the scene geometry remains valid."

## Dead Ends

Training stack required — not training-free. Weights/license TBD. Distinct from single-shot I2V persona clips.
