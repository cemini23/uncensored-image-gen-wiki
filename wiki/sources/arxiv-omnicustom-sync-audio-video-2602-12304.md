---
title: "OmniCustom — sync audio-video customization (arXiv:2602.12304)"
type: source
tags: [paper, audio-video, customization, identity, voice-clone, dit, lora]
keywords: [OmniCustom, sync audio-video customization, OVI, reference LoRA, timbre, identity, OmniCustom-1M, zero-shot]
related:
  - entities/models/omnicustom.md
  - concepts/sync-audio-video-customization.md
  - concepts/persona-audio-stack.md
  - concepts/video-identity-inheritance.md
  - entities/lipsync/latentsync.md
  - entities/models/foley-omni.md
  - sources/arxiv-2604-11283-mllm-video-translation-survey.md
  - sources/arxiv-2606-03672-foley-omni.md
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
  - sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md
  - concepts/multi-shot-audio-video-evaluation.md
maturity: draft
read_status: read
created: 2026-06-01
updated: 2026-06-08
---

## Relations

@entities/models/omnicustom.md @concepts/sync-audio-video-customization.md @concepts/persona-audio-stack.md @concepts/video-identity-inheritance.md @entities/lipsync/latentsync.md

## Raw Concept

- **Title**: OmniCustom: Sync Audio-Video Customization Via Joint Audio-Video Generation Model
- **Authors**: Maomao Li et al. (HKU, Shanda AI, XIntelligence)
- **Type**: arXiv:2602.12304
- **Location**: `raw-sources/arxiv-2602.12304-omnicustom-sync-audio-video-customization-via-jo.pdf`
- **Retrieved**: 2026-06-01
- **Read status**: read (abstract + intro)

## Narrative

Defines **sync audio-video customization**: given reference image $I^r$ + reference audio $A^r$ + text prompt → generate video preserving **face identity** and audio preserving **timbre**, with **spoken content** specified by text (not fixed TTS re-generation). Also supports **background sound effects** (beach, etc.) that pure TTS pipelines cannot inject.

**OmniCustom** — tuning-free DiT framework on **OVI** joint audio-video base:
- Separate **reference identity** and **reference audio** LoRA branches on self-attention QKV
- **Contrastive flow-matching** objective (with-ref vs without-ref flows)
- Trained on **OmniCustom-1M** (1M single-human portrait AV clips)

Task ladder vs prior work:

| Setting | Identity | Audio track | Timbre control | BGS |
|---------|----------|-------------|----------------|-----|
| Video customization | ✓ | ✗ | ✗ | ✗ |
| Audio-driven video | ✓ | ✓ (fixed drive audio) | ✗ | ✗ |
| **Sync AV customization** | ✓ | ✓ | ✓ (text-specified speech) | ✓ |

### Workspace relevance

Highest-signal paper in this batch for **persona talking-head + voice** unified path — may subsume separate Fish-Speech + LatentSync + Wan I2V chains if weights ship and license permits commercial use `[NEEDS VERIFICATION 2026-06-01]`. Project: https://omnicustom-project.github.io/page/

## Snippets

> "We first propose sync audio-video customization, which jointly produces identity-consistent videos and timbre-cloned audio tracks." [Source: arXiv:2602.12304 Table 1 / abstract]

## Dead Ends

- **Per-identity tuning at inference** (DreamVideo-style) — OmniCustom claims tuning-free; verify before adopting.
