---
title: ReaDiT Guidance
type: entity
tags: [guidance, diffusion, video, watch]
keywords: [ReaDiT, DiT readout, spatial control, camera control]
related:
  - sources/arxiv-2609-04649-readit-guidance.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
maturity: draft
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@sources/arxiv-2609-04649-readit-guidance.md @concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md

## Raw Concept

- **What prompted this page**: ingest of arXiv:2609.04649 on 2026-09-11.
- **Synthesized from**: sources/arxiv-2609-04649-readit-guidance.md

## Narrative

ReaDiT Guidance is a lightweight method that controls image and video generation with Diffusion Transformer (DiT) models. It reads features from one DiT block and uses them to steer the generative process toward spatial targets such as depth, pose, or edge maps. The method also covers motion control, because text-to-video models use DiT backbones. The paper reports that it needs only a small training dataset and fewer parameters than adapter methods. The base model stays unchanged, so the method can combine with adapters such as ControlNet. Name collision note: this ReaDiT is a generative-media guidance method. It has no relation to the Obsidian ReadItLater note app. Code: none found. Do not clone. Image-gen Phase-1: none. wire_status: deferred.
