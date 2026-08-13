---
title: XYZFlow — multidimensional shortcut flows for efficient image gen (CUHK/Westlake/JHU)
type: entity
tags: [t2i, image-generation, flow-matching, efficiency, watch]
keywords: [XYZFlow, shortcut flows, temporal scaling, spatial scaling, next-shortcut-prediction, few-step, spherelab]
related:
  - sources/arxiv-2608-12276-xyzflow.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/uis/comfyui.md
maturity: draft
created: 2026-08-13
updated: 2026-08-13
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-12276-xyzflow.md @concepts/budget-aware-diffusion-caching.md @entities/uis/comfyui.md

## Raw Concept

Phase-0 from arXiv:2608.12276. Few-step T2I by scaling flow matching along two dimensions — temporal (non-Markovian denoising-history conditioning) and spatial (Next Shortcut Prediction over patches) — instead of teacher distillation.

## Narrative

| Field | Value |
|-------|-------|
| Org | CUHK (Weiyang Liu) + Westlake + JHU |
| Method | Multidimensional shortcut flows: temporal scaling + spatial scaling (Next Shortcut Prediction) |
| Results | 7.2–8.5× teacher speedups, competitive FID; better quality-latency than scaling/step-cut |
| Project | spherelab.ai/xyzflow |
| Code | github.com/Sphere-AI-Lab/xyzflow — real code (~34 MB), **no LICENSE → no SPDX** |
| Phase-0 | **WATCH** |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Code is runnable-shaped (train_xyzflow_teacher_student.py, sampling, eval) but license-gated and CUDA-DDP-centric. If SPDX lands as open, it joins the ComfyUI few-step efficiency cluster (vs ReCache / distillation concepts). No pretrained weights visible in repo.

## Snippets

_(none)_
