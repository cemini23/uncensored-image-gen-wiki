---
title: "PersonaLive — real-time portrait animation for live AI avatars"
type: entity
tags: [persona-ops, live-streaming, portrait-animation, real-time, virtual-avatar]
keywords: [PersonaLive, GVCLab, portrait animation, live stream, virtual avatar, real-time, 24-7 stream]
related:
  - concepts/persona-ops-stack.md
  - concepts/video-identity-inheritance.md
  - entities/lipsync/musetalk.md
  - entities/models/openrouter-video.md
  - entities/uis/comfyui.md
maturity: validated
created: 2026-05-22
updated: 2026-06-05
phase_0_verdict: CONDITIONAL-GO
phase_0_date: 2026-06-05
cross-wiki-source: "@osint-wiki/sources/trading-posts-oil-polymarket-html-dex-sniping-2026-05-21.md"
provenance:
  stub: true
  ingested_from:
    - briefs/2026-05-21_k55-2-ridark-eth-image-gen-relevant-repos.md
---

## Relations

@concepts/persona-ops-stack.md @concepts/video-identity-inheritance.md @entities/lipsync/musetalk.md @entities/models/openrouter-video.md @entities/uis/comfyui.md

## Raw Concept

Phase-0 audit 2026-06-05 on `GVCLab/PersonaLive` ([Source: github.com/GVCLab/PersonaLive @ 2026-05-15]). Cross-wiki K55-2 origin from @ridark_eth list — **independent README verification supersedes list claims** for license, weights, and ComfyUI node.

**Author credibility warning:** @ridark_eth K52 fabrication incident — always verify against primary repo.

## Narrative

### Phase-0 audit [CONFIRMED 2026-06-05]

| Check | Result |
|-------|--------|
| Code license | **Apache-2.0** |
| Weights | HF `huaichang/PersonaLive` + ModelScope; SD-image-variations derivative chain |
| Stars / activity | 3.3k★; training code released 2026-05-15; CVPR 2026 |
| VRAM | **12 GB** streaming strategy for offline long video `[CONFIRMED README]`; live WebUI FPS on 4090 `[NEEDS VERIFICATION 2026-06-05]` |
| ComfyUI | **ComfyUI-PersonaLive** by okdalto — community node exists |
| NSFW / ToS | README **academic research only** + user liability disclaimer; platform live-stream ToS still operator risk |
| MPS | CUDA/PyCUDA/TensorRT path; **not Apple-Silicon-first** |

**Verdict: CONDITIONAL-GO** — adopt for **live-stream research track** after local WebUI latency test on operator GPU. Not a Wan-replacement for batch persona clips.

### Persona-ops fit

Sits at the intersection of:

- **Video identity inheritance** — needs a locked master portrait (FLUX + PuLID / LoRA stack) as the visual anchor → @concepts/video-identity-inheritance.md
- **Real-time lipsync** — likely pairs with MuseTalk-class latent inpainting for mouth sync on live audio → @entities/lipsync/musetalk.md (batch vs real-time tradeoff documented there)
- **Closed API video** — OpenRouter Kling/Wan paths are batch/async, not live-stream native → @entities/models/openrouter-video.md

## Snippets

> "PersonaLive, a real-time and streamable diffusion framework capable of generating infinite-length portrait animations."

[Source: github.com/GVCLab/PersonaLive README (retrieved 2026-06-05)]

## Dead Ends

None — build-track blocked on local latency benchmark + live-platform ToS review.
