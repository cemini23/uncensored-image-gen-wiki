---
title: Persistent Identity Preservation Benchmark
type: entity
tags: [benchmark, identity, persona, watch]
keywords: [identity preservation, persistent identity, subject-driven generation, evaluation]
related:
  - sources/arxiv-2609-04151-persistent-identity-preservation.md
  - concepts/persona-consistency-methods.md
  - concepts/likeness-collision-verification.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
maturity: draft
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH HIGH
wire_status: deferred
---

## Relations

@sources/arxiv-2609-04151-persistent-identity-preservation.md @concepts/persona-consistency-methods.md @concepts/likeness-collision-verification.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.04151 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-04151-persistent-identity-preservation.md

## Narrative

This benchmark measures whether a generative image model keeps the identity of a subject through generation and editing. The paper compares three paradigms: model-specific identity, in-context identity, and persistent identity. Persistent identity uses a dedicated identity layer that stays independent of one generative model. Identity drifts most under iterative edits, small subject scales, severe image degradation, and multi-subject composition. The reference implementation is PHOTA IDENTITY from Phota Labs. Code: none found. No clone by default. Image-gen Phase-1: none. wire_status: deferred.
