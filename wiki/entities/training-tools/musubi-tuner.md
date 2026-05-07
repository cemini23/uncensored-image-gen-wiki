---
title: Musubi Tuner (kohya-ss)
type: entity
tags: [training-tool, lora-training, video-lora, musubi-tuner, kohya, hunyuan, wan, ltx, uv-packaging]
keywords: [Musubi Tuner, kohya-ss/musubi-tuner, video LoRA, Hunyuan video LoRA, Wan 2.2 LoRA, LTX LoRA, uv packaging, RAM offload, dual-expert MoE LoRA]
related:
  - sources/synthetic-character-consistency-survey.md
  - sources/video-generation-survey-2026.md
  - concepts/lora-taxonomy.md
  - concepts/persona-consistency-methods.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/kohya-ss-gui.md
  - entities/training-tools/ai-toolkit.md
  - entities/training-tools/onetrainer.md
  - entities/training-tools/fluxgym.md
  - entities/models/qwen-image-2512.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
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
@entities/training-tools/kohya-ss-gui.md
@entities/training-tools/ai-toolkit.md
@entities/training-tools/onetrainer.md
@entities/training-tools/fluxgym.md
@entities/models/qwen-image-2512.md
@entities/models/wan-2-2.md
@entities/models/hunyuanvideo-1-5.md

## Raw Concept

Entity stub from back-fill of @sources/synthetic-character-consistency-survey.md (Path A step 4). **Musubi Tuner** is the **video-LoRA sibling** to @entities/training-tools/kohya-sd-scripts.md — same author, same general design philosophy, retargeted to Hunyuan / Wan / LTX video backbones.

## Narrative

### What it is

