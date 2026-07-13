---
title: "Stage-aware LoRA + distribution-calibrated candidate selection (SPaRa–DCAL)"
type: concept
tags: [persona-consistency, lora, personalization, inference, training]
keywords: [SPaRa, DCAL, stage-aware LoRA, alpha(t), candidate selection, identity diversity tradeoff, DreamBooth]
related:
  - sources/arxiv-2607-07173-spara-dcal-subject-driven-personalization.md
  - concepts/persona-consistency-methods.md
  - concepts/lora-taxonomy.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/david-adoption-brief-routing.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/ai-toolkit.md
  - entities/models/flux-2-klein.md
  - entities/models/flux-2-klein.md
  - entities/adapters/flux2-klein-matchingpose.md
  - concepts/video-identity-inheritance.md
  - sweeps/2026-07-09-daily.md
maturity: draft
created: 2026-07-09
updated: 2026-07-12
---

## Relations

@sources/arxiv-2607-07173-spara-dcal-subject-driven-personalization.md @concepts/persona-consistency-methods.md @concepts/lora-taxonomy.md @concepts/reference-plus-lora-stacking.md @entities/training-tools/kohya-sd-scripts.md @entities/training-tools/ai-toolkit.md

## Raw Concept

Synthesized from @sources/arxiv-2607-07173-spara-dcal-subject-driven-personalization.md — modular subject-driven personalization via timestep-scaled LoRA (SPaRa) and inference-time calibrated picking (DCAL).

## Narrative

### SPaRa (training-side)

Standard LoRA uses `W(t) = W₀ + (α/r) B A`. **SPaRa** makes `α(t)` depend on diffusion timestep bucket (high / mid / low noise), reallocating adapter strength without changing rank or matrix shapes. Intuition: high-noise steps bind global subject layout; low-noise steps refine texture — uniform strength mismatches capacity needs.

**Adoption**: WATCH until trainer support exists. Manual proxy: vary LoRA strength by timestep bucket in ComfyUI if node graph exposes schedule hooks.

### DCAL (inference-side)

When generating `K` candidates for the same persona + prompt:

| Failure mode | Cause |
|--------------|-------|
| Identity-only pick | Highest CLIP-I/DINO-I sample often clusters near reference — low pose/scene diversity |
| Blind random pick | Wastes identity consistency |

**DCAL** scores candidates with identity + text alignment + redundancy/diversity penalty. Paper shows identity metrics rise while pairwise diversity falls if you only optimize identity — operator must accept explicit tradeoff.

### David adoption path (no paper code required)

1. Generate **8–16** persona master frames per prompt (existing ComfyUI batch).
2. Score with CLIP-I/DINO-I vs reference + CLIP-T vs prompt.
3. Penalize near-duplicate picks in embedding space (pairwise cosine).
4. Select top-1 for catalog; keep runners-up for variation sets.

Phase-0: **GO (procedure)** for DCAL-style selection; **WATCH** for SPaRa training schedules.

## Snippets

> "A uniform low-rank constraint or a uniform adapter strength cannot explicitly distinguish the capacity requirements of different denoising stages."

> "Identity-oriented candidate selection restricts the radius of selected features around the reference center."

## Dead Ends

- Assuming SDXL DreamBooth numbers transfer to FLUX Klein without local validation.
- Skipping diversity metrics — persona feeds that look like the same reference photo kill engagement.
