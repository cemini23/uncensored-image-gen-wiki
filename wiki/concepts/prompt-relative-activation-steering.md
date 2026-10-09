---
title: Prompt-relative activation steering (stopping token-over-token accumulation)
type: concept
tags: [tts, activation-steering, technique, training-free, control]
keywords: [prompt-relative steering, signed residual, token accumulation, steering drift, activation steering, Lombard effect, intelligibility, autoregressive control, baseline projection]
related:
  - sources/arxiv-2610-07647-loud-and-clear-intelligibility-steering.md
  - concepts/emotional-activation-steering-tts.md
  - entities/voice-models/qwen3-tts.md
  - concepts/persona-audio-stack.md
  - sweeps/2026-10-07-daily.md
  - concepts/federated-daily-research-digest.md
  - sources/arxiv-2610-10415-steerspeech.md
maturity: draft
created: 2026-10-08
updated: 2026-10-08
---

## Relations

@sources/arxiv-2610-07647-loud-and-clear-intelligibility-steering.md @concepts/emotional-activation-steering-tts.md @entities/voice-models/qwen3-tts.md @concepts/persona-audio-stack.md @sweeps/2026-10-07-daily.md @concepts/federated-daily-research-digest.md @sources/arxiv-2610-10415-steerspeech.md

## Raw Concept

The question this page answers: activation steering works on a single forward pass, but autoregressive generation applies it repeatedly — so why does the effect run away, and what fixes it? Synthesized from arXiv:2610.07647 (Loud and Clear).

## Narrative

**The problem with naive steering in an autoregressive model.** Steering adds a fixed direction to the hidden state at selected layers. In a single-pass model that is a one-time nudge. In an autoregressive model every generated token runs the steered forward pass, and the next token conditions on the already-steered output — so the perturbation **compounds**. The result is drift: a strength setting that produces the intended effect for the first few tokens produces something else by the end. `@concepts/emotional-activation-steering-tts.md` sidesteps this by using static vectors with fixed coefficients; it works, but the effect is not independently controllable per token and cannot be turned off mid-utterance.

**The technique.** Hold the steering **relative to the prompt rather than to the running state**.

1. Compute a baseline projection: project the hidden states of the *prompt* tokens onto the unit steering direction. That is the model's natural resting value for this direction on this input.
2. Set a **target projection** at baseline plus the steering vector's norm — a fixed absolute level, not a per-step increment.
3. For each generated token, apply the **signed residual** between the target projection and the token's current projection, then renormalise.

Because the target is an absolute level rather than an accumulating increment, a token that already sits at the target receives no further push. Accumulation stops by construction.

**What this buys an operator.**

- **Stable strength.** A coefficient means the same thing at token 1 and token 400.
- **Mid-utterance control.** Because each token is corrected toward a target, the coefficient can be changed — or zeroed — partway through generation, giving within-utterance dynamics. That is what "dynamic" in the paper's title refers to.
- **Streaming compatibility.** It works one token at a time, so it suits a streaming TTS path.

**Evidence in the source application.** Steered toward Lombard-style hyper-articulation, word-error rate under restaurant-babble noise falls **7-22% at 1 dB SNR** across seen and unseen speakers in four languages, with speaker similarity preserved at 89-95% and human CMOS +0.958. Time-to-first-audio is essentially unchanged (0.474 s vs 0.469 s). It matches a *trained* Lombard baseline without any training.

**How it differs from the sibling concept.** Both pages concern training-free activation steering on TTS, but they solve opposite problems and the word "residual" is overloaded between them:

| | `@concepts/emotional-activation-steering-tts.md` | This page |
|---|---|---|
| Target | emotion | intelligibility |
| Vector | shared + residual decomposition, fixed | one direction, applied prompt-relative |
| Time behaviour | static across the utterance | can vary per token, can un-steer |
| Failure addressed | over-applying the generic emotional shift | token-over-token accumulation |

They should compose: steer emotion with the decomposition method, steer delivery with this one — though the source paper did not test the combination, and the emotional page notes that strong emotion steering raises WER while this method exists to lower it.

**Operator caveats.** The base model in the source is **Qwen3-TTS** (`@entities/voice-models/qwen3-tts.md`), open and local, but **no code or weights were released** — adopting means reimplementing from the paper. Vector extraction needs paired corpora of the target behaviour (here, loud/regular and enunciated/default speech), which is the real cost; the steering itself is free. Layer choice was tuned per backbone (layers 19-20 here) and will not transfer unchanged to another model. And the method was demonstrated on intelligibility only — whether prompt-relative steering fixes accumulation for *emotion* vectors is untested.

## Snippets

[Source: https://arxiv.org/abs/2610.07647 (retrieved 2026-10-08) — target projection set at prompt baseline plus vector norm; signed residual applied per generated token.]
