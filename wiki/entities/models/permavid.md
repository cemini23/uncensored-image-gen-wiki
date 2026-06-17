---
title: PermaVid (SJTU — edit-consistent video memory)
type: entity
tags: [model, video, memory, video-editing, camera-control, research]
keywords: [PermaVid, YS-IMTech, RGB depth memory, edit-aware, DiffSynth, camera-controlled]
related:
  - sources/arxiv-2606-16449-permavid-disentangled-context-memory.md
  - concepts/disentangled-context-memory-video-edits.md
  - concepts/camera-controlled-video-generation.md
  - concepts/latent-spatial-memory-video-world-models.md
  - concepts/world-models-video-generation.md
  - entities/models/mirage.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-17
updated: 2026-06-17
phase_0_verdict: CONDITIONAL-GO
phase_0_date: 2026-06-17
---

## Relations

@sources/arxiv-2606-16449-permavid-disentangled-context-memory.md @concepts/disentangled-context-memory-video-edits.md @concepts/camera-controlled-video-generation.md

## Raw Concept

Entity from 2026-06-17 ingest — PermaVid (arXiv:2606.16449). Code: https://github.com/YS-IMTech/PermaVid

## Narrative

**PermaVid** — disentangled RGB + depth context memory for consistent video under global/local edits.

| Field | Value |
|-------|-------|
| Repo | `YS-IMTech/PermaVid` — ~12★; pushed 2026-06-17 |
| License | No LICENSE file at audit |
| Stack | `diffsynth` training + inference scripts |
| Phase-0 | **CONDITIONAL-GO** — see `briefs/2026-06-17_phase-0-causalmotion-permavid.md` |

**Adopt when:** Camera-path world exploration with mid-session style/object edits; weights + license clarified.

## Snippets

(See @sources/arxiv-2606-16449-permavid-disentangled-context-memory.md)

## Dead Ends

Training-heavy — not a lightweight ComfyUI node at ingest.
