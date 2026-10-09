---
title: "SGF+ — decoupling gradient flows in autoregressive video (arXiv:2610.10429)"
type: source
tags: [paper, video-generation, autoregressive, training-method, wan, watch]
keywords: [SGF+, Self Gradient Forcing, gradient conflict, decoupled parameters, context writer, denoiser, KV cache, Wan2.1, causal forcing, Apache-2.0, Self Forcing]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-08-daily.md
  - concepts/decoupled-gradient-flows-autoregressive-video.md
  - concepts/autoregressive-video-foresight-training.md
  - concepts/serial-to-parallel-diffusion-schedule.md
  - entities/models/wan-2-2.md
maturity: draft
read_status: skimmed
created: 2026-10-09
updated: 2026-10-09
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-08-daily.md @concepts/decoupled-gradient-flows-autoregressive-video.md @concepts/autoregressive-video-foresight-training.md @concepts/serial-to-parallel-diffusion-schedule.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: SGF+: Decoupling Gradient Flows for Autoregressive Video Generation
- **Type**: arXiv:2610.10429 (Tsinghua University + Joy Future Academy, JD + CUHK; Zihan Su, Junhao Zhuang et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.10429-sgf-decoupling-gradient-flows-for-autoregressive.pdf (archived 2026-10-09)
- **URL**: https://arxiv.org/abs/2610.10429
- **Retrieved**: 2026-10-09

## Narrative

**The finding.** In autoregressive video diffusion, one set of parameters does two jobs: **writing context** (encoding already-generated frames into the KV cache) and **denoising** (predicting the next frames). The authors measure the gradients of those two roles and find they **systematically conflict** — mean angle 104 and 106 degrees in attention and FFN respectively, with all 512 sampled pairs showing negative cosine similarity. The network is being pulled in opposite directions by two tasks it must do at once.

**The fix.** Give the two roles separate parameters while keeping them **forward-coupled** through causal attention, and train on the original generation objective with no auxiliary losses. Parameters roughly double (1.4B to 2.8B) but the two halves initialise from the same autoregressive model and are optimised jointly through the shared KV state.

**Training.** A two-pass scheme: pass one is a no-grad self-rollout that records detached clean latents and exit noisy latents; pass two reconstructs with a differentiable KV path. It sits inside the **Self Forcing** family, which uses DMD-style distribution matching.

**Results.** Five seconds of training rollout extends to **up to 24 hours** of continuous generation with no long-video fine-tuning. At 60 s and 240 s, both framewise and chunkwise, it beats Self Forcing and the original SGF on subject and background consistency, flickering, motion smoothness, aesthetics and imaging. Inference memory rises 24.85 to 27.96 GB with essentially unchanged latency (4.969 s vs 4.962 s for 81 frames).

**Phase-0 (2026-10-09).** **Code and checkpoints ship** at `github.com/Zihan-Su/Self_Gradient_Forcing_Plus` and `huggingface.co/ZihanSu/Self_Gradient_Forcing_Plus`, both **Apache-2.0** — one of the most permissive releases in this batch. Student is a Wan2.1-T2V-1.3B, teacher is a frozen Wan2.1-T2V-14B; TF init comes from Causal Forcing. Training peaked around 98 GB across multiple GPUs.

**Verdict: WATCH-full.** It sits directly on the wiki's autoregressive-video track (`@concepts/autoregressive-video-foresight-training.md`, `@concepts/serial-to-parallel-diffusion-schedule.md`) and, unusually, ships permissively-licensed code and weights on the smallest Wan backbone. Two honest caveats: it is a **training-time** change, so adopting it means retraining a student rather than dropping in a module; and inference at 27.96 GB sits just over a 24 GB 4090, so it needs quantisation or offload. See `@concepts/decoupled-gradient-flows-autoregressive-video.md`. No Basgiath hook — Bedrock terrain generation is procedural, not AR diffusion.

## Snippets

[Source: https://arxiv.org/abs/2610.10429 (retrieved 2026-10-09) — 512 sampled gradient pairs, all negative cosine; conflict angle 104/106 degrees.]
