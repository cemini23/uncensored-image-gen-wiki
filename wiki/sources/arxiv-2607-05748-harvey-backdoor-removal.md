---
title: "HARVEY — learn backdoor to remove backdoor (arXiv:2607.05748)"
type: source
tags: [paper, ml-security, backdoor, peripheral]
keywords: [HARVEY, backdoor defense, data poisoning, anti-backdoor learning, AAAI 2025]
related:
  - sweeps/2026-07-10-daily.md
maturity: draft
read_status: skimmed
created: 2026-07-10
updated: 2026-07-10
---

## Relations

_(peripheral ML-security paper — no image-gen entity links)_

## Raw Concept

- **Title**: Two Sides of the Same Coin: Learning the Backdoor to Remove the Backdoor
- **Authors**: Qi Zhao, Christian Wressnegger
- **Type**: arXiv:2607.05748 · AAAI 2025 journal reference
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607-05748-2607-05748v1-two-sides-of-the-same-coin-learning.pdf`
- **URL**: https://arxiv.org/abs/2607.05748
- **Retrieved**: 2026-07-10
- **Read status**: skimmed (abstract only)

## Narrative

**HARVEY** is a training-time defense against poisoned/backdoored models. Instead of learning a benign reference model to filter clean samples, it learns a **backdoored reference oracle** to identify poisonous samples more accurately, then removes the backdoor.

Sweep landed via uncensored-alignment query (adjacent to safety/alignment lane). **Not an image-gen adoption target** for David's persona pipeline — filed for federation completeness and cross-wiki routing to @wiki-cybersec if needed.

Phase-0: **SKIP** — no operator action in image-gen workspace.

## Snippets

> "Learning a backdoored reference model is significantly easier than learning a reference model on benign data."

## Dead Ends

- Persona LoRA / ComfyUI adoption — unrelated to generative-media workflows here.
