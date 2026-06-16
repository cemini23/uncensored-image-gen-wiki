---
title: Unified controllable video-to-audio generation
type: concept
tags: [concept, audio, foley, video-to-audio, multimodal-control, sfx]
keywords: [VTA, TC-VTA, AC-VTA, foley extension, MMAudio, MultiFoley, MMDiT, temporal synchronization, reference audio conditioning, FoleyGenEx]
related:
  - sources/arxiv-2606-14049-foleygenex-unified-vta.md
  - entities/models/foleygenex.md
  - concepts/persona-audio-stack.md
  - entities/models/foley-omni.md
  - sources/arxiv-2606-03672-foley-omni.md
  - entities/sfx-models/stable-audio-open.md
  - sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md
maturity: draft
created: 2026-06-16
updated: 2026-06-16
---

## Relations

@sources/arxiv-2606-14049-foleygenex-unified-vta.md @entities/models/foleygenex.md @concepts/persona-audio-stack.md @entities/models/foley-omni.md

## Raw Concept

Ingest 2026-06-16 from FoleyGenEx (arXiv:2606.14049) — one model, five audio generation modes, frame-level sync + reference-audio control.

## Narrative

**VTA task spectrum** (post–silent-video era):

| Mode | Use case |
|------|----------|
| VTA | Dub silent generated video |
| TC-VTA | Override semantics while keeping lip/event sync |
| AC-VTA | Transfer reference audio **style/events** onto new visuals |
| FE | Extend partial soundtrack on longer clip |
| TTA | Fallback text-only ambience |

**Technical axis:** MMAudio brought **Synchformer + MMDiT** sync; MultiFoley added reference audio but hurt alignment. FoleyGenEx claims both via **dynamic masking** + shared flow-matching training.

### vs persona audio stack

Current production path (@concepts/persona-audio-stack.md): separate Fish-Speech (voice), Stable Audio Open (SFX), ACE-Step (music), FFmpeg mux. Unified VTA/V2ST models (@entities/models/foley-omni.md, FoleyGenEx) could collapse **ambient+foley** pass after video gen — voice still separate for DM cloning quality.

## Snippets

> "Manual dubbing and alignment are prohibitively time-consuming."

## Dead Ends

Adverb TC-VTA ("lion roar" on cat video) is demo gimmick — not primary persona workflow. Weight release TBD.
