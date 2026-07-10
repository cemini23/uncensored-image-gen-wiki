---
title: Kohya sd-scripts
type: entity
tags: [training-tool, lora-training, kohya, sd-scripts, sdxl, flux, hunyuan, musubi]
keywords: [Kohya, sd-scripts, kohya-ss, sdxl_train_network.py, flux_train_network.py, sd-trainer, kohya_ss GUI, Musubi Tuner, AdamW8bit, Prodigy]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/lora-taxonomy.md
  - concepts/persona-consistency-methods.md
  - entities/training-tools/ai-toolkit.md
  - entities/training-tools/onetrainer.md
  - entities/training-tools/kohya-ss-gui.md
  - entities/training-tools/musubi-tuner.md
  - entities/training-tools/fluxgym.md
  - entities/models/pony-v6.md
  - entities/models/pony-v7.md
  - entities/models/illustrious-xl.md
  - entities/models/noobai-xl.md
  - entities/models/flux-1-dev.md
  - entities/models/sdxl-fine-tunes.md
  - concepts/model-selection-workflow.md
  - entities/hardware/gpu-guide.md
  - entities/uis/comfyui.md
  - sources/arxiv-2607-07173-spara-dcal-subject-driven-personalization.md
  - concepts/stage-aware-lora-distribution-calibrated-selection.md
  - sources/arxiv-2607-05711-fourtune-4bit-diffusion-post-training.md
  - concepts/fourtune-w4a4g4-diffusion-lora-training.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/lora-taxonomy.md
@concepts/persona-consistency-methods.md
@entities/training-tools/ai-toolkit.md
@entities/training-tools/onetrainer.md
@entities/training-tools/kohya-ss-gui.md
@entities/training-tools/musubi-tuner.md
@entities/training-tools/fluxgym.md
@entities/models/pony-v6.md
@entities/models/pony-v7.md
@entities/models/illustrious-xl.md
@entities/models/noobai-xl.md
@entities/models/flux-1-dev.md
@entities/models/sdxl-fine-tunes.md
@concepts/model-selection-workflow.md
@entities/hardware/gpu-guide.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md. **Kohya sd-scripts** is the canonical CLI training suite for Stable Diffusion / SDXL / Pony / Illustrious / NoobAI / FLUX / Hunyuan LoRAs; the de-facto baseline trainer of the entire 2024-2026 community.

## Narrative

### What it is

