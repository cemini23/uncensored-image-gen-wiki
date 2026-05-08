---
title: OneTrainer
type: entity
tags: [training-tool, lora-training, onetrainer, sdxl, flux, 8gb-vram, gui]
keywords: [OneTrainer, OneTrainer GUI, 8 GB FLUX LoRA, low VRAM training, Adafactor, LoRA+, DoRA support, SDXL trainer, FLUX trainer]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/lora-taxonomy.md
  - concepts/persona-consistency-methods.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/ai-toolkit.md
  - entities/training-tools/kohya-ss-gui.md
  - entities/training-tools/musubi-tuner.md
  - entities/training-tools/fluxgym.md
  - entities/models/pony-v6.md
  - entities/models/flux-1-dev.md
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
@entities/training-tools/ai-toolkit.md
@entities/training-tools/kohya-ss-gui.md
@entities/training-tools/musubi-tuner.md
@entities/training-tools/fluxgym.md
@entities/models/pony-v6.md
@entities/models/flux-1-dev.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md. **OneTrainer** is the GUI-first community trainer with the strongest **8 GB VRAM** story of 2026 — the recommended pick when the user's local hardware is 8 GB and a cloud rental is not desired.

## Narrative

### What it is

**OneTrainer** ([github.com/Nerogar/OneTrainer](https://github.com/Nerogar/OneTrainer)) — desktop GUI training app by **Nerogar** for SD 1.5 / SDXL / FLUX / Pony / Illustrious / NoobAI LoRAs. Tk-based GUI with a comprehensive config tree.

Differentiating features:
- **Best 8 GB FLUX LoRA path** in the community ([r/StableDiffusion: Community test FLUX.1 LoRA/DoRA training on 8 GB](https://www.reddit.com/r/StableDiffusion/comments/1fj6mj7/community_test_flux1_loradora_training_on_8_gb/)) — works via Adafactor + LoRA+ + aggressive layer offload + Q4 quantisation of the base.
- **Native DoRA support** alongside LoRA / LoCon / LoHA / LoKr.
- **GUI-first**: the most beginner-friendly trainer; saves and reuses YAML/JSON configs.
- **Concept training**: explicit support for "concept" mode (multiple sub-concepts in one model) alongside character LoRA mode.

### Why creators use it

[CONFIRMED]

- **8 GB VRAM**: it works. The other trainers require workarounds; OneTrainer ships the recipe.
- **GUI + clear config tree**: less command-line overhead than Kohya / ai-toolkit; easier for users coming from the SDXL community.
- **DoRA testing**: the community has done much of its DoRA-vs-LoRA evaluation in OneTrainer.
- **Cross-base coverage**: SD 1.5, SDXL, Pony, Illustrious, NoobAI, FLUX.1 Dev all in one app.

### Hardware tier

[CONFIRMED]

| Backbone | Min VRAM (OneTrainer) | Optimiser default | Reference time |
|---|---|---|---|
| SD 1.5 | 6 GB | AdamW8bit | 30-60 min on 3060 |
| SDXL / Pony / Illustrious / NoobAI | 8 GB (with offload) | AdamW8bit | 1-2 h on 3090 |
| FLUX.1 Dev (Q4 + LoRA+) | **8 GB** | Adafactor + LoRA+ | 4-8 h on 3060 |
| FLUX.1 Dev (FP8 + LoRA) | 12 GB | AdamW8bit | 2-3 h on 3090 |

[CONFIRMED] The **8 GB FLUX recipe** ([Local AI Master FLUX VRAM Guide](https://localaimaster.com/blog/flux-local-image-generation), [r/StableDiffusion 8 GB OneTrainer benchmark](https://www.reddit.com/r/StableDiffusion/comments/1fj6mj7/community_test_flux1_loradora_training_on_8_gb/)): Q4-quantised FLUX.1-Dev base + Adafactor + LoRA+ + per-layer offload. Slower than 12-16 GB AdamW8bit but feasible.

### Linux / Windows / macOS

[CONFIRMED]

- **Linux**: native, fast.
- **Windows**: primary platform; the GUI was designed Windows-first.
- **macOS**: limited MPS support; not the recommended platform.

### Role in 2026 production stack

[CONFIRMED]

- **8 GB VRAM machines**: OneTrainer is the recommended trainer.
- **GUI-preference users coming from SDXL community**: OneTrainer over command-line Kohya.
- **DoRA experimentation**: OneTrainer has the most polished DoRA UX, even if @concepts/lora-taxonomy.md flags DoRA as a non-default for character work.
- **For 12-16+ GB FLUX work**: @entities/training-tools/kohya-sd-scripts.md or @entities/training-tools/ai-toolkit.md is more efficient. OneTrainer is the 8 GB / GUI choice.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- ~~Apple Silicon (MPS) status — OneTrainer historically Windows-Linux first~~ — **resolved [CONFIRMED 2026-05-07]**: OneTrainer's docs claim **out-of-box Apple Silicon support** but community M3 Max users report `RuntimeError: Torch not compiled with CUDA enabled` errors during training (Reddit threads 2025-12 → 2026-04). The first-time-install path is fragile; not recommended as the Apple-Silicon trainer of choice. For 8 GB on Apple Silicon, the more reliable path is cloud rental + dataset prep locally — OneTrainer's 8 GB story holds on Linux/Windows but not on MPS.
- FLUX.2 / Z-Image Turbo support timeline.
- Whether the 8-GB FLUX recipe still produces character LoRAs at quality parity with 16 GB AdamW8bit; community thread above suggests yes for face-only LoRAs but degrades for body/clothing variation.
- Output format: confirm Kohya-LoRA `.safetensors` is the default (compatible with ComfyUI / A1111 / Forge).

## Snippets

> "Community test: FLUX.1 LoRA/DoRA training on 8 GB. Works with Adafactor + LoRA+ in OneTrainer. Slower than 12 GB but you don't need to rent a GPU."
> — paraphrased from [r/StableDiffusion: 8 GB OneTrainer benchmark](https://www.reddit.com/r/StableDiffusion/comments/1fj6mj7/community_test_flux1_loradora_training_on_8_gb/)

> "Q4 quant + CPU-offload checkpoint, OneTrainer + Adafactor + LoRA+, 8 GB VRAM, ~6 h for a usable FLUX face LoRA. Not glamorous but it works."
> — paraphrased from [Local AI Master FLUX VRAM Guide](https://localaimaster.com/blog/flux-local-image-generation)

## Dead Ends

- **Prodigy on FLUX in OneTrainer** [RETRACTED]. Same FLUX/DiT issue documented for ai-toolkit and Kohya. Use AdamW8bit (12+ GB) or Adafactor + LoRA+ (8 GB).
