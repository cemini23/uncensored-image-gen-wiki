---
title: "FreeStyle — style-content dual-reference via community LoRA mining (arXiv:2606.20506)"
type: source
tags: [paper, image-generation, lora, style-transfer, dual-reference, civitai, flux, illustrious, qwen]
keywords: [FreeStyle, community LoRA mining, CRef SRef, content leakage, frequency-aware RoPE, CAS, Civitai, TensorArt, ComfyUI triplets]
related:
  - concepts/style-content-dual-reference-generation.md
  - entities/models/freestyle.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/lora-taxonomy.md
  - concepts/persona-consistency-methods.md
  - entities/models/flux-1-dev.md
  - entities/models/pony-v6.md
  - entities/models/illustrious-xl.md
  - entities/models/qwen-image-2512.md
  - entities/marketplaces/civitai.md
  - entities/uis/comfyui.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-22-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-06-22
updated: 2026-06-22
---

## Relations

@concepts/style-content-dual-reference-generation.md @entities/models/freestyle.md @concepts/reference-plus-lora-stacking.md @concepts/lora-taxonomy.md @entities/marketplaces/civitai.md

## Raw Concept

- **Title**: FreeStyle: Free Control of Style-Content Dual-Reference Generation from Community LoRA Mining
- **Authors**: Jinghong Lan, Wei Cheng, Yunuo Chen et al.
- **Type**: arXiv:2606.20506
- **Location**: `raw-sources/arxiv-2606.20506-2606-20506v1-freestyle-free-control-of-style-con.pdf`
- **URL**: https://arxiv.org/abs/2606.20506 · https://github.com/Blue2Giant/FreeStyle
- **Retrieved**: 2026-06-22
- **Read status**: read (abstract + pipeline)

## Narrative

**FreeStyle** — scalable **style + content dual-reference** image generation by mining **community LoRAs** (Civitai / TensorArt / Liblib) as compositional style/content anchors.

**Data pipeline:**

- ComfyUI batch generation + filtering → large triplets `(content ref, style ref, text, target)`
- **CRef+SRef dataset:** ~480K dual-reference sequences (Flux 273K + Illustrious 173K + Qwen 34K), 1,704 styles
- **SRef-only dataset:** ~619K style-reference sequences, 622 styles

**Training curriculum (leakage control):**

1. Style-transfer stage — attention-level enrichment constraint suppresses style-ref content leakage
2. Dual-reference stage — **frequency-aware RoPE** blocks positional-correspondence leakage

**Benchmark:** style similarity, content preservation (style-invariant **CAS**), aesthetics, instruction following, VLM **Rejection Score** for leakage.

### Workspace relevance

- **Direct persona ops angle:** automates style/content disentanglement using the same Civitai LoRA long tail operators already curate
- Open **Apache-2.0** repo + dataset release — Phase-0 **GO** for pipeline study / adapter recipes
- Bases: Flux, Illustrious, Qwen-Image class — aligns with Eastern Vanguard stack

## Snippets

> "We treat community LoRAs as compositional anchors for style and content."

> "A key bottleneck is the lack of large-scale triplet data with clean content-style separation and broad long-tail style coverage."

## Dead Ends

Trained model weights availability TBD beyond dataset — verify HF release before production adoption.
