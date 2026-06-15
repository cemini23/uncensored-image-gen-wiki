---
title: AnchorEdit (JD / USTC — causal multi-turn image editor)
type: entity
tags: [model, image-editing, multi-turn, autoregressive, wan, research]
keywords: [AnchorEdit, multi-turn image editing, causal memory, Wan2.1-T2V-14B, xuhang07, JD Explore Academy]
related:
  - sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md
  - concepts/causal-multi-turn-image-editing.md
  - entities/models/wan-2-2.md
  - entities/adapters/flux-kontext.md
  - concepts/persona-consistency-methods.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-15
updated: 2026-06-15
---

## Relations

@sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md @concepts/causal-multi-turn-image-editing.md @entities/models/wan-2-2.md @entities/adapters/flux-kontext.md

## Raw Concept

Entity from 2026-06-15 ingest — AnchorEdit (arXiv:2606.11751). Code: https://github.com/xuhang07/AnchorEdit

## Narrative

**AnchorEdit** — AR diffusion multi-turn image editor finetuned from **Wan2.1-T2V-14B**. 1024p native; 4-step distilled inference variant; 10+ turn stability via causal memory.

| Spec | Value |
|------|-------|
| Code license | Apache-2.0 `[CONFIRMED]` |
| Weights | Wan2.1 research terms — separate from code |
| VRAM | ≥40 GB stated in README |
| Phase-0 | **CONDITIONAL-GO** — see `briefs/2026-06-15_phase-0-budcache-anchoredit.md` |

**Status:** Training code released 2026-06-11; pretrained AnchorEdit checkpoints `[NEEDS VERIFICATION 2026-06-15]`. Not laptop build-track.

## Snippets

(See @sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md)

## Dead Ends

Persona operator without A100/H100 should stay on FLUX Kontext single-turn chain until distilled smaller checkpoint or ComfyUI workflow ships.
