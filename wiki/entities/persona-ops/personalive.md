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
maturity: draft
created: 2026-05-22
updated: 2026-05-22
cross-wiki-source: "@osint-wiki/sources/trading-posts-oil-polymarket-html-dex-sniping-2026-05-21.md"
provenance:
  stub: true
  ingested_from:
    - briefs/2026-05-21_k55-2-ridark-eth-image-gen-relevant-repos.md
---

## Relations

@concepts/persona-ops-stack.md @concepts/video-identity-inheritance.md @entities/lipsync/musetalk.md @entities/models/openrouter-video.md

## Raw Concept

Cross-wiki K55-2 tool-eval item from @ridark_eth's unaudited "50 GitHub Repos" list (Post 2, 2026-05-21). `GVCLab/PersonaLive` — portrait image animation for **real-time** live streams (24/7 virtual AI avatars without physical presence). Highest-novelty candidate in the image-gen subset; **no auto-adoption** until Phase-0 audit.

**Author credibility warning:** @ridark_eth has a documented K52 incident of fabricating capability details on a real repo — verify claims independently before build-track adoption.

## Narrative

### Claimed surface area [TENTATIVE — single-source, unaudited list]

- Animates a **static portrait** into a live-stream-ready avatar
- Targets **real-time** throughput (distinct from batch I2V paths like Wan 2.2 or Kling 3.0)
- Positioned for **24/7** unattended streams with a virtual persona

### Persona-ops fit

Sits at the intersection of:

- **Video identity inheritance** — needs a locked master portrait (FLUX + PuLID / LoRA stack) as the visual anchor → @concepts/video-identity-inheritance.md
- **Real-time lipsync** — likely pairs with MuseTalk-class latent inpainting for mouth sync on live audio → @entities/lipsync/musetalk.md (batch vs real-time tradeoff documented there)
- **Closed API video** — OpenRouter Kling/Wan paths are batch/async, not live-stream native → @entities/models/openrouter-video.md

### Phase-0 checklist (before adoption)

- [ ] License terms (code + weights) — commercial use for monetized personas?
- [ ] VRAM / latency on consumer GPU (4090 / Mac Studio)?
- [ ] Identity drift across long sessions?
- [ ] NSFW posture vs platform ToS for live surfaces (Twitch, YouTube, Fanvue live)?
- [ ] Reproducible install on ComfyUI vs standalone repo?

## Dead Ends

None yet — stub only; repo not audited.
