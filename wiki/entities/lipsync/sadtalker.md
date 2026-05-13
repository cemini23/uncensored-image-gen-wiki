---
title: SadTalker (OpenTalker — single-image talking-head with 3DMM coefficients)
type: entity
tags: [lipsync, talking-head, single-image-animation, sadtalker, opentalker, 3dmm, expnet, cvpr-2023, photo-to-video]
keywords: [SadTalker, OpenTalker, 3DMM, ExpNet, PoseVAE, single-image talking head, photo-to-video, CVPR 2023, Tencent, Xi'an Jiaotong, talking portrait]
related:
  - concepts/persona-audio-stack.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/musetalk.md
  - entities/lipsync/wav2lip.md
  - entities/lipsync/liveportrait.md
  - concepts/video-identity-inheritance.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/lipsync/latentsync.md
@entities/lipsync/musetalk.md
@entities/lipsync/wav2lip.md
@entities/lipsync/liveportrait.md
@concepts/video-identity-inheritance.md

## Raw Concept

Page prompted by the W4 Tier 2 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 2 ("SadTalker — single-image avatar + head motion + lip sync — fastest for quick talking-head posts"); the canonical **photo-to-talking-video** pick (no source video required, just one portrait + audio). Previously no entity page.

## Narrative

### What it is

**SadTalker** is the CVPR 2023 paper (Wang et al., Xi'an Jiaotong University + Tencent AI Lab) and OpenTalker reference implementation. Unlike @entities/lipsync/latentsync.md / @entities/lipsync/musetalk.md / @entities/lipsync/wav2lip.md (which require a source **video**), SadTalker takes a single **static portrait image** + audio and synthesizes a talking-head video — including audio-driven head pose, expression, and lip sync. Architecture combines:

- **ExpNet** — audio → 3DMM expression coefficients
- **PoseVAE** — audio + identity → 3DMM head-pose trajectory
- **Face renderer** — 3DMM coefficients + source portrait → final video frames

### Key facts (May 2026)

- **License**: Apache 2.0 [NEEDS VERIFICATION 2026-05-13] — verify against current repo
- **Repo**: `github.com/OpenTalker/SadTalker`
- **Paper**: SadTalker (CVPR 2023, arXiv:2211.12194)
- **Input**: single portrait image + audio clip
- **Output**: 256×256 or 512×512 talking-head video
- **VRAM**: ~6-12 GB
- **Speed**: faster than diffusion-based lipsync (LatentSync); slower per-frame than MuseTalk real-time but doesn't need pre-rendered video
- **Distinctive features**:
  - **No source video needed** (unlike Wav2Lip / LatentSync / MuseTalk)
  - **Head pose generation** (head moves naturally, not just lips)
  - **3DMM-anchored** identity preservation across motion

### Positioning vs video-based lipsync

| Axis | SadTalker | Wav2Lip | LatentSync 1.6 | MuseTalk v1.5 |
|------|-----------|---------|----------------|---------------|
| Input | **Portrait image** + audio | Video + audio | Video + audio | Video + audio |
| Head motion | ✅ generated from audio | ❌ static (input video only) | ❌ from input | ❌ from input |
| Resolution | 256-512 | 96 face | 512 | 256 face |
| Identity drift | Moderate (3DMM anchor) | Low (preserves input frames) | Low (latent-space) | Low (inpaint only mouth) |
| Best for | **Photo-to-talking-video** from a single still | Sync-precision on existing footage | Final-pass quality | Real-time / batch |

### Persona pipeline integration

SadTalker fits the persona pipeline when you have a **portrait master image** but no source video. Two patterns:

```
Pattern A — quick talking-head from a still:
  ComfyUI persona portrait (single .png)
     ↓
  Fish-Speech S2 Pro voiceover (.wav)
     ↓
  SadTalker (portrait + .wav → talking-head .mp4 with generated head motion)
     ↓
  optional: LatentSync pass on output for sharper lip detail
     ↓
  FFmpeg final mux
```

```
Pattern B — first-frame seed for video gen:
  SadTalker quick talking-head from one portrait
     ↓
  use first frame as I2V seed for Wan 2.2 / HunyuanVideo 1.5
     ↓
  LatentSync final-pass for lip detail
```

### Operator notes

- **Identity stability**: SadTalker's 3DMM anchor maintains identity across head motion better than naive frame-by-frame approaches but slightly worse than fixed-input video methods (Wav2Lip preserves the input video's identity frames literally). Cross-reference @concepts/video-identity-inheritance.md.
- **Head-motion realism**: PoseVAE produces plausible but somewhat generic head sway — for hero-shot content, prefer real source video + LatentSync; for **bulk DM voice notes with a face**, SadTalker single-portrait flow is far cheaper.
- **Expression fidelity**: ExpNet handles broad emotion → expression mapping; subtle/specific emotion control is weaker than starting from real source video
- **Apple Silicon (MPS)**: workable [VERIFY 2026-05-13]

## Snippets

> "SadTalker — Single-image avatar + head motion + lip sync — fastest for quick talking-head posts."
[Source: @concepts/persona-audio-stack.md Layer 2 — other options table, retrieved 2026-05-13]

## Dead Ends

- **SadTalker for high-fidelity Fanvue/IG hero-shot**: 3DMM-rendered motion is plausible but recognizably synthetic — pair with LatentSync final-pass or start from real source video for premium-tier content.
- **SadTalker for high-emotion-specific delivery**: ExpNet generic emotion mapping is weaker than starting from real source-video performance + LatentSync lip-pass.
