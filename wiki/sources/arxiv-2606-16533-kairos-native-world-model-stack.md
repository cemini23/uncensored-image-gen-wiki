---
title: "Kairos — native world model stack for Physical AI (arXiv:2606.16533)"
type: source
tags: [paper, world-model, physical-ai, embodied, hybrid-attention, sensenova]
keywords: [Kairos, Kairos 3.0, hybrid linear attention, cross-embodiment, world understanding generation prediction, Apache-2.0, SenseNova]
related:
  - concepts/physical-ai-native-world-model-stacks.md
  - entities/models/kairos.md
  - concepts/world-models-video-generation.md
  - concepts/hybrid-linear-attention.md
  - concepts/video-generation-physical-executability.md
  - entities/models/sana-wm.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-19-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-06-19
updated: 2026-06-19
---

## Relations

@concepts/physical-ai-native-world-model-stacks.md @entities/models/kairos.md @concepts/world-models-video-generation.md @concepts/hybrid-linear-attention.md

## Raw Concept

- **Title**: Kairos: A Native World Model Stack for Physical AI
- **Authors**: Kairos Team (SenseNova / Acerobotics lineage)
- **Type**: arXiv:2606.16533
- **Location**: `raw-sources/arxiv-2606.16533-kairos-a-native-world-model-stack-for-physical-a.pdf`
- **URL**: https://arxiv.org/abs/2606.16533 · https://github.com/kairos-agi/kairos-sensenova · https://huggingface.co/collections/kairos-agi/kairos30
- **Retrieved**: 2026-06-19
- **Read status**: read (abstract + stack overview)

## Narrative

**Kairos 3.0** — operational world-model **stack** (not just a video generator) for Physical AI:

| Pillar | Design |
|--------|--------|
| **Learn** | Cross-embodiment curriculum: open-world video → human behavior → robot interaction |
| **Maintain** | Unified understand / generate / predict in one architecture; hybrid linear temporal attention (sliding + dilated + gated linear) with bounded error-propagation theory |
| **Run** | Deployment co-design — timestep distillation, hardware-aware inference; claims real-time on consumer/edge hardware |

**Scale:** ~4B params at audit. Apache-2.0 code + HF/ModelScope weights.

**Positioning:** Bridges Cosmos-style pixel rendering, JEPA-style latent prediction, and Genie/Marble-style interactive environments in one native stack.

### Workspace relevance

Build-track **world model** candidate alongside SANA-WM/MoVerse (@concepts/world-models-video-generation.md). Hybrid linear attention extends @concepts/hybrid-linear-attention.md pattern. Robot/action head is out of persona scope but video generation + long-horizon memory is in scope.

## Snippets

> "World models are transitioning from passive visual generators to foundational, operational infrastructure for Physical AI."

> "Hybrid Linear Temporal Attention… sliding-window attention captures local dynamics, dilated sliding windows capture mid-range dependencies, and gated linear attention maintains persistent global memory."

## Dead Ends

Primary eval axis is embodied robotics — persona video ops need separate quality probe on uncensored prompts. 4B may be censored at base — verify before NSFW persona use.
