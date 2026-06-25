---
title: TinyHistory — lightweight AR video history encoder
type: entity
tags: [entity, video-generation, long-horizon, memory, stanford]
keywords: [TinyHistory, history embedding, Wan 2.1, HunyuanVideo, two-stage context learning]
related:
  - sources/arxiv-2512-23851-tinyhistory-lightweight-video-history.md
  - concepts/lightweight-video-history-embeddings.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - concepts/long-video-rag-retrieval.md
maturity: draft
created: 2026-06-25
updated: 2026-06-25
---

## Relations

@sources/arxiv-2512-23851-tinyhistory-lightweight-video-history.md @concepts/lightweight-video-history-embeddings.md @entities/models/wan-2-2.md

## Raw Concept

Entity for **TinyHistory** (arXiv:2512.23851) — Stanford/MIT lightweight history encoder for AR video DiTs.

## Narrative

| Attribute | Value |
|-----------|-------|
| **Paper** | arXiv:2512.23851 |
| **Backbones tested** | Wan 2.1 14B, HunyuanVideo 12.8B @ 480p |
| **Code/weights** | Not public at ingest |
| **Phase-0** | **Skipped** — no repo |

### Build-track status

Watchlist for persona long-video + laptop finetune scenarios. Re-evaluate when code drops with Wan 2.2 compatibility.

## Snippets

> "Lightweight history embedding learned through two-stage context learning."

## Dead Ends

None until release fails.
