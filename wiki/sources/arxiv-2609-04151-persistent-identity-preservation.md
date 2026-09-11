---
title: "Persistent identity preservation benchmark (arXiv:2609.04151)"
type: source
tags: [paper, identity, benchmark, persona, watch]
keywords: [identity preservation, subject-driven generation, persistent identity, benchmark]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - concepts/persona-consistency-methods.md
  - concepts/likeness-collision-verification.md
  - entities/benchmarks/persistent-identity-preservation.md
maturity: draft
read_status: read
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH HIGH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @concepts/persona-consistency-methods.md @concepts/likeness-collision-verification.md @entities/benchmarks/persistent-identity-preservation.md

## Raw Concept

- **Title**: Persistent Identity Preservation in Generative Image Models: A Benchmark and Evaluation System
- **Type**: arXiv:2609.04151 [cs.CV]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.04151
- **Code**: none found
- **Retrieved**: 2026-09-11

## Narrative

The paper defines a unified benchmark for subject identity in generative image models. It groups methods into three paradigms: model-specific identity (for example LoRA), in-context identity (reference images in the input), and persistent identity (a reusable identity layer). It tests generation, editing, restoration, and multi-subject tasks with increasing identity stress. The results show that strong image quality and instruction following do not guarantee strong identity fidelity. Image-gen Phase-1: none.

## Snippets

"Persistent identity substantially reduces this degradation across generation, editing, and restoration." [Source: arxiv-2609.04151]
