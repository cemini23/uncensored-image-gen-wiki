---
title: "Articulatory source-filter TTS — vocal-tract kinematics as control (arXiv:2610.00735)"
type: source
tags: [paper, tts, voice, articulatory, control, watch]
keywords: [Articulatory Source-Filter TTS, vocal tract kinematics, EMA trajectories, acoustic-to-articulatory inversion, FastPitchFormant, OT-CFM, HiFi-GAN, accent control]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-02-daily.md
  - concepts/persona-audio-stack.md
maturity: draft
read_status: skimmed
created: 2026-10-02
updated: 2026-10-02
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-02-daily.md @concepts/persona-audio-stack.md

## Raw Concept

- **Title**: Articulatory Source-Filter TTS: Physically Grounded Control through Vocal Tract Kinematics
- **Type**: arXiv:2610.00735 (SPIRE Lab, Indian Institute of Science + CMU; Jesuraj Bandekar, Shinji Watanabe, Prasanta Kumar Ghosh)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.00735-articulatory-source-filter-tts-physically-ground.pdf (archived 2026-10-02)
- **URL**: https://arxiv.org/abs/2610.00735
- **Retrieved**: 2026-10-02

## Narrative

**The claim.** A text-driven source-filter TTS model whose vocal-tract filter is conditioned on predicted articulatory kinematics — 12-channel EMA midsagittal trajectories covering lips, jaw and tongue. The paper presents it as the first text-driven TTS with kinematic-level control of the vocal-tract response.

**Method, two stages.** Stage 1 trains an acoustic-to-articulatory inversion Transformer (about 7.3M parameters) on six EMA corpora (86 speakers, about 36 hours) using MMS-1B features, with MSE plus Pearson-correlation losses, to generate pseudo-trajectories for LibriTTS train-clean-460. Stage 2 (about 33M parameters) follows FastPitchFormant: a phoneme encoder, three prediction streams, a pitch/energy predictor, an articulatory trajectory predictor, a source log-Mel predictor and a filter log-Mel predictor. An OT-CFM U-Net (10 Euler steps) refines the source. Final mel is source plus filter, synthesised by HiFi-GAN.

**Results.** Inversion correlation 0.9542 seen / 0.7749 unseen. Zero-shot trajectory correlation 0.6922. TTS: WER 5.53 clean, MOS 3.76, UTMOS 3.71, F0 correlation 0.8841, MCD 5.89. It beats YourTTS and ties XTTS (466.9M) on WER at 33M parameters. It **loses** raw spectral fidelity to StyleTTS2 (MCD 4.52) and HierSpeech++ (4.91). Removing OT-CFM raises WER to 4.77 but crashes UTMOS to 2.26. It scores maximum controllability (3/3) and interpretability (5/5), and demonstrates cross-speaker source/filter swap and a rhotic-to-non-rhotic accent edit.

**Phase-0 (2026-10-02).** A demo page only (`coding-phoenix-12.github.io/ArticulatorySFTTS/`) — **no repository, no weights, no licence**. Training used two 24GB GPUs at 1M steps, batch 8, so it fits a 24GB card. **Verdict: WATCH-thin.** The control concept is neat — articulatory trajectories are close to visemes, which is a conceptual tie to `@concepts/persona-audio-stack.md`, and cross-speaker pitch/timbre recombination is a novel voice-design knob — but with no release, no zero-shot cloning and sub-SOTA quality it is not actionable now.

## Snippets

[Source: https://arxiv.org/abs/2610.00735 (retrieved 2026-10-02)]
