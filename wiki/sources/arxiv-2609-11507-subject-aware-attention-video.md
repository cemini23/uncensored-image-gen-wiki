---
title: "Subject-aware attention for multi-subject video (arXiv:2609.11507)"
type: source
tags: [paper, video, identity, multi-subject, watch]
keywords: [subject-to-video, identity consistency, ISGM, preference RL]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - concepts/video-identity-inheritance.md
  - entities/models/subject-aware-attention-video.md
maturity: draft
read_status: read
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH HIGH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @concepts/video-identity-inheritance.md @entities/models/subject-aware-attention-video.md

## Raw Concept

- **Title**: Harnessing Intrinsic Subject-Aware Attention for Controllable Multi-Subject Video Generation
- **Type**: arXiv:2609.11507 [cs.CV]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.11507
- **Code**: none found
- **Retrieved**: 2026-09-11

## Narrative

The paper studies multi-subject video generation and names two problems: inflexible fidelity strength and semantic drift. The authors find that some attention blocks in a Diffusion Transformer form an Intrinsic Spatial Grounding Map (ISGM). Their framework DIAL uses the ISGM in the low-noise stage for training-free fidelity control, and in the high-noise stage to build preference pairs for reinforcement learning. Tests on OpenS2V-Eval show better identity consistency and controllable fidelity strength. Image-gen Phase-1: none.

## Snippets

"We term these peaking internal signals the Intrinsic Spatial Grounding Map (ISGM). The ISGM precisely localizes reference subjects in the video latent space, providing an intrinsic guidance signal that can be leveraged to modulate and strengthen subject consistency throughout the denoising process." [Source: arxiv-2609.11507]
