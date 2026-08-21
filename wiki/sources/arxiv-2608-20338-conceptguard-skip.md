---
title: "ConceptGuard LLM unlearning bench (arXiv:2608.20338) — skip LLM"
type: source
tags: [paper, skip, llm, unlearning, safety]
keywords: [ConceptGuard, dual-use concepts, unlearning, contextual separation]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-21-daily.md
maturity: draft
read_status: read
created: 2026-08-21
updated: 2026-08-21
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@sweeps/2026-08-21-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: ConceptGuard: Benchmarking Context-Sensitive Unlearning in Large Language Models
- **Authors**: Sahil Kale (PICT), Ian Harris (UC Irvine)
- **Type**: arXiv:2608.20338 [cs.CL]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.20338-conceptguard-benchmarking-context-sensitive-unle.pdf`
- **URL**: https://arxiv.org/abs/2608.20338
- **Retrieved**: 2026-08-21
- **Code**: No GitHub found. Dataset claimed public — **not downloaded.**

## Narrative

**Phase-0: SKIP LLM unlearning.** Dual-use concepts: forget harmful *uses* while retaining benign uses of the same concept. Current unlearning methods show weak contextual separation. This is not T2I de-censoring / abliteration. Image-gen `wont_wire`. CCC may treat it as an unlearning-eval sibling to Phantom Gains; no extra clone.

## Snippets

> "We argue that effective unlearning must operate at the level of concepts, ensuring complete removal of unsafe applications while maintaining their correct and useful usage."

[Source: arxiv-2608.20338, abstract]
