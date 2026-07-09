---
title: ai-toolkit (Ostris)
type: entity
tags: [training-tool, lora-training, ai-toolkit, ostris, flux, wan, replicate, modal]
keywords: [ai-toolkit, Ostris, ostris ai-toolkit, FluxGym backend, Replicate ostris trainer, Modal hosting, FLUX trainer, Wan trainer, ostris/ai-toolkit]
related:
  - sources/synthetic-character-consistency-survey.md
  - sources/video-generation-survey-2026.md
  - concepts/lora-taxonomy.md
  - concepts/persona-consistency-methods.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/onetrainer.md
  - entities/training-tools/kohya-ss-gui.md
  - entities/training-tools/musubi-tuner.md
  - entities/training-tools/fluxgym.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/pony-v7.md
  - entities/models/wan-2-2.md
  - concepts/model-selection-workflow.md
  - entities/hardware/gpu-guide.md
  - sources/arxiv-2607-07173-spara-dcal-subject-driven-personalization.md
  - concepts/stage-aware-lora-distribution-calibrated-selection.md
maturity: draft
created: 2026-05-06
updated: 2026-05-07
---

## Relations

@sources/synthetic-character-consistency-survey.md
@sources/video-generation-survey-2026.md
@concepts/lora-taxonomy.md
@concepts/persona-consistency-methods.md
@entities/training-tools/kohya-sd-scripts.md
@entities/training-tools/onetrainer.md
@entities/training-tools/kohya-ss-gui.md
@entities/training-tools/musubi-tuner.md
@entities/training-tools/fluxgym.md
@entities/adapters/flux2-klein-9b-faceswap.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/models/pony-v7.md
@entities/models/wan-2-2.md
@concepts/de-censoring-techniques.md
@concepts/model-selection-workflow.md
@entities/hardware/gpu-guide.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md. **ai-toolkit** by **Ostris** is the FLUX-first / Wan-first community trainer of 2024-2026. Most-recommended FLUX LoRA trainer when you don't already have a Kohya pipeline.

## Narrative

### What it is

