---
title: Stable Audio Open 1.0 (Stability AI text-to-audio for SFX, foley, short loops)
type: entity
tags: [sfx-generation, foley, text-to-audio, stable-audio, stability-ai, latent-diffusion, t5-encoder, cc-licensed-training, stability-community-license]
keywords: [Stable Audio Open, Stable Audio Open 1.0, Stability AI Community License, 47 seconds, 44.1kHz stereo, latent diffusion, T5 conditioning, 1.21B parameters, CC0 CC-BY CC-Sampling+ training data, 1024 latent tokens, foley, sound effects, ambient, drum beats]
related:
  - concepts/persona-audio-stack.md
  - entities/music-models/ace-step.md
  - entities/music-models/musicgen.md
  - entities/sfx-models/audioldm.md
  - entities/sfx-models/tango-2.md
  - entities/sfx-models/audio-omni.md
  - entities/voice-models/bark.md
  - sources/persona-ops-stack-2026.md
  - entities/models/foley-omni.md
  - sources/arxiv-2606-03672-foley-omni.md
  - sources/arxiv-2606-14049-foleygenex-unified-vta.md
  - concepts/unified-controllable-video-to-audio.md
  - entities/models/foleygenex.md
  - concepts/unified-audio-text-llm-no-text-regression.md
  - sources/arxiv-2607-05196-nemotron-audex-unified-audio-intelligence.md
  - entities/voice-models/nemotron-audex.md
  - sweeps/2026-07-12-daily.md
maturity: draft
created: 2026-05-13
updated: 2026-07-12
---

## Relations

@concepts/persona-audio-stack.md
@entities/music-models/ace-step.md
@entities/music-models/musicgen.md
@entities/sfx-models/audioldm.md
@entities/sfx-models/tango-2.md
@entities/sfx-models/audio-omni.md @entities/voice-models/bark.md
@sources/persona-ops-stack-2026.md

## Raw Concept

Page prompted by the W4 voice/audio-gen backfill (scope expansion 2026-05-13). Named in @concepts/persona-audio-stack.md as the primary recommendation for **both** sound design and short-form music loops (Layer 3 + Layer 4 overlap); previously no entity page.

## Narrative

### What it is

**Stable Audio Open 1.0** is Stability AI's open-weight text-to-audio model. 1.21B-parameter latent diffusion architecture with **T5-based text conditioning**. Generates **up to 47 seconds of stereo audio at 44.1 kHz** from a text prompt. Sibling/companion to the closed commercial Stable Audio service (which produces full 3-minute tracks). Trained exclusively on **Creative Commons-licensed data** (~7,300 hours of CC0 / CC-BY / CC-Sampling+ audio) — explicit scientific-transparency posture, no proprietary dataset opacity.

### Key facts (May 2026)

- **License**: **Stability AI Community License** [CONFIRMED]
  - Research + non-commercial: free
  - Commercial use under **$1M ARR**: free
  - Commercial use over $1M ARR: requires Enterprise License
- **Size**: ~1.21B parameters
- **Output**: variable length up to **47 seconds**, stereo, 44.1 kHz
- **Architecture**: DiT (transformer-component latent diffusion) + T5 text encoder, trained on 1,024-latent-token sequences (≈47s of audio)
- **HF**: `stabilityai/stable-audio-open-1.0`
- **vLLM-Omni support**: yes (via `vllm-recipes`)
- **Training transparency**: full attribution to source recordings; CC-licensed only
- **Strengths**: sound effects, field recordings, drum beats, instrument riffs, ambient, production elements
- **Weaknesses**: modest for instrumental music generation (use ACE-Step or commercial Stable Audio service for full tracks)

### Positioning — dual-use foley + short music

Stable Audio Open is the canonical pick for **both Layer 3 (music background, short clips) and Layer 4 (SFX/foley)** in @concepts/persona-audio-stack.md. The 47s ceiling + sound-design strength match short-form social-content audio needs perfectly:

| Use case | Pick |
|----------|------|
| Reel/TikTok background loop (10-30s) | Stable Audio Open |
| Ambient sound for scene video | Stable Audio Open |
| Foley / one-shot SFX | Stable Audio Open |
| Drum beat / instrument riff | Stable Audio Open |
| Full song (3+ min) | ACE-Step v1.5 (local) or Stable Audio commercial service |
| Melody-conditioned variation | MusicGen-melody (research only — CC-BY-NC weights) |

### Operator notes

- **Build-track license posture**: clean commercial use under $1M ARR. For solo-operator persona-ops that's a generous ceiling. If revenue scales past $1M, register with Stability for Enterprise.
- **CC training data** is a significant copyright-risk mitigant — outputs are less likely to overfit specific protected works compared to MusicGen (which used Shutterstock/Pond5 licensed but proprietary data)
- **Output silence padding**: short generations are silence-padded to the full 1,024-token (~47s) window — trim in post-processing (FFmpeg)
- **Native ComfyUI support**: maturing as of May 2026 — until stable, run via Python CLI + FFmpeg mux per @concepts/persona-audio-stack.md
- **Sample CLI** (vLLM-Omni example): `--num-inference-steps 100 --guidance-scale 7.0 --audio-length 10.0`

## Snippets

> "Stable Audio Open is an open source text-to-audio model for generating up to 47 seconds of samples and sound effects."
[Source: stability.ai/news-updates/introducing-stable-audio-open (retrieved 2026-05-13)]

> "Stable Audio Open 1.0 is released under the Stability AI Community License. All training data are drawn from audio under CC0, CC BY, or CC Sampling+ licenses, with full attribution provided."
[Source: openlaboratory.ai/models/stable-audio-open-1 (retrieved 2026-05-13)]

> "The Stability AI Community License allows for research, non-commercial, and commercial use of the Core Models for individuals or organizations that generate under $1M (or local currency equivalent) of annual revenue, regardless of the source of that revenue."
[Source: https://stability.ai/license (retrieved 2026-05-13)]

### Install

```bash
git clone https://github.com/Stability-AI/stable-audio-tools.git
cd stable-audio-tools && pip install -e .
huggingface-cli download stabilityai/stable-audio-open-1.0 --local-dir models/stable-audio
# minimal CLI use (vLLM-Omni)
python examples/offline_inference/text_to_audio/text_to_audio.py \
  --model stabilityai/stable-audio-open-1.0 \
  --prompt "Lo-fi rain on a windowpane, late evening, soft thunder" \
  --audio-length 30.0 \
  --num-inference-steps 100 \
  --guidance-scale 7.0 \
  --output ambient.wav
```

## Dead Ends

- **Stable Audio Open for full-song generation (3+ min)**: 47s ceiling. Use ACE-Step v1.5 (local) or commercial Stable Audio service.
- **Stable Audio Open at >$1M ARR without registration**: license violation. Either register for Enterprise or stay under threshold.
