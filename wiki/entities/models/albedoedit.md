---
title: AlbedoEdit (MPI-INF / NVIDIA Research)
type: entity
tags: [model, video-editing, albedo, wan, intrinsic]
keywords: [AlbedoEdit, Wan 2.1 T2V-14B, albedo guidance, VOI, VOR, VTE]
related:
  - sources/arxiv-2606-01362-albedoedit-video-editing.md
  - concepts/albedo-guided-instance-video-editing.md
  - entities/models/wan-2-2.md
  - concepts/two-pass-generation-workflow.md
maturity: draft
created: 2026-06-06
updated: 2026-06-06
---

## Relations

@sources/arxiv-2606-01362-albedoedit-video-editing.md @concepts/albedo-guided-instance-video-editing.md @entities/models/wan-2-2.md

## Raw Concept

Entity stub from 2026-06-06 ingest — AlbedoEdit unified video editor.

## Narrative

**AlbedoEdit** — full finetune of **Wan 2.1 T2V-14B** for albedo-conditioned instance editing (insertion / removal / texture). Synthetic PBR training dataset; inference uses DiffusionRenderer-class albedo extraction + user albedo edit.

**Hardware:** ~2× Wan 14B memory (concatenated source + dual albedo + target latents). Trained 832×480 × 33 frames on 8× H200.

**Release:** models + dataset promised `[NEEDS VERIFICATION 2026-06-06]`. Project: vcai.mpi-inf.mpg.de/projects/AlbedoEdit/

## Snippets

(See @sources/arxiv-2606-01362-albedoedit-video-editing.md)

## Dead Ends

14B full finetune — not 8 GB persona tier. Real-world albedo quality bottleneck.
