---
title: "Personality sliders — SAS inference-time LLM steering (arXiv:2603.03326)"
type: source
tags: [paper, persona-ops, llm, activation-steering, alignment]
keywords: [Sequential Adaptive Steering, SAS, Big Five, personality sliders, activation steering, SillyTavern, inference-time]
related:
  - concepts/sequential-adaptive-personality-steering.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - concepts/llm-interaction-style-governance.md
  - concepts/cross-model-safety-steering.md
  - concepts/domain-sensitive-llm-over-alignment.md
  - sweeps/2026-06-27-daily.md
maturity: draft
read_status: read
created: 2026-06-27
updated: 2026-06-27
---

## Relations

@concepts/sequential-adaptive-personality-steering.md @entities/persona-ops/sillytavern.md @concepts/persona-ops-stack.md

## Raw Concept

- **Title**: Controllable and explainable personality sliders for LLMs at inference time
- **Authors**: Florian Hoppe, David Khachaturov, Robert Mullins, Mark Huasong Meng
- **Type**: arXiv:2603.03326
- **Location**: `raw-sources/arxiv-2603.03326-personality-sliders-llm-inference-time.pdf`
- **URL**: https://arxiv.org/abs/2603.03326 · https://openreview.net/forum?id=6TuaAw1DkF
- **Retrieved**: 2026-06-27
- **Read status**: read (abstract + SAS method)

## Narrative

**Sequential Adaptive Steering (SAS)** — multi-dimensional **Big Five personality control** at inference via activation steering without weight updates.

**Problem:** naive multi-vector steering causes destructive interference / representation collapse.

**Fix:** train probes sequentially on residual streams **already shifted** by prior trait interventions → orthogonalized steering primitives composable via coefficients α.

Alternative to per-persona SFT/RLHF for SillyTavern-style DM stacks. Phase-0: **Skipped** — no public implementation repo at ingest.

## Snippets

> "Users can instantly synthesize novel, complex personality profiles by simply adjusting steering coefficients (α) without any additional training."

## Dead Ends

Research-only until open steering-vector release for local LLM backends (llama.cpp / vLLM hooks).
