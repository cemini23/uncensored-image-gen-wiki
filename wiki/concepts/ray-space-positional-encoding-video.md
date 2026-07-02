---
title: Ray-space positional encoding for video (RayPE)
type: concept
tags: [concept, video-generation, camera-control, 3d-aware, attention]
keywords: [RayPE, Plücker reciprocal product, additive QK injection, NGI, zero-init PE]
related:
  - sources/arxiv-2606-27345-raype-ray-space-positional-encoding-3d-video.md
  - concepts/camera-controlled-video-generation.md
  - entities/models/wan-2-2.md
  - concepts/ucm-time-aware-pe-warping-world-models.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-07-02-daily.md
  - concepts/ucm-time-aware-pe-warping-world-models.md
  - entities/models/hunyuanvideo-1-5.md
maturity: draft
created: 2026-07-02
updated: 2026-07-02
---

## Relations

@sources/arxiv-2606-27345-raype-ray-space-positional-encoding-3d-video.md @entities/models/wan-2-2.md @concepts/camera-controlled-video-generation.md

## Raw Concept

Ingest 2026-07-02 from Yin et al. (arXiv:2606.27345) — Plücker rays inside attention dot product for Wan2.2 camera control.

## Narrative

### Camera conditioning axes

| Class | Examples | Geometry channel |
|-------|----------|------------------|
| External adapter | MotionCtrl, CameraCtrl, ReCamMaster | Auxiliary encoder / concat |
| RoPE modulation | PRoPE, UCPE, ReRoPE | Multiplicative RoPE split |
| **RayPE** | **This paper** | **Additive Plücker on Q/K** |

**Design win:** zero-init preserves pretrained Wan weights; original `(u,v,t)` RoPE untouched — friendly for fine-tuning on consumer stacks once code drops.

### Persona ops mapping

Dolly-in on persona still → I2V clip with **metric camera path** (promo orbit shots) without explicit 3D reconstruction stage.

### Build-track note

Phase-0 **WATCH** — monitor Tencent/Wan community release.

## Snippets

> "Can the geometric relationship between two camera rays be made to live inside the attention dot product?"

## Dead Ends

No ComfyUI node at ingest.
