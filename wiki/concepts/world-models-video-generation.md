---
title: World Models for Video Generation
type: concept
tags: [concept, world-model, video-generation, interactive, action-controllable, world-simulator]
keywords: [world model, world simulator, interactive video generation, action-controllable, camera-controllable, minute-scale, autoregressive rollout, explorable environment, LingBot-World, HY-WorldPlay]
related:
  - sources/sana-wm-minute-scale-world-model.md
  - entities/models/sana-wm.md
  - concepts/camera-controlled-video-generation.md
maturity: draft
created: 2026-05-16
updated: 2026-05-16
---

## Relations

@sources/sana-wm-minute-scale-world-model.md @entities/models/sana-wm.md @concepts/camera-controlled-video-generation.md

## Raw Concept

Stub created during the cross-wiki ingest of NVIDIA's SANA-WM paper (@sources/sana-wm-minute-scale-world-model.md), routed from the OSINT workspace 2026-05-16. Anchors the distinction between *clip generators* (prompt-to-clip T2V/I2V) and *world models*.

## Narrative

A **video world model** is an action-conditioned, explorable video generator: rather than mapping a text prompt to a fixed 5–10s clip, it takes a first frame plus an action signal (e.g. a 6-DoF camera trajectory) and synthesizes a long, controllable video that follows that action while preserving scene identity — an explorable environment, not a one-shot clip. SANA-WM is the workspace's first ingested example (2.6B params, one-minute 720p, single-GPU); industrial peers cited in that paper are LingBot-World and HY-WorldPlay. Distinct from the prompt-to-clip T2V/I2V models catalogued in the video-generation survey. → @entities/models/sana-wm.md
