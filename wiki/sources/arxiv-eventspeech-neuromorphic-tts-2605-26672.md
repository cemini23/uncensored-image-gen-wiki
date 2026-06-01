---
title: "EventSpeech — speech from neuromorphic event cameras (arXiv:2605.26672)"
type: source
tags: [paper, tts, event-camera, neuromorphic, reference-only]
keywords: [EventSpeech, event camera, neuromorphic, EVT-SPK, DAVIS346, expressive TTS, RGB motion blur]
related:
  - concepts/persona-audio-stack.md
  - entities/lipsync/latentsync.md
maturity: draft
read_status: skimmed
created: 2026-06-01
updated: 2026-06-01
---

## Relations

@concepts/persona-audio-stack.md @entities/lipsync/latentsync.md

## Raw Concept

- **Title**: Can We Hear from Events? Generating Speech from Event Camera
- **Authors**: Jingping Fang et al. (BTBU, Xidian, Tongji, Sydney)
- **Type**: arXiv:2605.26672
- **Location**: `raw-sources/arxiv-2605.26672-can-we-hear-from-events-generating-speech-from-e.pdf`
- **Retrieved**: 2026-06-01
- **Read status**: skimmed (abstract + intro)

## Narrative

**EventSpeech** generates expressive speech from **neuromorphic event streams** (microsecond async intensity changes) instead of 30fps RGB, arguing RGB exposure integration causes **temporal granularity mismatch** that blurs lip micro-dynamics and yields over-smoothed TTS prosody.

Architecture: Event Encoder + multi-scale Audio Encoder (Hierarchical Wavelet Contextualizer) + bidirectional alignment. **EVT-SPK** benchmark: synthetic corpus + **2.8k real** DAVIS346 + H3-VR recordings (low light, fast articulation).

### Workspace relevance — **REFERENCE-ONLY**

Requires specialized event-camera hardware — not laptop persona-ops build track. File for lipsync research horizon; standard RGB + LatentSync/MuseTalk remain canonical → @entities/lipsync/latentsync.md.

Demo: https://xrfang-0102.github.io/EventSpeechWeb/

## Snippets

> "Traditional RGB-based speech generation faces Temporal Granularity Mismatch since fixed camera exposure times inevitably blur the high-frequency articulatory transients essential for rendering emotional speech." [Source: arXiv:2605.26672 abstract]

## Dead Ends

- **Event camera for persona DM voice notes** — hardware barrier; no consumer deployment path in 2026.
