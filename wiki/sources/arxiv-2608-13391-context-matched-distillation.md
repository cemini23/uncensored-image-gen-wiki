---
title: "Context-Matched Distillation (CMD): teacher causality for autoregressive video distillation (arXiv:2608.13391)"
type: source
tags: [paper, video-generation, distillation, causal, streaming, watch]
keywords: [Context-Matched Distillation, CMD, causal DMD, distribution matching distillation, autoregressive video, few-step, teacher causality, online control, NVIDIA]
related:
  - concepts/context-matched-video-distillation.md
  - concepts/score-gradient-matching-video-distillation.md
  - concepts/streaming-force-controlled-video-generation.md
  - concepts/cascaded-streaming-high-resolution-video.md
  - entities/models/wan-2-2.md
  - sweeps/2026-08-14-daily.md
maturity: draft
read_status: read
created: 2026-08-14
updated: 2026-08-14
---

## Relations

@concepts/context-matched-video-distillation.md @concepts/score-gradient-matching-video-distillation.md @concepts/streaming-force-controlled-video-generation.md @concepts/cascaded-streaming-high-resolution-video.md @entities/models/wan-2-2.md @sweeps/2026-08-14-daily.md

## Raw Concept

- **Title**: Context-Matched Distillation: Teacher Causality for Autoregressive Video Distillation
- **Authors**: Hmrishav Bandyopadhyay et al. (NVIDIA + SketchX CVSSP, University of Surrey)
- **Type**: arXiv:2608.13391 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.13391-context-matched-distillation-teacher-causality-f.pdf`
- **URL**: https://arxiv.org/abs/2608.13391
- **Retrieved**: 2026-08-14
- **Code**: project page `hmrishavbandy.github.io/cmd-site/`; no GitHub repo in PDF → no SPDX check

## Narrative

Interactive AR video generation needs both **low-latency rollouts** and precise **online control**. Few-step distillation cuts denoising steps; online control imposes a causal constraint (frames/blocks depend on history + controls available *during* generation). Existing video DMD pipelines supervise causal few-step students with **bidirectional teachers that score complete clips** — a target's score can depend on future frames/controls unavailable when the student generated it. **CMD** aligns teacher supervision with the student's causal information set: replaces bidirectional full-clip scoring with a **causal teacher** that evaluates each target without future frames/controls; the same causal teacher initializes the few-step student → consistent causal formulation across teacher training.

**Phase-0: WATCH** — closes the teacher/student information-set mismatch for few-step + controllable AR video; relevant to streaming/camera-control video pipelines. Project-page only, no repo/weights → no SPDX. Phase-1: Image-gen local wire `deferred`.

## Snippets

> "The score for a target can therefore depend on future frames and controls that were unavailable when the student generated it, misaligning teacher supervision with the student's causal information set."

_[Source: arxiv-2608.13391, abstract]_
