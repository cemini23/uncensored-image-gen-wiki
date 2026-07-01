---
title: "MSTEdit — self-prompting scene text editing (arXiv:2605.15523)"
type: source
tags: [paper, image-editing, text-rendering, glyph-control, flux-fill, icml-2026]
keywords: [MSTEdit, self-prompting, scene text editing, FLUX-Fill, MM-DiT, in-context learning, open-vocabulary]
related:
  - concepts/self-prompting-scene-text-editing.md
  - concepts/video-text-editing-glyph-control.md
  - sources/arxiv-2606-23254-steervte-video-text-editing.md
  - entities/models/flux-1-dev.md
  - entities/models/steervte.md
  - sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md
  - sweeps/2026-07-01-daily.md
  - concepts/self-prompting-scene-text-editing.md
  - sweeps/2026-07-01-daily.md
  - concepts/causal-multi-turn-image-editing.md
maturity: draft
read_status: read
created: 2026-07-01
updated: 2026-07-01
---

## Relations

@concepts/self-prompting-scene-text-editing.md @concepts/video-text-editing-glyph-control.md @entities/models/flux-1-dev.md

## Raw Concept

- **Title**: Self-Prompting Diffusion Transformer for Open-Vocabulary Scene Text Editing via In-Context Learning
- **Authors**: Hongxi Li, Tong Wang, Chengjing Wu, Tianbao Liu, et al. (Meitu MT Lab + BIT; ICML 2026)
- **Type**: arXiv:2605.15523
- **Location**: `raw-sources/arxiv-2605.15523-self-prompting-scene-text-editing.pdf`
- **URL**: https://arxiv.org/abs/2605.15523 · https://hongxiii.github.io/mstedit/
- **License**: CC BY-NC 4.0 (OpenReview)
- **Retrieved**: 2026-07-01
- **Read status**: read (abstract + method summary)

## Narrative

**MSTEdit** — **open-vocabulary scene text editing** on still images: replace text in a masked region while preserving background **and original glyph style** (font, color, stroke) — not generic text rendering.

**Approach:** Built on **FLUX.1-Fill-Dev** (MM-DiT inpainting). Constructs **style + glyph prompts directly from the target region** of the input image — no external glyph/style encoders. Two-stage training: large-scale self-supervised pretrain → small paired-image cooldown on **MST-Edit dataset** (11 languages).

**Claims:** SOTA on AnyText benchmark + internal MST-Edit eval for text accuracy (NED) and style consistency (FID, LPIPS) `[TENTATIVE]`.

### Workspace relevance

**Image-side counterpart** to @concepts/video-text-editing-glyph-control.md (SteerVTE video branch). Persona promo stills — swap on-image text (handles, watermarks, promo codes) without re-shooting. Stacks on existing FLUX-Fill ComfyUI graphs when weights release.

Phase-0: **WATCH** — no public GitHub at ingest; project page only; **NC license** blocks commercial persona monetization without Meitu terms check.

## Snippets

> "Constructs style and glyph prompts directly from the original image, without introducing additional style or glyph encoders."

> "Leveraging the in-context learning capability of the Multi-Modal Diffusion Transformer (MM-DiT)."

## Dead Ends

No open weights/repo at ingest. CC BY-NC 4.0 — commercial persona ops need license review before adoption.
