---
title: Subject-Aware Attention Video (DIAL)
type: entity
tags: [video, identity, multi-subject, watch]
keywords: [subject-to-video, identity consistency, ISGM, DIAL]
related:
  - sources/arxiv-2609-11507-subject-aware-attention-video.md
  - concepts/video-identity-inheritance.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
maturity: draft
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH HIGH
wire_status: deferred
---

## Relations

@sources/arxiv-2609-11507-subject-aware-attention-video.md @concepts/video-identity-inheritance.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.11507 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-11507-subject-aware-attention-video.md

## Narrative

This page covers DIAL, a framework for controllable multi-subject video generation. The method reads an Intrinsic Spatial Grounding Map (ISGM) from selected attention blocks of a Diffusion Transformer. At inference, the ISGM gives training-free control of fidelity strength. At training time, the same maps build preference pairs for reinforcement learning to reduce semantic drift. The source reports state-of-the-art results on the OpenS2V-Eval benchmark. The work order states no clone and the text shows no code repository. Image-gen Phase-1: none. wire_status: deferred.
