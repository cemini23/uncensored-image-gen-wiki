---
title: Agent safety — abstention is not non-perception
type: concept
tags: [concept, vlm, safety, evaluation, k244]
keywords: [abstention, refusal override, visual grounding, executable evaluation]
related:
  - sources/arxiv-2608-18628-safety-overrides-vision.md
  - sweeps/2026-08-21-daily.md
maturity: draft
created: 2026-08-21
updated: 2026-08-21
wire_status: wont_wire
---

## Relations

@sources/arxiv-2608-18628-safety-overrides-vision.md @sweeps/2026-08-21-daily.md

## Raw Concept

k244 pointer from Gupta/Chakraborty (arXiv:2608.18628). Brief already in `briefs/2026-08-21_k244-vlm-safety-override-pointer.md` (gitignored). Wiki page exists so the paper is discoverable.

## Narrative

When scoring VLMs or using them as judges/filters on generated images, **a refusal is not evidence that the model failed to see the content.** Safety-constrained instruction can override grounded answering while visual influence remains internally available. Late-layer refusal directions can restore answers without changing the image.

Do not treat this as an Image-gen runtime ticket: no activation-steering cookbook, no clone, `wont_wire`. Use it as an evaluation hygiene rule: abstention ≠ missing perception; do not convert refusal counts into “the VLM didn’t detect X.”

## Snippets

_(see source page)_
