---
title: "IPA — implicit preference alignment for human animation (arXiv:2605.07545)"
type: source
tags: [paper, human-animation, post-training, preference-alignment, hands, icml-2026]
keywords: [IPA, implicit preference alignment, hand-aware local optimization, VACE, DPO, flow matching, human image animation]
related:
  - concepts/implicit-preference-alignment-human-animation.md
  - concepts/motion-shape-disentangled-human-animation.md
  - entities/models/emosh.md
  - entities/models/wan-2-2.md
  - concepts/persona-consistency-methods.md
  - concepts/video-reference-avatar-generation.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-07-01-daily.md
  - concepts/video-reference-avatar-generation.md
  - sweeps/2026-07-01-daily.md
  - sources/arxiv-2606-10860-gravity-weighted-instruction-hierarchy-dpo.md
maturity: draft
read_status: read
created: 2026-07-01
updated: 2026-07-01
---

## Relations

@concepts/implicit-preference-alignment-human-animation.md @concepts/motion-shape-disentangled-human-animation.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: Implicit Preference Alignment for Human Image Animation
- **Authors**: Yuanzhi Wang, Xuhua Ren, Jiaxiang Cheng, Bing Ma, et al. (ICML 2026)
- **Type**: arXiv:2605.07545
- **Location**: `raw-sources/arxiv-2605.07545-implicit-preference-alignment-human-animation.pdf`
- **URL**: https://arxiv.org/abs/2605.07545 · https://github.com/mdswyz/IPA
- **Retrieved**: 2026-07-01
- **Read status**: read (abstract + method framing + Phase-0)

## Narrative

**IPA** — data-efficient **post-training** for human image animation that improves **hand fidelity** without strict good/bad preference pairs required by DPO.

**Problem:** Hand regions have highest DoF and frame-wise inconsistency — curating DPO winner/loser pairs for hands is prohibitively expensive (only "Case 4" strict pairs work for DPO).

**Method:** Theoretically grounded **implicit reward maximization** — maximize likelihood of self-generated **good-only** samples while KL-constraining deviation from pretrained prior. **Hand-Aware Local Optimization** steers gradients to hand regions.

**Base model:** Experiments on **VACE** (Wan2.1-based human animation stack) `[TENTATIVE]` — claims SOTA hand quality vs MimicMotion, UniAnimate-DiT, Wan-Animate class.

### Workspace relevance

Persona dance/motion-transfer clips where **hand blur and finger collapse** break immersion — post-training axis adjacent to @concepts/motion-shape-disentangled-human-animation.md (geometry retarget) but **preference-aligned fine-tune** on existing Wan animation checkpoints.

Phase-0: **CONDITIONAL-GO** — `mdswyz/IPA` MIT, 3★, minimal README at ingest; requires VACE-14B training stack audit before laptop adoption.

## Snippets

> "IPA aligns the model by maximizing the likelihood of self-generated high-quality samples while penalizing deviations from the pretrained prior."

> "Constructing strict preference pairs for hands is prohibitively expensive and often impractical due to frame-wise inconsistencies."

## Dead Ends

Not a drop-in ComfyUI node. Training-oriented; consumer-GPU feasibility unverified at ingest.
