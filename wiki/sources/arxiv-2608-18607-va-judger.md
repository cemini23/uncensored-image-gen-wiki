---
title: "VA-Judger joint video-audio reward model (arXiv:2608.18607)"
type: source
tags: [paper, video, audio, reward-model, rl, ltx, watch]
keywords: [VA-Judger, VAPref-10K, VA-Judger-Bench, LTX-2, OmniNFT, ShareLab-SII]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/multi-shot-audio-video-evaluation.md
  - concepts/persona-audio-stack.md
  - entities/benchmarks/va-judger.md
  - entities/models/ltx-2.md
  - sweeps/2026-08-20-daily.md
maturity: draft
read_status: read
created: 2026-08-20
updated: 2026-08-20
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@entities/benchmarks/va-judger.md @concepts/multi-shot-audio-video-evaluation.md @entities/models/ltx-2.md @concepts/persona-audio-stack.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-20-daily.md

## Raw Concept

- **Title**: VA-Judger: Reward Modeling from Human Preference Feedback for Joint Video-Audio Generation
- **Authors**: Yinming Huang, Shuyuan Tu, Xi Yan, Zihan Yang, Jianhua Han, Xu Hang, Yu-Gang Jiang, Zuxuan Wu (Shanghai Innovation Institution / Fudan / Yinwang)
- **Type**: arXiv:2608.18607 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.18607-va-judger-reward-modeling-from-human-preference.pdf`
- **URL**: https://arxiv.org/abs/2608.18607
- **Retrieved**: 2026-08-20
- **Code**: `ShareLab-SII/VA-Judger` ~71 MB. GitHub license **null / no LICENSE file**. **Not cloned**. No HF weights/datasets fetched.

## Narrative

First human-preference reward model aimed at *joint* video-audio generation rather than stitching VideoAlign / HPSv3 / Audiobox / CLAP / DeSync scores. Separate expert metrics miss cross-modal coherence (right visemes, wrong event; sharp video, wrong emotion in the track) and invite reward hacking under RL — the paper's foil is OmniNFT. Authors build **VAPref-10K** (~9K prompts, 10.3K pairwise comparisons from open generators), **VA-Judger-Bench** (in-domain + OOD closed models: Kling 2.6, Wan 2.6, Veo 3.1, Sora 2), and train a chain-of-thought omni judge: easy-pair CoT cold start, rejection-sampled hard-pair explanations verified against humans, then dimension-wise GRPO. They use the judge as the reward to post-train **LTX-2** and report better human-aligned quality than the base model and OmniNFT.

**WATCH.** Useful eval/RL pointer for LTX-2 / MSAV-style AV stacks. Do not clone until SPDX exists. No Image-gen Phase-1.

## Snippets

> "To address this problem, we first construct a large-scale human-preference dataset VAPref-10K for joint video-audio generation, comprising 9K prompts and 10.3K fine-grained paired comparisons from open-source generation models. We also introduce the VA-Judger-Bench benchmark with both in-domain and out-of-domain model comparisons to evaluate whether reward models truly align with human preferences. We further propose VA-Judger, a chain-of-thought omni-reward model for joint video-audio generation."

[Source: arxiv-2608.18607, abstract]