**Kohya sd-scripts** ([github.com/kohya-ss/sd-scripts](https://github.com/kohya-ss/sd-scripts)) — Python CLI suite by **kohya-ss** for fine-tuning Stable Diffusion family models. Successive scripts cover SD 1.5, SDXL, FLUX, and (via the **Musubi Tuner** sibling project) Hunyuan / Wan / LTX video LoRAs.

Companion projects:
- **kohya_ss GUI** ([github.com/bmaltais/kohya_ss](https://github.com/bmaltais/kohya_ss)) — Gradio frontend wrapping sd-scripts; the modal way community trains.
- **Musubi Tuner** ([github.com/kohya-ss/musubi-tuner](https://github.com/kohya-ss/musubi-tuner)) — same author's video-LoRA trainer for Hunyuan / Wan, with `uv` packaging and explicit RAM-offload support ([Musubi Tuner GUI README](https://github.com/kohya-ss/musubi-tuner/blob/main/src/musubi_tuner/gui/gui.md)).

### Why it's the baseline

[CONFIRMED]

- **Most LyCORIS-complete trainer**: supports LoRA / LoCon / LoHA / LoKr / DoRA, with rank/alpha/network-args fully configurable. See @concepts/lora-taxonomy.md for the variant table.
- **Best base coverage**: SD 1.5, SDXL (every fine-tune — Pony, Illustrious, NoobAI, Anima), FLUX.1 Dev/Schnell, FLUX.2 (recent), Z-Image (recent), Qwen-Image (via Musubi).
- **Optimiser flexibility**: AdamW8bit, Lion, Prodigy, Adafactor, LoRA+, and per-layer LR schedules. The 2026 default is AdamW8bit @ 5e-5 for FLUX/DiT bases and 1e-4 for SDXL/Pony.
- **Used in every major community recipe**: every Reddit-indexed training guide ([r/StableDiffusion: 8-bit Adam vs Adafactor vs Prodigy](https://www.reddit.com/r/StableDiffusion/comments/17mk1hs/8bit_adam_vs_adafactor_vs_prodigy_which_optimizer/), [r/StableDiffusion: Best Linux/Windows Training Tools 2025](https://www.reddit.com/r/StableDiffusion/comments/1nmzpxm/best_linux_and_windows_training_tools_in_2025/)) uses Kohya.

### Hardware tier

[CONFIRMED]

| Backbone | Min VRAM (Kohya, AdamW8bit) | Notes |
|---|---|---|
| SD 1.5 | 6 GB | Most permissive |
| SDXL / Pony / Illustrious / NoobAI | 12 GB | 16 GB recommended |
| FLUX.1 Dev (FP8 + LoRA) | 12 GB | Aggressive offload required at 12; 16 GB comfortable |
| FLUX.2 Dev | 24 GB+ | H100 / A100 territory for batch >1 |
| Hunyuan video (via Musubi) | 24 GB+ | RAM-offload helps |
| Wan 2.2 (via Musubi) | 24 GB+ | dual-LoRA workflow for high/low-noise experts |

For 8 GB VRAM, the community uses **Adafactor + LoRA+** in Kohya — slow but feasible ([r/StableDiffusion: 8 GB FLUX-1 LoRA/DoRA on OneTrainer](https://www.reddit.com/r/StableDiffusion/comments/1fj6mj7/community_test_flux1_loradora_training_on_8_gb/)). @entities/training-tools/onetrainer.md is the more 8-GB-friendly trainer in 2026.

### Linux / Windows / macOS

[CONFIRMED]

- **Linux**: native, fastest, all features.
- **Windows**: native, full-feature; kohya_ss GUI is Windows-popular.
- **macOS / Apple Silicon**: limited — partial MPS support, training is much slower (no bitsandbytes 8-bit on MPS), most community guidance is "rent a 4090 on RunPod / Vast.ai for the training step, do inference locally on the Mac". This is the recommended pattern for this MacBook Pro workspace.

### Role in 2026 production stack

[CONFIRMED]

- **Kohya is the default character-LoRA trainer** for SDXL/Pony/Illustrious/NoobAI in 2026.
- **For FLUX**, Kohya and @entities/training-tools/ai-toolkit.md compete; ai-toolkit has slightly better FLUX UX, Kohya has wider LyCORIS support.
- **For Wan / Hunyuan video LoRAs**, Musubi Tuner is the modal pick.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- ~~Apple Silicon training viability on M-series with current Kohya~~ — **resolved [CONFIRMED 2026-05-07]**: Kohya sd-scripts runs on M1/M2/M3/M4 with **manual `cuda` → `mps` patches** in `train_util.py` — community-documented but not first-class. Expected throughput 5-10× slower than NVIDIA at SDXL scale; OOM risk at FLUX.1 Dev scale on 16 GB unified memory unless aggressive offload. **Bitsandbytes 8-bit optimisers do not work on MPS** — substitute Adafactor or AdamW-fp32. For this workspace, cloud rental remains the recommended training path; sd-scripts on Mac is exploratory only.
- FLUX.2 Klein 9B compatibility — community reports a working recipe on a 4060 Ti 16 GB ([r/StableDiffusion thread](https://www.reddit.com/r/StableDiffusion/comments/1rcc1cy/lora_klein_9b_fantastic_likeness_4060_16gb/)). Verify on this workspace's hardware.
- Whether the Kohya / kohya_ss GUI split has been resolved or whether they remain forked — affects which doc set to follow.

## Snippets

> "Best Linux and Windows training tools in 2025: Kohya is still the answer. ai-toolkit for FLUX-first workflows; OneTrainer if you need 8 GB; Musubi for video. Everything else is downstream of Kohya."
> — paraphrased from [r/StableDiffusion: Best Linux/Windows Training Tools 2025](https://www.reddit.com/r/StableDiffusion/comments/1nmzpxm/best_linux_and_windows_training_tools_in_2025/)

> "We tested 8-bit Adam vs Adafactor vs Prodigy — for SDXL character work, AdamW8bit at 1e-4 with cosine LR is the boring-but-correct answer. Prodigy auto-tunes but you save maybe 20 % time and the result is a wash."
> — paraphrased from [r/StableDiffusion: 8-bit Adam vs Adafactor vs Prodigy](https://www.reddit.com/r/StableDiffusion/comments/17mk1hs/8bit_adam_vs_adafactor_vs_prodigy_which_optimizer/)

## Dead Ends

- **Kohya on Apple Silicon for full FLUX training** [TENTATIVE-RETRACTED]. Possible at small batch + low rank but not the cost-effective path. Rent cloud GPU for training; do inference locally.
- **Prodigy on FLUX in Kohya** [RETRACTED]. Same LR-underestimation issue documented in @concepts/lora-taxonomy.md. AdamW8bit @ 5e-5 is the FLUX default in Kohya.
