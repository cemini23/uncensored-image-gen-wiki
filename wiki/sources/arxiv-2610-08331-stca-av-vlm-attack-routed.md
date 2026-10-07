---
title: "STCA — adversarial attack on autonomous-driving VLMs (arXiv:2610.08331) — routed cybersec"
type: source
tags: [paper, adversarial-attack, vlm, video, routed, out-of-domain]
keywords: [STCA, adversarial attack, black-box VLM, autonomous driving, temporal coherence, PGD, YOLOv8, BDD100K, nuScenes, Video-LLaVA, Qwen2.5-VL]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-07-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-08
updated: 2026-10-08
phase0_verdict: ROUTE
wire_status: routed
route_target: "@cybersecurity-wiki"
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-07-daily.md

## Raw Concept

- **Title**: Transferable Spatial Temporal Coherence Adversarial Attack on Black-Box Vision Language Models for Autonomous Driving
- **Type**: arXiv:2610.08331 (Heyam M. Bin Jahlan, Areej M. Alhothali, Abeer Alhothali)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.08331
- **Retrieved**: 2026-10-08

## Narrative

**What it is.** A three-stage black-box attack that drives video-VLM scene descriptions in autonomous driving toward wrong text. The contribution is adding a **temporal** attack to the usual spatial one and showing the two compose.

**Method.** Stage one expands the modality: Gemini 2.5 and Video-LLaVA generate candidate captions and CLIP picks the top three. Stage two is the spatial attack — CLIP selects the top 60 semantically aligned frames, YOLOv8 masks objects, and PGD perturbs against a white-box surrogate at eps=32/255. Stage three is the temporal attack — a motion mask from frame-to-frame mask differences drives a PGD perturbation at eps=16/255 minimising cosine similarity between adjacent-frame features on a LanguageBind encoder. Targets are Video-LLaVA-7B, Qwen2.5-VL-7B and Dolphin.

**Results.** On BDD100K, attack success rises from 32.6% to **71%** (Video-LLaVA), 45% to **84.2%** (Qwen2.5-VL), with Dolphin holding at 46.9% to 46.2%. On nuScenes, 57.6/64.7/37.6% to 83/96.5/47.1%. SSIM falls only 0.93 to 0.82, so the perturbation is visually mild. It beats PGD and FGSM baselines. The domain-tuned Dolphin is the most robust.

**Why it routes out.** This is an **attack methodology against a deployed safety-critical perception stack**, not a generative-media technique. The "spatial temporal coherence" in the title refers to *video* temporal coherence, not image coherence. Adversarial-example crafting via PGD is not generation in the image-gen sense, and there is no diffusion or image generator anywhere in the pipeline — the perturbed frames are not a generation artifact. **Verdict: ROUTE to `@cybersecurity-wiki`.** Image-gen keeps this routing record; image-gen Phase-1: none. **No code, no weights, no licence stated.** No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.08331 (retrieved 2026-10-08) — Qwen2.5-VL attack success 45% to 84.2% on BDD100K.]
