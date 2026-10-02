---
title: "TabSOM — tabular-to-image encoding via self-organizing maps (arXiv:2608.13513)"
type: source
tags: [paper, tabular-to-image, som, out-of-domain, reference-only]
keywords: [TabSOM, self-organizing map, SOM component planes, tabular-to-image, Hungarian assignment, data encoding, cross-wiki]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-14-daily.md
maturity: draft
read_status: skimmed
created: 2026-08-14
updated: 2026-10-02
phase0_verdict: SKIP
wire_status: wont_wire
cross-wiki-source: "@seo-wiki/sources/arxiv-chushig-muzo-2026-tabsom-tabular-to-image-2608.13513-2026-08-14.md"
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-08-14-daily.md

## Raw Concept

- **Title**: TabSOM — tabular-to-image encoding using self-organizing map component planes
- **Type**: arXiv:2608.13513 (Chushig-Muzo et al.)
- **Source**: cross-wiki routed from `@seo-wiki` (SEO K158 digest brief, 2026-08-14); misfiled there by digest arXiv API bleed
- **URL**: https://arxiv.org/abs/2608.13513
- **Retrieved**: 2026-08-14

## Narrative

**What it does.** TabSOM maps tabular features onto a fixed image canvas using SOM component planes, assigned collision-free with a Hungarian assignment, plus a second channel encoding pairwise feature relations. It beats twelve tabular-to-image baselines on public binary-classification sets (rank 1-2, lowest variance), with interpretability via prototype partial-dependence and class-separation importance.

**Why this is out of scope.** This workspace is a librarian for **generative media** — image, video, voice, lipsync, music, SFX. TabSOM encodes *structured tabular data as an image* so a CNN/ViT can classify it. No generative model, no synthesis, no media output. The SEO brief routed it here only because it mentions images.

**Phase-0 / verdict.** No public GitHub at ingest. **SKIP / `wont_wire`.** One idea is noted for completeness and nothing more: a *fixed* spatial layout of features (rather than t-SNE-style jitter) is a cleaner canvas than random placement, and the pairwise-interaction channel is structure most prior encoders drop. Neither applies to generative media work. Page retained as the routing record so the brief is not re-triaged.

## Snippets

[Source: https://arxiv.org/abs/2608.13513 (retrieved 2026-08-14)]
[Source: cross-wiki brief `2026-08-14_k158-tabsom-tabular-to-image-from-seo.md`]
