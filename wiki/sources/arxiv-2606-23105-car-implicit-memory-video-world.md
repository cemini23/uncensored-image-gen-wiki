---
related:
  - concepts/implicit-memory-retrieval-video-world-models.md
  - entities/models/car.md
  - concepts/world-models-video-generation.md
  - concepts/latent-spatial-memory-video-world-models.md
  - concepts/camera-controlled-video-generation.md
  - sources/arxiv-2606-09828-mirage-latent-spatial-memory.md
  - sources/arxiv-2606-02553-longlive-rag-long-video-generation.md
  - entities/models/wan-2-2.md
  - entities/models/mirage.md
  - sweeps/2026-06-24-daily.md
  - concepts/long-video-rag-retrieval.md
title: "CaR — compression and retrieval for video world models (arXiv:2606.23105)"
type: source
tags: [paper, world-model, video-generation, memory, camera-control, orange-3dv]
keywords: [CaR, Compression and Retrieval, Retrieval Attention, SceneFly, implicit memory, hard-cut, viewpoint encoding]
maturity: draft
read_status: read
created: 2026-06-24
updated: 2026-06-24
---

## Relations

@concepts/implicit-memory-retrieval-video-world-models.md @entities/models/car.md @concepts/world-models-video-generation.md @concepts/camera-controlled-video-generation.md

## Raw Concept

- **Title**: Compression and Retrieval: Implicit Memory Retrieval for Video World Models
- **Authors**: Zhan Peng et al. (HUST, HUJING, Sun Yat-sen University)
- **Type**: arXiv:2606.23105
- **Location**: `raw-sources/arxiv-2606-23105-compression-and-retrieval-implicit-memory-retrie.pdf`
- **URL**: https://arxiv.org/abs/2606.23105 · https://github.com/Orange-3DV-Team/CaR · https://orange-3dv-team.github.io/CaR/
- **Retrieved**: 2026-06-24
- **Read status**: read (abstract + method)

## Narrative

**CaR** — attention-driven **implicit memory retrieval** for long-horizon **video world models** with complex camera trajectories.

**Architecture:**

| Component | Role |
|-----------|------|
| Context compression network | Historical video → compact context tokens |
| Standard self-attention branch | Preserves frozen DiT video prior |
| **Retrieval Attention** | Viewpoint-aware (camera projection encoding) history retrieval for target view |
| SceneFly dataset | ~1000 min UE5 synthetic video, 100 scenes, frame-level intrinsics/extrinsics |

**Capabilities:** single-image scene exploration (camera + action control), history video extension, **hard-cut** generation with discontinuous trajectories while preserving scene identity.

Repo README at ingest: **code coming soon**; SceneFly dataset coming soon. Phase-0: **CONDITIONAL-GO** — `briefs/2026-06-24_phase-0-car-signposevae.md`.

## Snippets

> "By injecting viewpoint information via positional encoding, our method performs flexible memory retrieval through attention computation."

## Dead Ends

Dynamic-scene memory updates noted as future work — static-scene revisit bias at ingest.
