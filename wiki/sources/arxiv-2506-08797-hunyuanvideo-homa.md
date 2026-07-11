---
title: "HunyuanVideo-HOMA — weak HOI human animation (arXiv:2506.08797)"
type: source
tags: [paper, video-generation, hunyuanvideo, human-object-interaction, tencent]
keywords: [HOMA, HunyuanVideo-HOMA, human-object interaction, HOI, weak motion control, MMDiT, sparse pose, object trajectory, audio lip sync, Tencent Hunyuan]
related:
  - concepts/hunyuanvideo-homa-weak-hoi-video.md
  - entities/models/hunyuanvideo-1-5.md
  - concepts/video-identity-inheritance.md
  - concepts/seam-stitching-strategies.md
  - entities/lipsync/latentsync.md
  - entities/models/wan-2-2.md
  - entities/uis/comfyui.md
  - sweeps/2026-07-11-daily.md
maturity: draft
read_status: read
created: 2026-07-11
updated: 2026-07-11
---

## Relations

@concepts/hunyuanvideo-homa-weak-hoi-video.md @entities/models/hunyuanvideo-1-5.md @concepts/video-identity-inheritance.md @concepts/seam-stitching-strategies.md @entities/lipsync/latentsync.md @entities/models/wan-2-2.md @entities/uis/comfyui.md

## Raw Concept

- **Title**: HunyuanVideo-HOMA: Generic Human-Object Interaction in Multimodal Driven Human Animation
- **Authors**: Ziyao Huang, Zixiang Zhou, Juan Cao, Yifeng Ma, Yi Chen, Zejing Rao, Zhiyong Xu, Hongmei Wang, Qin Lin, Yuan Zhou, Qinglin Lu, Fan Tang (UCAS + Tencent Hunyuan)
- **Type**: arXiv:2506.08797v2 (8 Jul 2026)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2506.08797-hunyuanvideo-homa-generic-human-object-interacti.pdf`
- **URL**: https://arxiv.org/abs/2506.08797
- **Project**: https://bone-11.github.io/homa-page/
- **Retrieved**: 2026-07-11
- **Read status**: read (abstract, architecture, data pipeline, benchmarks, limitations)

## Narrative

**HunyuanVideo-HOMA** extends **HunyuanVideo** for **human–object interaction (HOI)** video from weak multimodal controls: human reference image, object reference image, sparse pose sequence, object trajectory dots, text, and optional audio.

Key design vs prior HOI methods (AnchorCrafter, VACE-14B, MimicMotion, EchoMimic-v2):

| Axis | HOMA approach |
|------|----------------|
| Motion control | **Weak** — sparse trajectory dots + decoupled pose; avoids actor mocap / per-object finetune |
| Backbone | HunyuanVideo **MMDiT** + parameter-space **HOI adapter** initialized from pretrained weights |
| Audio | Facial cross-attention adapter for lip sync (Sync-C competitive with EchoMimic-v2) |
| Training | ~140h depth-filtered internet HOI; 48×96GB GPUs; 5s clips @ up to 512×896 |

Reported SOTA on self-collected HOI test set (FID 51.60, FVD 502.69, Object-CLIP 90.05). Includes interactive demo for dot repositioning when hand–object distance is invalid.

**Phase-0 verdict: WATCH** — preprint + project page; **no public weights/repo** on ingest date. Training footprint far above laptop. Persona ops hook: product-demo clips (persona holding prop / merch) once weights ship.

## Snippets

> "HunyuanVideo-HOMA is a weakly conditioned multimodal-driven framework … encodes appearance and motion signals into the dual input space of a multimodal diffusion transformer (MMDiT)."

[Source: arxiv-2506.08797 abstract]

> "We use a fixed learning rate of 1e-5 … Training is conducted on 48×96G GPUs … Each generated video has a duration of five seconds."

[Source: arxiv-2506.08797 §4.1.1]

## Dead Ends

- Per-object finetune still wins on AnchorCrafter benchmark subset — HOMA trades some object-specific fidelity for zero-shot generalization.
- Dot–hand distance sensitivity; demo UI is the mitigation, not automatic robustness.
