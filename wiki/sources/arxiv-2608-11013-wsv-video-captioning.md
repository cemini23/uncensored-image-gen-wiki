---
title: "Watching Synthetic Videos — zero-shot video captioning via T2V-aligned latents (arXiv:2608.11013)"
type: source
tags: [paper, video, captioning, eval, watch, synthetic-data]
keywords: [WSV, zero-shot video captioning, text-only training, 3D causal VAE, GPT-2 prompter, synthetic latents, MSVD, MSR-VTT, VATEX]
related:
  - concepts/multi-shot-audio-video-evaluation.md
  - concepts/world-models-video-generation.md
  - sweeps/2026-08-13-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-08-13
updated: 2026-08-13
---

## Relations

@concepts/multi-shot-audio-video-evaluation.md @concepts/world-models-video-generation.md @sweeps/2026-08-13-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: Watching Synthetic Videos: Aligning Cross-modal Representations with Visual Synthesis for Zero-shot Video Captioning
- **Authors**: Liangyu Fu, Junbo Wang, Yuke Li et al. (Northwestern Polytechnical University et al.)
- **Type**: arXiv:2608.11013 (9 pp)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.11013-watching-synthetic-videos-aligning-cross-modal-r.pdf`
- **URL**: https://arxiv.org/abs/2608.11013
- **Retrieved**: 2026-08-13

## Narrative

**Phase-0: WATCH (gen-adjacent eval/training-data technique).** Two-stage zero-shot video captioning: (1) a pretrained **text-to-video generation model** synthesizes video latent representations from text, polished to bridge the real/synthetic distribution gap; (2) a prompter conditions GPT-2 on the polished latents to produce captions. Inference encodes an input video via a pretrained 3D Causal VAE and feeds latents directly to the prompter. B@4 52 / CIDEr 95.7 on MSVD, MSR-VTT, VATEX.

**Image-gen relevance:** consumes open T2V generation as a *synthetic training-data engine* for video-language tasks — a technique that generalizes to captioning/eval-data bootstrapping for generated video (persona consistency checks, content description, alt-text pipelines). No code / weights released. Not a build-track model; WATCH for the synthetic-data pattern.

## Snippets

_(none)_
