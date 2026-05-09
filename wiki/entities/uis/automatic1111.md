---
title: Automatic1111 SDXL WebUI
type: entity
tags: [ui, inference-frontend, automatic1111, sd, sdxl, webui, open-source]
keywords: [Automatic1111, A1111, SDXL WebUI, stable-diffusion-webui, Forge, tab-based, legacy UI]
related:
  - entities/uis/comfyui.md
  - entities/models/pony-v6.md
  - entities/models/illustrious-xl.md
  - entities/models/noobai-xl.md
  - entities/models/sdxl-fine-tunes.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - sources/uncensored-image-generation-survey.md
  - entities/uis/forge.md
  - entities/uis/invokeai.md
  - entities/uis/swarmui.md
maturity: stub
created: 2026-05-08
updated: 2026-05-08
---

## Relations

@entities/uis/comfyui.md
@entities/models/pony-v6.md
@entities/models/illustrious-xl.md
@entities/models/noobai-xl.md
@entities/models/sdxl-fine-tunes.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/uis/forge.md
@entities/uis/invokeai.md
@entities/uis/swarmui.md

## Raw Concept

**Automatic1111 (A1111)** — the original Stable Diffusion WebUI by AUTOMATIC1111. Tab-based form interface; SD 1.5 / SDXL native support; FLUX via community patches. GitHub: [github.com/AUTOMATIC1111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui). Legacy UI — largely superseded by ComfyUI for production workflows and Forge for performance, but widely installed and documented.

## Narrative

### What it is

A1111 is the oldest and most widely recognized Stable Diffusion frontend. Tab-based UI with form inputs for prompts, samplers, CFG scale, resolution, etc. Extensible via extensions (now largely deprecated in favor of ComfyUI custom nodes).

### Current status (May 2026)

- **SDXL support**: native, full quality
- **FLUX support**: via community forks/extensions — not first-class
- **NSFW**: no built-in censorship filtering; relies on model-level alignment
- **Extensions ecosystem**: declining — most new development has moved to ComfyUI
- **Performance**: slower than Forge for equivalent hardware

### Why creators might still use it

- Familiar interface with the largest tutorial/YouTube ecosystem
- Extensions for specific workflows (e.g., regional prompting, XYZ plot)
- Quick single-image generation without learning node graphs

### Why creators are moving away

- **ComfyUI** offers superior workflow automation and reproducibility
- **Forge** offers better VRAM efficiency and speed
- Extension development has stalled; no equivalent to ComfyUI's node ecosystem
- No native FLUX support

## Workspace TODO

- Flesh out this page when a user specifically needs A1111 guidance
- Document key extensions still relevant for NSFW workflows
- Compare with Forge on specific workflows

## Snippets

> A1111 remains the most documented SD UI but is no longer the recommended primary interface for production uncensored workflows. ComfyUI (node-graph) and Forge (performance fork) have overtaken it for serious work.