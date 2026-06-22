---
title: FreeStyle (community LoRA dual-reference)
type: entity
tags: [model, image-generation, lora, style-transfer, research, apache-2.0]
keywords: [FreeStyle, Blue2Giant, community LoRA mining, dual-reference, CRef SRef dataset]
related:
  - sources/arxiv-2606-20506-freestyle-community-lora-mining.md
  - concepts/style-content-dual-reference-generation.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/lora-taxonomy.md
  - entities/models/flux-1-dev.md
  - entities/models/pony-v6.md
  - entities/models/illustrious-xl.md
  - entities/models/qwen-image-2512.md
  - entities/marketplaces/civitai.md
  - entities/uis/comfyui.md
  - concepts/persona-consistency-methods.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-22
updated: 2026-06-22
phase_0_verdict: GO
phase_0_date: 2026-06-22
---

## Relations

@sources/arxiv-2606-20506-freestyle-community-lora-mining.md @concepts/style-content-dual-reference-generation.md @entities/marketplaces/civitai.md @entities/models/flux-1-dev.md

## Raw Concept

Entity from 2026-06-22 ingest — FreeStyle (arXiv:2606.20506). Code: https://github.com/Blue2Giant/FreeStyle

## Narrative

**FreeStyle** — dual-reference image gen trained on community-mined LoRA triplets.

| Field | Value |
|-------|-------|
| License | Apache-2.0 |
| Repo | `Blue2Giant/FreeStyle` — ~18★; active 2026-06-19 |
| Assets | Open datasets (~480K CRef+SRef + ~619K SRef); ComfyUI workflows in repo |
| Phase-0 | **GO** — code + data pipeline auditable |

**Status:** Evaluate inference weights release; dataset useful for LoRA taxonomy / persona style mining even before full model deploy.

## Snippets

> "Generate Cref+Sref triplet by comfyui workflow and validated lora, all lora meta information and workflow included in this repo." [Source: github.com/Blue2Giant/FreeStyle README (retrieved 2026-06-22)]

## Dead Ends

Model checkpoint availability separate from dataset — confirm HF before betting production persona pipeline on trained FreeStyle weights.
