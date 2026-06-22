---
title: Physical AI native world model stacks (Kairos)
type: concept
tags: [concept, world-model, physical-ai, embodied, hybrid-attention, unified-multimodal]
keywords: [Kairos, native world model, cross-embodiment curriculum, understand generate predict, deployment-aware]
related:
  - sources/arxiv-2606-16533-kairos-native-world-model-stack.md
  - entities/models/kairos.md
  - concepts/world-models-video-generation.md
  - concepts/hybrid-linear-attention.md
  - concepts/video-generation-physical-executability.md
  - entities/models/sana-wm.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2606-18375-paiworld-3d-consistent-world-foundation.md
  - concepts/multi-view-3d-consistent-world-models.md
maturity: draft
created: 2026-06-19
updated: 2026-06-22
---

## Relations

@sources/arxiv-2606-16533-kairos-native-world-model-stack.md @entities/models/kairos.md @concepts/world-models-video-generation.md @concepts/hybrid-linear-attention.md

## Raw Concept

Ingest 2026-06-19 from Kairos (arXiv:2606.16533) — full stack world model for Physical AI with learn/maintain/run pillars.

## Narrative

**Paradigm shift:** World models as **infrastructure** (acquire → maintain state → run under latency budgets), not demo video generators.

**Kairos stack:**

| Stage | Function |
|-------|----------|
| Native pretraining | Cross-embodiment curriculum (video → human → robot) |
| Unified architecture | Same backbone for understanding, generation, action prediction |
| Hybrid linear attention | O(n) long-horizon memory vs full softmax |
| System co-design | Distillation + hardware-aware inference for edge/server |

**Comparison:** Cosmos = pixel twin; JEPA = latent predict; Genie/Marble = interactive env — Kairos claims all three in one **4B** open stack.

## Snippets

(See @sources/arxiv-2606-16533-kairos-native-world-model-stack.md)

## Dead Ends

Embodied-robot eval dominates paper — persona operators should Phase-0 smoke-test video gen + censorship before adopting.
