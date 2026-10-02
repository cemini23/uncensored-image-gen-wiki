---
title: LongLive-Plug (NVIDIA — once-for-all distillation LoRAs for video)
type: entity
tags: [video-generation, distillation, lora, wan, nvidia, apache-2-0, acceleration]
keywords: [LongLive-Plug, LongLive, NVIDIA, once-for-all distillation, CFG LoRA, few-step LoRA, long-context LoRA, Wan 2.1, Wan 2.2, MiniMax-H3, DMD2, 4-step video]
related:
  - sweeps/2026-09-30-daily.md
  - concepts/plug-and-play-distillation-lora.md
  - sources/arxiv-2609-38154-longlive-plug.md
  - entities/models/wan-2-2.md
  - concepts/one-step-autoregressive-video-distillation.md
  - sources/arxiv-2610-02188-dmad.md
  - concepts/adversarial-distribution-matching-distillation.md
maturity: draft
created: 2026-09-30
updated: 2026-09-30
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@sweeps/2026-09-30-daily.md @concepts/plug-and-play-distillation-lora.md @sources/arxiv-2609-38154-longlive-plug.md @entities/models/wan-2-2.md @concepts/one-step-autoregressive-video-distillation.md @sources/arxiv-2610-02188-dmad.md @concepts/adversarial-distribution-matching-distillation.md

## Raw Concept

Page prompted by the 2026-09-30 ingest of arXiv:2609.38154. First entity page for the NVIDIA LongLive line in this wiki. No prior coverage of "functional LoRA" distillation for video.

## Narrative

**What it is.** A set of reusable distillation LoRAs for video diffusion models, trained once per base model and merged into compatible downstream models at deploy time. Three functions are decoupled into separate LoRAs:

| LoRA | Function | Training signal |
|------|----------|-----------------|
| CFG LoRA | Removes the need for classifier-free guidance at inference | Guided flow regression at a fixed guidance scale (w_train = 5); the inference weight acts as a guidance dial |
| Few-step LoRA | Cuts the sampling schedule to 4 steps | DMD2 — frozen real-score teacher, trainable fake-score critic, 4-step schedule, generator updated once per 5 critic updates |
| Long-context LoRA | Corrects error accumulation in long / streaming clips | Streaming Long Tuning + DMD on a causal-autoregressive base |

Rank r=128 for all three. Deployment merges two updates at once into the target weights, so a downstream model with an added conditioning branch or extra output channels still accepts them.

**Why decoupling matters.** Coupled CausVid / Self-Forcing style LoRAs collapse when their guidance scale is rescaled — the guidance and step-count behaviours are entangled. Splitting them keeps the guidance dial nearly linear and independent of the step count.

**Backbones and coverage.** Wan2.1-14B, Wan2.2-TI2V-5B, MiniMax-H3. The paper reports verification across 54 downstream models and 8 task categories.

**Performance.** 20-50 native steps to 4 steps, a 5-12.5x step reduction. SCOPE FVD 805.5 (naive 4-step) to 478.7, against 502.1 for task-specific distillation and 382.9 for native 30-step. Long-context on ReWorld 64 s improves 73.51 to 75.77; Matrix-Game 3.0 reaches 84.34 versus 84.30 for task-specific distillation with zero downstream training.

**Cost.** Base distillation is about 80 H100 GPU-hours (700 iterations, 32 GPUs, roughly 2.5 h), against roughly 376.8 GPU-hours for four equivalent per-task runs. The operator does not need to rerun this — the weights are published.

**Licence and availability (Phase-0, 2026-09-30).** Repo `github.com/NVlabs/LongLive` (**Apache-2.0**), about 2.7k stars. Weights in the HF collection `Efficient-Large-Model/longlive-plug`, including `LongLive-1.3B`, `LongLive-2.0-5B` and NVFP4 variants. Code and weights are both released, which makes this the strongest adoption candidate of the 2026-09-30 batch.

**Status: clone deferred.** Outbound network is denied in this session, so the repository could not be cloned. Next operator action: clone `github.com/NVlabs/LongLive` and pull the `longlive-plug` weights.

## Snippets

[Source: github.com/NVlabs/LongLive (retrieved 2026-09-30) — "Released under the Apache License 2.0."]
[Source: https://arxiv.org/abs/2609.38154 (retrieved 2026-09-30)]
