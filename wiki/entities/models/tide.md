---
title: TIDE (unified LTX-2.3 video editor)
type: entity
tags: [model, video-editing, ltx, unified-model, research]
keywords: [TIDE, LTX-2.3, Bilibili, ZJU, task-isolated diffusion, per-token embeddings, OpenVE-Bench]
related:
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - concepts/task-isolated-unified-video-editing.md
  - entities/models/ltx-2.md
  - entities/models/javedit.md
  - entities/models/albedoedit.md
  - concepts/joint-audio-visual-instruction-editing.md
  - concepts/albedo-guided-instance-video-editing.md
  - concepts/sync-audio-video-customization.md
  - sources/arxiv-2606-01362-albedoedit-video-editing.md
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
maturity: draft
created: 2026-06-10
updated: 2026-06-10
---

## Relations

@sources/arxiv-2606-08260-tide-unified-video-editing.md @concepts/task-isolated-unified-video-editing.md @entities/models/ltx-2.md

## Raw Concept

Entity stub from 2026-06-10 ingest — TIDE unified video edit/gen model on LTX-2.3.

## Narrative

**TIDE** — 14B DiT finetune on LTX-2.3 with per-token task embeddings + dual-path (Gemma-3 + VAE) conditioning. One checkpoint for instruction edit, reference edit, multi-reference generation.

**Status:** research / adoption candidate. Project page: https://LittleWork123.github.io/tide `[NEEDS VERIFICATION 2026-06-10]` on weights, license, NSFW posture, ComfyUI nodes.

→ @concepts/task-isolated-unified-video-editing.md for mechanism detail.

## Snippets

(See @sources/arxiv-2606-08260-tide-unified-video-editing.md)

## Dead Ends

Visual-only — no joint audio path vs @entities/models/javedit.md.
