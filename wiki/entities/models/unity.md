---
title: UNITY (universal composite conditioning adapter)
type: entity
tags: [model, adapter, image-generation, research, sdxl, sd15, composite-conditioning]
keywords: [UNITY, arya-domain, MAF Network, Morph Wrapper, ECCV 2026, canny depth scribble]
related:
  - sources/arxiv-2606-20971-unity-attention-flow-conditioning.md
  - concepts/universal-composite-diffusion-conditioning.md
  - entities/adapters/ip-adapter.md
  - concepts/persona-consistency-methods.md
  - entities/models/pony-v6.md
  - entities/models/flux-1-dev.md
  - entities/marketplaces/civitai.md
  - entities/uis/comfyui.md
  - sources/synthetic-character-consistency-survey.md
  - sources/video-generation-survey-2026.md
  - concepts/reference-plus-lora-stacking.md
maturity: draft
created: 2026-06-23
updated: 2026-06-23
phase_0_verdict: CONDITIONAL-GO
phase_0_date: 2026-06-23
---

## Relations

@sources/arxiv-2606-20971-unity-attention-flow-conditioning.md @concepts/universal-composite-diffusion-conditioning.md @entities/adapters/ip-adapter.md @entities/uis/comfyui.md

## Raw Concept

Entity from 2026-06-23 ingest — UNITY (arXiv:2606.20971). Code: https://github.com/arya-domain/UNITY

## Narrative

**UNITY** — universal composite conditioning adapter for frozen **SD 1.5 / SDXL**.

| Field | Value |
|-------|-------|
| License | **Unknown** — no LICENSE file in repo at audit |
| Repo | `arya-domain/UNITY` — 0★; pushed 2026-06-18; ECCV 2026 code |
| Backbones | SD1.5 + SDXL training scripts |
| Phase-0 | **CONDITIONAL-GO** — audit code before production; confirm license |

**Status:** Evaluate Phase-1/2 training on Pony-class SDXL before ComfyUI workflow adoption.

## Snippets

> "UNITY is a universal adapter framework that enables controllable image generation from multiple spatial conditioning signals using a single unified model." [Source: github.com/arya-domain/UNITY README (retrieved 2026-06-23)]

## Dead Ends

No FLUX port; license gap blocks unconditional adoption.
