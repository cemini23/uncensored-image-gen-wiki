---
title: Sequential adaptive personality steering (SAS)
type: concept
tags: [concept, persona-ops, llm, activation-steering, alignment]
keywords: [SAS, personality sliders, Big Five, multi-trait steering, SillyTavern, inference-time persona]
related:
  - sources/arxiv-2603-03326-personality-sliders-llm-inference-time.md
  - concepts/persona-ops-stack.md
  - entities/persona-ops/sillytavern.md
  - concepts/llm-interaction-style-governance.md
  - concepts/cross-model-safety-steering.md
  - concepts/activation-steering-video-generation.md
  - sources/arxiv-2606-29604-causal-perturbative-elicitation-llm.md
  - concepts/causal-perturbative-elicitation-llm.md
maturity: draft
created: 2026-06-27
updated: 2026-07-04
---

## Relations

@sources/arxiv-2603-03326-personality-sliders-llm-inference-time.md @entities/persona-ops/sillytavern.md @concepts/persona-ops-stack.md @concepts/causal-perturbative-elicitation-llm.md

## Raw Concept

Ingest 2026-06-27 from Hoppe et al. (arXiv:2603.03326) — composable Big Five sliders without fine-tuning.

## Narrative

### Persona stack positioning

| Method | Cost | Multi-trait | Workspace hook |
|--------|------|-------------|----------------|
| Character card + prompt | Low | Fragile | @entities/persona-ops/sillytavern.md default |
| SFT/DPO per persona | High | One profile | LoRA/adapter training |
| **SAS sliders** | Low (inference) | Composable α coeffs | Future local LLM backend |

**Key insight:** train steering probes **sequentially on shifted activations** so Big Five vectors don't destructively interfere — modular primitives vs monolithic RLHF personas.

### Build-track note

No open weights/vectors at ingest. Watch for release compatible with abliterated local chat models used in persona DMs.

**2026-07-04 contrast:** @concepts/causal-perturbative-elicitation-llm.md is the weight-space cousin of SAS. SAS promises composable residual-stream sliders; CPE learns low-rank adapters that can elicit latent behavioral modes from tiny prompt sets. Both are watch items until they have stable local-LLM hooks.

## Snippets

> "Sequential Adaptive Steering (SAS): orthogonalizes steering vectors by training subsequent probes on the residual stream shifted by prior interventions."

## Dead Ends

LLM-only — no direct image/video persona consistency bridge without separate visual adapters.
