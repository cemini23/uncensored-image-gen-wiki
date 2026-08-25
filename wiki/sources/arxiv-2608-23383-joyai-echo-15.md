---
title: "JoyAI-Echo-1.5 long-horizon AV (arXiv:2608.23383)"
type: source
tags: [paper, video, audio-visual, long-horizon, watch]
keywords: [JoyAI-Echo-1.5, JD, cross-shot memory, world-model 6-DoF]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/video-identity-inheritance.md
  - concepts/world-models-video-generation.md
  - entities/models/joyai-echo.md
  - entities/models/ltx-2.md
  - entities/models/wan-2-2.md
  - sweeps/2026-08-25-daily.md
maturity: draft
read_status: read
created: 2026-08-25
updated: 2026-08-25
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/models/joyai-echo.md @entities/models/ltx-2.md @concepts/video-identity-inheritance.md @concepts/world-models-video-generation.md @entities/models/wan-2-2.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-25-daily.md

## Raw Concept

- **Title**: Long-Horizon Audio-Visual Generation for Persistent Stories and Interactive Worlds
- **Authors**: Nan Duan, Haoyang Huang, Weiyang Jin, et al. (Joy Future Academy, JD)
- **Type**: arXiv:2608.23383 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.23383-long-horizon-audio-visual-generation-for-persist.pdf`
- **URL**: https://arxiv.org/abs/2608.23383
- **Retrieved**: 2026-08-25
- **Code**: `jd-opensource/JoyAI-Echo` (~12 MB GitHub). **LTX-2 Community License** (NOASSERTION / not Apache-MIT). **Not cloned.** $10M revenue commercial clause; Attachment A.7 restricts impersonation/deepfakes without consent.

## Narrative

**JoyAI-Echo-1.5** two variants: (1) long-video with composable cross-shot memory + speaker cues from speech-filtered audio for persistent appearance and voice; (2) world-model with calibrated metric 6-DoF camera from heterogeneous navigation, geometry-aware conditioning. Unified AV generation for persistent stories / interactive worlds.

**WATCH HIGH** for persona multi-shot AV. Do **not** clone: LTX-2 Community License is not GO SPDX for this wiki. Image-gen Phase-1: none (`deferred`). Production still Wan + Fish-Speech/LatentSync.

## Snippets

> "The long-video variant introduces composable cross-shot memory that aggregates visual evidence across multiple prior shots and speaker cues derived from speech-filtered full-shot audio, enabling persistent character appearance and voice identity."

[Source: arxiv-2608.23383, abstract]
