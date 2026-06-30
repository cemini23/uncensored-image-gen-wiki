---
title: "EAV-DFD audio-visual deepfake detection — routed (arXiv:2606.15117)"
type: source
tags: [paper, routed, deepfake-detection, security, audio-visual, cross-wiki]
keywords: [EAV-DFD, EA V-DFD, teacher-student domain adaptation, ensemble deepfake detection, FakeAVCeleb, Sharif University]
related:
  - concepts/persona-audio-stack.md
  - concepts/persona-failure-modes.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-06-16-daily.md
  - sources/arxiv-2411-19537-deepfake-generation-detection-survey.md
  - concepts/generative-ai-era-deepfake-landscape.md
maturity: draft
read_status: read
created: 2026-06-16
updated: 2026-06-30
---

## Relations

Primary ingest target: `@cybersecurity-wiki/` (defensive deepfake detection). Image-gen touchpoint: detecting synthetic persona A/V content.

## Raw Concept

- **Title**: Teacher-Student Structure for Domain Adaptation in Ensemble Audio-Visual Video Deepfake Detection
- **Authors**: Elham Abolhasani, Maryam Ramezani, Hamid R. Rabiee (Sharif University of Technology)
- **Type**: arXiv:2606.15117
- **Location**: `raw-sources/arxiv-2606.15117-teacher-student-structure-for-domain-adaptation.pdf`
- **URL**: https://arxiv.org/abs/2606.15117
- **Retrieved**: 2026-06-16
- **Read status**: read (routed — defensive security, not generative build-track)

## Narrative

**Routed stub.** **EAV-DFD** — ensemble audio-visual deepfake detector with three sub-networks (visual Xception on face crops, audio CNN+Masked Transformer, audio-visual cross-attention on lip crops + mel). **Teacher-student domain adaptation** fine-tunes on small samples from unseen domains without catastrophic forgetting.

**Results [TENTATIVE]:** Trained on FakeAVCeleb; tested on DFDC, Deepfake TIMIT, PolyGlotFake — AUC gains up to +17.94% on unseen domains with limited student data.

**Image-gen touchpoint:** As local persona pipelines (@concepts/persona-audio-stack.md) produce increasingly realistic talking-head + cloned-voice content, platform-side and defensive researchers use such detectors — relevant to **persona ops risk** (@concepts/persona-failure-modes.md), not to generation quality. Umbrella survey: @sources/arxiv-2411-19537-deepfake-generation-detection-survey.md (@concepts/generative-ai-era-deepfake-landscape.md).

Full defensive methodology belongs in cybersecurity wiki.

## Snippets

> "The proposed model can learn new deepfake methods without forgetting prior knowledge, using a small number of videos from both old and new domains."

## Dead Ends

No open inference code verified. Not ingested as ComfyUI technique.
