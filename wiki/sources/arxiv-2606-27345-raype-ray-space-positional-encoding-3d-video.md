---
title: "RayPE — ray-space positional encoding for 3D video (arXiv:2606.27345)"
type: source
tags: [paper, video-generation, camera-control, 3d-aware, wan, tencent]
keywords: [RayPE, Plücker coordinates, QK injection, Normalize-Gate-Inject, Wan2.2-TI2V-5B]
related:
  - concepts/ray-space-positional-encoding-video.md
  - concepts/camera-controlled-video-generation.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2602-22960-ucm-camera-control-memory-world-models.md
  - sweeps/2026-07-02-daily.md
  - sources/arxiv-2602-22960-ucm-camera-control-memory-world-models.md
  - entities/models/hunyuanvideo-1-5.md
maturity: draft
read_status: read
created: 2026-07-02
updated: 2026-07-02
---

## Relations

@concepts/ray-space-positional-encoding-video.md @entities/models/wan-2-2.md @concepts/camera-controlled-video-generation.md

## Raw Concept

- **Title**: RayPE: Ray-Space Positional Encoding for 3D-Aware Video Generation
- **Authors**: Minghao Yin, Jiahao Lu, Wenbo Hu, Wang Zhao, Ying Shan, Kai Han (HKU / HKUST / Tencent ARC Lab)
- **Type**: arXiv:2606.27345
- **Location**: `raw-sources/arxiv-2606.27345-raype-ray-space-positional-encoding-for-3d-aware.pdf`
- **URL**: https://arxiv.org/abs/2606.27345
- **Retrieved**: 2026-07-02
- **Read status**: read (abstract + method framing)

## Narrative

**RayPE** — injects per-token **6D Plücker ray coordinates** additively into self-attention **Q/K** (zero-init), preserving native 3D RoPE. Attention score decomposes into content + geometry + cross-terms.

**NGI module:** decouple ray direction vs moment magnitude; learned scale gate; PE-side RMSNorm for heterogeneous pose datasets (SfM, SLAM, metric).

**Base model:** **Wan2.2-TI2V-5B** — `<0.1%` param overhead. Trained on RealEstate10K + DL3DV + PanShot + OmniWorld mix.

### Workspace relevance

Lightweight camera-control upgrade path for existing Wan 2.2 persona I2V graphs — orbit/zoom/dolly without ControlNet render proxies. Complements adapter-based methods in @concepts/camera-controlled-video-generation.md.

Phase-0: **WATCH** — no public GitHub at ingest; Tencent ARC research.

## Snippets

> "The geometric relation between two camera rays is captured by the Plücker reciprocal product, which is bilinear in the two rays — the same algebraic form as the dot product in Transformer attention."

## Dead Ends

Weights not released; wait for Wan ecosystem port.
