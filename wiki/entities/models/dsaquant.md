---
title: DSAQuant
type: entity
tags: [quantization, video, diffusion, watch]
keywords: [QAT, video diffusion, low-bit, Wan]
related:
  - sources/arxiv-2609-04031-dsaquant.md
  - entities/hardware/gpu-guide.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
maturity: draft
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH / GO clone
wire_status: deferred
---

## Relations

@sources/arxiv-2609-04031-dsaquant.md @entities/hardware/gpu-guide.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.04031 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-04031-dsaquant.md

## Narrative

DSAQuant is a denoising-stage-aligned QAT framework for video diffusion models. The method uses two parts. Denoising-Stage Oriented Supervision moves training supervision from teacher distillation to target-driven loss across the denoising steps. Denoising-Stage Gated Guidance turns off classifier-free guidance in the final denoising steps. The paper reports tests on the Wan and CogVideoX families under W4A4 and W3A3. The code license is Apache-2.0 CONFIRMED. Clone status: DONE, code only, at .local/adopts/DSAQuant. The GitHub API size is ~85 MB, but the depth-1 code tree is 1 MB (74 files: vdm_infer, scripts, tests). No weights pull and no HF weight pull. LEGAL.md is a comment-language disclaimer, not a weights license. LOCAL CUDA eval is a follow-up. Image-gen Phase-1: none. wire_status: deferred.
