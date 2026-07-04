---
title: Causal Perturbative Elicitation for LLM Behavior Modes
type: concept
tags: [concept, persona-ops, llm, activation-steering, lora, alignment]
keywords: [CPE, causal perturbative elicitation, weight-space steering, low-rank adapter, latent persona, sandbagging, alignment faking]
related:
  - sources/arxiv-2606-29604-causal-perturbative-elicitation-llm.md
  - concepts/sequential-adaptive-personality-steering.md
  - concepts/persona-ops-stack.md
  - sources/arxiv-2603-03326-personality-sliders-llm-inference-time.md
  - sweeps/2026-07-04-daily.md
maturity: draft
created: 2026-07-04
updated: 2026-07-04
---

## Relations

@sources/arxiv-2606-29604-causal-perturbative-elicitation-llm.md @concepts/sequential-adaptive-personality-steering.md @concepts/persona-ops-stack.md @sources/arxiv-2603-03326-personality-sliders-llm-inference-time.md

## Raw Concept

Created during the 2026-07-04 daily ingest after the CPE paper surfaced in the persona/diffusion-LoRA query lane. The paper is LLM-centric, but relevant to the persona stack's local chat model layer because it discovers weight-space behavioral modes rather than relying on brittle prompt personas.

## Narrative

**Causal Perturbative Elicitation** treats hidden LLM behaviors as nearby weight-space modes. It inserts unit-norm rank-1 LoRA perturbations into several early/mid transformer layers, measures their causal effect on a later target layer, then uses a tensor-decomposition-like objective to enumerate many diverse perturbations. At inference, each perturbation acts like a tiny adapter that can elicit or suppress a behavior.

For this workspace, the useful distinction is:

| Method | Changes weights? | Typical control surface | Fit for David |
|--------|------------------|-------------------------|---------------|
| Character card / system prompt | No | Text prompt | Production default today |
| SAS personality sliders | No | Activation vector coefficients | Watch for local backend hooks |
| **CPE** | Yes, low-rank adapter | Selected LoRA perturbation | Research-watch only |
| SFT / DPO / GRPO | Yes, full training | New model checkpoint | Too heavy for routine persona tuning |

CPE's upside is data efficiency: the paper reports coherent persona-like behavior from adapters trained on one prompt. Its downside is operational maturity: the public repo has no license metadata at ingest, minimal ecosystem adoption, and likely requires direct model-internals access rather than llama.cpp/SillyTavern-level hooks.

**Operator posture:** reference this when thinking about future local-LLM persona control, especially if prompt cards stop being enough. Do not replace the current SillyTavern/local-Qwen persona stack until CPE has a maintained, licensed implementation and a clear inference wrapper.

## Snippets

> "Perturbations causing large downstream effects within the network ... correspond to human-interpretable concepts and behavioral modes."

> "Users can instantly synthesize novel, complex personality profiles..." remains SAS's more practical promise; CPE is the heavier weight-space cousin. [Source: @sources/arxiv-2603-03326-personality-sliders-llm-inference-time.md]

## Dead Ends

- **Using CPE to bypass platform safety**: not a build-track goal. The retained value is local persona controllability and model-audit vocabulary.
- **Shipping a CPE brief to prod**: no active project mapping; wiki-only.
