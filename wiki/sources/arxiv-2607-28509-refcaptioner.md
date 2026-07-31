---
title: "RefCaptioner — multi-reference image-grounded video captioning (arXiv:2607.28509)"
type: source
tags: [paper, video-captioning, evaluation, grounding, kling]
keywords: [RefCaptioner, MRVBench, HCD-GRPO, phrase-grounding]
related:
  - entities/benchmarks/refcaptioner.md
  - concepts/multi-shot-audio-video-evaluation.md
  - entities/benchmarks/filmops.md
  - entities/models/wan-2-2.md
  - sweeps/2026-07-31-daily.md
maturity: draft
read_status: read
created: 2026-07-31
updated: 2026-07-31
---

## Relations

@entities/benchmarks/refcaptioner.md @concepts/multi-shot-audio-video-evaluation.md @entities/benchmarks/filmops.md @sweeps/2026-07-31-daily.md

## Raw Concept

- **Title**: RefCaptioner: Multi-Reference Image-Grounded Video Captioning
- **Authors**: Tengfei Liu et al. (PKU / Kling Team / …)
- **Type**: arXiv:2607.28509
- **Code**: github.com/pkucs-Ltf/RefCaptioner (Apache-2.0)
- **Weights**: huggingface.co/TengfeiLiuCoder/RefCaptioner
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.28509-refcaptioner-multi-reference-image-grounded-vide.pdf`
- **URL**: https://arxiv.org/abs/2607.28509
- **Retrieved**: 2026-07-31

## Narrative

Two-stage post-training (mixed SFT + Hierarchical Coverage-Discounted GRPO) for captions that bind phrases to multiple reference images and reject distractors. MRVBench covers real + AI-generated video. Useful for persona identity QA (does caption ground the right LoRA subject?).

**Phase-0: CONDITIONAL-GO (code)** — Apache-2.0; local code clone `~/Desktop/projects/RefCaptioner` (~6 MB). Weights on David CUDA only (>>500 MB). Complements FilmOps cinematic QA.

## Snippets

_(none)_
