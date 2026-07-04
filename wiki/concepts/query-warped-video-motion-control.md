---
title: Query-Warped Video Motion Control
type: concept
tags: [concept, video-generation, motion-control, training-free, i2v, wan]
keywords: [query warping, QWERTY, semantic-temporal channel decomposition, STCD, image-to-video, mask warp, optical flow, Wan2.2, CogVideoX]
related:
  - sources/arxiv-2607-01869-qwerty-query-warped-video-motion-control.md
  - concepts/camera-controlled-video-generation.md
  - concepts/video-identity-inheritance.md
  - entities/models/wan-2-2.md
  - entities/models/cogvideox-1-5.md
  - sweeps/2026-07-04-daily.md
maturity: draft
created: 2026-07-04
updated: 2026-07-04
---

## Relations

@sources/arxiv-2607-01869-qwerty-query-warped-video-motion-control.md @concepts/camera-controlled-video-generation.md @concepts/video-identity-inheritance.md @entities/models/wan-2-2.md @entities/models/cogvideox-1-5.md

## Raw Concept

Created from the QWERTY paper in the 2026-07-04 daily ingest. Anchors the emerging class of **training-free DiT attention manipulation** for user-specified video motion.

## Narrative

Query-warped motion control is an inference-time way to tell a video DiT where objects or the camera should move without training a ControlNet branch. The first frame in an I2V model already carries a stable spatial layout during early denoising. QWERTY copies selected first-frame **query** channels into later-frame target positions, making those target tokens attend back to the original first-frame keys and inherit the desired semantic content at the new location.

The subtle part is avoiding temporal damage. Video DiTs use 3D RoPE, so some query channels encode temporal order rather than object identity. QWERTY's STCD step splits semantic channels from temporal channels and only warps the semantic subspace. Warping keys, query+key together, hidden states, or temporal RoPE degrades quality.

### Practical translation

| Persona workflow need | Query-warped control hook |
|-----------------------|---------------------------|
| "Move this character's hand from A to B" | Mask-warp the hand/arm region |
| "Make the camera orbit the seated model" | Derive optical flow from depth + camera pose |
| "Preserve identity while changing pose" | Use I2V master image, then apply early-step query guidance only |
| "Avoid duplicate subject ghosts" | Fill source holes for mask warps; leave optical-flow holes for model inpainting |

### Adoption posture

No code was public at ingest, so this is not yet a David-use-now item. The watch condition is concrete: if someone ships a ComfyUI node or diffusers/Wan patch that exposes mask-warp or optical-flow controls for Wan 2.2 TI2V-5B, test it against the persona I2V graph immediately.

## Snippets

> "At each timestep, we run 5 latent-optimization iterations ... only during the early timesteps (the first 5 steps out of 50), where the global layout and motion trajectory of the video are determined."

> "Depth-estimated flow from [VGGT and Depth Anything 3] yields results comparable to ground-truth flow."

## Dead Ends

- **Using U-Net noise-warping recipes directly on Wan/CogVideoX**: QWERTY's ablations show those methods do not transfer cleanly to 3D-full-attention DiTs.
- **Treating it as camera memory**: this controls motion within a clip; long-horizon revisit consistency still belongs to memory systems like UCM/DecMem/Mirage.
