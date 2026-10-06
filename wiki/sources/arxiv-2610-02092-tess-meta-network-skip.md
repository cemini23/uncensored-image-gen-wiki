---
title: ""TESS — meta-network data selection for LLMs (arXiv:2610.02092) — SKIP""
type: source
tags: [paper, llm-training, data-selection, out-of-domain, skip]
keywords: [TESS, meta-network, data selection, pointwise value matching, ScaleBiO, LLM instruction tuning, Alpaca, Dolly]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-05-daily.md
  - sweeps/2026-10-03-daily.md
  - sweeps/2026-10-04-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-06
updated: 2026-10-06
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-05-daily.md @sweeps/2026-10-03-daily.md @sweeps/2026-10-04-daily.md

## Raw Concept

- **Title**: Scalable, Transferable Meta-Network for Data Selection Requires a Different Loss (and Why the Obvious Choice Is Problematic)
- **Type**: arXiv:2610.02092 (Nanyang Technological University; Zilin Du et al. — ICLR 2027)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.02092-scalable-transferable-meta-network-for-data-sele.pdf (archived 2026-10-06)
- **URL**: https://arxiv.org/abs/2610.02092
- **Retrieved**: 2026-10-06

## Narrative

**What it does.** Learns a meta-network that scores each training example's utility. It shows the obvious objective (ScaleBiO/SBO) causes weight suppression and shortcut learning, and replaces it with a Pointwise Value Matching MSE loss.

**Results.** On LLM safety tuning (Alpaca/Dolly, Llama-3-8B, Qwen2.5-7B) TESS beats the best learnable baseline by 16.27% ASR, and by 24.58 points on generalization. Small-to-large transfer cut training time 5.65-6.60x. 13.4 h training, 156.8 GB peak memory.

**Why SKIP.** **The decisive question was which modality it selects data for.** It selects training data for **LLMs**, not image or video diffusion models. The loss is token-averaged cross-entropy over text; the datasets are Alpaca, Dolly and safety corpora; the target models are Llama-3-8B and Qwen2.5-7B. There is no image or video modality anywhere. This is not relevant to the wiki's LoRA/dataset-curation track, which curates image and video data. The transferable-scorer idea is methodologically interesting but the paper is text-only, and no sibling wiki covers LLM training data. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.02092 (retrieved 2026-10-06)]
