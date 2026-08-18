---
title: "TransAnyText e-commerce image text (arXiv:2608.16284) — skip gen / route SEO"
type: source
tags: [paper, skip, routed, e-commerce, vlm, inpainting]
keywords: [TransAnyText, HTML patches, TransAnyDataset, TransAnyBench, JD.com, image text translation]
related:
  - sweeps/2026-08-18-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-08-18
updated: 2026-08-18
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

Primary: SEO wiki brief `briefs/2026-08-18_transanytext-from-image-gen.md`.
@sweeps/2026-08-18-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: TransAnyText: Translating Arbitrary Text in E-commerce Images via Structured Visual Generation
- **Authors**: Xiaoan Liu, Lichen Ma, et al. (Wuhan University / JD.com / XJTU / HKUST-GZ)
- **Type**: arXiv:2608.16284 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.16284-transanytext-translating-arbitrary-text-in-e-com.pdf`
- **URL**: https://arxiv.org/abs/2608.16284
- **Retrieved**: 2026-08-18
- **Code**: none in PDF. No GitHub. No SPDX.

## Narrative

**Phase-0: SKIP gen / ROUTE seo.** JD.com pipeline turns in-image e-commerce text (product shots, banners, detail pages) into **renderable HTML patches**. A VLM does visual understanding, translation, and structured visual code; a diffusion model inpaints the background and refines pixels; deterministic HTML render writes the target-language text. Three-stage post-training: SFT image-to-code, privilege-gap weighted self-distillation for style/layout tokens, RL with verifiable rewards. Ships TransAnyDataset / TransAnyBench.

This is marketplace localization, not persona T2I, not identity, not lipsync. Competing against cascaded OCR→translate→erase→repaint and closed image editors (Seedream, Nano Banana, GPT Image). Not atto / poker / guruwatcher / prod. Image-gen local wire: none (`wont_wire`).

## Snippets

> "Our framework decouples semantic generation from pixel rendering: a vision-language model (VLM) handles visual understanding, cross-lingual translation, and structured visual generation, while a diffusion model performs background inpainting and pixel-level refinement, followed by deterministic rendering to synthesize the final image."

[Source: arxiv-2608.16284, abstract]
