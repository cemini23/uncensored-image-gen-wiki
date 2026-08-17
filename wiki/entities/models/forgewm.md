---
title: ForgeWM — few-step causal action-conditioned video world model
type: entity
tags: [model, world-model, video, distillation, causal, wan, watch]
keywords: [ForgeWM, Wan2.1-1.3B, Matrix-Game 2, BidSFT, DMD, CrossFPS, Minecraft]
related:
  - sources/arxiv-2608-14022-forgewm.md
  - concepts/world-models-video-generation.md
  - concepts/context-matched-video-distillation.md
  - concepts/hybrid-policy-self-distillation-video.md
  - entities/models/wan-2-2.md
  - entities/models/kairos.md
maturity: draft
created: 2026-08-17
updated: 2026-08-17
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-14022-forgewm.md @concepts/world-models-video-generation.md @concepts/context-matched-video-distillation.md @concepts/hybrid-policy-self-distillation-video.md @entities/models/wan-2-2.md @entities/models/kairos.md

## Raw Concept

Phase-0 from arXiv:2608.14022. Progressive four-stage conversion of a bidirectional Wan2.1-1.3B / Matrix-Game 2 generator into 1/2/4-step causal action-conditioned world-model students.

## Narrative

| Field | Value |
|-------|-------|
| Org | CUHK + Tencent PCG + FDU + Shanghai AI Lab + HKUST |
| Backbone | Matrix-Game 2.0 I2V lineage — Wan2.1-T2V-1.3B + action-conditioning module |
| Recipe | BidSFT → TF-AR → CD → DMD (bidirectional teacher on AR self-rollout) |
| Students | Budget-specialized 1 / 2 / 4-step |
| Deploy | Dual-path: 1-step draft for interaction; 4-step refine of the *saved* draft at replay |
| Domains | Minecraft (keyboard+mouse); CrossFPS (gamepad, 7 games) |
| Code | `asdfo123/ForgeWM` Apache-2.0 ✅ — cloned `.local/adopts/ForgeWM` (182 MB, depth 1) |
| Weights / data | HF `ForgeWM/ForgeWM` + ~89 GB LMDB — **not downloaded** |
| Phase-0 | **WATCH stack / GO code** |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Portable takeaway for the video stack: keep the action interface aligned through causalization, train per-budget students, and refine the experienced draft instead of regenerating from noise. Sibling to CMD (causal teacher / information-set match) and HPSD (self-distill). Not a persona-video build pick until 1.3B few-step weights are measured on consumer GPU.

## Snippets

> "ForgeWM further supports a dual-path deployment protocol combining latency-critical interaction with optional replay-time refinement, where the one-step student re-noises and refines its saved draft."

[Source: arxiv-2608.14022, abstract]
