---
title: AnyTalk — 3D speech animation for arbitrary blendshape characters
type: entity
tags: [lipsync, 3d, blendshape, video-diffusion, watch]
keywords: [AnyTalk, AnyTalkRT, CsF, Character-specific Fine-tuning, KAIST, speech animation]
related:
  - sources/arxiv-2608-16143-anytalk.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/musetalk.md
  - entities/lipsync/liveportrait.md
  - concepts/persona-audio-stack.md
  - concepts/video-identity-inheritance.md
  - sweeps/2026-08-18-daily.md
maturity: draft
created: 2026-08-18
updated: 2026-08-18
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-16143-anytalk.md @entities/lipsync/latentsync.md @entities/lipsync/musetalk.md @entities/lipsync/liveportrait.md @concepts/persona-audio-stack.md @concepts/video-identity-inheritance.md @sweeps/2026-08-18-daily.md

## Raw Concept

Phase-0 from arXiv:2608.16143. 3D blendshape speech animation from a video-diffusion Character-specific Fine-tune (CsF) plus blendshape uplift. No character animation data.

## Narrative

| Field | Value |
|-------|-------|
| Org | KAIST / Sungshin (Yun, Yoon, Jung, Yoo, Lee, Noh) |
| Input | Arbitrary 3D character with blendshapes + speech audio |
| Path | CsF on video diffusion (stills + zeroed audio) → talking-head video → blendshape optimization |
| Real-time | AnyTalkRT distill (~1,600 clips): 9.09 ms/frame ≈ 110 FPS vs AnyTalk 3.12 s/frame |
| Data | **No** character-specific animation data |
| Project | https://serin-yoon.github.io/projects/anytalk/ |
| Code | "publicly available" in PDF — **no GitHub URL**; Serin-Yoon has no matching repo |
| Paper license | CC-BY-NC-SA 4.0 |
| Phase-0 | **WATCH HIGH** lipsync/persona |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Vs the 2D lipsync stack already in production:

| System | Representation | Needs | Role |
|--------|----------------|-------|------|
| **LatentSync** | 2D SD-VAE latent + Whisper + SyncNet | Source video | Quality-first talking-head Reels |
| **MuseTalk** | 2D latent inpaint (not diffusion) | Source video | Real-time DM throughput |
| **LivePortrait** | Implicit keypoints | Still portrait | Photo-to-talking-video |
| **AnyTalk** | 3D blendshapes via video-diffusion CsF | Rigged mesh, **no** anim data | Game/VR 3D character |

Image-gen Layer-2 stays LatentSync. AnyTalk is the watch if a persona ever ships a real-time 3D mesh. Game-dev brief filed for the blendshape/CsF path.

## Snippets

> "AnyTalk can perform audio-driven 3D facial animation using an arbitrary character with blendshapes, without requiring any animation data to train."

[Source: arxiv-2608.16143, Fig. 1 caption]
