---
title: PersonaShot — person-centric multi-shot narrative continuity benchmark
type: entity
tags: [benchmark, video, persona, multi-shot, watch]
keywords: [PersonaShot, physical continuity, affective dynamics, cinematic grammar, 16 metrics, SJTU, Tencent Youtu]
related:
  - sources/arxiv-2608-16717-personashot.md
  - concepts/video-identity-inheritance.md
  - concepts/persona-consistency-methods.md
  - concepts/multi-shot-audio-video-evaluation.md
  - entities/models/wan-2-2.md
  - sweeps/2026-08-18-daily.md
maturity: draft
created: 2026-08-18
updated: 2026-08-18
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-16717-personashot.md @concepts/video-identity-inheritance.md @concepts/persona-consistency-methods.md @concepts/multi-shot-audio-video-evaluation.md @entities/models/wan-2-2.md @sweeps/2026-08-18-daily.md

## Raw Concept

Phase-0 from arXiv:2608.16717. First person-centric bench that scores whether a character's physical and emotional state survive a cut.

## Narrative

| Field | Value |
|-------|-------|
| Org | SJTU + Tencent Youtu Lab + Zhejiang University |
| Size | ~1000 multi-shot segments |
| Metrics | 16, three axes |
| Temporal levels | within-shot / cross-shot / sequence trajectory |
| Evaluators | criterion-specific specialists distilled from a large MLLM; evidence-gated; ρ ≈ 0.65–0.74 vs expert MOS |
| Project | https://rain152.github.io/PersonaShot/ |
| Code / data | no GitHub; **do not download** the dataset |
| Phase-0 | **WATCH HIGH** persona-video |
| Phase-1 | Image-gen local wire: none (`deferred`) |

**Axes**

- **Physical continuity** — spatial layout, object state, geometric scale (cross-shot process, not single-frame physics).
- **Affective dynamics** — expression naturalness, facial/action coherence, emotion alignment, emotion arc (AU-aware, not a clip-level sentiment score).
- **Cinematic grammar** — narrative sequence, shot transition, rhythm, 180-rule, eyeline match.

**Operator takeaway.** VBench-class perceptual scores can look fine while the character resets after a cut. That is the multi-shot version of identity wobble already documented on `@concepts/video-identity-inheritance.md`. When a Wan / Seedance / HoloCine / EchoShot multi-shot pipeline is scored, use PersonaShot *alongside* MSAVBench (audio-video multi-shot), not instead of VBench.

## Snippets

> "Our evaluation reveals distinct capability profiles across state-of-the-art models and a clear gap between perceptual quality and cross-shot narrative continuity."

[Source: arxiv-2608.16717, abstract]
