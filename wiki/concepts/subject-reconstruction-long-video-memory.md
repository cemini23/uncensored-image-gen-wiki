---
title: Subject-reconstruction long-video memory (Memento)
type: concept
tags: [concept, video-generation, long-horizon, memory, subject-consistency, identity]
keywords: [Memento, subject reconstruction, dual-query memory, identity grounding, shot-level AR, long-form video]
related:
  - sources/arxiv-2606-14667-memento-long-video-subject-reconstruction.md
  - entities/models/memento.md
  - concepts/long-video-rag-retrieval.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - concepts/world-models-video-generation.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-17
updated: 2026-06-17
---

## Relations

@sources/arxiv-2606-14667-memento-long-video-subject-reconstruction.md @entities/models/memento.md @concepts/long-video-rag-retrieval.md @concepts/persona-consistency-methods.md

## Raw Concept

Ingest 2026-06-17 from Memento (arXiv:2606.14667) — auxiliary subject reconstruction loss + disentangled memory queries for multi-shot long video.

## Narrative

**Core insight:** Next-shot likelihood alone does not force memory to retain **identity-critical** cues — salient recent frames can crowd out sparse face/clothing evidence from distant shots.

**Memento fix:**

1. **Reconstruction head** — given memory + global story caption, regenerate subject appearance (verifiable objective).
2. **Dual queries** — story query pulls long-range identity; shot query pulls local continuity.
3. **Fixed memory bank** — scalable vs full global attention over all prior frames.

**Comparison table:**

| Approach | Identity mechanism |
|----------|-------------------|
| Seam stitch + I2V re-anchor | Post-hoc; manual hero frame |
| LongLive-RAG | Retrieve relevant latents |
| DecMem | Learned global/local memory inside model |
| **Memento** | Explicit reconstruct-from-memory training signal |

**Persona ops:** Story-driven multi-shot content (vlog arcs, narrative Reels) where `@concepts/video-identity-inheritance.md` per-shot I2V is insufficient.

## Snippets

(See @sources/arxiv-2606-14667-memento-long-video-subject-reconstruction.md)

## Dead Ends

Requires training Memento stack — not an operator plug-in today. Open weights unconfirmed.
