---
title: HunyuanImage 3.0 (Tencent)
type: entity
tags: [model, t2i, multimodal, autoregressive, moe, tencent, eastern-vanguard]
keywords: [HunyuanImage-3.0, 80B MoE, 13B active, TI2I, Chain-of-Thought, Instruct-Distil]
related:
  - sources/arxiv-2509-23951-hunyuanimage-3-0-technical-report.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/hydra-x.md
  - sources/uncensored-image-generation-survey.md
  - sources/synthetic-character-consistency-survey.md
  - sources/video-generation-survey-2026.md
  - concepts/persona-consistency-methods.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/model-selection-workflow.md
  - entities/uis/comfyui.md
  - entities/training-tools/musubi-tuner.md
  - sweeps/2026-07-02-daily.md
  - concepts/autoregressive-concept-erasure-obliviate.md
  - concepts/de-censoring-techniques.md
  - concepts/self-evolving-unified-multimodal-training.md
  - sources/arxiv-2606-27376-ask-solve-generate-self-evolving-multimodal.md
  - sources/arxiv-2606-28643-obliviate-autoregressive-concept-erasure.md
maturity: draft
created: 2026-07-02
updated: 2026-07-02
---

## Relations

@sources/arxiv-2509-23951-hunyuanimage-3-0-technical-report.md @entities/models/hunyuanvideo-1-5.md @sources/uncensored-image-generation-survey.md

## Raw Concept

Entity for **HunyuanImage 3.0** (arXiv:2509.23951) — Tencent 80B MoE autoregressive native multimodal image generator.

## Narrative

| Variant | Capabilities | VRAM (official) |
|---------|--------------|-----------------|
| HunyuanImage-3.0 | T2I | ≥3×80 GB |
| HunyuanImage-3.0-Instruct | T2I, TI2I, prompt rewrite, CoT | ≥8×80 GB |
| HunyuanImage-3.0-Instruct-Distil | above + 8-step sampling | ≥8×80 GB |

**Persona ops:** potential FLUX/Qwen-class host for character LoRA once training recipes stabilize — watch `PhotonAISG/hunyuan-image3-finetune` and CivitAI drops. Cross-carry to @entities/models/hunyuanvideo-1-5.md persona video stack when identity adapters port.

**Build-track:** Phase-0 **GO (catalog)** — weights on HF; **CONDITIONAL-GO (local)** only after GGUF/FP8 community quant proves ≤24 GB path.

## Snippets

> "Native multimodal model that unifies multimodal understanding and generation within an autoregressive framework."

## Dead Ends

3×80 GB minimum blocks default laptop workflow until quantization ecosystem matures.
