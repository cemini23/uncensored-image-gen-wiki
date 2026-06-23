---
title: Universal composite diffusion conditioning (UNITY)
type: concept
tags: [concept, image-generation, adapter, composite-conditioning, controlnet]
keywords: [UNITY, MAF, universal adapter, multi-control, SDXL, specialization stage, constant complexity]
related:
  - sources/arxiv-2606-20971-unity-attention-flow-conditioning.md
  - entities/models/unity.md
  - entities/adapters/ip-adapter.md
  - concepts/persona-consistency-methods.md
  - concepts/reference-plus-lora-stacking.md
  - entities/models/pony-v6.md
  - entities/models/flux-1-dev.md
  - entities/marketplaces/civitai.md
  - entities/uis/comfyui.md
  - sources/synthetic-character-consistency-survey.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-23
updated: 2026-06-23
---

## Relations

@sources/arxiv-2606-20971-unity-attention-flow-conditioning.md @entities/models/unity.md @entities/adapters/ip-adapter.md @entities/uis/comfyui.md

## Raw Concept

Ingest 2026-06-23 from UNITY (arXiv:2606.20971) — one adapter for many spatial control modalities.

## Narrative

**Problem:** Training **separate ControlNet/IP-Adapter heads** per modality (depth, canny, seg) scales poorly in memory and ComfyUI graph complexity.

**UNITY approach:**

- **Universal stage** — shared cross-modal semantics (half budget)
- **Specialization stage** — modality refinement without architecture change (half budget)
- **MAF + Morph Wrapper** — flow-field alignment + attention fusion at constant complexity

**Persona ops angle:** Composite control (pose + depth + style ref) on **Pony/SDXL** graphs with one trained stack vs N adapter nodes.

## Snippets

> "This constant complexity formulation supports flexible operation under both single and composite conditioning settings."

## Dead Ends

Released code targets SD1.5/SDXL — FLUX composite conditioning still separate adapter ecosystem.
