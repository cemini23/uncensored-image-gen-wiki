---
title: "Loud and Clear — prompt-relative activation steering for intelligibility (arXiv:2610.07647)"
type: source
tags: [paper, tts, activation-steering, intelligibility, training-free, watch]
keywords: [Loud and Clear, Lombard effect, activation steering, prompt-relative steering, Qwen3-TTS, intelligibility, noisy environments, hyper-articulation, vocal effort]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-07-daily.md
  - concepts/prompt-relative-activation-steering.md
  - concepts/emotional-activation-steering-tts.md
  - entities/voice-models/qwen3-tts.md
  - concepts/persona-audio-stack.md
  - concepts/best-of-k-speaker-verified-tts.md
maturity: draft
read_status: skimmed
created: 2026-10-08
updated: 2026-10-08
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-07-daily.md @concepts/prompt-relative-activation-steering.md @concepts/emotional-activation-steering-tts.md @entities/voice-models/qwen3-tts.md @concepts/persona-audio-stack.md @concepts/best-of-k-speaker-verified-tts.md

## Raw Concept

- **Title**: Loud and Clear: Dynamic Activation Steering for Improving Speech Intelligibility in Noisy Environments
- **Type**: arXiv:2610.07647 (KIT / KIT Campus Transfer + CMU; Seymanur Akti, Alexander Waibel)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.07647
- **Retrieved**: 2026-10-08

## Narrative

**The target.** Speech that stays intelligible when played over background noise. The paper induces **Lombard-effect speech** — the increased vocal effort and hyper-articulation people produce naturally in loud rooms — by steering activations in a TTS model at inference time. **No weight update.**

**The mechanism, which is the interesting part.** Steering directions are mean hidden-state differences from paired data: EARS loud/regular (vocal effort, 107 speakers) and Expresso enunciated/default (hyper-articulation, 4 speakers), combined as a joint direction. The novelty is **Prompt-Relative Activation Steering**: a plain steering vector accumulates token over token in autoregressive generation, so the output drifts. This method first computes the baseline projection of the reference-prompt tokens onto the unit direction, sets the target projection at baseline plus the vector norm, and applies the **signed residual** per generated token, then renormalises. Steering touches only layers 19-20 and only generated tokens, and it is streaming-compatible.

**Results.** Word-error rate under restaurant-babble noise drops **7-22% at 1 dB SNR**, across seen and unseen speakers in English, German, Spanish and Japanese. Speaker similarity is preserved at **89-95%**. Human CMOS is **+0.958 ± 0.48** at 5 dB SNR. Latency cost is negligible (time-to-first-audio 0.474 s vs 0.469 s; RTF 1.088 vs 1.078). It matches a *trained* Lombard baseline without training.

**What is new versus the emotional-steering lineage.** Both the target and the mechanism differ. `@concepts/emotional-activation-steering-tts.md` steers **emotion** with **static shared/residual decomposition** and fixed coefficients; this steers **intelligibility** with a **per-token prompt-relative projection that can un-steer mid-generation**. The word "residual" is overloaded between the two and means different things. The two also compose usefully: the emotional page notes that strong emotion steering *raises* WER, while this method steers specifically to *lower* WER in noise. It also transfers to unseen speakers and languages, where the emotional vectors needed per-backbone re-tuning of layer indices.

**Phase-0 (2026-10-08).** Base model is **Qwen3-TTS**, which is open, local and Apache-2.0 per `@entities/voice-models/qwen3-tts.md`. **No code repository, no weights and no stated licence** — only a demo page (`seymanurakti.github.io/loud-and-clear/`). Compute is not stated, but the method is training-free: extracting vectors needs paired corpora, not gradients, so an operator can re-extract their own from open datasets.

**Verdict: WATCH-full** — training-free, applies to an open local TTS already in the wiki, and directly attacks the token-accumulation problem. See `@concepts/prompt-relative-activation-steering.md`. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.07647 (retrieved 2026-10-08) — WER drops 7-22% at 1 dB SNR with speaker similarity preserved at 89-95%.]
