---
title: Frozen DiT video super-resolution (LiteVSR)
type: concept
tags: [concept, video-generation, super-resolution, vsr, adapter, flow-matching]
keywords: [LiteVSR, frozen DiT, State-Aware Adapter, VSR, ControlNet alternative, flow matching adaptation, lightweight VSR, structural refinement dual-stream]
related:
  - sources/arxiv-2606-09250-litevsr-frozen-dit-vsr.md
  - concepts/cascaded-streaming-high-resolution-video.md
  - concepts/two-pass-generation-workflow.md
  - entities/models/wan-2-2.md
  - entities/models/ltx-2.md
  - sources/video-generation-survey-2026.md
maturity: draft
created: 2026-06-11
updated: 2026-06-11
---

## Relations

@sources/arxiv-2606-09250-litevsr-frozen-dit-vsr.md @concepts/two-pass-generation-workflow.md @entities/models/wan-2-2.md @concepts/cascaded-streaming-high-resolution-video.md

## Raw Concept

Ingest 2026-06-11 from LiteVSR (arXiv:2606.09250) — parameter-efficient VSR on frozen video DiTs via flow-matching-aware adapter design.

## Narrative

**Problem:** Leveraging pretrained video generators (Wan, CogVideoX-class) for VSR either **fine-tunes the full backbone** (destroys priors, 32+ GPU cost) or **duplicates ControlNet** on DiT (no encoder-decoder shortcut → ~2× params + memory).

**LiteVSR insight:** Under **flow matching**, target velocity is constant across timesteps → LQ conditioning need not be time-varying. A small **State-Aware Adapter** per DiT block suffices:

| Stream | Source | Role across denoise |
|--------|--------|---------------------|
| Structural | LQ latent z_y | Layout / motion anchor (static) |
| Refinement | Clean estimate ẑ₀,t | Texture injection (dynamic) |

Time-modulated cross-attention shifts weight structural → refinement as t→0. Frozen DiT v_θ unchanged; adapter output projected via zero-init linear layers.

### vs other VSR tiers in wiki

| Approach | When to use |
|----------|-------------|
| **LiteVSR** | Batch upscale of existing LQ clips; laptop-scale adapter training |
| **Ultra Flash cascade** | Real-time HR **streaming** from LR AR generator |
| **Two-pass workflow** | Generic generate-then-upscale persona pipeline (may adopt LiteVSR as SR stage) |

## Snippets

> "ControlNet-style adapters … must duplicate the entire backbone, resulting in parameter counts comparable to full fine-tuning and doubled memory consumption during inference."

## Dead Ends

OMGSR-style static mid-timestep LQ injection is simpler but doesn't adapt across denoise steps — LiteVSR's gain is dynamic alignment; adds adapter latency vs single concat. Real-world AIGC artifact domain may need fine-tune beyond REDS `[NEEDS VERIFICATION 2026-06-11]`.
