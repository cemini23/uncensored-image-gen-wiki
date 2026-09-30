---
title: EmoRES-TTS (Meta FAIR — training-free emotion steering for TTS)
type: entity
tags: [voice-cloning, tts, emotion, activation-steering, cc-by-nc, reference-only]
keywords: [EmoRES-TTS, CoCoEmo, emotion steering, activation steering, IndexTTS-2, CosyVoice2, Meta FAIR, training-free, non-commercial]
related:
  - sweeps/2026-09-30-daily.md
  - concepts/emotional-activation-steering-tts.md
  - sources/arxiv-2609-38157-emores-tts.md
  - entities/voice-models/indextts-2.md
  - entities/voice-models/cosyvoice2.md
maturity: draft
created: 2026-09-30
updated: 2026-09-30
phase0_verdict: WATCH
wire_status: wont_wire
wire_target: none — CC BY-NC 4.0 blocks the commercial persona track
---

## Relations

@sweeps/2026-09-30-daily.md @concepts/emotional-activation-steering-tts.md @sources/arxiv-2609-38157-emores-tts.md @entities/voice-models/indextts-2.md @entities/voice-models/cosyvoice2.md

## Raw Concept

Page prompted by the 2026-09-30 ingest of arXiv:2609.38157. Fills the gap for emotion-controllable local TTS — the wiki already covered the two backbones it steers, but had no page for a training-free emotion-steering layer on top of them.

## Narrative

**What it is.** A thin training-free layer that makes an existing TTS backbone follow an emotion instruction more closely. It is not a standalone TTS model: it derives steering vectors for a backbone and injects them at inference.

**How it works.** An emotion steering vector is split into two parts — a **shared** component (the neutral to emotional centroid) and a **residual** (the centroid to the requested emotion) — with separate coefficients lambda_c and lambda_r. The prior CoCoEmo method is the special case lambda_c = lambda_r = 1. Vectors are mean-difference directions from paired neutral/emotional utterances (ESD, CREMA-D, RAVDESS), filtered by a speech-emotion recognizer and a quality gate. Steering injects at the attention output of selected layers — IndexTTS-2 layers 1/6/8, CosyVoice2 layers 14/17. Mixed emotions use a proportion vector. There are no gradients and no weight updates; one forward pass caches the activations.

**Reported gains.** Out-of-distribution IEMOCAP rank correlation rises from 22.00 to 48.13 on IndexTTS-2 and 39.13 to 52.10 on CosyVoice2. Human dominant-emotion hit rate rises to 73.89% and 77.88%. Naturalness is preferred in 63.80% and 60.32% of comparisons. Cost at lambda_r = 3: a small speaker-similarity drop and a higher word-error rate.

**Backbone dependencies.** `@entities/voice-models/indextts-2.md` and `@entities/voice-models/cosyvoice2.md` — both already operator-runnable locally. The best operating point is lambda_r = 3, alpha = 5, norm-matched.

**Licence — the blocker (Phase-0, 2026-09-30).** Repo `github.com/facebookresearch/EmoRES-TTS` is **CC BY-NC 4.0, non-commercial use only**. It is also a thin layer over **CoCoEmo**, which is a required dependency and is *not* vendored, so the vectors come from a separate repository. The repo has 7 stars and 2 commits. **Verdict: `wont_wire` for the persona-monetization track** — a non-commercial licence ends the commercial path. The *technique* stays relevant, and an operator who extracts their own vectors from open corpora (CREMA-D, RAVDESS are open for research; IEMOCAP is licence-gated) can reuse the method without the licence.

## Snippets

[Source: github.com/facebookresearch/EmoRES-TTS (retrieved 2026-09-30) — "CC BY-NC 4.0, see LICENSE. Non-commercial use only. Third-party models and corpora remain under their own licences."]
[Source: https://arxiv.org/abs/2609.38157 (retrieved 2026-09-30)]
