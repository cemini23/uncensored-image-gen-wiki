---
title: "Aslema NADI 2026 Tunisian Derja SLU (arXiv:2608.18689) — skip NLP shared-task"
type: source
tags: [paper, skip, nlp, slu, arabic, dialect]
keywords: [Aslema, NADI 2026, Tunisian Derja, SLURP-TN, Qwen3-Omni]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-20-daily.md
maturity: draft
read_status: read
created: 2026-08-20
updated: 2026-08-20
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@sweeps/2026-08-20-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: Aslema at NADI 2026: Augmentation through Fewshot for SLU
- **Authors**: Tajwaar Shafiq, Hunzalah Hassan Bhatti, Shammur Absar Chowdhury, Firoj Alam (QCRI / HBKU)
- **Type**: arXiv:2608.18689 [cs.CL]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.18689-aslema-at-nadi-2026-augmentation-through-fewshot.pdf`
- **URL**: https://arxiv.org/abs/2608.18689
- **Retrieved**: 2026-08-20
- **Code**: `hunzed/aslema_nadi2026` null SPDX. **Not cloned.** Not a ROUTE target.

## Narrative

**Phase-0: SKIP NLP shared-task.** NADI 2026 Task 5 intent/slot SLU on Tunisian Derja (SLURP-TN). Fine-tuned Qwen3-Omni-30B plus LLM+TTS synthetic Derja (VoxCPM voice clone) ranks 1st in slot filling (59.5 CoER) and 4th/8 in intent. Dialectal spoken-language understanding, not persona TTS/lipsync.

Image-gen `wont_wire`. Synthetic-speech mention is incidental. No sibling ROUTE.

## Snippets

> "Our final submitted system, based on Qwen3-Omni-30B and trained with a mixture of original and synthetic data, achieves 86.8% intent accuracy and 34.7 WER on the devtest split. On the official test set it ranks 1st in slot filling (59.5 CoER) and 4th among 8 teams in intent recognition (66.1% accuracy)."

[Source: arxiv-2608.18689, abstract]
