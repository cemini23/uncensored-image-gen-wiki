---
title: VLM-guided physical video generation (training-free)
type: concept
tags: [concept, video-generation, physics, vlm, training-free, inference-time]
keywords: [CausalMotion, keyframe guidance, trajectory guidance, VLM chain-of-thought, latent soft mask, PhyGenBench, training-free physics]
related:
  - sources/arxiv-2606-14317-causalmotion-physical-reasoning-video.md
  - entities/models/causalmotion.md
  - concepts/video-generation-physical-executability.md
  - entities/models/ltx-2.md
  - concepts/world-models-video-generation.md
  - sources/arxiv-proprio-physics-video-2605-28230.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-17
updated: 2026-06-17
---

## Relations

@sources/arxiv-2606-14317-causalmotion-physical-reasoning-video.md @entities/models/causalmotion.md @concepts/video-generation-physical-executability.md @entities/models/ltx-2.md

## Raw Concept

Ingest 2026-06-17 from CausalMotion (arXiv:2606.14317) — explicit VLM physical reasoning as inference-time guidance for frozen video diffusion.

## Narrative

**Design pattern:** Don't retrain the video model for physics — **structure the denoising path** with interpretable intermediates.

```
Text prompt
  → VLM: causal key states + captions
  → T2I keyframes per state
  → Grounding + physical state vectors → trajectories
  → Time-align keyframes to trajectory
  → Soft-mask latent injection during video diffusion
```

**When to use:** Dynamics-heavy prompts (melting, deflation, pouring, collisions) where pure diffusion skips intermediate states.

**When to skip:** Persona talking-head / static-scene I2V — overhead of VLM+SAM2+multi-keyframe pipeline exceeds benefit.

**Cluster:** Complements simulator-based physics (@sources/arxiv-proprio-physics-video-2605-28230.md best-of-N) and executability benchmarks (@concepts/video-generation-physical-executability.md) — CausalMotion is **zero-training inference glue**.

## Snippets

(See @sources/arxiv-2606-14317-causalmotion-physical-reasoning-video.md)

## Dead Ends

Backbone-specific latent guidance implementation — porting from LTX-Video to Wan requires engineering, not paper recipe alone.
