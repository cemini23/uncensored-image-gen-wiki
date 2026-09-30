---
title: "EmoRES-TTS — residual-enhanced vector steering for emotional TTS (arXiv:2609.38157)"
type: source
tags: [paper, tts, emotion, activation-steering, watch]
keywords: [EmoRES-TTS, CoCoEmo, emotion steering vector, activation steering, IndexTTS-2, CosyVoice2, Meta FAIR, training-free]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-30-daily.md
  - entities/voice-models/emores-tts.md
  - concepts/emotional-activation-steering-tts.md
  - entities/voice-models/indextts-2.md
  - entities/voice-models/cosyvoice2.md
maturity: draft
read_status: skimmed
created: 2026-09-30
updated: 2026-09-30
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-30-daily.md @entities/voice-models/emores-tts.md @concepts/emotional-activation-steering-tts.md @entities/voice-models/indextts-2.md @entities/voice-models/cosyvoice2.md

## Raw Concept

- **Title**: EmoRES-TTS: Residual-Enhanced Vector Steering for Emotional Speech Generation
- **Type**: arXiv:2609.38157 (Meta — Reality Labs / FAIR; Kuan-Po Huang et al., with NTU)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2609.38157-emores-tts-residual-enhanced-vector-steering-for.pdf (pending egress archive — SSH denied in session)
- **URL**: https://arxiv.org/abs/2609.38157
- **Retrieved**: 2026-09-30

## Narrative

**Training-free emotion steering for TTS.** The paper decomposes an emotion steering vector into a *shared* component (neutral to emotional centroid) and a *residual* (centroid to the requested emotion). Two independent coefficients, lambda_c and lambda_r, weight the parts separately; the prior CoCoEmo method is the special case lambda_c = lambda_r = 1.

Vectors are mean-difference directions extracted from paired neutral/emotional utterances (ESD, CREMA-D, RAVDESS), gated by both a speech-emotion recognizer and a quality filter. Steering injects at the attention output of selected layers — IndexTTS-2 layers 1/6/8, CosyVoice2 layers 14/17. Mixed emotions use a proportion vector. One forward pass caches activations; there are no gradients and no weight updates. The best reported setting is lambda_r = 3, alpha = 5, with all arms norm-matched.

**Results.** On the out-of-distribution IEMOCAP set, rank correlation rises from 22.00 to 48.13 (+118.8% relative) on IndexTTS-2, and from 39.13 to 52.10 (+33.1%) on CosyVoice2. Human raters put dominant-emotion hit rate at 73.89% and 77.88%, up from 54.72% and 58.18%. Naturalness is preferred 63.80% / 60.32%. The gains hold across three speech-emotion-recognition judges. The cost is a small speaker-similarity drop and a word-error-rate rise at lambda_r = 3.

**Phase-0 (2026-09-30).** Repo `github.com/facebookresearch/EmoRES-TTS` is **CC BY-NC 4.0 — non-commercial use only**, with only 7 stars and 2 commits. It is a thin layer over CoCoEmo, which is a required dependency and is **not** vendored, so the steering vectors must be fetched separately. Both backbones are already covered in this wiki. **Verdict: technique WATCH, adoption NO-GO for the persona-monetization track** — the non-commercial weight/code licence ends the commercial path, though the method itself is portable if an operator extracts their own vectors.

## Snippets

[Source: https://arxiv.org/abs/2609.38157 (retrieved 2026-09-30)]
[Source: https://github.com/facebookresearch/EmoRES-TTS (retrieved 2026-09-30) — "CC BY-NC 4.0, see LICENSE. Non-commercial use only."]
