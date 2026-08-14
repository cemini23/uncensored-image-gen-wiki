---
title: Context-Matched Distillation (CMD) — causal teacher for AR video distillation
type: concept
tags: [concept, video-generation, distillation, causal, streaming, control, nvidia]
keywords: [CMD, Context-Matched Distillation, causal DMD, teacher causality, information set, few-step, autoregressive video, online control, NVIDIA]
related:
  - sources/arxiv-2608-13391-context-matched-distillation.md
  - concepts/score-gradient-matching-video-distillation.md
  - concepts/streaming-force-controlled-video-generation.md
  - concepts/cascaded-streaming-high-resolution-video.md
  - entities/models/wan-2-2.md
  - sweeps/2026-08-14-daily.md
maturity: draft
created: 2026-08-14
updated: 2026-08-14
---

## Relations

@sources/arxiv-2608-13391-context-matched-distillation.md @concepts/score-gradient-matching-video-distillation.md @concepts/streaming-force-controlled-video-generation.md @concepts/cascaded-streaming-high-resolution-video.md @entities/models/wan-2-2.md @sweeps/2026-08-14-daily.md

## Raw Concept

Concept from 2026-08-14 ingest of arXiv:2608.13391 (NVIDIA + SketchX Surrey). Fixes the teacher/student information-set mismatch in causal few-step video distillation.

## Narrative

**Problem:** interactive AR video generation needs low-latency rollouts (few-step distillation) AND precise online control. Online control is causal — frames/blocks depend only on history + controls available *during* generation. But existing video DMD pipelines supervise causal few-step students with **bidirectional teachers that score complete clips** — so a target's score can depend on future frames/controls the student never had. Teacher supervision is misaligned with the student's causal information set.

**CMD pattern:**
- Replace bidirectional full-clip scoring with a **causal teacher** that evaluates each target without future frames/controls.
- **Initialize the few-step student from the same causal teacher** → one consistent causal formulation across teacher training, student init, and distillation.

**Why it matters for the gen stack:** few-step + controllable + causal = the streaming/camera-control video regime (joins `streaming-force-controlled-video-generation`, `cascaded-streaming-high-resolution-video`). This is an inference-time-latency win without the standard DMD future-leakage artifact. NVIDIA authorship — likely lands in NVIDIA video stacks; watch repo/weights.

## Snippets

> "CMD replaces bidirectional full-clip scoring with a causal teacher that evaluates each target without access to future frames or controls."

_[Source: arxiv-2608.13391, abstract]_
