---
title: Task-isolated unified video editing (TIDE)
type: concept
tags: [video-editing, video-generation, unified-model, ltx, multi-reference, instruction-editing]
keywords: [TIDE, task embeddings, per-token isolation, dual-path conditioning, unified video model, instruction editing, reference-guided editing, multi-reference generation, LTX-2.3]
related:
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - entities/models/tide.md
  - entities/models/ltx-2.md
  - concepts/joint-audio-visual-instruction-editing.md
  - concepts/albedo-guided-instance-video-editing.md
  - concepts/sync-audio-video-customization.md
  - entities/models/javedit.md
  - entities/models/albedoedit.md
  - sources/arxiv-2606-01362-albedoedit-video-editing.md
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-2606-08514-omnitryon-video-try-on.md
  - concepts/video-try-on-anything.md
  - concepts/layered-diffusion-content-preserving-video-editing.md
maturity: draft
created: 2026-06-10
updated: 2026-06-26
---

## Relations

@sources/arxiv-2606-08260-tide-unified-video-editing.md @entities/models/ltx-2.md @entities/models/tide.md @concepts/joint-audio-visual-instruction-editing.md @concepts/albedo-guided-instance-video-editing.md

## Raw Concept

Ingest 2026-06-10 — unified LTX-2.3 framework for edit + multi-reference gen via **per-token task IDs** instead of separate models or fragile positional hacks.

## Narrative

### Problem

2026 landscape splits capabilities: InsViE-style instruction editors, DreamID-Omni reference customization, Wan T2V generators — each a separate checkpoint. Unified attempts (VACE, VINO) need auxiliary encoders or fixed RoPE layouts that break when reference count varies.

### TIDE mechanism

1. **Per-token task embedding** `τ` — target (τ=0), source (τ=e_s), each reference (τ=e_1…e_k) or generation refs (τ=g_1…g_k); same image pixel gets different τ by task.
2. **Dual-path conditioning** — Gemma-3 VLM for semantics + VAE latents for structure.
3. **Progressive multi-task curriculum** — instruction edit first, then multi-reference mix.

Built on **LTX-2.3** 14B DiT + frozen Gemma-3-12B-IT.

### Persona workflow map

| Task | TIDE mode | Prior separate stack |
|------|-----------|---------------------|
| "Change her jacket to red" | Instruction edit | AlbedoEdit / img2img + re-animate |
| Outfit from reference photo | Ref-guided edit | IP-Adapter + Wan I2V |
| New scene from 3 refs | Multi-ref gen | Seedance-style multi-input (closed) |

**Gap vs JAVEdit:** TIDE is **visual-only** — no joint audio edit. Pick JAVEdit when dialogue must change with visuals.

## Snippets

> "The same type of visual input receives different identifiers depending on the task context."

## Dead Ends

1280×704 training res — persona 9:16 vertical may need crop workflow. License/weights `[NEEDS VERIFICATION 2026-06-10]`.
