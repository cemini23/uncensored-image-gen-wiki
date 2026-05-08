---
title: Forge (Inference UI)
type: entity
tags: [ui, inference-frontend, forge, fork, performance, sdxl, flux, open-source]
keywords: [Forge, A1111 fork, performance, VRAM optimization, SDXL, FLUX, speed, low-vram]
related:
  - entities/uis/comfyui.md
  - entities/uis/automatic1111.md
  - entities/models/pony-v6.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - sources/uncensored-image-generation-survey.md
  - entities/uis/invokeai.md
  - entities/uis/swarmui.md
maturity: stub
created: 2026-05-08
updated: 2026-05-08
---

## Relations

@entities/uis/comfyui.md
@entities/uis/automatic1111.md
@entities/models/pony-v6.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md

## Raw Concept

**Forge** — a performance-optimized fork of Automatic1111's SDXL WebUI. Focuses on VRAM efficiency and generation speed. GitHub: [lllyasviel/stable-diffusion-webui-forge](https://github.com/lllyasviel/stable-diffusion-webui-forge). The recommended A1111-based UI when performance matters more than workflow automation.

## Narrative

### What it is

Forge is the same A1111 codebase with aggressive optimization patches applied. Key improvements:

- **VRAM reduction**: ~20-30% less VRAM usage than stock A1111 via memory-efficient attention and offloading
- **Speed**: faster inference through architectural optimizations without changing output quality
- **SDXL + FLUX support**: better native support than upstream A1111, particularly for newer architectures
- **Extension compatibility**: most A1111 extensions work, but some break due to internal API changes

### When to choose Forge over ComfyUI

- You want a **simple tab-based interface** with better performance than A1111
- You're on a **lower VRAM card** (8-12 GB) and need the efficiency gains
- You don't need complex multi-pass node workflows
- You're already experienced with the A1111 ecosystem

### When to choose ComfyUI instead

- You need **multi-pass workflows** (generate → face-swap → upscale → detail)
- You want **workflow reproducibility** (.json exports)
- You're building **automated pipelines** (API integration, n8n orchestration)
- You need **FLUX-native workflow support** with adapter nodes

### Workspace TODO

- Add specific Forge performance benchmarks vs A1111 vs ComfyUI
- Document Forge-specific VRAM optimization settings
- Track Forge FLUX support maturity

## Snippets

> Forge is the performance-first choice among A1111-based UIs. Ideal for creators who want speed and lower VRAM usage without adopting node-based workflows.