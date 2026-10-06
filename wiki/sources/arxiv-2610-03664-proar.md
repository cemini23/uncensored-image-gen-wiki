---
title: "ProAR — prospective reasoning with autoregressive video models (arXiv:2610.03664)"
type: source
tags: [paper, video-generation, autoregressive, reasoning, wan, watch]
keywords: [ProAR, prospective reasoning, goal frame, transition alignment, autoregressive video, Wan2.2-TI2V-5B, asymmetric attention, VBVR, VideoRLVR]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-05-daily.md
  - concepts/autoregressive-video-foresight-training.md
  - entities/models/wan-2-2.md
maturity: draft
read_status: skimmed
created: 2026-10-06
updated: 2026-10-06
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-05-daily.md @concepts/autoregressive-video-foresight-training.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: ProAR: Learning Prospective Reasoning with Autoregressive Video Models
- **Type**: arXiv:2610.03664 (HK PolyU + UC Davis + Microsoft; Linghui Shen et al.)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.03664
- **Retrieved**: 2026-10-06

## Narrative

**What is new.** Autoregressive video generation is short-sighted — it optimizes each chunk locally. ProAR makes it goal-directed with two mechanisms: an **Outcome** signal, which predicts a goal frame at each step to anchor generation, and a **Transition** signal, which aligns current hidden states to clean future states. Prior AR work in this wiki (foresight alignment, hierarchical denoising, long-horizon memory) optimizes quality, consistency and horizon — not goal completion. The closest existing entry is Video-Mirai (`@concepts/autoregressive-video-foresight-training.md`), which distills future bidirectional representations but needs an **extra forward pass**; ProAR reuses teacher-forced clean next-chunk hidden states **in the same pass**.

**Method.** Wan2.2-TI2V-5B adapted to AR (causal attention plus teacher forcing). Each step jointly denoises the current chunk and a goal frame; an asymmetric mask lets the goal attend only to clean history while the current chunk also attends to the goal. A 236M three-block DiT predictor aligns the block-15 hidden state of the noisy current chunk to the clean next chunk (cosine loss, stop-gradient teacher). Loss is L_current + 0.25·L_goal + 0.01·L_align.

**Results.** VBVR 10-task mean 0.663 to 0.801 (+20.8% relative), beating Wan2.2-SFT (0.736) and closed-source Seedance 2.0 (0.627). VideoRLVR success rate 50.97 to 52.97, precision 61.56 to 67.17 (Sokoban precision 40.18 to 47.62). It surpasses the fully trained AR baseline at **25% of training steps**.

**Phase-0 (2026-10-06).** Base model is **Wan2.2-TI2V-5B — already in this wiki's local lineage** (`@entities/models/wan-2-2.md`), which is the useful part. But **no code and no weights are released**; only the project page `luka-group.github.io/ProAR`, with no licence. Training used 2–4 B200 GPUs, at +12–14% training cost and about +12% inference at chunk=4 with 20 denoising steps per chunk.

**Verdict: WATCH-thin.** The alignment predictor is **training-only and adds zero inference cost**, and the goal-frame anchor is a cheap idea — but B200-scale training plus absent weights keep it off the local build. Worth revisiting if the authors release the AR adaptation. There is a speculative conceptual Basgiath hook (factorized chunk generation toward a target biome, with the target belief protected from the uncertain current chunk), recorded in the entries above but not actionable.

## Snippets

[Source: https://arxiv.org/abs/2610.03664 (retrieved 2026-10-06) — VBVR 10-task mean 0.663 to 0.801.]
