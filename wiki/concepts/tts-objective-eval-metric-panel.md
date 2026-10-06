---
title: TTS objective evaluation metric panel (which metrics to trust)
type: concept
tags: [tts, evaluation, methodology, quality-control, technique]
keywords: [TTS evaluation, objective metrics, UTMOSv2, SQUIM, TTSDS, DNSMOS, speaker similarity, Wespeaker, metric panel, quality floor, long-form drift]
related:
  - sources/arxiv-2610-06057-turkish-tts-eval.md
  - concepts/asr-roundtrip-tts-eval-limits.md
  - concepts/best-of-k-speaker-verified-tts.md
  - concepts/persona-audio-stack.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-06-daily.md
maturity: draft
created: 2026-10-07
updated: 2026-10-07
---

## Relations

@sources/arxiv-2610-06057-turkish-tts-eval.md @concepts/asr-roundtrip-tts-eval-limits.md @concepts/best-of-k-speaker-verified-tts.md @concepts/persona-audio-stack.md @concepts/federated-daily-research-digest.md @sweeps/2026-10-06-daily.md

## Raw Concept

The question this page answers: when choosing between local voice-clone models, which objective numbers actually predict what an operator will hear? Synthesized from arXiv:2610.06057, an 18-metric evaluation of four modern zero-shot TTS systems.

## Narrative

**The problem.** Objective TTS metrics disagree with each other and with listeners. An operator picking a clone model from a leaderboard can easily pick wrong, because different metric families measure different things and some of them measure the wrong thing entirely.

**The finding that should change behaviour.** In a controlled study where four zero-shot TTS systems were compared against the **same speaker's real "gold" recordings**, several systems **scored higher than the real recordings** on signal-cleanliness predictors. A baseline reached DNSMOS-Pro 4.225 where the human gold audio scored 3.601. A metric that ranks synthetic audio above the genuine article is not measuring human-likeness — it is measuring cleanliness, and it rewards idealized, artefact-free audio.

**So treat those metrics as floors, not rankings.** Use them to catch a broken output (clipping, dropout, obvious noise) and not to declare a winner.

**The one metric to trust.** **Speaker similarity was the only dimension where the gold reference was reliably highest.** If a single number must drive a clone-model choice, use speaker similarity from a speaker-verification encoder — it is the metric that behaved correctly under a known-best control. This is consistent with, and reinforces, `@concepts/best-of-k-speaker-verified-tts.md`, where speaker-embedding similarity was also the useful signal for reranking candidates.

**Metric families and what they are for.** Group metrics deliberately rather than averaging them:

| Family | Examples | Use for |
|---|---|---|
| Learned naturalness | UTMOSv2, SCOREQ, NatScore, SpeechLMScore | relative naturalness, with care — can reward idealized audio |
| Signal / intelligibility | SQUIM (PESQ, SI-SDR, STOI), Brouhaha | catching broken output; a floor, not a rank |
| Speaker similarity | Wespeaker-class encoders | **the defensible clone-quality rank** |
| Distributional | TTSDS | aggregate similarity to real speech |
| Low-level acoustics | (varies) | debugging, not judging |

**Two axes that need stratifying.**

- **Utterance length.** Systems rank differently on short versus long input. One evaluated system won zero metrics in aggregate yet collapsed specifically on short utterances (SI-SDR 26.4 to 20.4). Short-prompt performance is a distinct capability, and short prompts are common in persona DM use.
- **Drift over time.** Track **identity drift** and **naturalness drift** separately on long narration. They are different failure modes — a voice can stay recognisable while its delivery degrades, or vice versa — and the evaluated systems differed in which they suffered from.

**How to use this.** Build a small panel rather than chasing one number: speaker similarity as the ranking metric, a signal metric as a pass/fail floor, and length-stratified runs to expose short-input weakness. This complements `@concepts/asr-roundtrip-tts-eval-limits.md`, which covers the same class of failure on the *recognition* side — metrics that pass while the thing they claim to measure is broken.

**Caveats.** The source study is objective-only (no human MOS) and single-speaker, so absolute scores are gold-relative and do not transfer across speakers or languages. The language was Turkish; the *metric behaviour* is the transferable claim, not the numbers. And the study evaluated four specific systems — treat it as evidence about metric trustworthiness, not as a general model ranking.

## Snippets

[Source: https://arxiv.org/abs/2610.06057 (retrieved 2026-10-07) — "several systems beat the gold reference on signal-clean predictors."]
