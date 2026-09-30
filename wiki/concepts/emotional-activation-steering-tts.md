---
title: Emotional activation steering for TTS (training-free emotion control)
type: concept
tags: [tts, voice-cloning, emotion, activation-steering, technique]
keywords: [emotion steering, activation steering, shared-residual decomposition, CoCoEmo, EmoRES-TTS, IndexTTS-2, CosyVoice2, training-free control, mixed emotion]
related:
  - sweeps/2026-09-30-daily.md
  - entities/voice-models/emores-tts.md
  - sources/arxiv-2609-38157-emores-tts.md
  - entities/voice-models/indextts-2.md
  - entities/voice-models/cosyvoice2.md
  - concepts/activation-steering-video-generation.md
maturity: draft
created: 2026-09-30
updated: 2026-09-30
---

## Relations

@sweeps/2026-09-30-daily.md @entities/voice-models/emores-tts.md @sources/arxiv-2609-38157-emores-tts.md @entities/voice-models/indextts-2.md @entities/voice-models/cosyvoice2.md @concepts/activation-steering-video-generation.md

## Raw Concept

The question this page answers: how do you make an existing voice-clone model express a chosen emotion, per clip, without fine-tuning it? Synthesized from arXiv:2609.38157 (EmoRES-TTS) and the wiki's existing activation-steering coverage.

## Narrative

**The problem.** A zero-shot voice clone reproduces the timbre of a reference clip, but emotion control is weak. Prompting helps inconsistently. Fine-tuning per emotion is expensive and destroys the base model's cloning quality. For a persona pipeline that needs a happy clip, then a sad clip, then an angry clip from the same voice, neither is practical.

**The technique.** Steering vectors are mean-difference directions extracted from paired neutral and emotional utterances. At inference, the vector is added to the activations at the attention output of selected layers. No gradients and no weight updates — one forward pass caches the activations, and the steering is a cheap addition afterward.

**The shared/residual split.** The key refinement is to decompose the steering vector into two parts and weight them separately:

- **Shared component** (coefficient lambda_c) — the neutral to emotional centroid direction. This carries the general "this is emotional speech" shift.
- **Residual component** (coefficient lambda_r) — the centroid to the requested emotion direction. This carries *which* emotion.

Setting lambda_c = lambda_r = 1 reproduces the earlier CoCoEmo method. Decoupling them lets the operator amplify the specific emotion without over-applying the generic emotional shift. The reported best operating point is lambda_r = 3, alpha = 5, with all arms norm-matched.

**Mixed emotions.** Because the residual is a direction, several emotion residuals can be combined with a proportion vector — useful for "mostly calm, slightly amused" deliveries.

**Vector quality depends on data.** The vectors are built from paired neutral/emotional corpora (ESD, CREMA-D, RAVDESS), gated by a speech-emotion recognizer and a quality filter. The corpus licence therefore propagates: IEMOCAP is licence-gated, while CREMA-D and RAVDESS are open for research. An operator who extracts their own vectors from open corpora owns the result; one who uses the published vectors inherits the upstream licence.

**Where it fits in this wiki.** The worked implementation is `@entities/voice-models/emores-tts.md`, which is **CC BY-NC 4.0** and therefore blocked for the commercial persona track. The method is portable to any backbone that exposes attention outputs; the two verified backbones are `@entities/voice-models/indextts-2.md` and `@entities/voice-models/cosyvoice2.md`. This is the audio-side analogue of `@concepts/activation-steering-video-generation.md`.

**Operator caveats.** The paper reports a word-error-rate rise at lambda_r = 3, so high emotion strength trades against intelligibility. Steering is applied at layers chosen per backbone (IndexTTS-2 layers 1/6/8; CosyVoice2 layers 14/17) — those layer indices do not transfer to other models and must be re-tuned.

## Snippets

[Source: https://arxiv.org/abs/2609.38157 (retrieved 2026-09-30) — IEMOCAP rank correlation 22.00 to 48.13 on IndexTTS-2; 39.13 to 52.10 on CosyVoice2.]
