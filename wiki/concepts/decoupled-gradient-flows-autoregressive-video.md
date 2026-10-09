---
title: Decoupled gradient flows in autoregressive video (role separation)
type: concept
tags: [video-generation, autoregressive, training-method, technique]
keywords: [gradient conflict, context writer, denoiser, role decoupling, KV cache, self forcing, SGF+, negative cosine, parameter separation, AR video]
related:
  - sources/arxiv-2610-10429-sgf-plus.md
  - concepts/autoregressive-video-foresight-training.md
  - concepts/serial-to-parallel-diffusion-schedule.md
  - concepts/one-step-autoregressive-video-distillation.md
  - entities/models/wan-2-2.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-08-daily.md
maturity: draft
created: 2026-10-09
updated: 2026-10-09
---

## Relations

@sources/arxiv-2610-10429-sgf-plus.md @concepts/autoregressive-video-foresight-training.md @concepts/serial-to-parallel-diffusion-schedule.md @concepts/one-step-autoregressive-video-distillation.md @entities/models/wan-2-2.md @concepts/federated-daily-research-digest.md @sweeps/2026-10-08-daily.md

## Raw Concept

The question this page answers: an autoregressive video model uses the same weights to write its own history into the cache and to predict the next frames — are those two jobs actually compatible? Synthesized from arXiv:2610.10429 (SGF+).

## Narrative

**The conflict, measured.** In autoregressive video diffusion, one parameter set does two things. It **writes context** — encoding already-generated frames into the KV cache. And it **denoises** — predicting the next frames. SGF+ measures the gradients of those two roles and finds they **systematically oppose each other**: mean angle 104 and 106 degrees in attention and FFN, with all 512 sampled parameter pairs showing negative cosine similarity.

That is a strong claim stated as a measurement rather than an intuition, and it explains a known symptom: AR video models that drift or degrade over long rollouts are being pulled in two directions by a shared parameter set.

**The fix.** Split the parameters by role while keeping the two halves **forward-coupled** through causal attention, and train on the original generation objective with **no auxiliary losses**. Parameters roughly double, but both halves initialise from the same autoregressive model so neither starts cold.

**Training procedure.** A two-pass scheme: a no-grad self-rollout records detached clean latents and exit noisy latents; a second pass reconstructs through a **differentiable KV path**. It sits inside the Self Forcing family, which uses DMD-style distribution matching rather than plain regression.

**Reported effect.** Five seconds of training rollout extends to **up to 24 hours** of continuous generation with no long-video fine-tuning. At 60 s and 240 s it beats Self Forcing and the original SGF on subject and background consistency, flickering, motion smoothness, aesthetics and imaging. Inference memory rises modestly (24.85 to 27.96 GB) with essentially unchanged latency.

**Where it sits.** This is a **training-time parameterisation change**, not a sampling-schedule change and not a distillation method. Contrast the neighbours:
- `@concepts/serial-to-parallel-diffusion-schedule.md` changes *when* the model is called at inference, with no retraining.
- `@concepts/one-step-autoregressive-video-distillation.md` trains a faster *student* to replace the model.
- This page changes *how the existing model is parameterised* for long-horizon stability, and must be trained in.

**Operator caveats.** Adopting it means **retraining a student**, so it suits someone building a model rather than someone running one. Inference at 27.96 GB sits just over a 24 GB card, so a 4090 will need quantisation or offload. The training peak of roughly 98 GB is multi-GPU. On the positive side this is one of the few entries in the wiki's AR-video lane with **Apache-2.0 code and weights already released** on the smallest Wan backbone, so it is inspectable and testable rather than theoretical.

## Snippets

[Source: https://arxiv.org/abs/2610.10429 (retrieved 2026-10-09) — 512 sampled gradient pairs, all negative cosine similarity; conflict angle 104/106 degrees.]
