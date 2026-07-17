---
title: "TAGRPO — GRPO post-training for I2V with trajectory alignment (arXiv:2601.05729)"
type: source
tags: [paper, i2v, grpo, rlhf, wan, hunyuanvideo, post-training]
keywords: [TAGRPO, GRPO, DanceGRPO, trajectory alignment, image-to-video, Wan 2.2, HunyuanVideo-1.5, Tencent Hunyuan, memory bank]
related:
  - concepts/grpo-i2v-post-training.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - concepts/video-identity-inheritance.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2607-15273-meanflownft-forward-process-rl.md
  - entities/models/meanflownft.md
  - sweeps/2026-07-17-daily.md
maturity: draft
read_status: read
created: 2026-06-01
updated: 2026-07-17
---

## Relations

@concepts/grpo-i2v-post-training.md @entities/models/wan-2-2.md @entities/models/hunyuanvideo-1-5.md @concepts/video-identity-inheritance.md @sources/video-generation-survey-2026.md

## Raw Concept

- **Title**: TAGRPO: Boosting GRPO on Image-to-Video Generation with Direct Trajectory Alignment
- **Authors**: Jin Wang et al. (HKU + Tencent Hunyuan)
- **Type**: arXiv:2601.05729
- **Location**: `raw-sources/arxiv-2601.05729-tagrpo-boosting-grpo-on-image-to-video-generatio.pdf`
- **Retrieved**: 2026-06-01
- **Read status**: read (abstract + intro)

## Narrative

**Problem:** Visual GRPO methods (DanceGRPO, etc.) work on T2I/T2V but **fail to improve I2V consistently** on Wan 2.2 and HunyuanVideo-1.5 when applied naively.

**TAGRPO insight:** Videos rolled out from the **same conditioning image + identical initial noise** share structure — relative **trajectory ranking** among the group is more informative than per-sample reward scaling alone.

**Method:**
- Trajectory-wise GRPO loss on **intermediate latents** — pull toward high-reward trajectories, push away from low-reward within the group
- **Memory bank** of past rollout latents + rewards to reduce batch rollout cost (contrastive-learning pattern)

**Results [TENTATIVE — paper claims]:** Faster convergence and higher Q-Save / HPSv3 rewards vs DanceGRPO on Wan 2.2 and HunyuanVideo-1.5. Code/deliverables promised on project page.

### Workspace relevance

First open I2V-specific GRPO recipe targeting the **same bases** in the persona video stack (@entities/models/wan-2-2.md). Potential post-training path to improve I2V identity carry after PuLID-anchored master frames → @concepts/video-identity-inheritance.md.

## Snippets

> "Directly applying existing visual GRPO methods to state-of-the-art image-to-video models—such as Wan 2.2 and HunyuanVideo-1.5—fails to yield consistent reward improvements." [Source: arXiv:2601.05729 §1]

> "We encourage latents to align more closely with those from higher-reward videos while maintaining greater distance from lower-reward counterparts." [Source: arXiv:2601.05729 §1]

## Dead Ends

None yet — weights/release timeline `[NEEDS VERIFICATION 2026-06-01]`.
