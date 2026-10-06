---
title: "Objective evaluation of modern TTS for Turkish — an 18-metric panel (arXiv:2610.06057)"
type: source
tags: [paper, tts, evaluation, benchmark, methodology, watch]
keywords: [TTS evaluation, objective metrics, UTMOSv2, SQUIM, TTSDS, speaker similarity, Wespeaker, long-form drift, Turkish, metric panel, Chatterbox, CosyVoice, VoxCPM2, OmniVoice]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-06-daily.md
  - concepts/tts-objective-eval-metric-panel.md
  - concepts/asr-roundtrip-tts-eval-limits.md
  - concepts/persona-audio-stack.md
maturity: draft
read_status: skimmed
created: 2026-10-07
updated: 2026-10-07
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-06-daily.md @concepts/tts-objective-eval-metric-panel.md @concepts/asr-roundtrip-tts-eval-limits.md @concepts/persona-audio-stack.md

## Raw Concept

- **Title**: A Comprehensive Objective Evaluation of Modern Text-to-Speech for Turkish Using Speech Quality Assessment Models
- **Type**: arXiv:2610.06057 (Sestek, Ankara; Yunus Emre Ozkose et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.06057-a-comprehensive-objective-evaluation-of-modern-t.pdf (archived 2026-10-07)
- **URL**: https://arxiv.org/abs/2610.06057
- **Retrieved**: 2026-10-07

## Narrative

**What it is.** Not a model — an *evaluation study*. It runs 18 objective metrics over four modern zero-shot TTS systems (**Chatterbox, CosyVoice, OmniVoice, VoxCPM2**) plus a VITS baseline on Turkish, in both fine-tuned and zero-shot modes, all anchored to the same speaker's natural "gold" recordings. 100 short, 100 medium and 100 long sentences, with a separate long-form study tracking how identity and naturalness drift over time.

**The finding that matters most.** **There is no global winner — the winners partition by metric family.** VITS tops DNSMOS-Pro (4.225 against gold 3.601, i.e. the baseline outscores the real recording). OmniVoice-ZS sweeps the SQUIM signal metrics. CosyVoice tops UTMOSv2 and TTSDS. VoxCPM2 tops speaker similarity (0.881 against gold 0.894) and NatScore.

**The trap this exposes.** Several systems **beat the gold reference on signal-cleanliness predictors**. That is proof those metrics reward idealized audio rather than human-likeness — they are quality *floors*, not quality *rankings*. The wiki already tracks a related failure at `@concepts/asr-roundtrip-tts-eval-limits.md` (ASR-roundtrip masking reading errors); this is the same class of problem on the synthesis side.

**The one metric to trust.** **Speaker similarity is the only dimension where the gold reference is reliably highest.** That makes it the most defensible single metric for a voice-clone decision.

**Other transferable findings.** Utterance length must be stratified — Chatterbox wins zero metrics overall and collapses specifically on short input (SI-SDR 26.4 to 20.4), so short-prompt performance is a distinct axis. Identity drift and naturalness drift are different things and should be monitored separately on long narration; CosyVoice and VITS are the most temporally stable, VoxCPM2 shows near-zero first-to-last identity drift.

**Phase-0 (2026-10-07).** Evaluation code and results are released at `github.com/EmreOzkose/tr-tts-eval`; **no licence is stated**, and no weights ship (eval-only). Compute is not stated. Turkish is irrelevant to a non-Turkish operator — but **the methodology transfers**, and the four systems evaluated are exactly the class an operator would shortlist for a local clone stage. See `@concepts/tts-objective-eval-metric-panel.md`.

**Verdict: WATCH-full** — the reusable part is the metric panel plus the guidance on which metrics to distrust.
