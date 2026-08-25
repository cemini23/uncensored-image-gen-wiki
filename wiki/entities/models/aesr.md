---
title: AESR — agentic enhancement + semantic repair for ID T2V
type: entity
tags: [model, video, identity, agentic, watch]
keywords: [AESR, IPVG, Seedance2, playbook, VLM repair]
related:
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - entities/benchmarks/personashot.md
  - entities/models/seedance-2.md
  - sources/arxiv-2608-20749-aesr.md
  - sweeps/2026-08-24-daily.md
maturity: draft
created: 2026-08-25
updated: 2026-08-25
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-20749-aesr.md @concepts/video-identity-inheritance.md @concepts/persona-consistency-methods.md @entities/models/seedance-2.md @entities/benchmarks/personashot.md @sweeps/2026-08-24-daily.md

## Raw Concept

Entity from 2026-08-25 ingest of arXiv:2608.20749. Cloud-API playbook loop. No SPDX clone.

## Narrative

Prompt-playbook + VLM segment repair around Seedance-class ID T2V. Ranked 1st IPVG 2026 Track 1.

| Check | Result |
| --- | --- |
| Code | `oceanflowlab/AESR` — **no LICENSE**. **Not cloned.** |
| Runtime | Closed APIs (Seedance2 / Ark). Needs `.env` provider keys |
| vs PersonaShot | PersonaShot *scores* multi-shot ID continuity; AESR *repairs* ID T2V via agents |
| Production | Wan + identity adapters / LatentSync unchanged |

**Phase-1:** none (`deferred`). Re-check when SPDX lands.

## Snippets

_(see source page)_
