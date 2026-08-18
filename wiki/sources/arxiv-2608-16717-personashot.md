---
title: "PersonaShot: person-centric multi-shot narrative continuity bench (arXiv:2608.16717)"
type: source
tags: [paper, benchmark, video, persona, multi-shot, watch]
keywords: [PersonaShot, narrative continuity, physical continuity, affective dynamics, cinematic grammar, SJTU, Tencent Youtu]
related:
  - entities/benchmarks/personashot.md
  - concepts/video-identity-inheritance.md
  - concepts/persona-consistency-methods.md
  - concepts/multi-shot-audio-video-evaluation.md
  - entities/models/wan-2-2.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-18-daily.md
maturity: draft
read_status: read
created: 2026-08-18
updated: 2026-08-18
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/benchmarks/personashot.md @concepts/video-identity-inheritance.md @concepts/persona-consistency-methods.md @concepts/multi-shot-audio-video-evaluation.md @entities/models/wan-2-2.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-18-daily.md

## Raw Concept

- **Title**: PersonaShot: Benchmarking Person-Centric Narrative Continuity in Multi-Shot Video Generation
- **Authors**: Yuji Wang, Yuheng Chen, Teng Hu, Ran Yi, Yijia Hong, Han Feng, Weijian Cao, Chengjie Wang, Lizhuang Ma, Jiangning Zhang (SJTU / Tencent Youtu Lab / Zhejiang University)
- **Type**: arXiv:2608.16717 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.16717-personashot-benchmarking-person-centric-narrativ.pdf`
- **URL**: https://arxiv.org/abs/2608.16717
- **Project**: https://rain152.github.io/PersonaShot/
- **Retrieved**: 2026-08-18
- **Code**: none in PDF. Project page only. GitHub search negative. Paper license CC-BY 4.0. No SPDX. Do not download the dataset.

## Narrative

SJTU + Tencent Youtu **person-centric** bench for multi-shot T2V. VBench / HumanVBench / MSVBench / MSAVBench score appearance or single-shot quality; they do not ask whether a character's *physical and emotional state* survives a cut. PersonaShot: ~**1000** multi-shot segments and **16** metrics on three axes — **physical continuity** (spatial layout, object state, geometric scale), **affective dynamics** (expression naturalness, facial/action coherence, emotion alignment, emotion arc), **cinematic grammar** (shot transition, rhythm, 180-rule, eyeline match, narrative sequence). Evaluators are criterion-specific specialists distilled from a large MLLM teacher and gated so 180-rule / eyeline only score when the evidence exists. Human alignment ρ ≈ 0.65–0.74 on the specialist criteria.

Headline result: a clear **gap between perceptual quality and cross-shot narrative continuity**. Pretty clips still reset physical state, jump affect, and break cinematic relations. That is exactly the persona-video failure mode `@concepts/video-identity-inheritance.md` already names (identity wobble / motion drift) — PersonaShot measures the *story* version of it.

**Phase-0: WATCH HIGH** persona-video. Project page only. No dataset clone. Image-gen local wire: none (`deferred`).

## Snippets

> "Even visually compelling videos frequently exhibit physical-state resets, abrupt affective shifts, and broken cinematic relations across shots."

[Source: arxiv-2608.16717, abstract]
