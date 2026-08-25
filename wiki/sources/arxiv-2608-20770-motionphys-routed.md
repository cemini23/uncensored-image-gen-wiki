---
title: "MotionPhys AI-video detector (arXiv:2608.20770) — routed cybersec"
type: source
tags: [paper, routed, deepfake-detection, security, video]
keywords: [MotionPhys, optical-flow, AI-generated video detection, CASIA]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/generative-ai-era-deepfake-landscape.md
  - concepts/persona-failure-modes.md
  - sources/arxiv-2606-15117-eav-dfd-deepfake-detection-routed.md
  - sweeps/2026-08-24-daily.md
maturity: draft
read_status: read
created: 2026-08-25
updated: 2026-08-25
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@sweeps/2026-08-24-daily.md @concepts/federated-daily-research-digest.md @sources/arxiv-2606-15117-eav-dfd-deepfake-detection-routed.md @concepts/generative-ai-era-deepfake-landscape.md @concepts/persona-failure-modes.md

## Raw Concept

- **Title**: MotionPhys: Detecting AI-Generated Videos via Physical Consistency of Optical-Flow Trajectories
- **Authors**: Haojin He, Hao Tan, Zichang Tan, Ajian Liu, Jun Wan (CASIA / UCAS / Sangfor)
- **Type**: arXiv:2608.20770 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.20770-motionphys-detecting-ai-generated-videos-via-phy.pdf`
- **URL**: https://arxiv.org/abs/2608.20770
- **Retrieved**: 2026-08-25
- **Code**: no matching public repo for *this* paper (`wangmiaowei/MotionPhysics` is a different AAAI work).

## Narrative

**Phase-0: SKIP gen / ROUTE cybersec.** Detector: sparse optical-flow trajectories as physical evidence (inertia, continuous forces, trajectory geometry) vs pixel/latent appearance artifacts. Same class as EAV-DFD — defensive detection of synthetic persona video, not a generator. Brief: `briefs/2026-08-25_motionphys-from-image-gen.md`. Image-gen `wont_wire`.

## Snippets

> "We introduce MotionPhys, a lightweight and interpretable framework that treats sparse motion trajectories as physical evidence rather than relying on appearance artifacts or generator-specific traces."

[Source: arxiv-2608.20770, abstract]