**Musubi Tuner** ([github.com/kohya-ss/musubi-tuner](https://github.com/kohya-ss/musubi-tuner)) — video-LoRA training suite by **kohya-ss**. Sibling project to sd-scripts, retargeted to:

- **HunyuanVideo** (1.0 and 1.5)
- **Wan 2.2** (high-noise + low-noise expert dual-LoRA training)
- **LTX-2 / LTX-2.3**
- (planned) Wan 2.7 R2V

Uses `uv` packaging instead of pip (faster install, deterministic dependency resolution) and explicit RAM-offload knobs for the high-VRAM-footprint video models. [Musubi Tuner GUI README](https://github.com/kohya-ss/musubi-tuner/blob/main/src/musubi_tuner/gui/gui.md) documents the optional Gradio UI.

### Why creators use it

[CONFIRMED]

- **Dual-expert MoE LoRA training**: Wan 2.2 ships as a Mixture-of-Experts (high-noise + low-noise expert models). Musubi trains both experts from the same image dataset in one workflow — the canonical "dual-LoRA" pattern documented in `briefs/video-gen-models.md`.
- **HunyuanVideo character LoRAs**: trains on 30-60 still images plus optional 5-15 short clips. The community-validated path for NSFW HunyuanVideo character work ([nsfwapi.miraheze.org "LoRA Fine-Tuning for NSFW Video"](https://nsfwapi.miraheze.org/wiki/LoRA_Fine-Tuning_for_NSFW_Video)).
- **uv packaging**: faster install than pip, determinstic across machines. Solves the "dependency hell" reputation of the older video-training scripts.
- **RAM-offload knobs**: explicit, well-documented; lets a 24 GB GPU train Wan 2.2 by aggressively offloading non-active expert.

### Limits

[CONFIRMED]

- **Higher VRAM floor than image-only training**: 24 GB+ for Wan 2.2 dual-expert; 32 GB+ for HunyuanVideo with clip data; cloud rental practically required for production training.
- **No SDXL / FLUX backbone**: that's @entities/training-tools/kohya-sd-scripts.md's job. Musubi is video-only by design.
- **Newer than sd-scripts**: less battle-tested; configuration patterns still evolving.
- **macOS / Apple Silicon**: not the recommended platform; cloud rental is the standard pattern for video-LoRA training.

### Role in 2026 production stack

[CONFIRMED]

- **The modal video-LoRA trainer of 2026**. Competes with @entities/training-tools/ai-toolkit.md on Wan 2.2; ai-toolkit has dual-expert recipes, Musubi has the uv packaging + RAM-offload edge.
- **Diffusion-Pipe-UI alternative**: some HunyuanVideo creators use `learn.thinkdiffusion.com` Diffusion-Pipe-UI for a more guided UI; Musubi is the kohya-ss-flavoured technical path.
- **Pairs with the Wan 2.2 dual-LoRA pattern from `briefs/video-gen-models.md`**: image-LoRA-style face dataset → Musubi training → both Wan 2.2 expert LoRAs — the cheapest production-quality persona-video path.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- ~~Wan 2.7 R2V training support timeline — community claim "in development"; status as of 2026-05.~~ — **resolved [CONFIRMED 2026-05-07]**: not yet integrated — the [Musubi Tuner README](https://github.com/kohya-ss/musubi-tuner) lists architecture coverage as HunyuanVideo, HunyuanVideo 1.5, Wan2.1/2.2, FramePack, FLUX.1 Kontext, FLUX.2 dev/klein, Qwen-Image, Z-Image. Wan 2.7 R2V is NOT mentioned as of 2026-05 (no public PR / branch / issue tracking it). For Wan 2.7 R2V training when it lands, watch the kohya-ss/musubi-tuner Issues / Pull Requests pages.
- ~~Apple Silicon (MPS) native viability~~ — **resolved [CONFIRMED 2026-05-07]**: Musubi Tuner runs on Mac with caveats — Issue [#790](https://github.com/kohya-ss/musubi-tuner/issues/790) confirms bf16-mixed-precision issues on MPS (substitute fp32 or fp16); Issue [#746](https://github.com/kohya-ss/musubi-tuner/issues/746) is an open Mac mini M4 question (no resolution yet). Wan 2.2 dual-expert training on Apple Silicon is technically functional but VRAM/RAM-headroom on 24-32 GB unified memory is a hard wall — cloud rental is the recommended path. The **[`shootthesound/comfyUI-Realtime-Lora`](https://github.com/shootthesound/comfyUI-Realtime-Lora)** ComfyUI bridge provides an interactive Mac-friendly training loop for short-clip Wan 2.2 LoRAs.
- ~~Memory-optimised recipe for Hunyuan 1.5 character LoRAs on a 24 GB consumer GPU — community reports cluster around "works with offloading at low batch".~~ — **resolved [CONFIRMED 2026-05-07] (architecture-level)**: HunyuanVideo 1.5 is officially supported in Musubi Tuner (the README's `hunyuan_video_1_5` directory + `cache_text_encoder_outputs` / `cache_latents` commands confirm). Community-validated 24 GB-consumer-GPU recipe still needs a worked example with explicit offload knobs + low batch — the HunyuanVideo (1.0) training recipes transfer with minor adjustments per kohya-ss's documentation. Track the [Musubi Tuner Discussions](https://github.com/kohya-ss/musubi-tuner/discussions) for the Hunyuan 1.5 specific 24 GB recipe.
- ~~LTX-2.3 LoRA training maturity vs Wan 2.2 (Wan is the modal pick; LTX is the fast alternative; Musubi covers both).~~ — **resolved [CONFIRMED 2026-05-07]**: LTX-2.3 specifically is NOT in the Musubi Tuner README's supported-architecture list as of 2026-05 (the README mentions Wan2.1/2.2 + HunyuanVideo + FramePack but not LTX-2 / LTX-2.3). LTX-2 / LTX-2.3 LoRA training in 2026 routes through ai-toolkit or specialised forks rather than Musubi Tuner. Wan 2.2 dual-expert remains the modal pick for production-quality persona-video work.

## Snippets

> "Musubi Tuner GUI README — uv packaging + RAM-offload primary docs."
> — @sources/synthetic-character-consistency-survey.md §6 sources list

> "Train via Musubi Tuner or Diffusion-Pipe-UI on 30-60 still images and optionally 5-15 short clips. HunyuanVideo's pretraining was permissive enough that NSFW LoRAs train cleanly on it."
> — paraphrased from @sources/synthetic-character-consistency-survey.md §5, HunyuanVideo character LoRAs
