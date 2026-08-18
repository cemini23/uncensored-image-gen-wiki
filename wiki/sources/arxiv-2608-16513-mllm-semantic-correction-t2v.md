---
title: "MLLM-guided semantic correction for T2V (arXiv:2608.16513)"
type: source
tags: [paper, video, t2v, mllm, training-free, watch]
keywords: [Semantic Assessment Supervisor, Semantic Modification Assistant, mid-generation, latent intervention, HunyuanVideo, CogVideoX]
related:
  - concepts/mllm-mid-generation-video-correction.md
  - concepts/mllm-dit-video-fusion.md
  - concepts/llm-as-image-conditioning.md
  - entities/models/agentic-i2v.md
  - entities/models/wan-2-2.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-18-daily.md
maturity: draft
read_status: read
created: 2026-08-18
updated: 2026-08-18
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/mllm-mid-generation-video-correction.md @concepts/mllm-dit-video-fusion.md @concepts/llm-as-image-conditioning.md @entities/models/agentic-i2v.md @entities/models/wan-2-2.md @concepts/federated-daily-research-digest.md @sweeps/2026-08-18-daily.md

## Raw Concept

- **Title**: MLLM-Guided Semantic Correction for Text-to-Video Generation
- **Authors**: Junhao Chen, Zheqi Lv, Keting Yin, Shengyu Zhang, Zhou Zhao, Feiyang Chen, Xinyu Duan, Baoxing Huai, Fei Wu (Zhejiang University / Huawei Cloud)
- **Type**: arXiv:2608.16513 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.16513-mllm-guided-semantic-correction-for-text-to-vide.pdf`
- **URL**: https://arxiv.org/abs/2608.16513
- **Retrieved**: 2026-08-18
- **Code**: none in PDF. GitHub search negative. No SPDX.

## Narrative

ZJU + Huawei Cloud **training-free** supervisor that sits *inside* a T2V diffusion sampling loop. T2V models (Sora-class closed; HunyuanVideo / CogVideoX open) still drop objects, flip attributes, or mismatch actions because intermediate latents have no semantic inspector. Prior fixes sit at the start (prompt/noise rewrite — Free-Bloom, GPT4Motion, FreeInit) or the end (VideoRepair, NeuS-E). CFG just turns the knob. None of them react mid-trajectory.

Two modules: **Semantic Assessment Supervisor** decodes intermediate preview frames (raw noisy latents are unreadable to an MLLM) and writes a deviation diagnosis; **Semantic Modification Assistant** applies a controllable latent-trajectory intervention. No weight updates. Claimed lifts in semantic alignment, visual fidelity, and temporal consistency across multiple benches [TENTATIVE, single source].

Do **not** dump this into `@concepts/mllm-dit-video-fusion.md` — that page is a token-bridge *architecture* (BiVidGen EMA tokens). This is an inference-loop corrector. Sibling contrast: Agentic I2V is prompt/seed/CFG search *before* a black-box sampler; this is online mid-loop.

**Phase-0: WATCH.** No code. Image-gen local wire: none (`deferred`).

## Snippets

> "We propose two key modules: a Semantic Assessment Supervisor that generates intermediate preview frames for semantic evaluations and deviation diagnostics, and a Semantic Modification Assistant that corrects semantic drift during inference via a controllable latent trajectory intervention."

[Source: arxiv-2608.16513, abstract]
