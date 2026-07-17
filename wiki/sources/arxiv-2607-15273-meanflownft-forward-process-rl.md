---
title: "MeanFlowNFT — forward-process RL for MeanFlow (arXiv:2607.15273)"
type: source
tags: [paper, meanflow, rlhf, grpo, wan, few-step]
keywords: [MeanFlowNFT, NFT, forward-process RL, Wan2.1, SD3.5, VBench 84.33, Harahan]
related:
  - entities/models/meanflownft.md
  - concepts/grpo-i2v-post-training.md
  - entities/models/wan-2-2.md
  - sources/arxiv-tagrpo-i2v-grpo-2601-05729.md
  - sweeps/2026-07-17-daily.md
maturity: draft
read_status: read
created: 2026-07-17
updated: 2026-07-17
---

## Relations

@entities/models/meanflownft.md @concepts/grpo-i2v-post-training.md @entities/models/wan-2-2.md @sources/arxiv-tagrpo-i2v-grpo-2601-05729.md

## Raw Concept

- **Title**: MeanFlowNFT: Forward-Process Reinforcement Learning for Few-Step Generative Models
- **Authors**: Harahan et al.
- **Type**: arXiv:2607.15273
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.15273-meanflownft-bringing-forward-process-rl-to-avera.pdf`
- **URL**: https://arxiv.org/abs/2607.15273
- **Code**: https://github.com/Harahan/MeanFlowNFT (Apache-2.0)
- **Weights**: https://huggingface.co/Harahan/MeanFlowNFT
- **Project**: https://harahan.github.io/meanflownft-project-page/
- **Retrieved**: 2026-07-17

## Narrative

**MeanFlowNFT** applies **forward-process** RL (NFT-style) to MeanFlow few-step generators. README centers **SD3.5-M** training/eval; **Wan2.1** support is "being built" on the `wan` branch. Paper highlights Wan2.1 **4-step VBench 84.33**.

**Phase-0: WATCH / CONDITIONAL-GO** — Apache code + HF weights exist; full stack (SD3.5 / Wan / reward models) >>500 MB. Local adopt: **code clone only**. TipDrop: RL post-train watch alongside TAGRPO for future Wan few-step quality lifts — no smoke install today.

## Snippets

Paper claim (abstract): Wan2.1 4-step VBench **84.33** under MeanFlowNFT post-training. [Source: arXiv:2607.15273]
