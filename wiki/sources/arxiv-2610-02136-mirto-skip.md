---
title: "MIRTO — brain-MRI anomaly segmentation eval protocol (arXiv:2610.02136) — SKIP"
type: source
tags: [paper, medical-imaging, evaluation, out-of-domain, skip]
keywords: [MIRTO, unsupervised anomaly detection, UAD, brain MRI, registration gate, multiverse testing, BraTS, conformal threshold, clinical]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-02-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-02
updated: 2026-10-02
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-02-daily.md

## Raw Concept

- **Title**: MIRTO: a registration-gated, multiverse-tested evaluation protocol for unsupervised anomaly segmentation in brain MRI
- **Type**: arXiv:2610.02136 (University of Milan / Politecnico di Milano + Human Technopole; Negin Kafee Hernashki, Soumick Chatterjee)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.02136
- **Retrieved**: 2026-10-02

## Narrative

**What it is.** An *evaluation protocol*, not a model. It measures how much of an unsupervised-anomaly-detection leaderboard is decided by evaluation choices — registration, thresholding, aggregation, lesion definition — rather than by the models, and shows those choices can flip rankings. It runs on frozen stored anomaly maps with no retraining.

**Method.** Four components: a registration gate (56 candidate transforms, centroid within 3 mm, overlap floor 0.85) plus five label-free diagnostics; thresholds chosen on validation data only, reporting realised versus nominal false-positive burden with a conformal per-scan guarantee; a multiverse of 15,552 defensible pipelines across 10 axes; and paired subject-bootstrap intervals with Holm correction. Four methods are compared (REFLECT, UCcD, cDDPM, AnomalyDINO) on 312 BraTS 2020 subjects.

**Results.** An axis-order mapping error dropped cDDPM voxel AUROC from 0.873 to 0.583 while slice AUROC barely moved. Method explains at least 0.95 of the variance in voxel AUROC/AUPRC but only 0.14 in lesion sensitivity. Budget and aggregation flip residual-model Dice rankings in 36-49% of universes. A training-free change to REFLECT latent aggregation raised Dice by 0.052.

**Phase-0 (2026-10-02).** Code at `github.com/soumickmj/MIRTO` (evaluator, analysis code, checklist); no explicit code licence in the text, and the MOOD dataset is CC BY-SA 3.0.

**Why SKIP.** Domain is clinical neuroimaging — brain-MRI tumour segmentation and UAD benchmark methodology. Diffusion models appear only as the detectors under test, so there is no generative-media application. No sibling wiki (cybersec, game-dev, SEO, OSINT/finance, 3D-printing, CCC) covers clinical medical imaging. Page kept as the triage record so the paper is not re-fetched and re-triaged. The transferable *idea* — that evaluation choices can outrank model choices — echoes the RGOR benchmark-leakage finding recorded at `@sources/arxiv-2609-38019-rgor-beyond-lip-sync.md`, but that connection does not justify adopting this protocol.

## Snippets

[Source: https://arxiv.org/abs/2610.02136 (retrieved 2026-10-02)]
