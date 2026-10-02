---
title: "Instruction factor bias — diagnosing which factors a model shortcuts (arXiv:2607.21582)"
type: source
tags: [paper, dataset-curation, caption-quality, bias-diagnostic, watch]
keywords: [factor dominance rate, factor hierarchy, bias-aware data, compositional generalization, robot demos, caption factors, cross-wiki]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-07-26-daily.md
  - concepts/multi-angle-dataset-prep.md
maturity: draft
read_status: skimmed
created: 2026-07-26
updated: 2026-10-02
phase0_verdict: WATCH
wire_status: wont_wire
cross-wiki-source: "@seo-wiki/sources/arxiv-qi-2026-bias-aware-compositional-robot-data-2607.21582-2026-07-26.md"
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-07-26-daily.md @concepts/multi-angle-dataset-prep.md

## Raw Concept

- **Title**: Factor Dominance Rate / Factor Hierarchy — bias-aware reallocation of a fixed demo budget
- **Type**: arXiv:2607.21582 (Qi et al.)
- **Source**: cross-wiki routed from `@seo-wiki` (SEO K146 digest brief, 2026-07-26); misfiled there by digest arXiv API bleed
- **URL**: https://arxiv.org/abs/2607.21582
- **Retrieved**: 2026-07-26

## Narrative

**The claim.** Factor Dominance Rate and Factor Hierarchy expose which instruction factors a policy is secretly keying on — the ones it shortcuts rather than genuinely grounds. Once the hierarchy is known, reallocating a *fixed* demonstration budget toward the under-grounded factors beats simply adding more data. In the paper's robot setting it reached parity with naive scale-up using half the demonstrations.

**Why it matters here.** The transfer to image/video LoRAs is by analogy, not by evidence: a persona LoRA can key on one caption factor (say, framing) and ignore another (say, lighting) while still scoring well. The diagnostic is the valuable part — **measure the factor hierarchy before spending on more data**, rather than after a disappointing training run.

**Phase-0.** The paper is a robotics policy result. It releases no code or weights relevant to training a diffusion LoRA, and its factor definitions are task-specific. **Verdict: WATCH / `wont_wire`** — the diagnostic *idea* applies to `@concepts/multi-angle-dataset-prep.md`, but nothing here is directly runnable. An operator would have to define the factors for their own caption schema.

## Snippets

[Source: https://arxiv.org/abs/2607.21582 (retrieved 2026-07-26)]
[Source: cross-wiki brief `2026-07-26_k146-instruction-factor-bias-from-seo.md`]
