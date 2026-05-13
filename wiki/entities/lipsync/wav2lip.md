---
title: Wav2Lip (Rudrabha — GAN-based sync-accuracy lipsync baseline)
type: entity
tags: [lipsync, gan, wav2lip, syncnet, rudrabha, iiit-h, lipsync-baseline, dubbing, research-restricted]
keywords: [Wav2Lip, Rudrabha Mukhopadhyay, IIIT-H, SyncNet, GAN-based lipsync, 96x96 face, easy-Wav2Lip, Wav2Lip-HD, CodeFormer, dubbing existing footage]
related:
  - concepts/persona-audio-stack.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/musetalk.md
  - entities/lipsync/sadtalker.md
  - entities/lipsync/liveportrait.md
  - entities/uis/comfyui.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/lipsync/latentsync.md
@entities/lipsync/musetalk.md
@entities/lipsync/sadtalker.md
@entities/lipsync/liveportrait.md
@entities/uis/comfyui.md

## Raw Concept

Page prompted by the W4 Tier 2 voice/audio backfill (2026-05-13). Named in @concepts/persona-audio-stack.md Layer 2 ("accuracy baseline: Wav2Lip — GAN-based, industry staple for sync accuracy"); the oldest of the three canonical lipsync models and the most widely tutorial-covered. Previously no entity page.

## Narrative

### What it is

**Wav2Lip** is the 2020 IIIT-H paper (Prajwal et al., ACM MM 2020) and reference implementation by Rudrabha Mukhopadhyay that established the **SyncNet-supervised GAN** approach to lipsync. The model takes a video + audio clip and adjusts the mouth region frame-by-frame to match the audio. **Sync accuracy** is its strongest axis — beats both @entities/lipsync/latentsync.md and @entities/lipsync/musetalk.md on raw sync-precision metrics for dubbing existing footage, though visual quality is lower (96×96 face region, GAN artifacts).

### Key facts (May 2026)

- **License**: original repo is **research-use-only** for the pre-trained weights (custom restrictive license — "for research and educational purposes only, with explicit non-commercial clause") [CONFIRMED via original repo README]; **community forks** may relicense differently — verify per-fork
- **Original repo**: `github.com/Rudrabha/Wav2Lip`
- **Architecture**: encoder-decoder GAN with SyncNet supervision (audio → adjusted mouth pixels)
- **Resolution**: **96×96 face region** (low; main visual-quality limit)
- **Variants**:
  - **Easy-Wav2Lip** — community-packaged installer, lower friction
  - **Wav2Lip-HD** — adds CodeFormer / GFPGAN face restoration as post-processing
  - **Wav2Lip-288** — higher-resolution variant (still legacy quality)
- **VRAM**: ~4-8 GB (lowest of any lipsync pick)
- **Speed**: fast on consumer GPU
- **Strength**: sync accuracy (SyncNet-supervised); easiest setup; widest tutorial coverage

### Positioning vs LatentSync / MuseTalk

| Axis | Wav2Lip | LatentSync 1.6 | MuseTalk v1.5 |
|------|---------|----------------|---------------|
| Architecture | **GAN** + SyncNet | Latent diffusion + SD-VAE + SyncNet | Latent inpainting (1-step) |
| Visual quality | Lower (96×96, GAN artifacts) | **Highest** (512×512) | High (256×256) |
| Sync accuracy | **Highest** | High | High |
| Setup complexity | **Lowest** | Moderate | Higher (OpenMMLab) |
| VRAM | ~4-8 GB | 12-16 GB | 8-12 GB |
| Speed | Fast | Quality-first (batch) | 30+ FPS real-time |
| **License (weights)** | **Research-only** ❌ | Apache 2.0 (VERIFY) | MIT |
| Best for | Dubbing existing footage where sync precision is critical | Final-pass talking-head Reels | Real-time avatars, batch throughput |

### Operator notes

- **License is the killer constraint**: the original Wav2Lip weights' research-only license means commercial / monetized persona content **cannot legally use Wav2Lip outputs** without rolling your own training run from clean data. This is the single biggest reason @entities/lipsync/latentsync.md and @entities/lipsync/musetalk.md displaced Wav2Lip as primary recommendations in 2025-2026.
- **Where it still wins**: research, prototyping, sync-precision benchmarking, low-VRAM environments where MuseTalk's OpenMMLab dependencies are too heavy. Some forks (verify license per-fork) may be commercial-clean.
- **Post-processing pipeline**: Wav2Lip + CodeFormer / GFPGAN face restoration narrows the visual-quality gap vs LatentSync, but doesn't close it — the 96×96 base mouth region remains a hard ceiling
- **Apple Silicon (MPS)**: workable on M-series via PyTorch MPS backend; faster than LatentSync on the same hardware since GAN inference is single-pass vs iterative diffusion

## Snippets

> "GAN-based, industry staple for sync accuracy. Older architecture, visual quality lower than LatentSync/MuseTalk. Best for: dubbing existing footage where lip-sync precision matters more than visual fidelity. Widest community, easiest setup, most tutorials."
[Source: @concepts/persona-audio-stack.md Layer 2 — accuracy baseline section, retrieved 2026-05-13]

## Dead Ends

- **Wav2Lip for monetized persona content using original-repo weights**: research-only license. Use @entities/lipsync/latentsync.md (final-pass quality) or @entities/lipsync/musetalk.md (real-time) for revenue-generating content. Some community forks may relicense — verify per-fork before assuming.
- **Wav2Lip for hero-shot Fanvue/IG quality**: 96×96 face region is the visual-quality ceiling. Post-process face-restore narrows but doesn't close the gap.
