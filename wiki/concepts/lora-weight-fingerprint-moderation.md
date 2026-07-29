---
title: LoRA weight-space fingerprinting for harmful-adapter screening
type: concept
tags: [concept, safety, moderation, lora, defensive]
keywords: [u1-singular-vector, weight-fingerprint, CSAM-LoRA-detection, marketplace-screening]
related:
  - sources/arxiv-2607-25750-csam-lora-weight-detect.md
  - concepts/persona-ops-stack.md
  - entities/marketplaces/civitai.md
  - sweeps/2026-07-29-daily.md
maturity: draft
created: 2026-07-29
updated: 2026-07-29
---

## Relations

@sources/arxiv-2607-25750-csam-lora-weight-detect.md @concepts/persona-ops-stack.md

## Raw Concept

Defensive question: can marketplace / private LoRA libraries be screened for harmful capability **from weights alone** without generating outputs?

## Narrative

UK AISI (arXiv:2607.25750) shows LoRA u1 singular vectors fingerprint training-domain intent (age proxy in the paper). Operator takeaway for persona ops: prefer weight-space / metadata-independent hygiene when ingesting third-party LoRAs; never use generative inspection for suspected CSAM content. Cross-routed defensive brief → cybersecurity wiki.

## Snippets

_(none)_
