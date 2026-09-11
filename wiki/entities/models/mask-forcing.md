---
title: Mask Forcing
type: entity
tags: [video, diffusion, autoregressive, distillation, watch]
keywords: [autoregressive video diffusion, DMD, rollout, masking]
related:
  - sources/arxiv-2609-09123-mask-forcing.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
maturity: draft
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@sources/arxiv-2609-09123-mask-forcing.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.09123 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-09123-mask-forcing.md

## Narrative

Mask Forcing is a training strategy for autoregressive (AR) video diffusion distillation. It targets mode collapse and error accumulation in self-rollout training with a Distribution Matching Distillation (DMD) loss. The method samples a random mask and a second, lower noise level. It then re-noises the masked latent positions to that lower level and keeps the other positions at the original level. The result is a dual-noise rollout input that drives the student to more teacher modes. The paper reports that other AR video distillation methods improve with this strategy. The work order supplies no clone or license facts for this method. Adopt a watch posture and track the paper before any local test. Image-gen Phase-1: none. wire_status: deferred.
