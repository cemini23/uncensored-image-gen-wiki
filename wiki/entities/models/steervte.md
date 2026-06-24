---
title: SteerVTE — video text editing adapter
type: entity
tags: [entity, video-editing, text-rendering, bytedance]
keywords: [SteerVTE, SteerVTE-1M, Text Context Adapter, glyph control, ByteDance, PKU]
related:
  - sources/arxiv-2606-23254-steervte-video-text-editing.md
  - concepts/video-text-editing-glyph-control.md
  - entities/models/wan-2-2.md
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
maturity: draft
created: 2026-06-24
updated: 2026-06-24
---

## Relations

@sources/arxiv-2606-23254-steervte-video-text-editing.md @concepts/video-text-editing-glyph-control.md

## Raw Concept

Entity for **SteerVTE** (arXiv:2606.23254) — ByteDance/PKU video text editing via frozen DiT + Text Context Adapter.

## Narrative

| Attribute | Value |
|-----------|-------|
| **Paper** | arXiv:2606.23254 |
| **Base** | Frozen text-to-video DiT (unspecified open checkpoint at ingest) |
| **Adapter** | Style encoder + line/char glyph encoders |
| **Training data** | SteerVTE-1M auto-synthesized triplets |
| **Code/weights** | Not public at ingest |
| **Phase-0** | **Skipped** — no repo |

### Claims vs baselines

Outperforms VIVA, Kiwi-Edit, UniVideo on text accuracy/style/temporal metrics; beats Seedance 2.0 on sentence accuracy in paper eval `[TENTATIVE]`.

### Build-track status

Research reference for subtitle/branded-text Reel edits — no local adoption path until open release.

## Snippets

> "Lightweight text context adapter with two complementary modules: a style encoder… and dual-granularity glyph encoders."

## Dead Ends

Proprietary ByteDance — expect cloud/API first if ever productized.
