---
title: Vera — layered content-preserving video editor
type: entity
tags: [entity, video-editing, layered-diffusion, netflix, compositing]
keywords: [Vera, Netflix, alpha matte, MoT, content preservation]
related:
  - concepts/layered-diffusion-content-preserving-video-editing.md
  - entities/models/vera-identity-s2v.md
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - sources/arxiv-2606-23610-vera-layered-content-preserving-video-editing.md
  - sources/arxiv-2607-20247-vera-identity-faithful-s2v.md
maturity: draft
created: 2026-06-26
updated: 2026-07-23
---

## Relations

@sources/arxiv-2606-23610-vera-layered-content-preserving-video-editing.md @concepts/layered-diffusion-content-preserving-video-editing.md

## Raw Concept

Entity for **Vera** (arXiv:2606.23610) — Netflix layered diffusion video editor.

## Narrative

**Name collision note (2026-07-23):** Kuaishou identity-faithful S2V is `@entities/models/vera-identity-s2v.md` (arXiv:2607.20247) — not this Netflix layered editor.


| Attribute | Value |
|-----------|-------|
| **Paper** | arXiv:2606.23610 |
| **Project** | https://vera-layered-diffusion.github.io/ |
| **Training data** | 486K layered frames |
| **Code/weights** | Not public at ingest |
| **Phase-0** | **Skipped** — no repo |

### Build-track status

Watchlist for non-destructive persona clip editing (background/object VFX). Re-evaluate on any open-weight release.

## Snippets

> "Mixture-of-Transformers architecture, with separate DiTs for each layer that interact through joint self-attention."

## Dead Ends

Netflix proprietary stack at ingest.
