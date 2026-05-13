---
title: MuseTalk (Tencent Lyra Lab real-time lipsync via latent-space inpainting)
type: entity
tags: [lipsync, latent-inpainting, tencent, lyra-lab, tencent-music, real-time, mit-license, whisper-tiny, musev, eastern-vanguard]
keywords: [MuseTalk, TMElyralab, Tencent Music Entertainment Lyra Lab, Lyra Lab, latent space inpainting, real-time lipsync, 30 FPS, Whisper-tiny, MuseV, virtual human, 256x256 face region, MIT license]
related:
  - concepts/persona-audio-stack.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/wav2lip.md
  - entities/lipsync/sadtalker.md
  - entities/lipsync/liveportrait.md
  - entities/persona-ops/fish-speech.md
  - entities/uis/comfyui.md
  - concepts/video-identity-inheritance.md
  - sources/persona-ops-stack-2026.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/lipsync/latentsync.md
@entities/lipsync/wav2lip.md
@entities/lipsync/sadtalker.md
@entities/lipsync/liveportrait.md
@entities/persona-ops/fish-speech.md
@entities/uis/comfyui.md
@concepts/video-identity-inheritance.md
@sources/persona-ops-stack-2026.md

## Raw Concept

Page prompted by the W4 voice/audio-gen backfill (scope expansion 2026-05-13). Named in @concepts/persona-audio-stack.md as the speed alternative to @entities/lipsync/latentsync.md (real-time vs quality-first); previously no entity page.

## Narrative

### What it is

**MuseTalk** is Tencent Music Entertainment Lyra Lab's real-time lipsync model (TMElyralab GitHub org). Despite using a Stable-Diffusion-class UNet architecture, it is **NOT a diffusion model** — it operates by **single-step latent-space inpainting** of the lip region, which is what makes 30+ FPS real-time inference possible on consumer GPUs. Pairs with **MuseV** (sibling repo) for full text/image-to-video → talking-head virtual-human pipeline.

### Key facts (May 2026)

- **License**: MIT [CONFIRMED — hitpaw blog; verify against main repo on next ingest]
- **Architecture**: frozen SD VAE encodes face frames + frozen Whisper-tiny encodes audio → UNet inpaints lip region in latent space (single step, not iterative diffusion)
- **Speed**: 30+ FPS on consumer GPU (RTX 30/40-class) — real-time capable
- **Resolution**: 256×256 face region in v1.0 (theoretical bound not yet hit per upstream); v1.5 released with multilingual + quality improvements
- **Audio encoder**: Whisper-tiny (small footprint, multilingual)
- **Dependencies**: OpenMMLab (more complex setup than LatentSync)
- **Pairing**: MuseV (text/image/pose-to-video) → MuseTalk (lipsync) is the canonical Tencent virtual-human stack
- **Real-time chat use**: only UNet + VAE decoder run online (face detection is offline preprocessing)

### Positioning vs LatentSync / Wav2Lip

| Axis | MuseTalk v1.5 | LatentSync 1.6 | Wav2Lip |
|------|---------------|----------------|---------|
| Architecture | Latent-space inpainting (1-step) | Latent diffusion (iterative) | GAN |
| Real-time | ✅ 30+ FPS | ❌ batch | ✅ |
| Visual quality | High (256×256 face) | Highest (512×512) | Lower |
| Setup complexity | Higher (OpenMMLab deps) | Moderate | Lowest, widest tutorials |
| Best for | Live avatars, batch throughput, real-time DM | Final-pass posts, Fanvue videos | Quick prototyping, sync-accuracy on existing footage |

### Persona pipeline integration

For **real-time DM voice-note → talking-head video** flows:
```
SillyTavern persona response (text)
   ↓
Fish-Speech S2 Pro / CosyVoice2 (text → audio, ~150ms)
   ↓
Pre-generated persona face frames (cached from MuseV)
   ↓
MuseTalk (face frames + audio → talking-head video, 30 FPS)
   ↓
n8n → DM channel
```

For **batch high-throughput Reels/TikTok content**: pre-generate audio + face track, batch through MuseTalk overnight. See @concepts/persona-audio-stack.md.

### Operator notes

- **Pre-processing required**: face detection (offline) before real-time chat — generate face frames + audio offline, then run online lipsync
- **MuseV companion repo** is the upstream "talking-head video from photo" generator that MuseTalk lipsyncs
- **MPS / Apple Silicon viability**: not officially supported [NEEDS VERIFICATION 2026-05-13]
- **Resolution ceiling at 256×256** is the main quality limit vs LatentSync 1.6 — for final-pass Fanvue/IG output, post-upscale or switch to LatentSync

## Snippets

> "Note that although we use a very similar architecture as Stable Diffusion, MuseTalk is distinct in that it is NOT a diffusion model. Instead, MuseTalk operates by inpainting in the latent space with a single step."
[Source: github.com/TMElyralab/MuseTalk (retrieved 2026-05-13)]

> "If you want to launch online video chats, you are suggested to generate videos using MuseV and apply necessary pre-processing such as face detection in advance. During online chatting, only UNet and the VAE decoder are involved, which makes MuseTalk real-time."
[Source: huggingface.co/TMElyralab/MuseTalk (retrieved 2026-05-13)]

### Install

```bash
git clone https://github.com/TMElyralab/MuseTalk.git
cd MuseTalk && pip install -r requirements.txt
# weights via HF
huggingface-cli download TMElyralab/MuseTalk --local-dir models/
```

## Dead Ends

- **MuseTalk for highest-resolution final posts**: 256×256 face region caps quality vs LatentSync 1.6 (512×512). Use LatentSync for hero-shot Reels.
