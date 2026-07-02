---
title: "HunyuanImage 3.0 — technical report (arXiv:2509.23951)"
type: source
tags: [paper, t2i, multimodal, autoregressive, moe, tencent, eastern-vanguard]
keywords: [HunyuanImage 3.0, 80B MoE, 13B active, native multimodal, Chain-of-Thought, open weights]
related:
  - entities/models/hunyuanimage-3-0.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/hydra-x.md
  - sources/uncensored-image-generation-survey.md
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/model-selection-workflow.md
  - entities/uis/comfyui.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2606-27376-ask-solve-generate-self-evolving-multimodal.md
  - concepts/autoregressive-concept-erasure-obliviate.md
  - sources/arxiv-2606-28643-obliviate-autoregressive-concept-erasure.md
  - sweeps/2026-07-02-daily.md
maturity: draft
read_status: read
created: 2026-07-02
updated: 2026-07-02
---

## Relations

@entities/models/hunyuanimage-3-0.md @entities/models/hunyuanvideo-1-5.md @sources/uncensored-image-generation-survey.md

## Raw Concept

- **Title**: HunyuanImage 3.0 Technical Report
- **Authors**: Tencent Hunyuan team (74 authors)
- **Type**: arXiv:2509.23951
- **Location**: `raw-sources/arxiv-2509.23951-hunyuanimage-3-0-technical-report.pdf`
- **URL**: https://arxiv.org/abs/2509.23951 · https://github.com/Tencent-Hunyuan/HunyuanImage-3.0
- **Retrieved**: 2026-07-02
- **Read status**: read (abstract + README + Phase-0)

## Narrative

**HunyuanImage 3.0** — native **autoregressive multimodal** model unifying understanding + generation. Image generation module publicly released.

**Scale:** **80B total MoE**, **13B active tokens** per forward — claimed largest open-source image generator at release `[TENTATIVE]`.

**Stack:** data curation, native Chain-of-Thought schema, progressive pre-training, aggressive post-training, inference infra. Variants on HF: base T2I, **Instruct** (T2I + TI2I + prompt rewrite + CoT), **Instruct-Distil** (8-step).

**Hardware:** README recommends **≥3×80 GB** (base) or **≥8×80 GB** (Instruct) — cloud/H200 tier, not laptop `[CONFIRMED]` from repo table.

### Workspace relevance

Eastern Vanguard T2I anchor alongside @entities/models/qwen-image-2512.md and @entities/models/z-image-turbo.md. Persona consistency via LoRA when community fine-tunes land (cf. PhotonAISG finetune repo). NSFW posture `[NEEDS VERIFICATION 2026-07-02]` — evaluate vs HunyuanVideo de-censor patterns.

Phase-0: **GO (catalog / cloud eval)** — `Tencent-Hunyuan/HunyuanImage-3.0` 3.1k★; custom Tencent license (not Apache).

## Snippets

> "13 billion parameters activated per token during inference, making it the largest and most powerful open-source image generative model to date."

## Dead Ends

Local 24 GB laptop inference infeasible at base config. Monitor distilled/quantized community ports.
