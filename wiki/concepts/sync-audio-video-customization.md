---
title: Sync audio-video customization (OmniCustom task)
type: concept
tags: [audio-video, customization, identity, voice-clone, persona-ops]
keywords: [sync audio-video customization, OmniCustom, timbre, reference image, reference audio, OVI, background sound]
related:
  - sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
  - entities/models/omnicustom.md
  - concepts/persona-audio-stack.md
  - concepts/video-identity-inheritance.md
  - entities/persona-ops/fish-speech.md
  - entities/lipsync/latentsync.md
  - sources/arxiv-2604-11283-mllm-video-translation-survey.md
  - concepts/mllm-video-translation.md
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
  - concepts/joint-audio-visual-instruction-editing.md
  - entities/models/javedit.md
  - sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md
  - concepts/multi-shot-audio-video-evaluation.md
  - entities/models/ltx-2.md
maturity: draft
created: 2026-06-01
updated: 2026-06-08
---

## Relations

@sources/arxiv-omnicustom-sync-audio-video-2602-12304.md @entities/models/omnicustom.md @concepts/persona-audio-stack.md @concepts/video-identity-inheritance.md @entities/persona-ops/fish-speech.md @entities/lipsync/latentsync.md

## Raw Concept

Ingest 2026-06-01 from OmniCustom paper — new task tier above silent video customization and audio-driven video.

## Narrative

**Inputs:** reference image $I^r$, reference audio $A^r$, text prompt (speech content + scene).

**Outputs:** synchronized video (face identity from $I^r$) + audio (timbre from $A^r$, words from prompt) + optional **ambient/foley** not synthesizable via TTS alone.

### vs current persona stack

| Stage | Current build track | OmniCustom unified |
|-------|---------------------|-------------------|
| Voice | Fish-Speech / Qwen3-TTS CLI | Timbre from $A^r$ in joint model |
| Video | Wan 2.2 I2V from master | Identity from $I^r$ in joint model |
| Lipsync | LatentSync post-pass | End-to-end AV sync (claimed) |
| BGS | Stable Audio Open + FFmpeg mux | Native in joint gen |

**Status:** research/adoption candidate — verify weights license + ComfyUI path `[NEEDS VERIFICATION 2026-06-01]`. → @entities/models/omnicustom.md

**Successor tier:** @concepts/joint-audio-visual-instruction-editing.md (JAVEdit) adds natural-language **editing** on top of reference-driven **customization** — same joint AV goal, different control surface.

**Eval tier:** @concepts/multi-shot-audio-video-evaluation.md (MSAVBench) — reference-to-AV metrics (subject/voice fidelity) show visual identity preservation lags voice cloning even on closed systems; joint customization models must optimize both.

## Snippets

> "Spoken content can be freely given via textual prompt." [Source: arXiv:2602.12304 §1 paraphrase]

## Dead Ends

- **Two-stage TTS → drive video** for editable speech — OmniCustom paper argues this breaks when background sounds or timbre+text decoupling matter.
