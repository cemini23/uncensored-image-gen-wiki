---
related:
  - concepts/task-isolated-unified-video-editing.md
  - entities/models/tide.md
  - entities/models/ltx-2.md
  - concepts/joint-audio-visual-instruction-editing.md
  - concepts/albedo-guided-instance-video-editing.md
  - concepts/sync-audio-video-customization.md
  - entities/models/javedit.md
  - entities/models/albedoedit.md
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
  - sources/arxiv-2606-01362-albedoedit-video-editing.md
  - sources/video-generation-survey-2026.md
  - concepts/video-text-editing-glyph-control.md
  - entities/models/steervte.md
  - sources/arxiv-2606-23254-steervte-video-text-editing.md
title: "TIDE — task-isolated unified video editing (arXiv:2606.08260)"
type: source
tags: [paper, video-editing, video-generation, ltx, unified-model, multi-reference]
keywords: [TIDE, task-isolated diffusion, per-token task embeddings, dual-path conditioning, LTX-2.3, instruction editing, reference-guided editing, multi-reference generation, TIDE-Bench, OpenVE-Bench, Bilibili]
maturity: draft
read_status: read
created: 2026-06-10
updated: 2026-06-24
---

## Relations

@concepts/task-isolated-unified-video-editing.md @entities/models/ltx-2.md @entities/models/tide.md @concepts/joint-audio-visual-instruction-editing.md @concepts/albedo-guided-instance-video-editing.md

## Raw Concept

- **Title**: TIDE: Task-Isolated Diffusion for Unified Video Editing and Generation
- **Authors**: Qi Liu, Gang Yue, Mingyu Yin, et al. (ZJU + Bilibili Inc.)
- **Type**: arXiv:2606.08260
- **Location**: `raw-sources/arxiv-2606.08260-tide-task-isolated-diffusion-for-unified-video-e.pdf`
- **URL**: https://arxiv.org/abs/2606.08260 · https://LittleWork123.github.io/tide
- **Retrieved**: 2026-06-10
- **Read status**: read (abstract + method + training)

## Narrative

**TIDE** unifies three video tasks in one **LTX-2.3** DiT (48 blocks, 14B finetuned):

1. Instruction-based video editing  
2. Reference-guided video editing  
3. Multi-reference subject-to-video generation  

**Per-token task embeddings** `E[τ]` disambiguate target vs source vs reference tokens in shared self-attention — same visual input gets different τ by task context. **Dual-path conditioning:** Gemma-3-12B-IT semantic path + VAE latent path for structure. **Progressive training:** edit-only → full multi-task mix → refined ratios.

Claims SOTA on OpenVE-Bench, OpenS2V, and new **TIDE-Bench** (multi-reference editing) `[TENTATIVE]`. Inference: 1280×704, 50-step Euler, CFG=4 + STG=1.

### Workspace relevance

Successor-class **unified editor** on LTX backbone — overlaps JAVEdit (joint A/V edit) and AlbedoEdit (instance edit) but adds arbitrary multi-reference count. Persona outfit/background swaps without sequential Fish-Speech + LatentSync if weights license permits `[NEEDS VERIFICATION 2026-06-10]`.

## Snippets

> "We cast reference-based video generation and video editing as a single conditional denoising problem with varying token roles."

> "TIDE builds upon LTX-2.3 … using its native Gemma-3-12B-IT as the VLM encoder (frozen throughout training)."

## Dead Ends

No audio-visual joint editing — visual-only vs JAVEdit. Bilibili-origin; NSFW posture and weight release unknown.
