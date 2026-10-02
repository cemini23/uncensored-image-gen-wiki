---
title: "Generative Cinematographer — composing camera and object motion in 3D (arXiv:2610.02180)"
type: source
tags: [paper, video-generation, camera-control, 3d, wan, watch]
keywords: [Generative Cinematographer, GenCine, camera path, 3D motion handles, point cloud, Wan VACE, Wan2.1-Fun-14B, Blender, ViPE, GroundingSAM2]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-02-daily.md
  - concepts/camera-controlled-video-generation.md
  - entities/models/wan-2-2.md
maturity: draft
read_status: skimmed
created: 2026-10-02
updated: 2026-10-02
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-02-daily.md @concepts/camera-controlled-video-generation.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: Generative Cinematographer: Composing Camera and Object Motion in 3D
- **Type**: arXiv:2610.02180 (Johns Hopkins University; Jiahan Zhang et al., with Alan Yuille, Anand Bhattad)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.02180-generative-cinematographer-composing-camera-and.pdf (archived 2026-10-02)
- **URL**: https://arxiv.org/abs/2610.02180
- **Retrieved**: 2026-10-02

## Narrative

**The problem it solves.** When a camera moves and an object moves at the same time, a 2D trajectory is ambiguous — the same on-screen motion can come from either. GenCine lifts one image into an editable 3D point-cloud scene so the artist authors one camera path plus several local 3D "motion handles" (rigid point groups) in a shared world frame. A pretrained video model then generates the clip from those 3D controls.

**Method.** A Blender-based 3D UI. Depth comes from ViPE and a dynamic-object mask from GroundingSAM2, giving a coloured point cloud. Three RGB guidance maps — background XYZ, foreground XYZ, foreground identity — are encoded by a frozen Wan VAE. The authors train a Wan-VACE-style side branch (8 blocks, about one fifth of the parameters) plus a rank-64 LoRA on the main branch, with a flow-matching objective. The base model is **Wan2.1-Fun-V1.1-14B-Control, frozen**. There is no physics simulator and no object-category prior.

**Results.** On 75 DAVIS plus SpatialVid examples the paper reports the lowest translation error (1.00 / 1.05) and foreground R-LPIPS (0.18 / 0.21) against Wan2.1, ATI, Wan-Move, VerseCrafter, SymphoMotion and Go-with-the-Track. PSNR is 16.64 (camera) and 16.54 (object) — essentially tied with Wan-Move and Go-with-the-Track. **Margins are small and there is no dominant win.**

**Phase-0 (2026-10-02).** **No code and no weights** — a project website only (`generative-cinematographer.github.io`), and no licence named beyond a note to respect data and model licences. Training used 4x H100 for about 20k iterations on 45k clips at 480x832. Inference VRAM is not stated, but the frozen 14B backbone is heavy and a 24GB card would likely need quantisation. **Verdict: WATCH-thin.** The joint 3D camera-plus-object idea is on-track and uses Wan, which matters for `@concepts/camera-controlled-video-generation.md`, but it is not runnable today and needs Blender, ViPE, GroundingSAM2 and a tracker.

## Snippets

[Source: https://arxiv.org/abs/2610.02180 (retrieved 2026-10-02)]
