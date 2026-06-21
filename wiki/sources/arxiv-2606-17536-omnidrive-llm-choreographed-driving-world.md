---
title: "OmniDrive Choreo — LLM-choreographed multi-view driving world model (arXiv:2606.17536)"
type: source
tags: [paper, world-model, video-generation, multi-view, driving, llm-agent, autonomous-driving]
keywords: [OmniDrive, WorldScript, latent co-compression, Qwen2.5-VL, Architect Cartographer Auditor, view-time permutation, nuScenes, multi-camera]
related:
  - concepts/llm-choreographed-multi-view-world-models.md
  - concepts/multi-agent-cross-view-video-world-models.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - entities/models/wan-2-2.md
  - entities/models/cogvideox-1-5.md
  - entities/models/hunyuanvideo-1-5.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-21-daily.md
  - concepts/federated-daily-research-digest.md
  - concepts/entity-centric-cinematic-video-conditioning.md
maturity: draft
read_status: read
created: 2026-06-21
updated: 2026-06-21
---

## Relations

@concepts/llm-choreographed-multi-view-world-models.md @concepts/multi-agent-cross-view-video-world-models.md @concepts/world-models-video-generation.md @concepts/camera-controlled-video-generation.md

## Raw Concept

- **Title**: OmniDrive: An LLM-Choreographed Multi-Agent World Model with Unified Latent Co-Compression for Multi-View Driving Video Generation
- **Authors**: Zijie Meng et al. (PKU, Xiamen Univ, KAIST, Tsinghua, NTU, Wuhan Univ, etc.)
- **Type**: arXiv:2606.17536
- **Location**: `raw-sources/arxiv-2606.17536-omnidrive-an-llm-choreographed-multi-agent-world.pdf`
- **URL**: https://arxiv.org/abs/2606.17536
- **Retrieved**: 2026-06-21
- **Read status**: read (abstract + architecture)
- **Name collision:** **Not** the NVlabs CVPR 2025 Drive LLM-Agent (`arxiv:2405.01533`, `github.com/NVlabs/OmniDrive`) — this is a **2026 multi-view video world-model** paper reusing the OmniDrive name.

## Narrative

**OmniDrive (2606.17536)** — controllable **multi-camera driving video** world model via **LLM latent choreography**, not per-camera VAE + late fusion.

**Three Qwen2.5-VL agents:**

| Role | Function |
|------|----------|
| **Architect** | User intent → structured **WorldScript** JSON |
| **Cartographer** | WorldScript → spatially-anchored layout images |
| **Auditor** | Cross-view critiques → auxiliary supervision |

Agent outputs + multi-view RGB are **co-tokenized** on a shared positional schema bound to the visual grid.

**Latent Co-Compression:** view–time permutation flattens the six-camera × time cube into a pseudo-temporal stream for a **single shared 3-D VAE pass** (RGB + layout), encoding inter-camera geometry inside the encoder receptive field rather than post-hoc cross-view attention.

**Claims [TENTATIVE]:** nuScenes SOTA multi-view consistency; BEV mAP 21.6; FVD 45.7; synthetic-only detector training +2.4 NDS on real val.

### Workspace relevance

- Extends **multi-agent cross-view world models** (@concepts/multi-agent-cross-view-video-world-models.md) with **LLM-orchestrated symbolic–geometry–pixel alignment** at token level
- Driving-specific — low direct persona use; pattern may transfer to multi-camera persona scene synthesis `[NEEDS VERIFICATION 2026-06-21]`
- **No public code** for this 2026 paper at ingest — do not conflate with NVlabs repo

## Snippets

> "We are, to our knowledge, the first to bind agent outputs to a shared latent token grid that is mechanically coupled to the visual stream by a position-aware schema."

> "Latent Co-Compression … turns inter-camera 3-D constraints into local convolutional dependencies inside a shared 3-D VAE."

## Dead Ends

Autonomous-driving domain; no open weights/repo for arXiv:2606.17536 at ingest. NVlabs OmniDrive is a different project.
