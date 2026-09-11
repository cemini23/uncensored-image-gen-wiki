---
title: "DSAQuant denoising-stage-aligned quantization (arXiv:2609.04031)"
type: source
tags: [paper, quantization, video, diffusion, watch]
keywords: [QAT, video diffusion, W4A4, denoising stages]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - entities/models/dsaquant.md
  - entities/hardware/gpu-guide.md
maturity: draft
read_status: read
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @entities/models/dsaquant.md @entities/hardware/gpu-guide.md

## Raw Concept

- **Title**: DSAQuant: Denoising-Stage-Aligned Quantization-Aware Training for Video Generation
- **Type**: arXiv:2609.04031 [cs.CV]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.04031
- **Code**: repo robbyant-research/DSAQuant, SPDX Apache-2.0 CONFIRMED, 14 stars, ~85 MB API size. Cloned to .local/adopts/DSAQuant (depth 1, 1 MB on disk, code only). No weights pull.
- **Retrieved**: 2026-09-11

## Narrative

The paper states that quantization-aware training (QAT) for video diffusion models (VDMs) keeps prompt semantics but degrades texture and sharpness. It traces this loss to timestep-agnostic quantization pipelines. DSAQuant adds Denoising-Stage Oriented Supervision in training and Denoising-Stage Gated Guidance at inference. The work reports tests on the Wan and CogVideoX families under W4A4 and W3A3. The code is Apache-2.0 and cloned locally as code only. Image-gen Phase-1: none.

## Snippets

"we propose DSAQuant, a Denoising-Stage-Aligned Quantization-aware training framework for VDMs." [Source: arxiv-2609.04031]
