---
title: "Video-Mirai — foresight training for AR video diffusion (arXiv:2606.03971)"
type: source
tags: [paper, video-generation, autoregressive, training, causal-forcing, consistency]
keywords: [Video-Mirai, foresight encoder, representation planning gap, Causal-Forcing, Self-Forcing, VBench, subject consistency, KV-cache]
related:
  - concepts/autoregressive-video-foresight-training.md
  - concepts/grpo-i2v-post-training.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - sources/video-generation-survey-2026.md
  - concepts/persona-consistency-methods.md
  - entities/models/wan-2-2.md
maturity: draft
read_status: read
created: 2026-06-04
updated: 2026-06-04
---

## Relations

@concepts/autoregressive-video-foresight-training.md @concepts/grpo-i2v-post-training.md @concepts/persona-consistency-methods.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: Video-Mirai: Autoregressive Video Diffusion Models Need Foresight
- **Authors**: Yonghao Yu et al. (U Tokyo, NII, PKU)
- **Type**: arXiv:2606.03971
- **Location**: `raw-sources/arxiv-2606-03971-video-mirai-autoregressive-video-diffusion-model.pdf`
- **URL**: https://arxiv.org/abs/2606.03971
- **Project**: https://y0uroy.github.io/Video-Mirai/
- **Retrieved**: 2026-06-04
- **Read status**: read (abstract + intro)

## Narrative

**Training-only** fix for the **representation-level planning gap** in causal AR video diffusion: present-segment supervision under-specifies which hidden states preserve identity/layout/motion for future segments.

Method: causal rollout → frozen **foresight encoder** reads completed rollout non-causally → lightweight **predictor** distills future-informed targets into current causal states (cosine loss, stopped gradients). Future frames supervise representations, never generator inputs. At inference: encoder + predictor discarded; same architecture, FLOPs, KV-cache as baseline.

**Claims [TENTATIVE]:** Causal-Forcing VBench Total 83.8→84.6; 30s rollouts — subject consistency 84.9→88.5, background 90.2→91.9. Orthogonal to Self-Forcing / Causal-Forcing / Rolling-Forcing / TAGRPO-style post-training.

### Workspace relevance

Persona I2V/T2V long rolls (Wan Causal-Forcing line) — reduces segment-boundary identity drift before lipsync. Pairs with @concepts/grpo-i2v-post-training.md (reward post-training) as complementary training axis.

## Snippets

> "Causality should constrain inference, not representation supervision."

> "Future frames supervise representations, never generator inputs."

## Dead Ends

None — Wan/Causal-Forcing weight drop not verified locally `[NEEDS VERIFICATION 2026-06-04]`.
