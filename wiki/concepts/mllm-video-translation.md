---
title: MLLM-Enabled Video Translation
type: concept
tags: [concept, video-translation, mllm, dubbing, lipsync, multilingual]
keywords: [MLLM video translation, semantic reasoner, expressive performer, visual synthesizer, dubbing pipeline, cross-lingual video]
related:
  - sources/arxiv-2604-11283-mllm-video-translation-survey.md
  - concepts/persona-audio-stack.md
  - concepts/sync-audio-video-customization.md
  - entities/lipsync/latentsync.md
  - entities/persona-ops/fish-speech.md
  - sources/video-generation-survey-2026.md
  - concepts/joint-audio-visual-instruction-editing.md
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
maturity: draft
created: 2026-06-03
updated: 2026-06-06
---

## Relations

@sources/arxiv-2604-11283-mllm-video-translation-survey.md @concepts/persona-audio-stack.md @concepts/sync-audio-video-customization.md @entities/lipsync/latentsync.md @entities/persona-ops/fish-speech.md

## Raw Concept

Concept stub from K95 ingest — arXiv:2604.11283 role-oriented survey of MLLM-based video translation.

## Narrative

**Video translation** localizes spoken content across languages while preserving timing, speaker identity, lip sync, and emotion. Legacy **cascaded pipelines** (ASR → MT → TTS → lip-sync) suffer error propagation and weak cross-modal coordination.

MLLM-era approach treats translation as **integrated multimodal reasoning + generation**, with three roles (@sources/arxiv-2604-11283-mllm-video-translation-survey.md):

1. **Semantic Reasoner** — video-grounded meaning + temporal fusion
2. **Expressive Performer** — prosody/emotion-aware speech
3. **Visual Synthesizer** — lip and face coherence

### Local persona stack mapping (2026)

| MLLM role | Build-track substitute |
|-----------|------------------------|
| Semantic Reasoner | Manual script + LLM MT (OpenRouter) |
| Expressive Performer | Fish-Speech / CosyVoice clone |
| Visual Synthesizer | LatentSync / MuseTalk on Wan output |

Unified open MLLM dubbing remains research — @concepts/sync-audio-video-customization.md (OmniCustom) is the closest joint A/V customization paper in wiki.

## Snippets

> "High-quality video translation requires not only semantic fidelity, but also temporal alignment, speaker consistency, and emotional expressiveness."

## Dead Ends

No single open model covers all three roles end-to-end for NSFW persona content `[NEEDS VERIFICATION 2026-06-03]`.
