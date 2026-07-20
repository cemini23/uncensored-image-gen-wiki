---
title: "Audio-Visual Flamingo — open long-form AV intelligence (arXiv:2607.16107)"
type: source
tags: [paper, audio-visual, multimodal, nvidia, understanding, watch]
keywords: [AV-Flamingo, AVF, TAVIT, AV-Skills, Nemotron, NVIDIA]
related:
  - entities/models/av-flamingo.md
  - concepts/persona-audio-stack.md
  - concepts/multi-shot-audio-video-evaluation.md
  - entities/voice-models/nemotron-audex.md
  - sweeps/2026-07-20-daily.md
maturity: draft
read_status: skimmed
created: 2026-07-20
updated: 2026-07-20
---

## Relations

@entities/models/av-flamingo.md @concepts/persona-audio-stack.md @concepts/multi-shot-audio-video-evaluation.md @entities/voice-models/nemotron-audex.md

## Raw Concept

- **Title**: Audio-Visual Flamingo: Open Audio-Visual Intelligence for Long and Complex Videos
- **Authors**: NVIDIA Nemotron-Labs et al.
- **Type**: arXiv:2607.16107
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.16107-audio-visual-flamingo-open-audio-visual-intellig.pdf`
- **URL**: https://arxiv.org/abs/2607.16107
- **Retrieved**: 2026-07-20

## Narrative

Fully open **AV understanding** MLLM for long/complex videos: **AV-Skills** (~7M caption/QA instances) + **TAVIT** temporal AV interleaved CoT. Paper claims open-sourcing model/training/inference; checkpoint licenses in Table 9 include **NVIDIA OneWay Noncommercial** on core weights (plus mixed MIT / CC-BY-NC-SA on some components).

**Phase-0: WATCH / REFERENCE** — understanding/eval tool, not a generation stack component. Noncommercial NVIDIA license blocks Fanvue monetization use. Weights >>500 MB — do not local-adopt. Distinct from Audio Flamingo 3 (audio-only LALM already on HF).

## Snippets

> "We open-source the model, training, and inference code, and associated techniques to support future research."

[Source: arXiv:2607.16107 p.2 (retrieved 2026-07-20)]
