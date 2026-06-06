---
title: "Foley-Omni — Unified Video Soundtrack Generation (arXiv:2606.03672)"
type: source
tags: [paper, audio, foley, video-to-sound, tts, music, unified-generation]
keywords: [Foley-Omni, V2ST, video soundtrack, speech, sound effects, music, unified audio generation, V2ST-Bench, Video Rebirth]
related:
  - entities/models/foley-omni.md
  - concepts/persona-audio-stack.md
  - sources/video-generation-survey-2026.md
  - entities/models/ltx-2.md
  - entities/sfx-models/stable-audio-open.md
  - sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
  - concepts/joint-audio-visual-instruction-editing.md
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
maturity: draft
read_status: read
created: 2026-06-03
updated: 2026-06-06
---

## Relations

@entities/models/foley-omni.md @concepts/persona-audio-stack.md @sources/video-generation-survey-2026.md @entities/models/ltx-2.md @entities/sfx-models/stable-audio-open.md

## Raw Concept

- **Title**: Foley-Omni: A Unified Multimodal Generation Model from Task-Level Audio Synthesis to Complete Video Soundtrack Generation
- **Authors**: Ye Tao, Lupeng Liu, Xuenan Xu, Jiasun Feng, Jiarui Wang, Ying Qin, Shuiyang Mao, Wei Liu, Shuai Wang (Nanjing U, Video Rebirth, SJTU, BJTU, Shanghai AI Lab)
- **Type**: arXiv:2606.03672
- **Location**: `raw-sources/arxiv-2606.03672-foley-omni-a-unified-multimodal-generation-model.pdf`
- **URL**: https://arxiv.org/abs/2606.03672
- **Retrieved**: 2026-06-03
- **Read status**: read (abstract + intro)

## Narrative

Extends **unified audio generation** from isolated task-level synthesis (TTA, TTS, TTM, V2A, VisualTTS) to **complete video soundtrack (V2ST)** — jointly generating **speech, sound effects, and music** for the same video in one latent process with temporal and semantic consistency.

**Contributions:**

- **Foley-Omni** model — shared latent generation across speech/SFX/music domains
- **Audiovisual data curation pipeline** for mixed-track training
- **V2ST-Bench** — benchmark for holistic video soundtrack evaluation

Claims competitive per-task performance vs expert systems plus improved speech intelligibility, audiovisual consistency, and perceptual quality on mixed soundtracks `[TENTATIVE]`.

Contrasts with closed **Veo 3** joint A/V and prior open models that unify tasks but generate one domain at a time (AudioX-class).

### Workspace relevance

Potential upgrade path for @concepts/persona-audio-stack.md **Layer 4 + dialogue path** — today operators mux Fish-Speech + Stable Audio Open + FFmpeg manually; Foley-Omni targets single-pass mixed tracks like @entities/models/ltx-2.md but audio-first. Watch for open weights and VRAM requirements `[NEEDS VERIFICATION 2026-06-03]`.

## Snippets

> "Real video production often requires multiple components of a complete audio track to be generated jointly and consistently for the same video."

> "Foley-Omni … extends isolated task-level synthesis to complete video soundtrack generation by jointly modeling speech, sound effects, and music within a shared latent generation process."

## Dead Ends

Weights / ComfyUI nodes not confirmed at ingest — keep cascaded persona-audio stack as build-track until release.
