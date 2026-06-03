---
title: "DSR — Cross-Modal Jailbreaking via Distributed Semantic Recomposition (arXiv:2606.01837)"
type: source
tags: [paper, security, jailbreak, mllm, multimodal, safety, red-team]
keywords: [DSR, distributed semantic recomposition, cross-modal jailbreak, MLLM, benign inputs harmful outputs, utility-safety paradox, content filter bypass]
related:
  - concepts/cross-modal-jailbreak-dsr.md
  - concepts/prompt-engineering-uncensored.md
  - sources/uncensored-image-generation-survey.md
maturity: draft
read_status: read
created: 2026-06-03
updated: 2026-06-03
---

## Relations

@concepts/cross-modal-jailbreak-dsr.md @concepts/prompt-engineering-uncensored.md @sources/uncensored-image-generation-survey.md

## Raw Concept

- **Title**: Benign Inputs, Harmful Outputs: Cross-Modal Jailbreaking via Distributed Semantic Recomposition
- **Authors**: Yani Wang, Yilong Yang, Yang Liu, Zhuzhu Wang, Zuobin Ying, Zhuo Ma
- **Type**: arXiv:2606.01837
- **Location**: `raw-sources/arxiv-2606.01837-benign-inputs-harmful-outputs-cross-modal-jailbr.pdf`
- **URL**: https://arxiv.org/abs/2606.01837
- **Retrieved**: 2026-06-03
- **Read status**: read (abstract + intro)

## Narrative

Prior **cross-modal jailbreak attacks (CMA)** still carry **harm-bearing** primitives visible in text or image inputs — semantic auditing and cross-modal alignment filters can block them. **Distributed Semantic Recomposition (DSR)** decomposes harmful intent into **benign textual and visual primitives** that pass input-level safety checks; the MLLM **fuses** them into harmful outputs during cross-modal inference via its reasoning ability.

Key property: **negligible input toxicity** while high attack success on commercial MLLM pipelines tested in paper `[TENTATIVE]`.

Identifies **Utility-Safety Paradox** — stronger instruction-following enables cognitive exploitation at inference time, not just prompt injection.

### Workspace relevance

**Red-team catalog entry** for operators using **hosted multimodal APIs** (GPT-4V-class image gen, Gemini) alongside local uncensored stacks — explains limits of input filters on cloud persona tooling. Distinct from local **de-censoring** (@concepts/prompt-engineering-uncensored.md): DSR targets MLLM guardrails, not diffusion CFG aborts. Research-layer only — do not reproduce harmful outputs in wiki snippets.

## Snippets

> "DSR decomposes harmful intent into a set of benign textual and visual primitives … enabling the latent fusion of these seemingly innocent components into harmful outputs during the cross-modal inference phase."

> "Our findings uncover a critical Utility-Safety Paradox in MLLMs, where the model's instruction-following proficiency facilitates its own cognitive exploitation."

## Dead Ends

Attack research — no defensive product integration. Local FLUX/Wan stacks without MLLM reasoning stage are out of scope for DSR mechanism.
