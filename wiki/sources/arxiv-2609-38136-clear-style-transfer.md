---
title: "CLeaR — leakage-resistant style transfer (arXiv:2609.38136)"
type: source
tags: [paper, style-transfer, image-generation, watch]
keywords: [CLeaR, style transfer, content leakage, leakage-degradation dilemma, orthogonal subspace projection, ensemble inversion, StyleBench]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-30-daily.md
  - concepts/style-content-dual-reference-generation.md
maturity: draft
read_status: skimmed
created: 2026-09-30
updated: 2026-09-30
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-30-daily.md @concepts/style-content-dual-reference-generation.md

## Raw Concept

- **Title**: CLeaR: A Unified Framework for Resolving the Leakage-Degradation Dilemma in Style Transfer
- **Type**: arXiv:2609.38136 (Zhejiang University / Fudan University; Teng Zhou et al.) — NeurIPS 2026
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2609.38136-clear-a-unified-framework-for-resolving-the-leak.pdf (archived 2026-09-30)
- **URL**: https://arxiv.org/abs/2609.38136
- **Retrieved**: 2026-09-30

## Narrative

**Training-free style transfer.** CLeaR names the "leakage-degradation dilemma": suppressing content leakage (reference objects, layout and semantics bleeding into the output) normally weakens style fidelity. The framework attacks it at three pipeline stages with no training.

1. **Orthogonal Subspace Projection** subtracts the content direction from the reference feature in each vision-foundation-model space.
2. **Ensemble Inversion** optimizes one pixel-space "style anchor" image whose features match the content-reduced targets across five VFMs (CLIP, CSD-CLIP, DINO, VGG, Inception).
3. **Energy-Guided Calibration** pushes the latent toward the style manifold during the final T/10 denoising steps of a DDIM sampler.

Conditioning uses IP-Adapter. Test-time cost is 300 inversion iterations plus 5 guidance steps. The text-to-image backbone is not named in the abstract.

**Results.** On StyleBench (2,920 style-content pairs) it beats eight baselines: CSD 0.682 vs 0.505 best baseline, Style Loss 0.034 vs 0.097, DINO similarity (the leakage metric, lower is better) 0.066 vs 0.168, KID 0.358 vs 0.237. Aesthetic score is slightly lower at 6.445.

**Phase-0 (2026-09-30).** Repo `github.com/0606zt/CLeaR` has a plausible training-free implementation (`style_extract.py`, `style_transfer.py`, `image_generator/`, `vision_encoder/`, `util/`, `requirements.txt`, `config.json`) but **no LICENSE file and no licence statement** — 1 star, 6 commits. Without a licence the rights are undetermined, so adoption is **NO-GO**; keep as a method reference. There is also no ComfyUI node, and the five-VFM test-time loop is heavy for the local track.

## Snippets

[Source: https://arxiv.org/abs/2609.38136 (retrieved 2026-09-30)]
[Source: https://github.com/0606zt/CLeaR (retrieved 2026-09-30) — repository shows 6 commits and no licence file.]
