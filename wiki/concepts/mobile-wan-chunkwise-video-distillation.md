---
title: "MobileWan chunk-wise video distillation"
type: concept
tags: [video-generation, wan, distillation, mobile, compression, inference]
keywords: [MobileWan, recurrence distillation, head pruning, chunk-wise autoregressive, causal linear attention, Wan2.2, on-device]
related:
  - sources/arxiv-2607-06173-mobilewan-mobile-video-diffusion.md
  - entities/models/wan-2-2.md
  - concepts/one-step-autoregressive-video-distillation.md
  - concepts/input-stable-sparse-attention-video.md
  - concepts/cascaded-streaming-high-resolution-video.md
  - sweeps/2026-07-09-daily.md
maturity: draft
created: 2026-07-09
updated: 2026-07-09
---

## Relations

@sources/arxiv-2607-06173-mobilewan-mobile-video-diffusion.md @entities/models/wan-2-2.md @concepts/one-step-autoregressive-video-distillation.md @concepts/input-stable-sparse-attention-video.md

## Raw Concept

Synthesized from @sources/arxiv-2607-06173-mobilewan-mobile-video-diffusion.md — Qualcomm's Wan2.2-5B → mobile NPU distillation stack.

## Narrative

MobileWan shows a **server-scale 5B Wan DiT** can be reformulated for constant-memory inference via:

1. **Recurrence distillation** — chunk-wise autoregressive latent rollout instead of full-sequence attention
2. **Causal linear attention** — RNN-like state across chunks
3. **Learnable head pruning** — gated self-attention heads with noise-biased training
4. **Step + VAE decode compression** — end-to-end latency to ~20 s for 5 s clips on phone-class hardware

For the image-gen wiki operator stack, the actionable read is **distillation technique watch**, not mobile deployment. If Qualcomm releases recipes, they may inform server-side few-step Wan serving or long-clip memory bounds — adjacent to @concepts/input-stable-sparse-attention-video.md and @concepts/cascaded-streaming-high-resolution-video.md.

Phase-0: **WATCH** — no weights/repo at ingest.

## Snippets

> "The model generates videos chunk-by-chunk while restricting attention to a small local token set … enabling the diffusion transformer to operate as an RNN during inference."

## Dead Ends

- Planning persona video on Snapdragon NPU — out of laptop/RunPod scope until open weights + CUDA path exist.
