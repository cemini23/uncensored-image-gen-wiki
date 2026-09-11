---
title: VoxReason
type: entity
tags: [benchmark, tts, evaluation, watch]
keywords: [source-grounded speech planning, listener-free evaluation, speaking plan]
related:
  - sources/arxiv-2609-03203-voxreason.md
  - concepts/persona-audio-stack.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
maturity: draft
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH, no clone
wire_status: deferred
---

## Relations

@sources/arxiv-2609-03203-voxreason.md @concepts/persona-audio-stack.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.03203 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-03203-voxreason.md

## Narrative

VoxReason is a listener-free benchmark for source-grounded speech planning before synthesis. It checks whether delivery choices are grounded in cited source records. The planner emits a source-cited speaking plan, and a deterministic verifier checks citation legality, slot agreement, unsupported state, schema validity, and one-cue counterfactual locality. The method is narrow: it tests the pre-synthesis decision, not rendered waveform quality. The repo is MENGZHEGENG/voxreason, SPDX NOASSERTION, 1 star. License is unclear, so clone is not allowed. Adoption posture is watch-only until the license resolves. Image-gen Phase-1: none. wire_status: deferred.
