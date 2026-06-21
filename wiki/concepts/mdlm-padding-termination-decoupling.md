---
title: MDLM padding vs termination decoupling (VoidPadding)
type: concept
tags: [concept, mdlm, masked-diffusion, language-model, training, inference]
keywords: [VoidPadding, VOID token, EOS overflow, MDLM instruction tuning, Dream, LLaDA, adaptive canvas, block decoding]
related:
  - sources/arxiv-2606-17999-voidpadding-mdlm-padding.md
maturity: draft
created: 2026-06-21
updated: 2026-06-21
---

## Relations

@sources/arxiv-2606-17999-voidpadding-mdlm-padding.md

## Raw Concept

Ingest 2026-06-21 from VoidPadding (arXiv:2606.17999) — separate padding from semantic termination in MDLM instruction tuning.

## Narrative

**MDLMs** denoise a fixed response canvas. Using repeated `[EOS]` as padding (AR convention) overloads the token: it must mean both **end-of-meaning** and **empty slot**, causing **EOS overflow** when decoding in large blocks.

**VoidPadding:** `[VOID]` = padding; `[EOS]` = semantic stop only. Inference bans VOID generation; uses VOID density to trigger **canvas expansion**.

**Alternatives compared:** RainbowPadding and plain EOS-padding baselines in paper.

### Workspace relevance

Operator note for **Dream / LLaDA** MDLM backends in caption or chat pipelines — not image diffusion proper.

## Snippets

> "Decoupling these roles … mitigates EOS overflow under large-block decoding."

## Dead Ends

No image-gen application. Persona stack likely uses autoregressive LLMs (Llama/Qwen) not MDLMs unless explicitly deployed.
