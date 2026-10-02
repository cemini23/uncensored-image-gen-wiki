---
title: "ERank — latent image richness as a data-selection signal (arXiv:2607.19315)"
type: source
tags: [paper, dataset-curation, data-selection, lora-training, watch]
keywords: [ERank, effective rank, channel covariance, image richness, data selection, dataset pruning, IC9600, cross-wiki]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-07-22-daily.md
  - concepts/multi-angle-dataset-prep.md
maturity: draft
read_status: skimmed
created: 2026-07-22
updated: 2026-10-02
phase0_verdict: WATCH
wire_status: wont_wire
cross-wiki-source: "@seo-wiki/sources/arxiv-smirnov-2026-erank-latent-image-richness-2607.19315-2026-07-22.md"
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-07-22-daily.md @concepts/multi-angle-dataset-prep.md

## Raw Concept

- **Title**: ERank — effective rank of latent channel covariance as a per-image richness score
- **Type**: arXiv:2607.19315 (Smirnov et al.)
- **Source**: cross-wiki routed from `@seo-wiki` (SEO K144 digest brief, 2026-07-22); misfiled there by digest arXiv API bleed
- **URL**: https://arxiv.org/abs/2607.19315
- **Retrieved**: 2026-07-22

## Narrative

**The claim.** ERank measures per-sample visual richness as the effective rank of the channel covariance of a frozen encoder's feature map. It is cheap (one frozen forward pass), label-free, and correlates with human complexity judgements at IC9600 r=0.72.

**Why it matters for this workspace.** It is a candidate **data-selection signal** for LoRA training sets — the same problem `@concepts/multi-angle-dataset-prep.md` solves by hand. It gives a numeric knob for the question "which of these 200 persona images belong in the training set?"

**The direction matters.** The reported results are task-dependent and go opposite ways: prune **low**-ERank samples for super-resolution gains, but prune **high**-ERank samples for OCR gains. There is no benefit for classification, segmentation or denoising. For a persona LoRA the correct direction is untested.

**Phase-0.** No public code at ingest. **Verdict: WATCH / `wont_wire`** — reimplement from the paper if adopting, or wait for a licensed repo under the 500 MB clone threshold. Adopting it today would mean writing the metric from scratch with no reference implementation.

## Snippets

[Source: https://arxiv.org/abs/2607.19315 (retrieved 2026-07-22)]
[Source: cross-wiki brief `2026-07-22_k144-erank-image-richness-from-seo.md`]
