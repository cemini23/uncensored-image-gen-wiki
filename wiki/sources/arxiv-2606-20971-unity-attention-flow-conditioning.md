---
title: "UNITY — attention flow networks for composite diffusion conditioning (arXiv:2606.20971)"
type: source
tags: [paper, image-generation, adapter, composite-conditioning, controlnet, sdxl, sd15]
keywords: [UNITY, Morphable Attention Flow, MAF Network, Morph Wrapper, universal adapter, canny depth scribble segmentation, ECCV 2026]
related:
  - concepts/universal-composite-diffusion-conditioning.md
  - entities/models/unity.md
  - entities/adapters/ip-adapter.md
  - concepts/persona-consistency-methods.md
  - concepts/reference-plus-lora-stacking.md
  - entities/models/flux-1-dev.md
  - entities/models/pony-v6.md
  - entities/uis/comfyui.md
  - entities/marketplaces/civitai.md
  - sources/synthetic-character-consistency-survey.md
  - sources/video-generation-survey-2026.md
  - sweeps/2026-06-23-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-06-23
updated: 2026-06-23
---

## Relations

@concepts/universal-composite-diffusion-conditioning.md @entities/models/unity.md @entities/adapters/ip-adapter.md @entities/uis/comfyui.md

## Raw Concept

- **Title**: UNITY: Attention Flow Networks for Adaptive Conditioning in Diffusion
- **Authors**: Aryan Das, Koushik Biswas, Moloud Abdar, Vinay Kumar Verma
- **Type**: arXiv:2606.20971
- **Location**: `raw-sources/arxiv-2606.20971-2606-20971v1-unity-attention-flow-networks-for-a.pdf`
- **URL**: https://arxiv.org/abs/2606.20971 · https://github.com/arya-domain/UNITY
- **Retrieved**: 2026-06-23
- **Read status**: read (abstract + repo README)

## Narrative

**UNITY** — **universal-to-specialized** adapter for **composite spatial conditioning** on frozen **SD 1.5 / SDXL** backbones (canny, depth, scribble, segmentation).

**Training curriculum:**

| Stage | Budget | Goal |
|-------|--------|------|
| Universal | ~50% steps | Cross-modal shared semantics |
| Specialization | ~50% steps | Modality-specific refinement |

**Core modules:** Morphable Attention Flow (MAF) Network + Morph Wrapper — channel-aware, spatially adaptive alignment via learnable flow fields + attention fusion. **Constant complexity** for single or composite conditioning.

**Claims:** SOTA fidelity with lower memory/latency vs per-modality adapters.

### Workspace relevance

- Directly adjacent to **IP-Adapter / ControlNet** stacking in persona ComfyUI graphs
- SDXL path overlaps **Pony / Illustrious** lineage (not FLUX-native at ingest)
- Repo: `arya-domain/UNITY` — Phase-0 **CONDITIONAL-GO** (code present; **no LICENSE file**)

## Snippets

> "Unlike prior methods that train separate adapters for each conditioning modality, UNITY jointly learns shared semantics across multiple conditioning types."

## Dead Ends

SD1.5/SDXL only in released code — no FLUX/Wan port at ingest.
