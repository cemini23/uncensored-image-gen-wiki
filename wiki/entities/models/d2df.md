---
title: D2DF (XJTU/Baidu — one-step video object removal)
type: entity
tags: [model, video-editing, object-removal, distillation, apache-2-0]
keywords: [D2DF, D2DF-DF, D2DF-DG, CogVideoX, PPCD, SGFP]
related:
  - sources/arxiv-2607-14976-d2df-one-step-video-object-removal.md
  - concepts/one-step-video-object-removal.md
  - entities/models/cogvideox-1-5.md
  - entities/models/wan-2-2.md
  - concepts/video-identity-inheritance.md
  - concepts/albedo-guided-instance-video-editing.md
  - concepts/task-isolated-unified-video-editing.md
  - sweeps/2026-07-17-daily.md
maturity: draft
created: 2026-07-17
updated: 2026-07-17
---

## Relations

@sources/arxiv-2607-14976-d2df-one-step-video-object-removal.md @concepts/one-step-video-object-removal.md @entities/models/cogvideox-1-5.md @entities/models/wan-2-2.md @concepts/video-identity-inheritance.md @concepts/albedo-guided-instance-video-editing.md @concepts/task-isolated-unified-video-editing.md

## Raw Concept

Entity from 2026-07-17 ingest of arXiv:2607.14976.

## Narrative

| Field | Value |
|-------|--------|
| Paper | arXiv:2607.14976 |
| Code | `github.com/bigD233/D2DF` — **Apache-2.0** |
| Weights | HF `BigD233333/D2DF` + CogVideoX-5B-I2V base |
| Local clone | `~/Desktop/projects/D2DF` (code-only, 2026-07-17) |

### Phase-0

**CONDITIONAL-GO** — clone + readme smoke path ready; do **not** download CogVideoX/D2DF weights until a CUDA RunPod session (exceeds 500 MB laptop budget).
