---
title: Metric validity against human judgement
type: concept
tags: [evaluation, methodology, concept]
keywords: [metric validity, perceptual correlation, proxy metric, benchmark failure, human judgement, semantic fidelity, composite predictors, broken metric, evaluation]
related:
  - sources/arxiv-2610-11669-gesture-benchmark.md
  - concepts/tts-objective-eval-metric-panel.md
  - concepts/asr-roundtrip-tts-eval-limits.md
  - concepts/reconstruction-based-t2v-benchmarking.md
  - concepts/federated-daily-research-digest.md
maturity: draft
created: 2026-10-12
updated: 2026-10-12
---

## Relations

@sources/arxiv-2610-11669-gesture-benchmark.md @concepts/tts-objective-eval-metric-panel.md @concepts/asr-roundtrip-tts-eval-limits.md @concepts/reconstruction-based-t2v-benchmarking.md @concepts/federated-daily-research-digest.md

## Raw Concept

The question this page answers: how do you tell whether an evaluation metric measures the thing you care about, before you make a decision on it? Consolidates three separate instances this wiki has ingested where a widely-used metric did not.

## Narrative

**Why this page exists.** Three times now, this wiki has ingested a paper whose central finding is the same: **a popular metric correlates with nothing a human notices.** They arrived from different subfields — speech synthesis, speech recognition, gesture generation — and each one was discovered independently. That is a pattern, not three coincidences, and it deserves one page rather than three scattered footnotes.

**The three cases.**

| Source | The metric | What went wrong |
|---|---|---|
| `@concepts/tts-objective-eval-metric-panel.md` | signal-cleanliness predictors (DNSMOS, SQUIM) | several TTS systems scored **above the real gold recording** — the metric measures cleanliness, not likeness |
| `@concepts/asr-roundtrip-tts-eval-limits.md` | ASR-roundtrip screening | masks context-dependent reading errors; the check passes while the failure is present |
| `@sources/arxiv-2610-11669-gesture-benchmark.md` | SC, a standard gesture metric | **no significant correlation with any perceptual dimension** across 101 participants |

**The common shape.** In each case the metric is a *proxy* for a property that is easy to compute, and the proxy diverges from the property as the system improves. A metric that ranks synthetic audio above real audio, or rates all gestures the same, is not noisy — it is measuring a different axis than the one the decision depends on.

**The practical test.** Before trusting a metric, ask whether it has ever been checked against human judgement on a control the humans agree about. The TTS panel case is instructive because it *had* such a control: the same speaker's natural recordings. The metric failed the control — it scored the real thing lower. **A known-best control is the cheapest way to catch a broken metric**, and it is worth building one before trusting any new evaluation.

**What to do instead.** Both robust answers in these papers look the same:

- **Anchor on the dimension that behaves correctly under a control.** Speaker similarity was the only TTS metric where the gold recording was reliably highest, which is why it is the defensible ranking metric.
- **Combine rather than choose.** The gesture paper found that **composite predictors over 13 metrics beat the best single metric**, reaching rho 0.78. No individual number captured the construct.

**A caution in the other direction.** Composites are not automatically better — averaging several metrics that each measure the wrong axis produces a wrong number more confidently. The gesture result worked because the components were chosen for perceptual relevance and validated against a human study. Without that validation a composite is just a bigger proxy.

**Where this fits operationally.** For an operator choosing between local models, this changes the decision procedure: pick a control you trust, verify the metric is ordered correctly on it, prefer the metric that survives, and treat any single number that has never been checked as a hypothesis rather than evidence. Complements `@concepts/reconstruction-based-t2v-benchmarking.md`, which concerns building a benchmark that measures a construct directly rather than by proxy.

## Snippets

[Source: cross-wiki brief `2026-10-10_k288-gesture-eval.md` — composite predictors over 13 metrics beat the best single metric at rho 0.7824.]
