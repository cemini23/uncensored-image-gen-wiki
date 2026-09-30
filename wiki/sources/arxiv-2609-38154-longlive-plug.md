---
title: "LongLive-Plug — once-for-all distillation LoRAs for video generation (arXiv:2609.38154)"
type: source
tags: [paper, video-generation, distillation, wan, watch]
keywords: [LongLive-Plug, once-for-all distillation, CFG LoRA, few-step LoRA, long-context LoRA, Wan 2.1, Wan 2.2, DMD2, NVIDIA]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-30-daily.md
  - entities/models/longlive-plug.md
  - concepts/plug-and-play-distillation-lora.md
  - entities/models/wan-2-2.md
  - concepts/one-step-autoregressive-video-distillation.md
maturity: draft
read_status: skimmed
created: 2026-09-30
updated: 2026-09-30
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-30-daily.md @entities/models/longlive-plug.md @concepts/plug-and-play-distillation-lora.md @entities/models/wan-2-2.md @concepts/one-step-autoregressive-video-distillation.md

## Raw Concept

- **Title**: LongLive-Plug: Once-for-All Distillation for Video Generation
- **Type**: arXiv:2609.38154 (NVIDIA; Shuai Yang, Luozhou Wang et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2609.38154-longlive-plug-once-for-all-distillation-for-vide.pdf (archived 2026-09-30)
- **URL**: https://arxiv.org/abs/2609.38154
- **Retrieved**: 2026-09-30

## Narrative

**Once-for-all distillation.** The paper splits video acceleration into three *independent* functional LoRAs — CFG-free guidance, few-step sampling, and long-context error correction — trains each once per base model, then merges them into any compatible downstream model at deploy time. The claim is that decoupling beats the coupled CausVid / Self-Forcing LoRA style, which collapses when its guidance scale is rescaled.

Rank r=128 throughout. The few-step LoRA uses DMD2 (frozen real-score teacher, trainable fake-score critic, 4-step schedule). Base distillation costs about **80 H100 GPU-hours**, against ~376.8 GPU-hours for four equivalent per-task runs.

**Results.** Native 20-50 step schedules drop to **4 steps = 5-12.5x step reduction**. SCOPE FVD 805.5 (naive 4-step) to 478.7, versus 502.1 for task-specific distillation and 382.9 for native 30-step. The authors verify transfer across **54 downstream models** and 8 task categories, including models with added conditioning branches or extra output channels.

**Base backbones**: Wan2.1-14B, Wan2.2-TI2V-5B, MiniMax-H3.

**Phase-0 (2026-09-30).** Repo `github.com/NVlabs/LongLive` reads **Apache-2.0** on the repository page, ~2.7k stars, and weights ship in the HF collection `Efficient-Large-Model/longlive-plug` (includes `LongLive-1.3B`, `LongLive-2.0-5B`, NVFP4 variants). The paper itself states no license. Code **and** weights released, so this is the most actionable item in the 2026-09-30 batch.

**Clone deferred** — outbound network is denied in this session, so `git clone` could not run. The clone is the next operator action.

## Snippets

[Source: https://arxiv.org/abs/2609.38154 (retrieved 2026-09-30)]
[Source: https://github.com/NVlabs/LongLive (retrieved 2026-09-30) — "Released under the Apache License 2.0."]
