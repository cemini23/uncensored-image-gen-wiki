---
title: "ARBOR — taxonomy-routed LoRA rank allocation for medical LLMs (arXiv:2610.06765) — SKIP"
type: source
tags: [paper, lora, medical, llm, out-of-domain, skip]
keywords: [ARBOR, conditional rank allocation, LoRA atoms, taxonomy routing, medical QA, Qwen3-8B, rank-one atoms, AdaLoRA]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-06-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-07
updated: 2026-10-07
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-06-daily.md

## Raw Concept

- **Title**: Conditional Rank Allocation for Taxonomy-Aware Medical Language Model Adaptation
- **Type**: arXiv:2610.06765 (National University of Singapore; Guangyuan Dong et al.)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.06765
- **Retrieved**: 2026-10-07

## Narrative

**What it does.** ARBOR (Adaptive Rank allocation with Budgeted On-demand Routing) is a LoRA variant that selects rank-one "atoms" per input, conditioned on a clinical taxonomy, instead of applying one fixed low-rank update to every question. The update selects the top-4 of 16 stored rank-one atoms through a straight-through gate. The gate sums four logits: question semantics from a frozen hidden state, a **specialty tag** (7 classes), an **operation tag** (8 classes), and their interaction.

**Results.** 69.69% macro over CMB / CMExam / MedQA / MedMCQA across five seeds, beating LoRA r16 by 1.26 points and MoELoRA by 1.30. The advantage grows from 0.08 to 1.94 points as the number of training specialties rises from 1 to 7.

**Phase-0 (2026-10-07).** No repository, no code statement, no licence. Trained on an A100-80GB for 400 updates.

**Why SKIP.** The decisive question was whether the *method* transfers to image/video diffusion LoRA training. It does not: the routing criterion is a **text-token taxonomy** — specialty and operation tags drawn from medical-QA metadata plus a frozen LLM decoder's hidden state. A vision DiT has no analogue; diffusion LoRAs route per timestep and per block, not per clinical label. Module-level rank reallocation for diffusion LoRA already exists as AdaLoRA. The gains are also under 1.3 points with several controls left unclosed by the authors. LLM-only, no vision path. No Basgiath hook.
