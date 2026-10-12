---
title: Image-to-text feedback guidance (suppressing self-reinforcement in MMDiTs)
type: concept
tags: [image-generation, mmdit, inference-time, technique]
keywords: [image-to-text feedback, I2T message, joint attention, Semantic Feedback Guidance, SFG, iSFG, self-reinforcement, error preservation, PAG, SEG, training-free guidance]
related:
  - sources/arxiv-2610-13941-sfg-semantic-feedback-guidance.md
  - concepts/contextual-token-interpretability.md
  - concepts/mllm-dit-video-fusion.md
  - sweeps/2026-10-12-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
created: 2026-10-12
updated: 2026-10-12
---

## Relations

@sources/arxiv-2610-13941-sfg-semantic-feedback-guidance.md @concepts/contextual-token-interpretability.md @concepts/mllm-dit-video-fusion.md @sweeps/2026-10-12-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

The question this page answers: in a Multimodal Diffusion Transformer the image stream writes back into the text stream — is that feedback always helpful? Synthesized from arXiv:2610.13941 (Semantic Feedback Guidance).

## Narrative

**The mechanism.** An MMDiT runs text and image streams that exchange information through joint attention. Beyond the text-to-image direction everyone expects, there is an **image-to-text message** — the emerging image writing back into the text stream. The paper's claim is that this feedback **preserves what is already in the image, including its errors**. Once the model has committed to a wrong count, layout or attribute, the feedback reinforces the commitment rather than correcting it.

**This is the control surface for a channel the wiki already reads.** `@concepts/contextual-token-interpretability.md` covers the Contextual Reader (arXiv:2610.06844), which showed the shared channel carries a global representation of the emerging scene — readable even with an empty prompt, meaning the model's own latents feed semantics back into the channel independently of the text. The Contextual Reader *measures* that. This page is the intervention: it shows the channel can be **suppressed**, and that suppressing it improves adherence.

**The technique — training-free, inference-time.** Weights stay frozen. In each joint-attention block the image-to-text and text-to-image messages are rescaled after softmax, then sampling is guided *away* from an auxiliary branch that strengthens image-to-text and weakens text-to-image. The direction is deliberately **opposite** to PAG and SEG, which the paper reports as degrading the model. It runs only in roughly the first 20% of denoising steps — the window where structure is decided.

**Why the cheap variant matters.** **iSFG** applies the scaling in place with **zero extra function evaluations** and about 3% wall-time. Most inference-time guidance costs a second forward pass per step; this costs nothing measurable. That is what makes it practically interesting rather than just conceptually neat.

**Reported effect.** GenEval 0.6661 to 0.7479 on FLUX (counting 0.646 to 0.817), plus 1.33 HPSv2.1 on SD3.5-Medium at zero extra NFE, and it transfers to video (VBench 82.58 to 84.25 on HunyuanVideo T2V and to I2V).

**Operator caveats.** The visible win is **complex-prompt adherence** — counting, spatial position, attribute binding — not general image quality, and it is **not** a de-censoring tool. The reference implementation is a diffusers-only research release with **no licence file and no ComfyUI node**, so adoption means porting an attention processor by hand and accepting unresolved rights. It was tested at 80 GB; consumer VRAM is unstated, though frozen weights mean it should sit near the base model's footprint.

**A naming warning worth carrying.** This is **SFG = Semantic Feedback Guidance**. It is unrelated to **SGF+ = Self Gradient Forcing Plus** (`@sources/arxiv-2610-10429-sgf-plus.md`), a training-time autoregressive *video* method on Wan2.1 with the letters reversed. Both now live in this wiki; do not conflate them.

## Snippets

[Source: https://arxiv.org/abs/2610.13941 (retrieved 2026-10-12) — iSFG adds zero extra NFE for +1.33 HPSv2.1 on SD3.5-Medium.]
