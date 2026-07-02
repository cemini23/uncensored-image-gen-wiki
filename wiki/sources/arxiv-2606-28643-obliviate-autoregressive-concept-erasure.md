---
title: "Obliviate — autoregressive concept erasure (arXiv:2606.28643)"
type: source
tags: [paper, concept-erasure, safety, autoregressive, t2i, alignment]
keywords: [Obliviate, KL supervision, trajectory-level updates, aligned visual prefix, Liquid, Emu3, Janus-Pro]
related:
  - concepts/autoregressive-concept-erasure-obliviate.md
  - concepts/de-censoring-techniques.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/cross-model-safety-steering.md
  - sources/arxiv-2606-05290-cross-model-safety-steering.md
  - entities/models/hunyuanimage-3-0.md
  - sources/arxiv-2509-23951-hunyuanimage-3-0-technical-report.md
  - sweeps/2026-07-02-daily.md
  - concepts/cross-model-safety-steering.md
  - sources/arxiv-2606-05290-cross-model-safety-steering.md
maturity: draft
read_status: read
created: 2026-07-02
updated: 2026-07-02
---

## Relations

@concepts/autoregressive-concept-erasure-obliviate.md @concepts/de-censoring-techniques.md @concepts/censorship-tier-taxonomy.md

## Raw Concept

- **Title**: Obliviate: Erasing Concepts from Autoregressive Image Generation Models
- **Authors**: Hossein Shakibania, Jonas Henry Grebe, Tobias Braun, et al. (TU Darmstadt / hessian.AI)
- **Type**: arXiv:2606.28643
- **Location**: `raw-sources/arxiv-2606.28643-erasing-concepts-from-autoregressive-image-gener.pdf`
- **URL**: https://arxiv.org/abs/2606.28643
- **Retrieved**: 2026-07-02
- **Read status**: read (abstract + method overview)

## Narrative

**Obliviate** — **concept erasure** for **autoregressive T2I** (visual token sequences), filling gap vs mature diffusion erasure (ESD, EraseFlow class).

**Key design:** KL supervision over **visual token distributions**; **full-trajectory** weight updates; **aligned visual prefixes** between conditional and pseudo-unconditional branches (prevents utility collapse).

**Evaluated on:** Liquid, Emu3-Gen, Janus-Pro — erasing nudity, graphic violence, branded imagery. RAB nudity benchmark: **91.58 → 3.15** on Liquid `[TENTATIVE]`.

### Workspace relevance

**Inverse axis** to @concepts/de-censoring-techniques.md — documents how frontier **unified AR multimodal** hosts (incl. @entities/models/hunyuanimage-3-0.md lineage) can be **safety-edited post-training**. Informs censorship-tier and whether AR models inherit FLUX-class erasure surface.

Phase-0: **REFERENCE** — no public repo; safety research not build-track deploy.

## Snippets

> "Concept erasure for autoregressive image generation remains largely unexplored, despite the growing relevance of these models in recent trends toward unified multimodal architectures."

## Dead Ends

Not a de-censoring tool — documents removal mechanics only.
