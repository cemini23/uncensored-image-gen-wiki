---
title: LatentSync (ByteDance audio-conditioned latent diffusion lipsync)
type: entity
tags: [lipsync, latent-diffusion, bytedance, audio-conditioned, syncnet, stable-diffusion-vae, whisper, eastern-vanguard]
keywords: [LatentSync, LatentSync-1.6, ByteDance, audio-conditioned latent diffusion, SyncNet supervision, Whisper audio embedding, end-to-end lipsync, 512x512, no intermediate motion representation, ComfyUI-LatentSyncWrapper, arxiv 2412.09262]
related:
  - concepts/persona-audio-stack.md
  - entities/lipsync/musetalk.md
  - entities/lipsync/wav2lip.md
  - entities/lipsync/sadtalker.md
  - entities/lipsync/liveportrait.md
  - entities/persona-ops/fish-speech.md
  - entities/uis/comfyui.md
  - concepts/video-identity-inheritance.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - sources/persona-ops-stack-2026.md
  - concepts/sync-audio-video-customization.md
  - sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
  - sources/arxiv-eventspeech-neuromorphic-tts-2605-26672.md
  - concepts/mllm-video-translation.md
  - sources/arxiv-2604-11283-mllm-video-translation-survey.md
maturity: draft
created: 2026-05-13
updated: 2026-06-03
---

## Relations

@concepts/persona-audio-stack.md
@entities/lipsync/musetalk.md
@entities/lipsync/wav2lip.md
@entities/lipsync/sadtalker.md
@entities/lipsync/liveportrait.md
@entities/persona-ops/fish-speech.md
@entities/uis/comfyui.md
@concepts/video-identity-inheritance.md
@entities/models/wan-2-2.md
@entities/models/hunyuanvideo-1-5.md
@sources/persona-ops-stack-2026.md

## Raw Concept

Page prompted by the W4 voice/audio-gen backfill (scope expansion 2026-05-13). Named in @concepts/persona-audio-stack.md as the primary lipsync recommendation (best visual quality among open-source lipsync as of May 2026); previously no entity page.

## Narrative

### What it is

**LatentSync** is ByteDance's end-to-end audio-conditioned **latent diffusion** lipsync framework — the first lipsync system to operate directly in Stable Diffusion's latent space without intermediate 3D / 2D landmark representation. Published as arXiv:2412.09262 (Li et al., Dec 2024), open-sourced at `github.com/bytedance/LatentSync`. Outperforms prior SOTA on HDTF and VoxCeleb2 benchmarks.

### Key facts (May 2026)

- **License**: Apache 2.0 (verified on ComfyUI wrapper; main repo license to confirm) [NEEDS VERIFICATION 2026-05-13]
- **Latest release**: LatentSync 1.6 — trained at **512×512** to fix blurriness reported in 1.5
- **Weights**: `ByteDance/LatentSync-1.6` on HuggingFace (~5 GB `latentsync_unet.pt` + ~1.6 GB `stable_syncnet.pt`)
- **Architecture**: SD-VAE encodes face frames → Whisper-tiny encodes audio → cross-attention conditions a U-Net diffusion model → SyncNet supervision in pixel space (key innovation)
- **Why latent space**: leverages Stable Diffusion's prior; produces sharp mouth movements without pixel-space compute
- **Loss design**: LPIPS for visual quality + SyncNet supervision against decoded VAE output (closes the latent-to-pixel sync gap)
- **VRAM**: 12-16 GB typical for inference
- **ComfyUI**: `ShmuelRonen/ComfyUI-LatentSyncWrapper` (unofficial; Windows + WSL 2.0 support)
- **Speed**: quality-first, not real-time — batch-processing posture

### Positioning vs MuseTalk / Wav2Lip

| Axis | LatentSync 1.6 | MuseTalk | Wav2Lip |
|------|----------------|----------|---------|
| Architecture | Latent diffusion + SD VAE + SyncNet | Latent-space inpainting (NOT diffusion) | GAN |
| Speed | Quality-first (not real-time) | 30+ FPS real-time | Older but fast |
| Visual quality (May 2026) | Best | Strong, faster | Lower (older) |
| Resolution | 512×512 | 256×256 face region | low |
| Best for | Final-pass talking-head Reels, Fanvue videos | Real-time avatars, batch throughput | Dubbing existing footage (sync precision) |

### Persona pipeline integration

```
ComfyUI video gen (Wan 2.2 / HunyuanVideo 1.5 → mp4)
         ↓
Fish-Speech S2 Pro voiceover (text → .wav)
         ↓
LatentSync (video + voice → lipsynced .mp4)
         ↓
Stable Audio Open ambient overlay → FFmpeg mux → final .mp4
```

See @concepts/persona-audio-stack.md for the full audio pipeline diagram.

### Operator notes

- **MPS / Apple Silicon viability**: not officially supported [NEEDS VERIFICATION 2026-05-13]; cloud burst (RunPod 4090) is the standard pattern
- **Frame jitter** that plagued pre-diffusion lipsync is reported solved
- **Photorealistic portrait images** in the LatentSync paper are from licensed models — the technique itself is identity-agnostic

## Snippets

> "We present LatentSync, an end-to-end lip-sync method based on audio-conditioned latent diffusion models without any intermediate motion representation, diverging from previous diffusion-based lip-sync methods based on pixel-space diffusion or two-stage generation."
[Source: arXiv:2412.09262 abstract (retrieved 2026-05-13)]

> "Our framework can leverage the powerful capabilities of Stable Diffusion to directly model complex audio-visual correlations. LatentSync uses the Whisper to convert melspectrogram into audio embeddings, which are then integrated into the U-Net via cross-attention layers."
[Source: github.com/bytedance/LatentSync (retrieved 2026-05-13)]

### Install

```bash
git clone https://github.com/bytedance/LatentSync.git
cd LatentSync && pip install -r requirements.txt
# weights (~7 GB total)
huggingface-cli download ByteDance/LatentSync-1.6 --local-dir checkpoints
```

## Dead Ends

- **Real-time use case**: LatentSync's diffusion-based inference is too slow for sub-100ms latency. Use MuseTalk for real-time avatars.
- **Pre-1.6 versions (1.5)**: blurriness issues — upgrade to 1.6.
