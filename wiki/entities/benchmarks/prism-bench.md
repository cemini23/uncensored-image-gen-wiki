---
title: PRISM-Bench
type: entity
tags: [benchmark, audio, video, watch]
keywords: [PRISM-Bench, T2AV benchmark, audio-centric evaluation, MLLM-as-a-Judge]
related:
  - sources/arxiv-2609-04867-prism-bench.md
  - concepts/persona-audio-stack.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
maturity: draft
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@sources/arxiv-2609-04867-prism-bench.md @concepts/persona-audio-stack.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.04867 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-04867-prism-bench.md

## Narrative

PRISM-Bench is an audio-centric diagnostic benchmark for text-to-audio-video (T2AV) generation. It stratifies audio content by type (Speech, Music, Sound) and by sound-source visibility (On-screen vs. Off-screen). It scores four perceptual dimensions with 35 fine-grained criteria. The judge protocol uses blind, side-by-side comparison against ground-truth references. The paper reports a wide gap between frontier and open-source systems, and it states that current systems overfit to perceptual fidelity and fail at music and synchronized On-screen audio. The benchmark data is restricted by licensing and redistribution constraints; no code or clone fact is stated. Image-gen Phase-1: none. wire_status: deferred.
