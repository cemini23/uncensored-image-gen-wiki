---
title: Foley-Omni (Video Rebirth)
type: entity
tags: [model, audio, foley, video-to-sound, unified-generation, sfx]
keywords: [Foley-Omni, V2ST, video soundtrack, speech SFX music, unified audio, Video Rebirth, V2ST-Bench]
related:
  - sources/arxiv-2606-03672-foley-omni.md
  - concepts/persona-audio-stack.md
  - entities/models/ltx-2.md
  - entities/sfx-models/stable-audio-open.md
  - sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
maturity: draft
created: 2026-06-03
updated: 2026-06-05
phase_0_verdict: NO-GO
phase_0_date: 2026-06-05
---

## Relations

@sources/arxiv-2606-03672-foley-omni.md @concepts/persona-audio-stack.md @entities/models/ltx-2.md @entities/sfx-models/stable-audio-open.md

## Raw Concept

Entity stub from K95 ingest of arXiv:2606.03672 — unified multimodal audio model for task-level synthesis through full **video-to-soundtrack (V2ST)** generation.

## Narrative

**Foley-Omni** jointly generates **speech, sound effects, and music** for a input video in one shared latent process — beyond task-level unification (AudioX-style) where each call covers one domain.

| Capability | Notes |
|------------|-------|
| Task-level TTA/TTS/TTM/V2A | Competitive with specialist systems per paper |
| Mixed V2ST | Joint speech + SFX + music with temporal alignment |
| V2ST-Bench | Paper-introduced holistic evaluation benchmark |

From **Video Rebirth** + academic collaborators. Competes conceptually with closed **Veo 3** and open **LTX-2** joint A/V — but audio-centric unification.

**Build-track status:** Phase-0 (2026-06-05) — **no public GitHub or HF weights**. Keep cascaded stack in @concepts/persona-audio-stack.md.

## Dead Ends

No open weights/code at audit date — revisit when Video Rebirth ships release.
