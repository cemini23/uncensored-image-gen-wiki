---
title: Implicit preference alignment for human animation (IPA)
type: concept
tags: [concept, human-animation, post-training, preference-alignment, hands]
keywords: [IPA, implicit reward maximization, good-only samples, hand-aware optimization, VACE, DPO alternative]
related:
  - sources/arxiv-2605-07545-implicit-preference-alignment-human-animation.md
  - concepts/motion-shape-disentangled-human-animation.md
  - entities/models/emosh.md
  - entities/models/wan-2-2.md
  - concepts/persona-consistency-methods.md
  - concepts/video-reference-avatar-generation.md
  - sources/arxiv-2606-10860-gravity-weighted-instruction-hierarchy-dpo.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-07-01-daily.md
maturity: draft
created: 2026-07-01
updated: 2026-07-01
---

## Relations

@sources/arxiv-2605-07545-implicit-preference-alignment-human-animation.md @concepts/motion-shape-disentangled-human-animation.md @entities/models/wan-2-2.md

## Raw Concept

Ingest 2026-07-01 from Wang et al. (arXiv:2605.07545, ICML 2026) — good-only implicit preference alignment for hand regions on VACE-class human animation.

## Narrative

### Hand quality failure mode in persona motion clips

| Symptom | Typical cause | Mitigation class |
|---------|---------------|------------------|
| Finger blur / merge | High DoF + weak hand priors in pose-driven I2V | Region-specific post-training |
| Frame-wise hand flicker | Inconsistent DPO pair labels | Good-only alignment (IPA) |
| Shape leakage on cross-drive | Motion-shape entanglement | EHM retarget (@concepts/motion-shape-disentangled-human-animation.md) |

IPA targets the **first two rows** — preference alignment without expensive bad-sample curation.

### IPA vs DPO for hands

Standard DPO needs strict winner/loser **video-level** pairs. Hands violate this: mixed-quality frames within a clip make "Case 4" pairs rare. IPA maximizes likelihood of **isolated good samples** + KL anchor to pretrained VACE/Wan animation prior — theoretically equivalent to implicit reward maximization.

**Hand-Aware Local Optimization** restricts the objective to hand bounding regions so global motion quality is not sacrificed.

### Build-track note

Phase-0 **CONDITIONAL-GO** — MIT repo exists but immature docs; audit VACE-14B fine-tune VRAM before laptop trial. Complements (does not replace) mesh retarget approaches when open weights drop.

## Snippets

> "Although constructing rigorous preference pairs is difficult, obtaining isolated good samples remains relatively accessible and cost-effective."

## Dead Ends

Training pipeline only at ingest — not inference-time filter.