**ai-toolkit** ([github.com/ostris/ai-toolkit](https://github.com/ostris/ai-toolkit)) — Python training toolkit by **Jaret Burkett (Ostris)**, designed FLUX-first and extended to Wan 2.2 / FLUX.2 / Z-Image. Differentiating features:

- **YAML-based config**: cleaner than Kohya's command-line argument soup; easier to share + version-control training recipes.
- **Web UI**: optional Gradio frontend.
- **Modal-hosted training**: built-in support for [Modal.com](https://modal.com/) cloud training — Ostris ships a hosted-trainer pattern that the community uses for cheap H100 access.
- **Replicate trainer**: [Replicate ostris trainer](https://replicate.com/ostris/flux-dev-lora-trainer) is the canonical hosted FLUX trainer; runs the same code with a paid web frontend.
- **DoRA support**: first-class.

### Why creators use it

[CONFIRMED]

- **Best FLUX UX**: cleaner config, fewer footguns than Kohya's FLUX support.
- **Wan 2.2 support**: trains Wan high-noise + low-noise expert LoRAs as a unified workflow ("dual-LoRA" pattern; both expert models from the same image dataset).
- **FLUX.2 dev / Klein 9B coverage**: explicit recipes; community-validated benchmarks ([r/StableDiffusion: Training character/face LoRAs on FLUX.2-dev](https://www.reddit.com/r/StableDiffusion/comments/1rcu82s/training_characterface_loras_on_flux2dev_with/), [r/StableDiffusion: Lora Klein 9b 4060 16gb](https://www.reddit.com/r/StableDiffusion/comments/1rcc1cy/lora_klein_9b_fantastic_likeness_4060_16gb/)).
- **Modal-cloud bridge**: lets a 8-GB / Apple Silicon user offload the training step without leaving the toolkit.
- **The FLUX Kontext Character Turnaround Sheet LoRA** ([RunComfy workflow](https://www.runcomfy.com/comfyui-workflows/flux-kontext-character-turnaround-sheet-lora)) was trained with ai-toolkit; the framework ships sample configs for the same workflow.

### Hardware tier

[CONFIRMED]

| Backbone | Min VRAM (ai-toolkit, AdamW8bit) | Reference time |
|---|---|---|
| FLUX.1 Dev | 16 GB | 2-4 h on RTX 3090 |
| FLUX.2 Dev | 80 GB (H100) | ~3 h, batch 1, 3500 steps |
| FLUX.2 Klein 9B | 16 GB | ~30 min on RTX 4060 Ti 16 GB |
| Wan 2.2 (dual-expert) | 24 GB+ | varies by clip dataset |
| Z-Image Turbo | 8-12 GB | 1.5-3 h on 3090 |

[CONFIRMED] FLUX.2 Klein 9B is the cheapest *high-quality* face LoRA path of 2026: ~30 min on a 4060 Ti 16 GB produces a usable character LoRA per [r/StableDiffusion: Klein 9B 4060 16gb](https://www.reddit.com/r/StableDiffusion/comments/1rcc1cy/lora_klein_9b_fantastic_likeness_4060_16gb/).

### Critical optimiser note

[CONFIRMED] **Use AdamW8bit on FLUX/DiT bases. Do not use Prodigy.** [ostris/ai-toolkit issue #134](https://github.com/ostris/ai-toolkit/issues/134) is the canonical bug report — Prodigy underestimates LR on FLUX/DiT and the character never trains. ai-toolkit defaults to AdamW8bit @ 5e-5 for FLUX, which is the correct setting; the issue is community users porting Prodigy SDXL recipes over.

### Linux / Windows / macOS

[CONFIRMED]

- **Linux**: native, fastest.
- **Windows**: native (recent, mostly works).
- **macOS**: ai-toolkit is best used as a Modal/Replicate-launcher from macOS, not for native MPS training. The 2026 pattern is: develop dataset locally, push to Modal/Replicate via ai-toolkit, fetch the trained LoRA back.

### Role in 2026 production stack

[CONFIRMED]

- **For FLUX-only workflows**, ai-toolkit is the most recommended trainer in 2026.
- **For SDXL/Pony/Illustrious/NoobAI**, @entities/training-tools/kohya-sd-scripts.md is still the better pick (more LyCORIS support, more years of recipe-tuning).
- **For Wan 2.2 video LoRAs**, ai-toolkit and Musubi Tuner compete; ai-toolkit's dual-expert recipe is community-validated; Musubi has uv packaging + RAM-offload edge.
- **For 8-GB VRAM**, @entities/training-tools/onetrainer.md outperforms ai-toolkit due to OneTrainer's specific 8 GB FLUX optimisations.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- Modal/Replicate cost tracking: typical FLUX.1 LoRA cost on Modal at 2026 prices.
- Whether the Wan 2.2 dual-expert recipe transfers to Wan 2.7 R2V (multi-reference) — not yet documented.
- ~~Apple Silicon native MPS path — Ostris ships some MPS testing but training-throughput is far below cloud H100~~ — **resolved [CONFIRMED 2026-05-07]**: Ostris main repo does not ship native MPS training as a first-class path. The community fork **[`github.com/hughescr/ai-toolkit`](https://github.com/hughescr/ai-toolkit)** provides Apple Silicon adaptation (replaces `torch.cuda.amp` with `torch.amp` throughout); HF blog by AlekseyCalvin documents the Mac workflow; PR open in main repo, not yet merged as of 2026-05. **Recommended for Mac users**: Hughescr fork for exploration, Modal/Replicate cloud bridge (built into ai-toolkit) for production runs.
- FLUX.2 Klein 9B trainer parity: the ~30-min benchmark assumes specific config; reproduce on this workspace.

## Snippets

> "Training character/face LoRAs on FLUX.2-dev with ai-toolkit on H100 — 3500 steps, batch 1, ~3 hours, AdamW8bit at 5e-5. Don't use Prodigy."
> — paraphrased from [r/StableDiffusion: Training character/face LoRAs on FLUX.2-dev](https://www.reddit.com/r/StableDiffusion/comments/1rcu82s/training_characterface_loras_on_flux2dev_with/)

> "LoRA Klein 9B, fantastic likeness, ~30 minutes on a 4060 Ti 16 GB. The cheapest high-quality face-LoRA path that exists right now."
> — paraphrased from [r/StableDiffusion: Klein 9B 4060 16gb](https://www.reddit.com/r/StableDiffusion/comments/1rcc1cy/lora_klein_9b_fantastic_likeness_4060_16gb/)

## Dead Ends

- **Prodigy on FLUX in ai-toolkit** [RETRACTED]. [Issue #134](https://github.com/ostris/ai-toolkit/issues/134) is the canonical bug report. AdamW8bit @ 5e-5 is correct.
- **ai-toolkit on macOS native MPS for FLUX.1 Dev** [TENTATIVE-RETRACTED]. Possible but slow; the cost-effective path is Modal/Replicate with ai-toolkit as launcher.
