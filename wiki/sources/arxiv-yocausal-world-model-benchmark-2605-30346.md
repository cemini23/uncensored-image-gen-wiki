---
title: "YoCausal — causality benchmark for video diffusion / world models (arXiv:2605.30346)"
type: source
tags: [paper, world-model, causality, benchmark, video-diffusion, wan]
keywords: [YoCausal, Reverse Surprise Index, RSI, Causality Cognition Index, CCI, VoE, temporal reversal, Wan2.2]
related:
  - concepts/world-models-video-generation.md
  - entities/models/wan-2-2.md
  - sources/sana-wm-minute-scale-world-model.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md
  - sources/arxiv-proprio-physics-video-2605-28230.md
  - sources/arxiv-2603-18639-orthophys-physics-video.md
  - concepts/physics-aware-orthogonal-view-video.md
  - sources/arxiv-2606-04811-dream-exe-robot-executability.md
  - concepts/video-generation-physical-executability.md
maturity: draft
read_status: read
created: 2026-06-01
updated: 2026-06-07
---

## Relations

@concepts/world-models-video-generation.md @entities/models/wan-2-2.md @sources/sana-wm-minute-scale-world-model.md @sources/video-generation-survey-2026.md

## Raw Concept

- **Title**: YoCausal: How Far is Video Generation from World Model? A Causality Perspective
- **Authors**: You-Zhe Xie et al. (NYCU, Shanda AI)
- **Type**: arXiv:2605.30346
- **Location**: `raw-sources/arxiv-2605.30346-yocausal-how-far-is-video-generation-from-world.pdf`
- **Retrieved**: 2026-06-01
- **Read status**: read (abstract + intro)

## Narrative

Asks whether VDMs **understand causality** or only statistical temporal patterns. Builds on cognitive-science **Violation of Expectation (VoE)** — infants surprised by reversed causality videos.

**YoCausal benchmark** — arbitrarily extensible: **reverse any real-world video** at zero cost for counterfactual pairs.

| Level | Metric | Meaning |
|-------|--------|---------|
| 1 | **RSI** (Reverse Surprise Index) | Fraction where denoising loss higher on reversed vs forward — **arrow-of-time** perception |
| 2 | **CCI** (Causality Cognition Index) | RSI(causal subset) − RSI(non-causal subset) — disentangles causality from mere temporal direction |

Evaluated **13 SOTA VDMs** + human baseline on 1,200 annotated videos.

**Findings [CONFIRMED from paper abstract]:**
1. Advanced models perceive arrow of time; some show preliminary causal cognition; **large human gap** remains
2. Arrow-of-time ≠ causality understanding
3. Causal cognition correlates partially with intuitive physics, **not** aesthetic quality
4. Scaling (UNet→DiT, params) improves causal cognition

Top-ranked in paper figures: **Wan2.2-A14B** on causal wipe-clean plate task.

### Workspace relevance

Evaluation lens for claiming a video base is a **world model** vs clip generator → @concepts/world-models-video-generation.md. Complements physics scoring (Proprio) and SANA-WM minute-scale control.

## Snippets

> "Perceiving the arrow of time does not imply understanding causality, and a significant gap persists relative to human-level causal cognition." [Source: arXiv:2605.30346 abstract]

## Dead Ends

None for benchmark use — not a generation tool.
