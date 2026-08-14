---
title: VoxAudio — vocalized audio synthesis (speech-in-soundscape) via multi-reward AR flow matching
type: entity
tags: [text-to-audio, speech, soundscape, flow-matching, streaming, watch]
keywords: [VoxAudio, vocalized audio, T2A, speech-in-soundscape, flow matching, VoxCorpus, VoxBench, temporal grounding, dubbing, podcast]
related:
  - sources/arxiv-2608-12951-voxaudio.md
  - concepts/persona-audio-stack.md
  - concepts/multi-shot-audio-video-evaluation.md
  - entities/sfx-models/stable-audio-open.md
  - entities/voice-models/phoenix-tts.md
  - sweeps/2026-08-14-daily.md
maturity: draft
created: 2026-08-14
updated: 2026-08-14
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-12951-voxaudio.md @concepts/persona-audio-stack.md @concepts/multi-shot-audio-video-evaluation.md @entities/sfx-models/stable-audio-open.md @entities/voice-models/phoenix-tts.md

## Raw Concept

Phase-0 from arXiv:2608.12951 (IEEE TMM). Causal autoregressive flow-matching T2A that embeds intelligible speech in an environmental soundscape — vs separate-TTS post-hoc mixing.

## Narrative

| Field | Value |
|-------|-------|
| Method | Causal AR flow matching; chunk-wise causal factorization + per-chunk noise levels; streaming KV cache |
| Preference | Multi-reward Negative-aware FineTuning (NFT): semantic fidelity, linguistic accuracy, aesthetic quality, temporal grounding |
| Data | VoxCorpus (verbatim-transcript captions + time intervals); VoxBench (interval-annotated, temporal-grounding metric) |
| Use cases | Podcast production, video dubbing — speech *inside* the scene |
| Code | `voxaudio.github.io` project page; no GH repo → no SPDX |
| Phase-0 | **WATCH** |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Persona-audio angle: quoted/embedded voice vs TTS+dub post-mix — mux-adjacent to the local audio pipeline. VoxBench's temporal-grounding eval is a reusable QA angle for dubbing/podcast persona content. Track: repo/weights release, VRAM + Apple-Silicon MPS viability, and how its speech leg compares to @entities/voice-models/phoenix-tts.md / Fish-Speech for embedded-speech fidelity.

## Snippets

_(none)_
