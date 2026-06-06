---
title: Physics-aware orthogonal-view video generation (OrthoPhys)
type: concept
tags: [concept, video-generation, physics, multi-view, world-model]
keywords: [OrthoPhys, Phys4View, orthogonal views, physical attributes, cross-view attention, foreground-background interaction]
related:
  - sources/arxiv-2603-18639-orthophys-physics-video.md
  - concepts/world-models-video-generation.md
  - sources/arxiv-proprio-physics-video-2605-28230.md
  - sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-06
updated: 2026-06-06
---

## Relations

@sources/arxiv-2603-18639-orthophys-physics-video.md @concepts/world-models-video-generation.md @sources/arxiv-proprio-physics-video-2605-28230.md

## Raw Concept

Concept from 2026-06-06 ingest — arXiv:2603.18639 OrthoPhys.

## Narrative

**Physics plausibility via orthogonal views** — intermediate representation is **four synchronized orthogonal foreground videos** under explicit material/motion parameters, not unstructured 2D pixel motion.

**Two-stage pipeline:**

1. **Phys4View** — physics-aware + geometry-enhanced cross-view attention → consistent multi-view foreground dynamics
2. **VideoSyn** — composite into full scene with learned FG–BG interactions (contact, occlusion)

Avoids full physics-engine inference loop while grounding motion in 3D-consistent geometry. Research-layer complement to:

- **Proprio** — score physics at inference (no generation change)
- **OptiWorld** — plan under constraints before render
- **YoCausal** — measure causal understanding

Not persona build-track — useful for evaluating whether persona action clips violate basic physics.

## Snippets

(See @sources/arxiv-2603-18639-orthophys-physics-video.md)
