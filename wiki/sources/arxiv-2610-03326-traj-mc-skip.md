---
title: ""Traj-MC — low-rank compression for diffusion LMs (arXiv:2610.03326) — SKIP""
type: source
tags: [paper, diffusion-language-model, compression, out-of-domain, skip]
keywords: [Traj-MC, diffusion language model, dLLM, low-rank approximation, SVD-LLM, LLaDA, Dream, trajectory-aware]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-05-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-06
updated: 2026-10-06
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-05-daily.md

## Raw Concept

- **Title**: Preserving Mathematical Reasoning in Compressed Diffusion Language Models via Trajectory-Aware Low-Rank Approximation
- **Type**: arXiv:2610.03326 (Duke University; Tian Liang et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.03326-preserving-mathematical-reasoning-in-compressed.pdf (archived 2026-10-06)
- **URL**: https://arxiv.org/abs/2610.03326
- **Retrieved**: 2026-10-06

## Narrative

**The trap is the word "diffusion".** This compresses **diffusion language models** (dLLMs) — masked text models such as LLaDA and Dream — not visual diffusion models. The method, Traj-MC, calibrates a low-rank decomposition on partially masked intermediate denoising states rather than on clean activations.

**Results.** At 20% parameter reduction, LLaDA-8B-Instruct GSM8K rises 42.2 to 56.7 over SVD-LLM, MATH-500 9.0 to 11.0, SVAMP 52.6 to 68.0.

**Why SKIP.** The low-rank object is the *token-masking trajectory* of a text dLLM. Visual DiTs have no token-masking trajectory, so the method does not transfer — "low-rank" is shared vocabulary only. Code is at `github.com/Zishan-Shao/traj-mc` with no licence stated. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.03326 (retrieved 2026-10-06)]
