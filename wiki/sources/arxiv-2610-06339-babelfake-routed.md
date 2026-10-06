---
title: "BabelFake — multilingual audio-visual deepfake benchmark (arXiv:2610.06339) — routed cybersec"
type: source
tags: [paper, deepfake, detection, benchmark, routed, out-of-domain]
keywords: [BabelFake, deepfake detection, audio-visual, multilingual, consent-sourced, lipsync, voice cloning, SpeechForensics, AVH-Align, benchmark]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-06-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-07
updated: 2026-10-07
phase0_verdict: ROUTE
wire_status: routed
route_target: "@cybersecurity-wiki"
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-06-daily.md

## Raw Concept

- **Title**: BabelFake: A Multilingual Audio-Visual DeepFake Benchmark
- **Type**: arXiv:2610.06339 (TU Darmstadt + Hessian.AI; Carlotta Segna et al.)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.06339
- **Retrieved**: 2026-10-07

## Narrative

**What it is.** The first consent-sourced, multilingual **audio-visual deepfake detection** benchmark. It is IRB-approved, with recordings from paid Prolific participants who consented to their likeness and voice being manipulated. It departs from prior benchmarks by pairing modern **audio** manipulations with visual ones, and by covering five languages.

**Scale and construction.** A controlled webcam protocol feeds a modular pipeline: **11 video manipulation methods** (face swap, lipsync, portrait animation) crossed with **4 voice-cloning engines** (Qwen3-TTS, Fish-Speech, OmniVoice, Chatterbox), conditioned on both pristine and synthetic audio. Output is 399k clips / 1,323 hours / 496 individuals across English, German, Italian, French and Spanish — 20,117 real and 379,582 fake samples, on an identity-disjoint 70/10/20 split.

**Results.** Three detectors are benchmarked (SpeechForensics, AVH-Align, (B)RAVEn). SpeechForensics is best overall at AUC 79.79, peaking at 83.83 on Spanish. Detectors degrade sharply when visual fakes keep **authentic** audio. Multimodal beats unimodal (74.27 against 71.44 macro). No language is consistently hardest; demographic gaps are mostly under 4 AUC.

**Phase-0 (2026-10-07).** No repository, no code, no weights. The dataset is **not on GitHub or HF** — it is controlled access under a non-commercial research licence, requiring institutional verification and a data-use agreement.

**Why it routes out.** This is a **detection** benchmark, not a generation resource, and detection is the cybersecurity wiki's lane. For image-gen it is at most a footnote: it does name which contemporary clone and lipsync engines are good enough to fool detectors, but every one of those (Qwen3-TTS, Fish-Speech, OmniVoice, Chatterbox, MuseTalk, LatentSync) is already catalogued here individually, and the paper adds no generation-side artifact analysis. **Verdict: ROUTE to `@cybersecurity-wiki`.** Image-gen keeps this routing record; image-gen Phase-1: none. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.06339 (retrieved 2026-10-07) — SpeechForensics best overall AUC 79.79.]
