---
title: "SFG — suppressing image-to-text feedback in MMDiTs (arXiv:2610.13941)"
type: source
tags: [paper, image-generation, mmdit, inference-time, training-free, watch]
keywords: [Semantic Feedback Guidance, SFG, iSFG, image-to-text feedback, I2T message, joint attention, MMDiT, FLUX, SD3.5, HunyuanVideo, GenEval, PAG, SEG]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-12-daily.md
  - concepts/image-to-text-feedback-guidance.md
  - concepts/contextual-token-interpretability.md
  - concepts/mllm-dit-video-fusion.md
  - entities/models/flux-1-dev.md
maturity: draft
read_status: skimmed
created: 2026-10-12
updated: 2026-10-12
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-12-daily.md @concepts/image-to-text-feedback-guidance.md @concepts/contextual-token-interpretability.md @concepts/mllm-dit-video-fusion.md @entities/models/flux-1-dev.md

## Raw Concept

- **Title**: Images Talk Back: Guiding MMDiTs by Suppressing Image-to-Text Feedback
- **Type**: arXiv:2610.13941 (Stanford University + Tsinghua University; Yucheng Yang, Serena Yeung-Levy)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.13941-images-talk-back-guiding-mmdits-by-suppressing-i.pdf (archived 2026-10-12)
- **URL**: https://arxiv.org/abs/2610.13941
- **Retrieved**: 2026-10-12

## Narrative

**The mechanism.** In a Multimodal Diffusion Transformer the image stream writes back into the text stream through joint attention — the paper calls this the **I2T message**. Its claim is that this feedback **preserves whatever is already in the evolving image, including its errors**, rather than correcting them. The image effectively talks back and the model listens to itself.

**This grounds a page the wiki already tracks.** `@concepts/contextual-token-interpretability.md` covers the Contextual Reader (arXiv:2610.06844), which *measures* that the shared channel carries a global representation of the emerging scene, readable even with an empty prompt. SFG is the control surface for that same channel: it shows the feedback can be **suppressed**, and that suppressing it helps.

**The technique — training-free, inference-time.** Weights stay frozen. In every joint-attention block the method scales the I2T message and the text-to-image message after softmax, then guides *away* from an auxiliary branch that strengthens I2T and weakens T2I. This is the **opposite** direction to PAG and SEG, which the paper reports as degrading the model. It runs only in the first ~20% of steps.

**The cheap variant is the notable one.** **iSFG** applies the scaling in place with **zero extra NFE** and about 3% wall-time. That is a rare cost profile for an inference-time intervention — most add a second forward pass.

**Results.** FLUX with CFG+SFG raises GenEval 0.6661 to **0.7479** (counting 0.646 to 0.817). SD3.5-Medium with iSFG adds +1.33 HPSv2.1 at zero extra NFE. It transfers to HunyuanVideo T2V (VBench 82.58 to 84.25) and to I2V.

**Phase-0 (2026-10-12).** Code ships at `github.com/yyc1215lll-creator/SFG` (`run_image.py`, `run_video.py`) but there is **no LICENSE file** — only third-party notices. It is a diffusers-only research release with **no ComfyUI node**. Tested on SD3-Medium, SD3.5-Medium, FLUX.1-dev, FLUX-de-distill and HunyuanVideo-1.5, on one A800 80 GB; consumer VRAM is not stated, though frozen weights mean VRAM is roughly the base model's.

**A naming collision to record.** **SFG here means Semantic Feedback Guidance.** It is *not* **SGF+ (Self Gradient Forcing Plus, arXiv:2610.10429)**, which the wiki already tracks as `@sources/arxiv-2610-10429-sgf-plus.md` — that one is a training-time autoregressive-video method on Wan2.1 with reversed letters. The two are unrelated; do not merge them.

**Verdict: WATCH-full.** Training-free, cheap, and it grounds two MMDiT-internals pages the wiki already keeps. Hold deployment until a licence and a ComfyUI path exist. It is **not** a de-censoring tool; the visible win is complex-prompt adherence — counting, position and attribute binding — which is a thin but real hook for Basgiath promotional art with complex prompts. See `@concepts/image-to-text-feedback-guidance.md`.

## Snippets

[Source: https://arxiv.org/abs/2610.13941 (retrieved 2026-10-12) — GenEval 0.6661 → 0.7479; iSFG adds zero extra NFE.]
