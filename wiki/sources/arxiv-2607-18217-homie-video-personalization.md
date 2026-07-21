---
title: "HOMIE — human-object centric video personalization (arXiv:2607.18217)"
type: source
tags: [paper, video-generation, personalization, wan, apache-2-0]
keywords: [HOMIE, HOCVP, Wan2.1, MLLM, Qwen3-VL, subject-driven]
related:
  - entities/models/homie.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
  - concepts/reference-plus-lora-stacking.md
  - entities/models/wan-2-2.md
  - entities/uis/comfyui.md
  - sweeps/2026-07-21-daily.md
maturity: draft
read_status: read
created: 2026-07-21
updated: 2026-07-21
---

## Relations

@entities/models/homie.md @concepts/persona-consistency-methods.md @concepts/video-identity-inheritance.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: HOMIE: Human-object Centric Video Personalization via Multimodal Intelligent Enhancement
- **Authors**: Yiyang Cai et al. (HKUST)
- **Type**: arXiv:2607.18217
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.18217-homie-human-object-centric-video-personalization.pdf`
- **URL**: https://arxiv.org/abs/2607.18217
- **Project**: https://yiyangcai.github.io/homie-page.github.io/
- **Code**: https://github.com/YIYANGCAI/HOMIE — **Apache-2.0**
- **Weights**: HF `yychai/homie-r2v-wan2.1` (+ Wan2.1-T2V-14B Diffusers + Qwen3-VL-2B-Thinking)
- **Retrieved**: 2026-07-21

## Narrative

**HOMIE** unifies inter-subject (multi human/object refs + abstract logos) and intra-subject (OCR maps / multi-view) video personalization on **Wan2.1-T2V-14B** with MLLM (Qwen3-VL) guidance in self-attention + modality-reference embeddings. Inference code + checkpoints released 2026-07-21.

**Phase-0: CONDITIONAL-GO (code only)** — Apache-2.0 confirmed. Local adopt: shallow clone `~/Desktop/projects/HOMIE` (~22 MB). Full smoke needs Wan2.1-14B + HOMIE safetensors + Qwen3-VL-2B (>>500 MB) → CUDA RunPod only. Strong persona product-demo / prop-interaction path (human holding branded object).

## Snippets

> "We release the technical report, inference codes as well as checkpoints tuned on Wan2.1-T2V-14B."

[Source: github.com/YIYANGCAI/HOMIE README (retrieved 2026-07-21)]
