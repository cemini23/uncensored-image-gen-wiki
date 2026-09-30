---
title: Plug-and-play distillation LoRAs (once-for-all video acceleration)
type: concept
tags: [video-generation, distillation, lora, acceleration, technique]
keywords: [once-for-all distillation, functional LoRA, CFG LoRA, few-step LoRA, long-context LoRA, plug-and-play, DMD2, CausVid, Self-Forcing, step reduction]
related:
  - sweeps/2026-09-30-daily.md
  - entities/models/longlive-plug.md
  - sources/arxiv-2609-38154-longlive-plug.md
  - concepts/one-step-autoregressive-video-distillation.md
  - entities/models/wan-2-2.md
maturity: draft
created: 2026-09-30
updated: 2026-09-30
---

## Relations

@sweeps/2026-09-30-daily.md @entities/models/longlive-plug.md @sources/arxiv-2609-38154-longlive-plug.md @concepts/one-step-autoregressive-video-distillation.md @entities/models/wan-2-2.md

## Raw Concept

The question this page answers: how do you get a 4-step, guidance-free video model without paying for a new distillation run every time the downstream model changes? Synthesized from arXiv:2609.38154 (LongLive-Plug) plus the existing distillation concept pages in this wiki.

## Narrative

**The problem.** Video diffusion models normally need 20 to 50 sampling steps and classifier-free guidance (two forward passes per step). Distillation cuts that cost, but the standard approach trains a *new* distilled model for each downstream variant. Add a ControlNet branch, change the output channels, or swap the task, and the distillation must be rerun. That is why a per-task run costs roughly 377 GPU-hours against 80 for one general run.

**The technique.** Split acceleration into *independent functions*, train each as its own LoRA, and merge them at deploy time.

- **CFG LoRA** — trained by guided flow regression at a fixed guidance scale. At inference the LoRA weight becomes a guidance dial, and the relationship stays near-linear.
- **Few-step LoRA** — trained with DMD2 (frozen real-score teacher, trainable fake-score critic). The generator updates once per five critic updates.
- **Long-context LoRA** — trained with Streaming Long Tuning plus DMD on a causal-autoregressive base, to stop error accumulation in long clips.

Merging is the deployment step: the LoRA updates are folded into the target model's weights. Because each function is separate, a downstream model that adds a conditioning branch or extra output channels still accepts them.

**Why it beats coupled distillation.** CausVid and Self-Forcing style LoRAs couple the guidance and step-count behaviours into one adapter. When the guidance scale is rescaled at inference, such a LoRA collapses — the few-step behaviour is destroyed. Decoupling removes that failure mode and lets the operator tune guidance and step count independently.

**What it costs an operator.** Nothing to train — the weights are published. The cost is paid once by the authors. Practical levers reported in the source: a wider LoRA rank and broader text-to-video prompt data both improve transfer to unseen downstream models.

**Where it fits in this wiki.** This is one branch of a broader tree. `@concepts/one-step-autoregressive-video-distillation.md` covers pushing the step count to one; this page covers making the acceleration *portable* across model variants. The worked implementation is `@entities/models/longlive-plug.md`, and the primary backbone is `@entities/models/wan-2-2.md`.

**Operator caveats.** The published weights are trained against specific backbones (Wan 2.1-14B, Wan 2.2-TI2V-5B, MiniMax-H3). Transfer to a heavily fine-tuned or abliterated checkpoint is untested here. The NVFP4 weight variants target Blackwell-class hardware; consumer 40-series cards should use the standard precision weights.

## Snippets

[Source: https://arxiv.org/abs/2609.38154 (retrieved 2026-09-30) — "20-50-step native schedules reduce to 4 steps (5-12.5x)."]
