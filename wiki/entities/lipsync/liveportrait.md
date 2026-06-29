---
title: "LivePortrait (Kuaishou KwaiVGI — premium single-image portrait animation)"
type: entity
tags: [lipsync, portrait-animation, single-image, liveportrait, kuaishou, kwaivgi, stitching-retargeting, premium-quality, implicit-keypoint]
keywords: [LivePortrait, Kuaishou, KwaiVGI, implicit keypoint, stitching, retargeting, portrait animation, single-image, photo-to-video, MIT, ECCV 2024]
related:
  - concepts/persona-audio-stack.md
  - entities/lipsync/sadtalker.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/musetalk.md
  - entities/lipsync/wav2lip.md
  - concepts/video-identity-inheritance.md
  - sources/arxiv-2606-13872-avatar-v-video-reference-avatar.md
  - concepts/video-reference-avatar-generation.md
  - concepts/motion-shape-disentangled-human-animation.md
maturity: draft
created: 2026-05-13
updated: 2026-06-29
---

## Relations

@concepts/persona-audio-stack.md
@entities/lipsync/sadtalker.md
@entities/lipsync/latentsync.md
@entities/lipsync/musetalk.md
@entities/lipsync/wav2lip.md
@concepts/video-identity-inheritance.md

## Raw Concept

Page prompted by the W4 Tier 3 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 2 ("LivePortrait — Premium single-image quality, static portrait animation") and decision matrix ("Quick talking-head from one image | SadTalker or LivePortrait"). Sibling of @entities/lipsync/sadtalker.md in the single-image-input family; positioned as the **premium-quality** option at the cost of slower inference.

## Narrative

### What it is

**LivePortrait** is Kuaishou's KwaiVGI portrait-animation model (ECCV 2024, released mid-2024) — an **implicit-keypoint-based** framework that animates a single source portrait from either driving audio or driving video. Distinguishing features vs SadTalker:

- **Stitching module** — preserves background and unchanged regions; output integrates cleanly into existing scenes
- **Retargeting modules** — independent control of eye + mouth motion, allowing fine-grained expression dial-in after the initial animation pass
- **Higher visual fidelity** — better identity preservation under large pose/expression deltas

Used widely in mid-2024–2025 for "still-photo-to-talking" social content and as the open analog to Runway's portrait-animation product tier.

### Key facts (May 2026)

- **License**: MIT [NEEDS VERIFICATION 2026-05-13] — verify against `KwaiVGI/LivePortrait` repo
- **Repo**: `github.com/KwaiVGI/LivePortrait`
- **Paper**: LivePortrait (Guo et al., ECCV 2024, arXiv:2407.03168)
- **Input**: single portrait image + driving (video OR audio→derived motion)
- **Output**: 512×512 (or higher with upscale chain)
- **VRAM**: ~10-16 GB inference
- **Speed**: slower than SadTalker; not real-time on consumer GPU but acceptable batch
- **Distinctive features**:
  - **Stitching** — composites animated face back into the original frame without seam artifacts
  - **Retargeting** — separate eye-open / mouth-open dial post-animation
  - **Cross-identity transfer** — drive portrait A's motion onto portrait B
- **Driving audio**: not native — requires an audio→keypoint adapter (community workflows wire this up via mouth-only driving from TTS)

### Positioning vs single-image / video-based lipsync

| Axis | LivePortrait | SadTalker | LatentSync 1.6 | Wav2Lip |
|------|--------------|-----------|----------------|---------|
| Input | **Portrait image** (+ driving video or derived motion) | Portrait image + audio | Video + audio | Video + audio |
| Resolution | **512+** | 256-512 | 512 | 96 face |
| Quality (identity + motion) | **Top among single-image** | Good | Top (video-based) | Good but low-res |
| Fine control | **Eye + mouth retargeting** | Limited | Limited | None |
| Stitching back to scene | **Yes (native)** | No (head-crop output) | N/A (video already framed) | N/A |
| Audio-driven | Via adapter | Native | Native | Native |
| Speed | Slower | Fast | Medium | Fast |
| **Best for** | **Premium single-image hero shots, IG/Fanvue still-to-motion** | Bulk talking-head from stills | Hero-shot lipsync on video | Sync precision on existing footage |

### Persona pipeline integration

Two patterns where LivePortrait wins over SadTalker:

```
Pattern A — premium photo-to-talking from a hero portrait:
  ComfyUI persona portrait (single .png, high-fidelity)
     ↓
  Fish-Speech S2 Pro voiceover (.wav)
     ↓
  Audio→keypoint adapter (or driving-video reference)
     ↓
  LivePortrait (portrait + motion → animated talking 512+ video)
     ↓
  FFmpeg mux + final upscale
```

```
Pattern B — driving-video transfer for identity-coherent series:
  Real-actor source video (operator-owned)
     ↓
  Persona portrait (single still)
     ↓
  LivePortrait (drive portrait B with motion of video A)
     ↓
  Consistent persona across N clips driven from one operator performance
```

### Operator notes

- **Quality vs throughput**: for **bulk** DM-tier talking-heads, SadTalker is the right cost point; for **hero shots / Fanvue landing pages / paid promo reels**, LivePortrait quality justifies the slower inference.
- **Cross-identity transfer raises hygiene concerns**: driving portrait B from real-person video A is voice-cloning's video twin — apply the same operator-owned-source discipline (@concepts/persona-legal-landscape.md).
- **Eye / mouth retargeting**: dial these post-animation to fix dead-eye look or close-mouth artifacts common to single-image methods. SadTalker has no equivalent surface.
- **Audio-driven workflow**: requires audio→motion adapter — community ComfyUI nodes exist but maturity varies [VERIFY 2026-05-13].
- **Apple Silicon (MPS)**: workable but slow [VERIFY 2026-05-13]
- **Cross-reference**: @concepts/video-identity-inheritance.md — LivePortrait's identity preservation is among the strongest in the single-image tier.

## Snippets

> "LivePortrait — Premium single-image quality, static portrait animation."
[Source: @concepts/persona-audio-stack.md Layer 2 — other options table, retrieved 2026-05-13]

> "Quick talking-head from one image | SadTalker or LivePortrait."
[Source: @concepts/persona-audio-stack.md Layer 2 — lipsync decision matrix, retrieved 2026-05-13]

## Dead Ends

- **LivePortrait for real-time bulk DM voice notes**: slower than SadTalker; for high-throughput / low-fidelity content SadTalker or Wav2Lip is the right cost point.
- **LivePortrait as a pure audio-driven lipsync without adapter**: native input is driving video; audio path requires an audio→keypoint conversion (community adapters exist but quality + maturity varies).
- **Cross-identity driving from non-operator-owned source video**: same right-of-publicity exposure as voice cloning (Vacker-class precedent). Operator-owned driving footage only.
