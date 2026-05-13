---
title: ACE-Step (ACE Studio + StepFun open-source music foundation model)
type: entity
tags: [music-generation, text-to-music, diffusion, ace-step, stepfun, ace-studio, apache-2-0, dcae, linear-transformer, eastern-vanguard]
keywords: [ACE-Step, ACE-Step-v1-3.5B, ACE-Step-1.5, StepFun, ACE Studio, music foundation model, Sana DCAE, deep compression autoencoder, linear transformer, full song generation, Apache 2.0, cross-platform Mac AMD Intel CUDA]
related:
  - concepts/persona-audio-stack.md
  - entities/music-models/musicgen.md
  - entities/music-models/suno.md
  - entities/music-models/udio.md
  - entities/sfx-models/stable-audio-open.md
  - concepts/persona-content-cadence.md
  - sources/persona-ops-stack-2026.md
maturity: draft
created: 2026-05-13
updated: 2026-05-13
---

## Relations

@concepts/persona-audio-stack.md
@entities/music-models/musicgen.md
@entities/music-models/suno.md @entities/music-models/udio.md
@entities/sfx-models/stable-audio-open.md
@concepts/persona-content-cadence.md
@sources/persona-ops-stack-2026.md

## Raw Concept

Page prompted by the W4 voice/audio-gen backfill (scope expansion 2026-05-13). Named in @concepts/persona-audio-stack.md as the primary local music-generation recommendation ("best all-around local music generation model as of May 2026"); previously no entity page.

## Narrative

### What it is

**ACE-Step** is a 3.5B-parameter open-source text-to-music foundation model developed by **ACE Studio** and **StepFun**. Combines **diffusion-based generation** with **Sana's Deep Compression AutoEncoder (DCAE)** plus a lightweight **linear transformer** conditioning network — the same DCAE lineage as the Sana T2I model family (image-gen lineage extending into audio). Released under Apache 2.0, full song generation in seconds on consumer GPUs.

### Key facts (May 2026)

- **License**: Apache 2.0 (weights + code) [CONFIRMED] — clean commercial use
- **Size**: 3.5B parameters (ACE-Step-v1-3.5B)
- **Architecture**: diffusion + DCAE (Sana lineage) + linear transformer conditioning — explicit lineage to Sana T2I efficiency tricks
- **Speed**: full song in <2s on A100, <10s on RTX 3090, 0.5-10s on A100 depending on "think mode" + diffusion steps
- **Repo (v1)**: `github.com/ace-step/ACE-Step`
- **Repo (v1.5)**: `github.com/ace-step/ACE-Step-1.5` — **adds Mac / AMD / Intel** support alongside CUDA (broadens beyond NVIDIA)
- **HF model**: `ACE-Step/ACE-Step-v1-3.5B`
- **Output**: minutes-long full songs (not just clips); supports retake variations, segment repainting (e.g. change a 0-30s segment to a different variant)
- **Prompt formats**: short tags, descriptive text, use-case scenarios — broad music style coverage
- **Generation modes**: text-to-music, music retake / variation, segment repaint

### Positioning vs MusicGen / Stable Audio Open

| Axis | ACE-Step v1.5 | MusicGen (Meta) | Stable Audio Open |
|------|---------------|-----------------|-------------------|
| Size | 3.5B | 300M / 1.5B / 3.3B | 1.21B |
| License (weights) | **Apache 2.0** | **CC-BY-NC 4.0** (non-commercial) | Stability Community (<$1M ARR free) |
| Length | Several minutes (full songs) | Limited by autoregressive decode | Up to 47s |
| Commercial use | ✅ clean | ❌ research only | ✅ under $1M ARR |
| Cross-platform | Mac / AMD / Intel / CUDA (v1.5) | CUDA-primary | CUDA-primary |
| Best for | **Modal 2026 local music gen for persona ops** | Research, melody-conditioned | Foley + short loops + ambient |

**ACE-Step's Apache 2.0 weights are the key differentiator** — MusicGen's non-commercial weights make it unusable for revenue-generating persona content; ACE-Step has no such restriction.

### Operator notes

- **Mac support in v1.5** is significant: no NVIDIA required for production music gen. Apple Silicon viability is first-class, not retrofit [CONFIRMED per repo README]
- **Style risk**: upstream acknowledges "unintentional copyright infringement due to stylistic similarity" risk — recommends verifying originality before commercial release of generated tracks
- **Decision matrix entry** (replacing prior persona-audio-stack [TENTATIVE]): primary local music gen recommendation

## Snippets

> "An open-source 3.5B parameter text-to-music model developed by ACE Studio and StepFun that generates original music across diverse genres with impressive coherence and speed."
[Source: https://acestep.org/ (retrieved 2026-05-13)]

> "✅ Ultra-Fast Generation — Under 2s per full song on A100, under 10s on RTX 3090."
[Source: github.com/ace-step/ACE-Step-1.5 (retrieved 2026-05-13)]

> "It integrates diffusion-based generation with Sana's Deep Compression AutoEncoder (DCAE) and a lightweight linear transformer, achieving state-of-the-art performance in generation speed, musical coherence, and controllability."
[Source: huggingface.co/ACE-Step/ACE-Step-v1-3.5B (retrieved 2026-05-13)]

### Install

```bash
git clone https://github.com/ace-step/ACE-Step.git
cd ACE-Step
conda create -n ace_step python=3.10 && conda activate ace_step
# Install PyTorch from pytorch.org first (system-specific)
pip install -r requirements.txt
python app.py  # http://127.0.0.1:7865
```

## Dead Ends

- **Pre-v1 / non-Sana-DCAE variants**: experimental — start directly at v1-3.5B or v1.5.
