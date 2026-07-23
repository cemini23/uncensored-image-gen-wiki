---
title: HOMIE (HKUST — human-object video personalization on Wan2.1)
type: entity
tags: [model, video-generation, personalization, wan, apache-2-0]
keywords: [HOMIE, HOCVP, Wan2.1-T2V-14B, Qwen3-VL, subject-driven]
related:
  - concepts/persona-consistency-methods.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/video-identity-inheritance.md
  - entities/models/filmworld.md
  - entities/models/vera-identity-s2v.md
  - entities/models/wan-2-2.md
  - entities/uis/comfyui.md
  - sources/arxiv-2607-18217-homie-video-personalization.md
  - sources/arxiv-2607-19038-filmworld-novel-to-film.md
  - sources/arxiv-2607-20174-streamhoi.md
  - sources/arxiv-2607-20247-vera-identity-faithful-s2v.md
  - sweeps/2026-07-21-daily.md
  - sweeps/2026-07-23-daily.md
maturity: draft
created: 2026-07-21
updated: 2026-07-23
---

## Relations

@sources/arxiv-2607-18217-homie-video-personalization.md @concepts/persona-consistency-methods.md @concepts/video-identity-inheritance.md @entities/models/wan-2-2.md

## Raw Concept

Entity from 2026-07-21 Phase-0 of arXiv:2607.18217 / github.com/YIYANGCAI/HOMIE.

## Narrative

| Field | Value |
|-------|--------|
| Paper | arXiv:2607.18217 |
| Code | `github.com/YIYANGCAI/HOMIE` — **Apache-2.0** |
| Weights | HF `yychai/homie-r2v-wan2.1` + Wan2.1-T2V-14B Diffusers + Qwen3-VL-2B-Thinking |
| Local clone | `~/Desktop/projects/HOMIE` (~22 MB, 2026-07-21) |
| Base | Wan2.1-T2V-14B |

### Phase-0

**CONDITIONAL-GO (code only)** — clone + read `infer.sh` / `generate.py`. Do **not** download Wan/HOMIE/Qwen weights onto laptop (>>500 MB). Next CUDA session: product-hold / prop-interaction persona smoke vs plain Wan I2V.

## Dead Ends

- ComfyUI node: not shipped; CLI/diffusers path only for now.
