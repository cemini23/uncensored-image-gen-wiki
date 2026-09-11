---
title: "PRISM-Bench audio-centric benchmark (arXiv:2609.04867)"
type: source
tags: [paper, benchmark, audio, video, watch]
keywords: [PRISM-Bench, T2AV, audio-centric benchmark, MLLM-as-a-Judge]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - concepts/persona-audio-stack.md
  - entities/benchmarks/prism-bench.md
maturity: draft
read_status: read
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @concepts/persona-audio-stack.md @entities/benchmarks/prism-bench.md

## Raw Concept

- **Title**: PRISM-Bench: An Audio-Centric Diagnostic Benchmark for Text-to-Audio-Video Generation
- **Type**: arXiv:2609.04867 [cs.MM]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.04867
- **Code**: none found
- **Retrieved**: 2026-09-11

## Narrative

The paper presents PRISM-Bench, the first audio-centric diagnostic benchmark for text-to-audio-video (T2AV) generation. The benchmark uses 900 human-verified samples. It splits audio evaluation along two axes: audio type (Speech, Music, Sound) and sound-source visibility (On-screen vs. Off-screen). It scores four perceptual dimensions with 35 criteria and uses a blind, side-by-side MLLM-as-a-Judge protocol against ground-truth references. The authors report strong alignment with human raters and a large gap between frontier and open-source systems. Image-gen Phase-1: none.

## Snippets

> "We present PRISM-Bench, the first audio-centric diagnostic benchmark for T2AV generation." [Source: arxiv-2609.04867]
