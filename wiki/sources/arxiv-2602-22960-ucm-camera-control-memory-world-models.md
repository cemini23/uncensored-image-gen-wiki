---
title: "UCM — camera control + memory via PE warping (arXiv:2602.22960)"
type: source
tags: [paper, world-model, video-generation, camera-control, memory, acm]
keywords: [UCM, time-aware positional encoding warping, dual-stream DiT, world simulation, scene revisiting]
related:
  - concepts/ucm-time-aware-pe-warping-world-models.md
  - concepts/camera-controlled-video-generation.md
  - concepts/world-models-video-generation.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-07-02-daily.md
  - sources/arxiv-2606-27345-raype-ray-space-positional-encoding-3d-video.md
  - entities/models/wan-2-2.md
  - concepts/latent-spatial-memory-video-world-models.md
maturity: draft
read_status: read
created: 2026-07-02
updated: 2026-07-02
---

## Relations

@concepts/ucm-time-aware-pe-warping-world-models.md @concepts/camera-controlled-video-generation.md @concepts/world-models-video-generation.md

## Raw Concept

- **Title**: UCM: Unified Modeling of Camera Control and Memory with Time-aware Positional Encoding Warping for World Models
- **Authors**: Tianxing Xu et al. (Tsinghua / industry collaborators)
- **Type**: arXiv:2602.22960 · DOI 10.1145/3799902.3811088 (ACM)
- **Location**: `raw-sources/arxiv-2602.22960-ucm-unified-modeling-of-camera-control-and-memor.pdf`
- **URL**: https://arxiv.org/abs/2602.22960
- **Retrieved**: 2026-07-02
- **Read status**: read (abstract + method overview)

## Narrative

**UCM** — world-model framework unifying **precise camera control** and **long-term memory** on a DiT video generator via **time-aware 3D PE warping** (extends PE-Field NVS idea to video + memory tokens).

**Mechanism:** Retrieve historical frames as memory; warp their 3D positional encodings to target camera trajectory; **dual-stream DiT** integrates condition without full-sequence quadratic blowup. **Data curation:** point-cloud rendering simulates scene revisiting on 500K+ monocular videos.

**Claims:** SOTA camera controllability + long-term consistency on revisit vs ViewCrafter-class baselines `[TENTATIVE]`.

### Workspace relevance

Persona **virtual set exploration** — orbit a reference still through a scripted camera path while preserving scene identity. Adjacent to @concepts/camera-controlled-video-generation.md and @concepts/world-models-video-generation.md.

Phase-0: **WATCH** — no public repo at ingest; ACM publication.

## Snippets

> "Unified Modeling of Camera Control and Memory with Time-aware Positional Encoding Warping for World Models."

## Dead Ends

No open weights; explicit 3D PE warping pipeline not ComfyUI-ready.
