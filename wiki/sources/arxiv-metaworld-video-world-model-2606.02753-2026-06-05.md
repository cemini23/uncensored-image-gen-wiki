---
title: "MetaWorld — multi-agent video world model (arXiv:2606.02753)"
type: source
tags: [paper, world-model, video-generation, multi-agent, consistency]
keywords: [MetaWorld, MWSU, WSA, World-State Alignment, multi-agent, egocentric, Subject-Aware World Generator, SJTU]
related:
  - entities/models/metaworld.md
  - concepts/world-models-video-generation.md
  - concepts/persona-consistency-methods.md
  - entities/models/decmem.md
  - entities/models/sana-wm.md
  - sources/sana-wm-minute-scale-world-model.md
  - entities/models/wan-2-2.md
  - sources/video-generation-survey-2026.md
maturity: draft
read_status: deep-read
created: 2026-06-05
updated: 2026-06-05
---

## Relations

@entities/models/metaworld.md @concepts/world-models-video-generation.md @entities/models/decmem.md @entities/models/sana-wm.md

## Raw Concept

- **Title**: MetaWorld: Scaling Multi-Agent Video World Model from Single-view Video Data
- **Authors**: Teng Hu, Mingchun Lu et al. (Shanghai Jiao Tong University, ZJU, NTU)
- **Type**: arXiv:2606.02753
- **Location**: `raw-sources/arxiv-2606.02753-metaworld-scaling-multi-agent-video-world-model.pdf`
- **URL**: https://arxiv.org/abs/2606.02753
- **Project**: https://sjtuplayer.github.io/projects/MetaWorld/
- **Retrieved**: 2026-06-05
- **Read status**: deep-read (abstract + intro)

## Narrative

Extends **video world models** from single-agent single-view to **multi-agent multi-egocentric** settings using only **monocular training video**.

**Challenges addressed:**

1. **Data scarcity** — coordinated multi-view multi-agent captures are expensive
2. **World state alignment** — independent per-view generation drifts on shared physics/events

**Three-part framework:**

- **MWSU:** Explicitly unroll monocular video into camera operator trajectory + visible subject motion in shared 3D — extracts synchronized multi-agent motion without multi-camera rigs
- **Subject-Aware World Generator:** Identity-image-conditioned appearance control per agent
- **WSA:** Per-frame **inter-branch cross-attention** inserted at every transformer layer during **joint denoising** of both views — enforces static geometry and dynamic motion consistency

**Claims [TENTATIVE]:** State-of-the-art cross-view consistency and identity fidelity for open-domain multi-agent world modeling.

### Workspace relevance

Research reference on **multi-perspective world consistency** — forward-looking for persona scenes with multiple synthetic characters or egocentric + third-person cuts. Compare to DecMem memory (@entities/models/decmem.md) and SANA-WM camera world model (@entities/models/sana-wm.md). Build-track: `[NEEDS VERIFICATION 2026-06-05]` for weights/code.

## Snippets

> "We propose World-State Alignment, a per-frame inter-branch cross-attention mechanism inserted at every transformer layer of the video DiT."

> "MetaWorld enforces both static geometric consistency and dynamic motion consistency, encouraging that the shared 3D physical environment evolves identically across all views."

## Dead Ends

None.
