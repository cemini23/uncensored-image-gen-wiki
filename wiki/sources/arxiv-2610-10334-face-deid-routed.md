---
title: "Face de-identification benchmark (arXiv:2610.10334) — routed cybersec"
type: source
tags: [paper, privacy, face-deidentification, benchmark, routed, out-of-domain]
keywords: [face de-identification, HiFD, UTILFACE, identity suppression, utility preservation, rPPG, ArcFace, likeness, NeurIPS, privacy]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-08-daily.md
  - concepts/likeness-collision-verification.md
maturity: draft
read_status: skimmed
created: 2026-10-09
updated: 2026-10-09
phase0_verdict: ROUTE
wire_status: routed
route_target: "@cybersecurity-wiki"
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-08-daily.md @concepts/likeness-collision-verification.md

## Raw Concept

- **Title**: How Private is Private? A Comparative Study for Face De-Identification
- **Type**: arXiv:2610.10334 (ELLIS Institute Finland + University of Oulu; Hui Wei, Guoying Zhao) — NeurIPS 2026 Datasets & Evaluations
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.10334-how-private-is-private-a-comparative-study-for-f.pdf (archived 2026-10-09)
- **URL**: https://arxiv.org/abs/2610.10334
- **Retrieved**: 2026-10-09

## Narrative

**What it is.** A benchmark (UTILFACE, about 100K images over 2,069 identities) plus a hierarchical metric (HiFD) for comparing **face de-identification** methods. HiFD folds identity suppression, three levels of utility preservation, and image quality into one score.

**Method.** Identity suppression is measured as consistency across an ensemble of face-recognition models (ArcFace, CosFace, AdaFace) between the original and de-identified image. Utility is layered: macro attributes (age, gender, ethnicity, expression, landmarks), micro attributes (gaze, micro-expression), and "imperceptible" ones — notably **rPPG**, the remote heart-rate signal recoverable from skin colour.

**Findings worth carrying.** Of twelve methods, the best reaches HiFD 0.607 and only three de-identify more than 80% of faces at a false-accept rate of 1e-2. The sharpest result: **generative GAN and diffusion de-identification methods silently destroy rPPG**, which means they trade a visible identity cue for a hidden physiological one. There is also an asymmetric coupling — preserving the imperceptible layer implies preserving the macro layers, but the reverse holds only 22% of the time.

**Phase-0 (2026-10-09).** A project page ships evaluation toolkit and HiFD scores "for research use". **No image archive is redistributed**, all source datasets are research-only/non-commercial, and **no OSI licence is named**. Computed on 8 AMD MI250X GPUs.

**Why it routes out — with one genuine cross-link kept.** It is a **privacy and adversarial-ML evaluation**, so it belongs to cybersec. But it bears on this wiki's persona work in a specific way: it quantifies **how much identity survives de-identification**, which is directly relevant to `@concepts/likeness-collision-verification.md` and to right-of-publicity risk assessment. That cross-link is worth keeping even though the primary route is out. **Verdict: ROUTE to `@cybersecurity-wiki`.** Image-gen Phase-1: none. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.10334 (retrieved 2026-10-09) — generative de-identification destroys rPPG; only 3 of 12 methods suppress >80% of identities.]
