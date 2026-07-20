---
title: "Geometry-limited voice-clone attribution floor for pro voice actors (arXiv:2607.15694)"
type: source
tags: [paper, voice, deepfake, attribution, speaker-recognition, persona-ops]
keywords: [voice-clone, attribution, embedding-geometry, Seed-VC, ASV, right-of-publicity]
related:
  - concepts/generative-ai-era-deepfake-landscape.md
  - concepts/persona-legal-landscape.md
  - concepts/persona-audio-stack.md
  - entities/persona-ops/fish-speech.md
  - sources/arxiv-2607-14753-lalms-spoofing-aware-asv.md
  - sweeps/2026-07-20-daily.md
maturity: draft
read_status: read
created: 2026-07-20
updated: 2026-07-20
---

## Relations

@concepts/generative-ai-era-deepfake-landscape.md @concepts/persona-legal-landscape.md @concepts/persona-audio-stack.md @entities/persona-ops/fish-speech.md @sources/arxiv-2607-14753-lalms-spoofing-aware-asv.md

## Raw Concept

- **Title**: A Geometry-Limited Identification Floor and Its Consequences for Voice-Clone Attribution in Professional Voice Actors
- **Authors**: Shuhei Kato (independent, Tokyo)
- **Type**: arXiv:2607.15694 (IEEE submission preprint)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.15694-a-geometry-limited-identification-floor-and-its.pdf`
- **URL**: https://arxiv.org/abs/2607.15694
- **Retrieved**: 2026-07-20

## Narrative

Empirical study on **1,168 Japanese voice actors** (~63 h): embedding-space crowding + multi-style performance creates a **geometry-limited misidentification floor** (~2.6% closed-set best ensemble; 13% session-disjoint). Fixed-threshold 1:N clone attribution is unreliable — wrongful accusations of enrolled actors on generic English encoders (~50% false attribution of non-enrolled clones) while Seed-VC clones of enrolled targets miss ~32% at the same threshold. Domain-matched VA-trained encoders help but do not erase the floor.

**Phase-0: REFERENCE** — no install path. Operator takeaway for persona stack: do **not** treat similarity-threshold ASV as autonomous enforcement or "proof" of clone authorship; prefer spoofing-aware open-set 1:N with abstain. Aligns with @concepts/persona-legal-landscape.md (right-of-publicity / Vacker) and deepfake detection limits.

## Snippets

> "Fixed-threshold clone attribution is thus unreliable here, and on a generic encoder unfair. Robust attribution must extend spoofing-aware speaker verification to open-set 1:N … and even then supports detection, not autonomous enforcement."

[Source: arXiv:2607.15694 abstract (retrieved 2026-07-20)]
