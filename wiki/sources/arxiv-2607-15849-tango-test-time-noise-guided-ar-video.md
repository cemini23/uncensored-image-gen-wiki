---
title: "TANGO — test-time noise-guided adaptation for AR video (arXiv:2607.15849)"
type: source
tags: [paper, video-generation, autoregressive, test-time, eccv]
keywords: [TANGO, terminal-points, noise-guided, AR-video, VBench, mever-team]
related:
  - entities/models/tango-ar-video.md
  - concepts/autoregressive-video-foresight-training.md
  - concepts/long-video-rag-retrieval.md
  - entities/models/wan-2-2.md
  - concepts/world-models-video-generation.md
  - sweeps/2026-07-20-daily.md
maturity: draft
read_status: read
created: 2026-07-20
updated: 2026-07-20
---

## Relations

@entities/models/tango-ar-video.md @concepts/autoregressive-video-foresight-training.md @entities/models/wan-2-2.md @concepts/world-models-video-generation.md

## Raw Concept

- **Title**: Test-Time Noise Guided Adaptation for Realistic Autoregressive Video Generation
- **Authors**: Dimitrios Karageorgiou et al. (CERTH / UvA)
- **Type**: arXiv:2607.15849 (ECCV 2026)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.15849-test-time-noise-guided-adaptation-for-realistic.pdf`
- **URL**: https://arxiv.org/abs/2607.15849
- **Project**: https://mever-team.github.io/tango/
- **Code**: https://github.com/mever-team/tango — **placeholder** ("Code coming soon")
- **Retrieved**: 2026-07-20

## Narrative

**TANGO** (Terminal points Avoidance through Noise Guided Optimization) treats the AR video diffuser as a critic of its own outputs: one-step-forward noise prediction should look isotropic Gaussian; deviation drives a search for trajectories that avoid "terminal points" on the real manifold that have no realistic continuation. Claims +3.1% absolute VBench and −28.3% FVD on 15s videos; applies to T2V / I2V / V2V without retraining.

**Phase-0: WATCH** — repo is README-only; no license/weights yet. Track for long persona rollouts once code drops. Do not TipDrop-route until install path exists.

## Snippets

> "Our code is available on https://mever-team.github.io/tango."

[Source: arXiv:2607.15849 abstract (retrieved 2026-07-20)]
