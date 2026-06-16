---
title: "Avatar V — video-reference talking avatar (arXiv:2606.13872)"
type: source
tags: [paper, avatar, talking-head, video-reference, lipsync, persona-ops, heygen]
keywords: [Avatar V, HeyGen, VideoRef DiT, sparse reference attention, motion style transfer, 1080p, production avatar, OmniHuman, Seedance]
related:
  - concepts/video-reference-avatar-generation.md
  - entities/models/avatar-v.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - concepts/persona-audio-stack.md
  - entities/lipsync/liveportrait.md
  - entities/lipsync/latentsync.md
  - entities/models/seedance-2.md
  - entities/adapters/pulid.md
  - sources/synthetic-character-consistency-survey.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-16-daily.md
maturity: draft
read_status: read
created: 2026-06-16
updated: 2026-06-16
---

## Relations

@concepts/video-reference-avatar-generation.md @entities/models/avatar-v.md @concepts/persona-consistency-methods.md @concepts/video-identity-inheritance.md

## Raw Concept

- **Title**: Avatar V: Scaling Video-Reference Avatar Video Generation
- **Authors**: HeyGen Research
- **Type**: arXiv:2606.13872
- **Location**: `raw-sources/arxiv-2606.13872-avatar-v-scaling-video-reference-avatar-video-ge.pdf`
- **URL**: https://arxiv.org/abs/2606.13872 · https://www.heygen.com/research/avatar-v-model
- **Retrieved**: 2026-06-16
- **Read status**: read (abstract + model design overview)

## Narrative

**Problem:** Single-image avatar conditioning captures insufficient identity + cannot reproduce **dynamic talking style** (rhythm, micro-expressions, gestures). Pixel-uniform diffusion loss under-trains lip/teeth/gaze regions.

**Avatar V** — production-scale **video-reference-conditioned** talking avatar system:

| Component | Function |
|-----------|----------|
| **VideoRef DiT** | Full reference-video token sequence (not fixed embedding) via **Sparse Reference Attention** — linear cost on long refs |
| **Motion representation stream** | Closed-loop talking-style transfer |
| **Identity-aware SR refiner** | 1080p facial detail recovery |
| **Audio engine** | LLM-based voice cloning (bundled stack) |
| **Training** | 100M+ clips / 50M videos; 5-stage pipeline (T2V → A2V → personality SFT → distillation >10× → RLHF) |

**Claims [TENTATIVE]:** Unlimited-duration 1080p generation; beats Seedance 2.0, Kling O3 Pro, Veo 3.1, OmniHuman 1.5 on HeyGen cross-scene benchmark. Deployed at millions of requests — **closed API only**.

### Persona-ops relevance

Sets SOTA bar for **cloud talking personas** vs local stack (Fish-Speech + LatentSync + Wan I2V). Video-reference conditioning is the key delta vs single-image @entities/lipsync/liveportrait.md — directly relevant to persona consistency when reference clip is available.

**Build-track:** NO-GO for local laptop — commercial HeyGen; watch for architectural ideas (sparse ref attention) in open forks.

## Snippets

> "Rather than compressing identity into fixed-size embeddings, the model conditions directly on the full token sequence of a reference video."

> "Avatar V generates 1080p videos of unlimited duration, achieving state-of-the-art performance across identity preservation, lip synchronization, and generation quality."

## Dead Ends

No open weights or self-host path. Right-of-publicity / deepfake abuse surface — detection counterpart routed to cybersecurity (@sources/arxiv-2606-15117-eav-dfd-deepfake-detection-routed.md).
