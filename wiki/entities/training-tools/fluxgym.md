---
title: FluxGym
type: entity
tags: [training-tool, lora-training, gui, fluxgym, flux, 8gb-vram, low-vram-trainer]
keywords: [FluxGym, Flux Gym, GUI FLUX trainer, 8GB FLUX LoRA, Cocktailpeanut, beginner FLUX trainer, sd-scripts wrapper]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/lora-taxonomy.md
  - concepts/persona-consistency-methods.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/kohya-ss-gui.md
  - entities/training-tools/onetrainer.md
  - entities/training-tools/ai-toolkit.md
  - entities/training-tools/musubi-tuner.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - concepts/model-selection-workflow.md
  - entities/hardware/gpu-guide.md
  - entities/uis/comfyui.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/lora-taxonomy.md
@concepts/persona-consistency-methods.md
@entities/training-tools/kohya-sd-scripts.md
@entities/training-tools/kohya-ss-gui.md
@entities/training-tools/onetrainer.md
@entities/training-tools/ai-toolkit.md
@entities/training-tools/musubi-tuner.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@concepts/model-selection-workflow.md
@entities/hardware/gpu-guide.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md (Path A step 4). **FluxGym** is a beginner-friendly **FLUX-only GUI trainer** wrapping sd-scripts; popularised the "train a FLUX LoRA on consumer hardware" workflow and reduced setup friction below kohya_ss GUI.

## Narrative

### What it is

**FluxGym** ([github.com/cocktailpeanut/fluxgym](https://github.com/cocktailpeanut/fluxgym)) — Gradio GUI by **Cocktailpeanut** dedicated specifically to FLUX.1 LoRA training. Wraps @entities/training-tools/kohya-sd-scripts.md (sd-scripts) under the hood with FLUX-only defaults pre-configured.

Distinguishing features:
- **One-click setup** (Pinokio integration on macOS / Windows / Linux).
- **FLUX-only**: no SDXL / Pony / Illustrious — every config option is FLUX-default-tuned.
- **Cleaner UI than kohya_ss GUI for the FLUX subset** — fewer footguns, fewer rarely-used options exposed.
- **Bundles the FP8 / Q-quantised FLUX checkpoints** for low-VRAM training.

### Why creators use it

[CONFIRMED]

- **Lowest setup friction for FLUX LoRA training in 2026**: the "I just want to train one persona LoRA on FLUX" path. Pinokio install gets a non-developer running in ~15 minutes.
- **8-12 GB VRAM friendly**: bundles the low-VRAM recipes (FP8 base, Adafactor + LoRA+, layer offload). Less aggressive than @entities/training-tools/onetrainer.md but more accessible.
- **macOS / Apple Silicon viable** (slow but feasible) via Pinokio's MPS-aware install.

### Limits

[CONFIRMED]

- **FLUX-only**: no SDXL / Pony / Illustrious / NoobAI / Wan / Hunyuan support. For SDXL workflows, use @entities/training-tools/kohya-ss-gui.md or @entities/training-tools/onetrainer.md.
- **Limited LyCORIS coverage**: standard LoRA primarily; LoCon / LoHA / LoKr / DoRA support thinner than full kohya_ss GUI.
- **Lags upstream sd-scripts**: same lag-from-upstream as @entities/training-tools/kohya-ss-gui.md, since FluxGym is also a sd-scripts wrapper.
- **No Modal / Replicate cloud bridge**: less cloud-friendly than @entities/training-tools/ai-toolkit.md.

### Role in 2026 production stack

[CONFIRMED]

- **Beginner FLUX-only path**: the recommended starting point for a creator with consumer-grade hardware (12-24 GB) who wants their first FLUX persona LoRA without learning Kohya's CLI.
- **Not for production-grade work**: as the workflow matures, creators graduate to @entities/training-tools/ai-toolkit.md (FLUX-first, YAML configs, Modal/Replicate bridge) or @entities/training-tools/kohya-ss-gui.md (full LyCORIS support).
- **Apple Silicon convenience**: the easiest Mac-native FLUX trainer to install in 2026, even if the throughput is far below a cloud H100. Useful for exploratory runs only.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- ~~Apple Silicon (MPS) actual training time for a FLUX.1 character LoRA on M3 / M4 Pro / M4 Max~~ — **resolved [CONFIRMED 2026-05-07]**: **effectively no Apple Silicon support** for production-grade FLUX training. Cocktailpeanut (FluxGym author) tweeted *"Me in the corner waiting for the impossible to eventually happen: FLUX finetuning on Apple Silicon Mac"* — confirming the upstream status. The Pinokio install completes on macOS but training on a M3/M4 Pro/Max is impractically slow (community reports 8+ hours for ranks where Linux/Windows hits 1-2 hours, with frequent OOM at >16 GB unified memory). For Apple Silicon users, the recommended path is **dataset prep on Mac → cloud H100 rental via ai-toolkit's Modal/Replicate bridge**.
- ~~LyCORIS variant support status as of 2026-05 (LoKr factor=4 in particular — the @concepts/lora-taxonomy.md 2026 default for character isolation).~~ — **resolved [CONFIRMED 2026-05-07]**: thin. FluxGym exposes only standard LoRA training as a first-class option; LyCORIS variants (LoKr / LoHa / LoCon / DoRA) are accessible only via the underlying sd-scripts Advanced tab and require manual config. For LoKr factor=4 character isolation as the 2026 default, use @entities/training-tools/ai-toolkit.md (YAML config makes LoKr factor=4 a one-line change) or @entities/training-tools/onetrainer.md (explicit LyCORIS UI). FluxGym remains a first-LoRA-on-FLUX.1 tool, not a LyCORIS-experimentation surface.
- ~~FLUX.2 Klein 9B trainer integration timeline — currently @entities/training-tools/ai-toolkit.md is the canonical Klein 9B path; FluxGym not yet documented for Klein 9B.~~ — **resolved [CONFIRMED 2026-05-07]**: FluxGym does NOT support FLUX.2 / Klein 9B as of 2026-05 — Issue #487 (open) tracks "FLUX.2-dev support" with no merged PR. The canonical Klein 9B trainer paths are @entities/training-tools/ai-toolkit.md (FLUX.2-first) and @entities/training-tools/musubi-tuner.md (Issues #859 / #860 confirm Klein 9B coverage). FluxGym remains FLUX.1-only in 2026.
- ~~Pinokio install handling InsightFace / GPU dependency stack on Apple Silicon~~ — **resolved [CONFIRMED 2026-05-07]**: Pinokio installs the FluxGym + InsightFace stack on macOS without the late-2025 install pain (InsightFace's macOS wheels stabilised). The install path is functional; the limit is FLUX training throughput on MPS, not the install itself.

## Snippets

> "Q4 quant + CPU-offload checkpoint, OneTrainer + Adafactor + LoRA+, 8 GB VRAM, ~6 h for a usable FLUX face LoRA. Not glamorous but it works. FluxGym is the same recipe with a friendlier UI for users who don't want to touch the OneTrainer config tree."
> — paraphrased community guidance, [Local AI Master FLUX VRAM Guide](https://localaimaster.com/blog/flux-local-image-generation)
