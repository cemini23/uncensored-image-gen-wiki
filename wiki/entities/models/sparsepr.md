---
title: SparsePR — training-free sparse attention (partition + residual)
type: entity
tags: [model, video, sparse-attention, training-free, apache-2-0, watch]
keywords: [SparsePR, Response-Coupled Partitioning, Probe-Fitted Residual Reconstruction, HunyuanVideo-13B, Wan2.2, Cosmos]
related:
  - concepts/budget-aware-diffusion-caching.md
  - concepts/input-stable-sparse-attention-video.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/linca.md
  - entities/models/squad.md
  - entities/models/token-radius-attention.md
  - entities/models/wan-2-2.md
  - sources/arxiv-2608-18484-sparsepr.md
  - sweeps/2026-08-20-daily.md
maturity: draft
created: 2026-08-20
updated: 2026-08-20
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-18484-sparsepr.md @concepts/budget-aware-diffusion-caching.md @concepts/input-stable-sparse-attention-video.md @entities/models/squad.md @entities/models/token-radius-attention.md @entities/models/wan-2-2.md @entities/models/hunyuanvideo-1-5.md @entities/models/linca.md @sweeps/2026-08-20-daily.md

## Raw Concept

Entity from 2026-08-20 ingest of arXiv:2608.18484. **GO code** Apache-2.0 clone; runtime H100/Linux — `deferred`. No Image-gen Phase-1.

## Narrative

Training-free sparse attention: Response-Coupled Partitioning + Probe-Fitted Residual Reconstruction. Online per attention call. Paper: 22.0–26.0% executed-pair density, 1.48×–2.61× E2E.

| Check | Result |
| --- | --- |
| Code | `PardisTaghavi/SparsePR` Apache-2.0 in `LICENSES/Apache-2.0.txt`; `.local/adopts/SparsePR` **~7.0 MB** |
| Weights | Official HF of HunyuanVideo-13B / Wan2.2-I2V-A14B / Cosmos-Predict2.5 / Cosmos3-Nano **not fetched** |
| Hardware | Linux; H100 recommended; CUDA 12.8; flash-attn + flashinfer; Wan/Cosmos vendor trees |
| vs TRA | TRA is a radius sparse *pattern*; SparsePR partitions by response + reconstructs residual |
| vs SQuad | SQuad *distills* Wan 2.2 5B softmax to O(n√n) + 6 NFE; SparsePR is training-free on frozen DiTs |
| vs LinCa / MDD | Cache schedule / FM magnitude-direction — different speed axis |

**Phase-1:** none (`deferred`). Do not `hf download` vendor checkpoints from this wiki.

## Snippets

_(see source page)_
