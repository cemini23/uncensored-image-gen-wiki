---
title: "Co-speech gesture benchmark — a metric that measures nothing (arXiv:2610.11669)"
type: source
tags: [paper, gesture, benchmark, evaluation, cross-wiki-in, watch]
keywords: [co-speech gesture, gesture benchmark, SC metric, Semantic Gesture Preservation, SGP, composite predictors, EMAGE, SemTalk, GestureLSM, SemConFlow, perceptual study]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/metric-validity-vs-human-judgement.md
  - concepts/tts-objective-eval-metric-panel.md
  - concepts/asr-roundtrip-tts-eval-limits.md
maturity: draft
read_status: skimmed
created: 2026-10-12
updated: 2026-10-12
phase0_verdict: WATCH
wire_status: deferred
cross-wiki-source: "@osint-wiki/sources/arxiv-2610.11669-co-speech-gesture-benchmark-2026-10-10.md"
---

## Relations

@concepts/federated-daily-research-digest.md @concepts/metric-validity-vs-human-judgement.md @concepts/tts-objective-eval-metric-panel.md @concepts/asr-roundtrip-tts-eval-limits.md @osint-wiki/sources/arxiv-2610.11669-co-speech-gesture-benchmark-2026-10-10.md

## Raw Concept

- **Title**: A perceptual benchmark for co-speech gesture generation
- **Type**: arXiv:2610.11669
- **Source**: incoming cross-wiki brief from OSINT (K288, `briefs/2026-10-10_k288-gesture-eval.md`); landed in the OSINT inbox and was routed here as the video/avatar lane
- **URL**: https://arxiv.org/abs/2610.11669
- **Retrieved**: 2026-10-12
- **Note**: the PDF was not fetched to this inbox — this page is written from the routing brief, which carried the numbers.

## Narrative

**The finding.** **SC**, a widely used co-speech gesture metric, shows **no significant correlation with any perceptual dimension** across a study of 101 human participants. A metric the field relies on measures nothing people notice.

**What does correlate.** A new **Semantic Gesture Preservation** metric — the fraction of annotated semantic-gesture intervals that are *not* collapsed into generic beat gestures — correlates with speech timing and content agreement at rho = 0.39. And **composite predictors over 13 metrics beat the best single metric**, reaching content match rho of **0.7824**.

That second result is worth pausing on: it says no single number captured the perceptual construct, and it took a combination to approach it.

**Models benchmarked.** EMAGE, SemTalk, GestureLSM and SemConFlow.

**Why it belongs in this wiki.** Two transferable ideas, both already themes here. First, **verify a metric against human judgement before trusting it** — this is the third instance of that lesson in this wiki, alongside `@concepts/tts-objective-eval-metric-panel.md` (several TTS systems scoring *above* the real gold recording on signal-cleanliness metrics) and `@concepts/asr-roundtrip-tts-eval-limits.md` (ASR-roundtrip screening masking real reading errors). The brief notes the same shape appeared in a sibling wiki as PatchBench (K285: benchmark scores flat while local regression is severe).

Second, **score semantics rather than plausibility**: "is this a meaningful gesture or a generic beat" tracks perception, while motion smoothness does not. The analogue for generated video and avatars is semantic fidelity, not smoothness.

**Phase-0 (2026-10-12).** **Nothing ships** — code and annotations are promised "on acceptance"; a project page exists at `holisticgesturebenchmark.github.io`. Written from the routing brief, so repository and licence could not be verified.

**Verdict: WATCH.** Ingested as the third member of a recurring theme rather than as a standalone tool; see `@concepts/metric-validity-vs-human-judgement.md`. The gesture-generation models themselves are outside this wiki's local stack. No Basgiath hook.

## Snippets

[Source: cross-wiki brief `2026-10-10_k288-gesture-eval.md` — SC shows no significant correlation with any perceptual dimension across 101 participants.]
