---
title: kohya_ss GUI (bmaltais)
type: entity
tags: [training-tool, lora-training, gui, kohya-ss, bmaltais, gradio, sdxl, flux]
keywords: [kohya_ss GUI, bmaltais, kohya_ss frontend, Gradio kohya, sd-scripts GUI, kohya wrapper, Windows training GUI]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/lora-taxonomy.md
  - concepts/persona-consistency-methods.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/onetrainer.md
  - entities/training-tools/musubi-tuner.md
  - entities/training-tools/fluxgym.md
  - entities/training-tools/ai-toolkit.md
  - entities/models/pony-v6.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/lora-taxonomy.md
@concepts/persona-consistency-methods.md
@entities/training-tools/kohya-sd-scripts.md
@entities/training-tools/onetrainer.md
@entities/training-tools/musubi-tuner.md
@entities/training-tools/fluxgym.md
@entities/training-tools/ai-toolkit.md
@entities/models/pony-v6.md
@entities/models/sdxl-fine-tunes.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md (Path A step 4). **kohya_ss GUI** is the **Gradio frontend** by bmaltais wrapping @entities/training-tools/kohya-sd-scripts.md — the modal way the community trains in 2026.

## Narrative

### What it is

**kohya_ss GUI** ([github.com/bmaltais/kohya_ss](https://github.com/bmaltais/kohya_ss)) — Gradio web frontend by **bmaltais** that wraps @entities/training-tools/kohya-sd-scripts.md and exposes its training options as a forms-based UI. Originally Stable Diffusion 1.5 / SDXL focused; FLUX support tracked as kohya-ss/sd-scripts adds capabilities.

### Why creators use it

[CONFIRMED]

- **The forms-based modal trainer**: the most-installed LoRA trainer GUI in the 2024-2026 community. Most YouTube training tutorials use kohya_ss GUI.
- **Saves and reuses TOML configs**: train recipes are exportable, version-controllable, shareable.
- **Wraps the full sd-scripts feature set**: every flag, every LyCORIS variant, every optimiser. Nothing the CLI can do that the GUI hides.
- **Windows-popular**: the easiest 12-16 GB Windows LoRA trainer to install (unzip + double-click `setup.bat`).

### Limits

[CONFIRMED]

- **Lags upstream sd-scripts**: new sd-scripts features take days-to-weeks to land in the GUI. For bleeding-edge FLUX.2 / Z-Image support, run sd-scripts directly.
- **macOS support**: limited; same MPS caveats as @entities/training-tools/kohya-sd-scripts.md. The 2026 pattern is "install on Windows / Linux for training, install ComfyUI on the Mac for inference".
- **GUI is Gradio, not native**: occasional sluggishness with large datasets / many tag inputs.
- **No Wan / Hunyuan video LoRA support**: the video story is @entities/training-tools/musubi-tuner.md sibling project, not kohya_ss GUI.

### Role in 2026 production stack

[CONFIRMED]

- **The default GUI trainer for SDXL / Pony / Illustrious / NoobAI** in 2026.
- **Competes with @entities/training-tools/onetrainer.md** for "GUI-first SDXL trainer" — kohya_ss GUI has wider community support and tutorial coverage; OneTrainer has the better 8 GB VRAM story for FLUX.
- **Competes with @entities/training-tools/ai-toolkit.md** for "GUI-or-code FLUX trainer" — kohya_ss GUI is GUI-only and lags FLUX features; ai-toolkit is YAML-based and FLUX-first.
- **Not a video trainer** — for Wan 2.2 / Hunyuan / LTX video LoRAs, use @entities/training-tools/musubi-tuner.md.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- ~~Current FLUX.2 / FLUX.2 Klein 9B / Z-Image support status as of 2026-05.~~ — **resolved [CONFIRMED 2026-05-07]**: bmaltais/kohya_ss does NOT yet support FLUX.2 / Klein 9B / Z-Image as of 2026-05; the GUI tracks bmaltais-wrapped sd-scripts which has not added these architectures. The canonical training path for FLUX.2 / Klein 9B / Z-Image is @entities/training-tools/musubi-tuner.md (its README confirms full architecture coverage; Klein 9B-specific issues #859 / #860 land there).
- ~~Whether bmaltais has merged the optional Musubi Tuner UI bridge that some forks have started shipping.~~ — **resolved [CONFIRMED 2026-05-07]**: no — bmaltais/kohya_ss has not merged a Musubi Tuner UI bridge. Musubi Tuner ships its own optional Gradio UI ([README](https://github.com/kohya-ss/musubi-tuner/blob/main/src/musubi_tuner/gui/gui.md)); kohya_ss GUI and Musubi Tuner remain separate frontends despite the shared kohya-ss / bmaltais lineage. For unified frontends, run them side-by-side rather than expecting cross-bridging.
- ~~Apple Silicon native install path — expected 5-10× slower than Linux/Windows~~ — **resolved [CONFIRMED 2026-05-07]**: kohya_ss GUI installs on M1/M2 via the bundled `setup.sh` with the **Mac-specific accelerate config** (`--mixed_precision no` and `--use_mps_device`) per [bmaltais/kohya_ss issue #1248](https://github.com/bmaltais/kohya_ss/issues/1248). SDXL training works at 5-10× slower than NVIDIA equivalents; FLUX training largely impractical due to bf16 / fp8 limits on MPS. Use sd-scripts directly under the GUI's hood for any Mac-specific patching.

## Snippets

> "Best Linux and Windows training tools in 2025: Kohya is still the answer. ai-toolkit for FLUX-first workflows; OneTrainer if you need 8 GB; Musubi for video. Everything else is downstream of Kohya."
> — paraphrased from [r/StableDiffusion: Best Linux/Windows Training Tools 2025](https://www.reddit.com/r/StableDiffusion/comments/1nmzpxm/best_linux_and_windows_training_tools_in_2025/)

> "The kohya_ss GUI saves and reuses TOML configs — the same recipe runs on the same dataset reliably six months later, even after the underlying sd-scripts has been updated three times."
> — paraphrased community workflow guidance
