---
title: Generative-AI-era deepfake landscape
type: concept
tags: [concept, deepfake, detection, security, persona-ops, diffusion]
keywords: [deepfake taxonomy, BioDeepAV, OOD detection, POI detection, diffusion fakes, voice clone, portrait animation]
related:
  - sources/arxiv-2411-19537-deepfake-generation-detection-survey.md
  - concepts/persona-failure-modes.md
  - concepts/persona-legal-landscape.md
  - concepts/persona-audio-stack.md
  - concepts/persona-consistency-methods.md
  - sources/arxiv-2606-15117-eav-dfd-deepfake-detection-routed.md
  - entities/lipsync/latentsync.md
  - entities/persona-ops/fish-speech.md
  - sources/persona-monetization-2026.md
  - concepts/likeness-collision-verification.md
  - sweeps/2026-06-30-daily.md
maturity: draft
created: 2026-06-30
updated: 2026-06-30
---

## Relations

@sources/arxiv-2411-19537-deepfake-generation-detection-survey.md @concepts/persona-failure-modes.md @concepts/persona-audio-stack.md

## Raw Concept

Ingest 2026-06-30 from Croitoru et al. (arXiv:2411.19537) — umbrella gen+det survey for diffusion-era fakes.

## Narrative

### Generation taxonomy (persona-relevant)

| Modality | Local stack examples | Deepfake class |
|----------|---------------------|----------------|
| Image | FLUX + PuLID/LoRA | Identity-conditioned T2I |
| Video | Wan I2V + LivePortrait/EMOSH | Portrait animation / cross-drive |
| Audio | Fish-Speech / CosyVoice | Voice cloning |
| Multimodal | LatentSync + TTS mux | AV talking-head |

Survey notes diffusion **prompt deepfakes** (celebrity name in text) are lower fidelity than **adapter/LoRA identity** methods — matches workspace build-track (@concepts/persona-consistency-methods.md).

### Detection vs operator reality

**BioDeepAV finding:** detectors trained on older GAN fakes drop sharply on **unseen diffusion generators** `[TENTATIVE per survey]`.

**Operator implication:** short-term evasion of platform classifiers is plausible; **long-term** exposure remains from law (2257, DEFIANCE, UK OSA), payment rails, and human reporting — not ML detection alone (@concepts/persona-failure-modes.md).

### POI detection task

**Person-of-interest (POI) detection** — given a reference identity, classify whether new media depicts a fake of that person. Relevant to **likeness collision** and **right-of-publicity** disputes (@concepts/likeness-collision-verification.md).

## Snippets

> "Covering both generation and detection, as well as all deepfake media types."

## Dead Ends

Defensive ML stack — operators should not treat detector OOD weakness as legal immunity.
