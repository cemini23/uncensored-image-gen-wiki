---
title: HYDRA-X (Tencent Hunyuan — holistic UMM)
type: entity
tags: [model, unified-multimodal, t2i, t2v, tencent, hunyuan, research]
keywords: [HYDRA-X, HYDRA-XTOK, Tencent Hunyuan, holistic visual tokenizer, 7B UMM, image video understanding generation editing]
related:
  - sources/arxiv-2606-13289-hydra-x-unified-multimodal.md
  - concepts/holistic-visual-tokenizer-umm.md
  - concepts/understanding-generation-gap.md
  - entities/models/bagel.md
  - entities/models/janus-pro.md
  - entities/models/seedance-2.md
  - sources/unireasoner.md
  - entities/models/blip3-o.md
  - entities/models/bagel.md
  - sources/video-generation-survey-2026.md
  - concepts/machine-mental-imagery.md
  - entities/benchmarks/mentisoculi.md
  - sources/arxiv-2602-02465-mentisoculi-visual-reasoning-limits-2026-06-13.md
  - sources/arxiv-2606-18249-uniar-shared-context-visual-tokenizer.md
  - concepts/shared-context-single-tokenizer-umm.md
  - entities/models/uniar.md
  - entities/models/hunyuanimage-3-0.md
  - sources/arxiv-2509-23951-hunyuanimage-3-0-technical-report.md
  - sources/arxiv-2606-27376-ask-solve-generate-self-evolving-multimodal.md
  - concepts/self-evolving-unified-multimodal-training.md
maturity: draft
created: 2026-06-12
updated: 2026-07-02
---

## Relations

@sources/arxiv-2606-13289-hydra-x-unified-multimodal.md @concepts/holistic-visual-tokenizer-umm.md @entities/models/bagel.md @entities/models/janus-pro.md @entities/models/seedance-2.md

## Raw Concept

Entity stub from 2026-06-12 ingest — HYDRA-X (arXiv:2606.13289), Tencent Hunyuan + NJU + Shanghai AI Lab.

## Narrative

**HYDRA-X** — 7B **unified multimodal model** with **HYDRA-XTOK** holistic visual tokenizer (single ViT for image + video). Five tasks: image/video understanding, image/video generation, instruction image editing.

| vs peer | HYDRA-X positioning |
|---------|---------------------|
| BAGEL / Janus-Pro | Unified tokenizer vs shared LLM + separate encoders |
| BLIP-3o | Adds native video temporal structure in tokenizer |
| Seedance 2.0 | Both unified A/V — Seedance is video-industrial; HYDRA-X is research UMM |
| Wan 2.2 | Specialist video DiT vs generalist UMM — different deployment tier |

**Phase-0:** Closed weights expected (Tencent). Watch for Hunyuan open releases. NSFW posture unknown — assume aligned `[NEEDS VERIFICATION 2026-06-12]`.

## Snippets

(See @sources/arxiv-2606-13289-hydra-x-unified-multimodal.md)

## Dead Ends

Not a replacement for local Wan + NSFW LoRA stack until open weights + community abliteration path exists.
