---
title: ComfyUI LoRA Optimizer (ethanfel)
type: entity
tags: [entity, custom-nodes, comfyui, lora, workflow]
keywords: [LoRA Optimizer, LoRA Stack, AutoTuner, multi-LoRA merge, ethanfel, GPL-3.0]
related:
  - entities/uis/comfyui.md
  - concepts/persona-consistency-methods.md
  - concepts/model-selection-workflow.md
  - concepts/persona-ops-stack.md
  - sweeps/2026-06-27-daily.md
maturity: draft
created: 2026-06-27
updated: 2026-06-27
---

## Relations

@entities/uis/comfyui.md @concepts/persona-consistency-methods.md

## Raw Concept

Entity for **ComfyUI-LoRA-Optimizer** — multi-LoRA conflict resolution custom node (sweep R1, 2026-06-27).

## Narrative

| Attribute | Value |
|-----------|-------|
| **Repo** | `ethanfel/ComfyUI-LoRA-Optimizer` |
| **License** | **GPL-3.0** |
| **Stars** | ~118 (2026-06-27) |
| **Last push** | 2026-06-27 |
| **Phase-0** | **CONDITIONAL-GO** — `briefs/2026-06-27_phase-0-navicache-lora-optimizer-confucius4.md` |

### Capabilities

**LoRA Stack (Dynamic)** + **LoRA Optimizer** nodes — per-layer conflict analysis, automatic strength adjustment, optional **AutoTuner**. ComfyUI Manager installable.

### Persona ops mapping

Pony/FLUX persona graphs often stack identity + style + pose LoRAs — reduces oversaturation artifacts without manual merge tuning.

## Snippets

> "Automatically figures out the best way to combine your LoRAs — analyzing where they conflict."

## Dead Ends

GPL-3.0 — fine for local laptop; caution if bundling into distributed SaaS.
