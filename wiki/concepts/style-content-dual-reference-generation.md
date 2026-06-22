---
title: Style-content dual-reference generation (FreeStyle)
type: concept
tags: [concept, image-generation, style-transfer, dual-reference, lora, civitai]
keywords: [FreeStyle, dual-reference, style reference, content reference, LoRA mining, content leakage, CAS, Rejection Score]
related:
  - sources/arxiv-2606-20506-freestyle-community-lora-mining.md
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
maturity: draft
created: 2026-06-22
updated: 2026-06-22
---

## Relations

@sources/arxiv-2606-20506-freestyle-community-lora-mining.md @entities/models/freestyle.md @concepts/reference-plus-lora-stacking.md @concepts/lora-taxonomy.md @entities/marketplaces/civitai.md

## Raw Concept

Ingest 2026-06-22 from FreeStyle (arXiv:2606.20506) — community LoRA mining for style+content dual-reference T2I.

## Narrative

**Task:** Given separate **content** and **style** references + text → image preserving structure while adopting style — harder than single-reference style transfer due to **semantic leakage** from style ref.

**FreeStyle data strategy:** Treat Civitai-class LoRAs as **cluster centers** for style vs content semantics; ComfyUI pipeline + filters build million-scale triplets across Flux / Illustrious / Qwen bases.

**Training tricks:**

- Two-stage curriculum (style-only transfer → full dual-reference)
- Attention enrichment constraint (stage 1)
- Frequency-aware RoPE (stage 2) — targets positional leakage

**Eval:** CAS (style-invariant content alignment), VLM rejection score for leakage.

### Workspace relevance

Maps directly to **persona style exploration** — borrow community LoRA aesthetics without copying subject identity from style ref. Complements manual reference+LoRA stacking (@concepts/reference-plus-lora-stacking.md) with learned disentanglement.

## Snippets

> "Models must balance content fidelity, style alignment, and instruction following while avoiding semantic leakage from the style reference."

## Dead Ends

Not identity-locked persona consistency (PuLID/character LoRA axis) — style/content refs are generic images.
