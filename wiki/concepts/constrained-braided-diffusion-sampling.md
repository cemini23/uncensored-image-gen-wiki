---
title: Constrained braided diffusion sampling (geometry-projected denoising)
type: concept
tags: [image-generation, diffusion-sampling, geometry, inference-time, technique]
keywords: [braided sampling, constrained sampling, conformal map, Droste, generalized inverse, Penrose consistency, projection operator, frozen T2I, Escher, inference-time]
related:
  - sources/arxiv-2610-02210-moore-escher-penrose.md
  - concepts/camera-controlled-video-generation.md
  - sweeps/2026-10-02-daily.md
maturity: draft
created: 2026-10-02
updated: 2026-10-02
---

## Relations

@sources/arxiv-2610-02210-moore-escher-penrose.md @concepts/camera-controlled-video-generation.md @sweeps/2026-10-02-daily.md

## Raw Concept

The question this page answers: how do you force a frozen diffusion model to obey an exact geometric constraint during sampling, instead of hoping the prompt gets close? Synthesized from arXiv:2610.02210 (Moore, Escher, Penrose).

## Narrative

**The problem.** Normal conditioning — a prompt, an init image, a ControlNet — *biases* the sampler toward a constraint. It does not *enforce* one. If the output must satisfy an exact mathematical relation (a recursive Droste scaling, a conformal twist), soft conditioning will drift.

**The technique.** Build a projection operator from the constraint itself, then alternate two kinds of denoising step so the image is developed in both spaces at once.

1. Express the constraint as a map T (for the Escher *Print Gallery* case, de Smit and Lenstra's conformal power map, which combines a Droste scale recursion with rotation).
2. Construct a **matched generalized inverse** T-dagger satisfying the Penrose consistency condition T·T-dagger·T = T. The consequence is that T·T-dagger is an *idempotent projection* — applying it twice changes nothing — onto the set of geometrically admissible images.
3. **Braid** the sampler: alternate steps in source space (the untwisted scene) with steps in transformed space (the twisted appearance), jumping between them through the projection. At each switch, a 4x in-loop super-resolution keeps the two spaces pixel-aligned.

**Why "braided" rather than "projected".** A single projection per step would drag the sample onto the constraint manifold and then let the next noise step pull it back off. Alternating lets each space correct the other's error — the source space supplies global composition, the transformed space supplies local detail — while the idempotent projection guarantees the constraint survives every landing.

**Scope and limits.** The paper demonstrates five geometry families (conformal twist, Poles, Mobius, Square, Rimrings) and reports only qualitative results — no quantitative metrics, no user study. Stated failure modes: the recursion can centre on the wrong anchor, and an optional "time travel" step can amplify seams. The method is not specific to Escher: any constraint admitting a map with a Penrose-consistent generalized inverse can be braided this way.

**Operator status.** No code and no licence; a project page exists only (`assafshocher.github.io/escher/supplement.html`). The backbone is cited as FLUX, so the technique is applicable in principle to a local frozen T2I model — but adopting it today means reimplementing both the conformal map and the braided scheduler from the paper. Tracked as a technique, not an artifact. It sits in the same family as other inference-time geometric control work, such as `@concepts/camera-controlled-video-generation.md` for camera trajectories, but enforces a constraint rather than steering toward one.

## Snippets

[Source: https://arxiv.org/abs/2610.02210 (retrieved 2026-10-02) — Penrose consistency T·T†·T = T makes T·T† an idempotent projection.]
