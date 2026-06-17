---
title: Disentangled context memory for edited video (PermaVid)
type: concept
tags: [concept, video-generation, memory, video-editing, camera-control, consistency]
keywords: [PermaVid, RGB depth memory, edit-aware invalidation, global edit, local edit, viewpoint revisiting]
related:
  - sources/arxiv-2606-16449-permavid-disentangled-context-memory.md
  - entities/models/permavid.md
  - concepts/camera-controlled-video-generation.md
  - concepts/latent-spatial-memory-video-world-models.md
  - concepts/world-models-video-generation.md
  - entities/models/mirage.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-17
updated: 2026-06-17
---

## Relations

@sources/arxiv-2606-16449-permavid-disentangled-context-memory.md @entities/models/permavid.md @concepts/camera-controlled-video-generation.md @concepts/latent-spatial-memory-video-world-models.md

## Raw Concept

Ingest 2026-06-17 from PermaVid (arXiv:2606.16449) — RGB vs depth memory banks with edit-aware update/retrieval for camera-controlled video under edits.

## Narrative

**Failure mode of unified memory:** After a global style edit, entangled RGB+geometry caches are all suspect — models either revert to pre-edit look or discard useful geometry.

**PermaVid pattern:**

```
Semantic appearance (RGB bank)  ← fast-changing; full flush on global edit
Geometric structure (depth bank) ← stable; survives global style edits
Edit type → selective invalidation (global vs local region Ωe)
Pose-conditioned retrieval → fuse into DiT generation
```

**Relation to Mirage/DecMem:** Those methods optimize **exploration memory** for world models; PermaVid optimizes **edit persistence** when users change content mid-roam.

**Persona relevance:** Outfit/global style changes across a walkthrough set without breaking room layout consistency.

## Snippets

(See @sources/arxiv-2606-16449-permavid-disentangled-context-memory.md)

## Dead Ends

Requires PermaVid-trained pipeline — not drop-in for Wan I2V persona loops without significant integration.
