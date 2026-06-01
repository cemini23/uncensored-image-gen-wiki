---
title: OmniCustom (sync audio-video customization model)
type: entity
tags: [model, audio-video, customization, dit, research]
keywords: [OmniCustom, OVI, reference LoRA, sync AV, OmniCustom-1M, zero-shot]
related:
  - sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
  - concepts/sync-audio-video-customization.md
  - concepts/persona-audio-stack.md
  - concepts/video-identity-inheritance.md
  - concepts/video-identity-inheritance.md
maturity: draft
created: 2026-06-01
updated: 2026-06-01
provenance:
  stub: true
---

## Relations

@sources/arxiv-omnicustom-sync-audio-video-2602-12304.md @concepts/sync-audio-video-customization.md @concepts/persona-audio-stack.md @concepts/video-identity-inheritance.md

## Raw Concept

Entity stub from 2026-06-01 ingest of arXiv:2602.12304. DiT-based tuning-free sync audio-video customization built on OVI joint AV backbone.

## Narrative

- **Task:** reference image + reference audio + text → identity-locked video + timbre-matched speech + optional background sounds
- **Architecture:** dual reference LoRA branches (identity + audio) on OVI fusion blocks; contrastive flow-matching aux loss
- **Training data:** OmniCustom-1M (1M single-human portrait AV clips)
- **Project:** https://omnicustom-project.github.io/page/

### Phase-0 checklist

- [ ] Weights + license (commercial persona use?)
- [ ] VRAM / inference time vs Fish-Speech + Wan + LatentSync chain
- [ ] NSFW posture on base OVI weights
- [ ] ComfyUI node availability

## Dead Ends

None yet — unaudited stub.
