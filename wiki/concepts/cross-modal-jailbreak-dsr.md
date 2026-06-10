---
title: Cross-Modal Jailbreak (DSR)
type: concept
tags: [concept, security, jailbreak, mllm, multimodal, red-team]
keywords: [DSR, distributed semantic recomposition, cross-modal jailbreak, benign inputs harmful outputs, MLLM safety, utility-safety paradox]
related:
  - sources/arxiv-2606-01837-dsr-cross-modal-jailbreak.md
  - concepts/prompt-engineering-uncensored.md
  - sources/uncensored-image-generation-survey.md
  - sources/arxiv-2606-09701-advgrpo-red-teaming-routed.md
maturity: draft
created: 2026-06-03
updated: 2026-06-10
---

## Relations

@sources/arxiv-2606-01837-dsr-cross-modal-jailbreak.md @concepts/prompt-engineering-uncensored.md @sources/uncensored-image-generation-survey.md

## Raw Concept

Concept stub from K95 ingest — arXiv:2606.01837 Distributed Semantic Recomposition (DSR) attack framework.

## Narrative

**Cross-modal jailbreak attacks** hide harmful intent across image + text so unimodal filters miss it. Prior CMA still leaves **harm-bearing** tokens/pixels at the input — blockable by semantic auditing and cross-modal alignment filters.

**DSR (Distributed Semantic Recomposition)** splits intent into **benign primitives** in each modality; the MLLM **recomposes** harmful content at inference via reasoning — input toxicity stays near zero.

**Utility-Safety Paradox:** stronger instruction-following increases exploitability — safety and capability trade off at the reasoning layer, not just the prompt layer.

### Distinction from local uncensored gen

| Surface | Mechanism |
|---------|-----------|
| **Hosted MLLM** (GPT-4V, Gemini) | DSR-class attacks relevant |
| **Local diffusion** (FLUX, Wan) | CFG / encoder alignment — see @concepts/prompt-engineering-uncensored.md |

Persona operators mixing **cloud captioning / editing APIs** with local NSFW render should assume input filters are bypassable by decomposition attacks — keep generation local for sensitive content.

## Snippets

See @sources/arxiv-2606-01837-dsr-cross-modal-jailbreak.md (no harmful exemplars in wiki).

## Dead Ends

Offensive research — catalog only, not a generation technique.
