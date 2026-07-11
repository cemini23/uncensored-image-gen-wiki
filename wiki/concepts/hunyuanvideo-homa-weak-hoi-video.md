---
title: HunyuanVideo-HOMA weak HOI video generation
type: concept
tags: [concept, video-generation, human-object-interaction, hunyuanvideo, persona-ops]
keywords: [HOMA, HOI, weak motion control, object trajectory, product demo, persona video, prop interaction, Tencent]
related:
  - sources/arxiv-2506-08797-hunyuanvideo-homa.md
  - entities/models/hunyuanvideo-1-5.md
  - concepts/video-identity-inheritance.md
  - concepts/seam-stitching-strategies.md
  - concepts/persona-content-cadence.md
  - entities/lipsync/latentsync.md
  - entities/models/wan-2-2.md
  - entities/uis/comfyui.md
  - sweeps/2026-07-11-daily.md
maturity: draft
created: 2026-07-11
updated: 2026-07-11
---

## Relations

@sources/arxiv-2506-08797-hunyuanvideo-homa.md @entities/models/hunyuanvideo-1-5.md @concepts/video-identity-inheritance.md @concepts/seam-stitching-strategies.md @concepts/persona-content-cadence.md @entities/lipsync/latentsync.md @entities/models/wan-2-2.md @entities/uis/comfyui.md

## Raw Concept

Ingest 2026-07-11 from Tencent Hunyuan **HOMA** paper — weakly supervised human–object interaction video on HunyuanVideo backbone.

## Narrative

**Problem:** Persona video pipelines excel at talking-head / pose-driven motion but struggle when the character must **hold, present, or manipulate a specific object** (merch, drink, phone) without per-object finetuning or mocap.

**HOMA pattern:** Feed **human image + object image + sparse pose + trajectory dots** into a HunyuanVideo-derived MMDiT with a lightweight HOI adapter. Weak control reduces dependency on curated motion capture vs AnchorCrafter-style strong supervision.

### Persona-ops fit

| Use case | Fit |
|----------|-----|
| Product / affiliate demo Reels | **High** — single object photo + persona still → interaction clip |
| Talking-head DMs | **Low** — use LatentSync / EchoMimic lane instead |
| Long-form narrative | **Medium** — 5s native; latent overlap stitching per MimicMotion-style extension |

### Adoption posture (2026-07-11)

**WATCH** — await Tencent open weights + ComfyUI node. Do not plan cloud budget around 48×96GB training recipe. When released, smoke-test object consistency (Object-CLIP proxy: visual prop match) on one persona + one merch still before batch content.

### Stack position

```
Persona still (PuLID + LoRA) → optional HOMA clip (prop interaction)
                             → LatentSync mux if audio-driven
                             → seam-stitch if chaining segments
```

## Snippets

> "Finally, HunyuanVideo-HOMA demonstrates versatility in text-conditioned generation and interactive object manipulation, supported by a user-friendly demo interface."

[Source: arxiv-2506.08797 abstract]
