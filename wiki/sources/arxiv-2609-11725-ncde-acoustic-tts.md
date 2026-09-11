---
title: "NCDE continuous-time acoustic modelling (arXiv:2609.11725)"
type: source
tags: [paper, tts, acoustic, watch]
keywords: [neural CDE, duration-aware TTS, emotional speech, style control]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - concepts/persona-audio-stack.md
maturity: draft
read_status: skimmed
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @concepts/persona-audio-stack.md

## Raw Concept

- **Title**: Continuous-Time Acoustic Modelling with Neural Controlled Differential Equations
- **Type**: arXiv:2609.11725 [cs.SD]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.11725
- **Code**: none found
- **Retrieved**: 2026-09-11

## Narrative

The paper comes from the Speech and Hearing Group at the University of Sheffield, and the venue is SLT 2026. It replaces the usual duration-based upsampling step in TTS with a neural controlled differential equation (CDE). The CDE treats the phone sequence as a control path, so the decoder input values change with duration and not only with position. The authors report that CDE models with one phone per step improve rank-order agreement between synthesized and reference emotion intensity. This work is a thin design-space study for this wiki. A `[Source: arxiv-2609.11725]` route to a local TTS pipeline is not clear yet. Image-gen Phase-1: none.

## Snippets

> Additional experiments with half-phone step-sizes suggest that temporal resolution changes the trade-off between style tracking and absolute calibration. [Source: arxiv-2609.11725]
