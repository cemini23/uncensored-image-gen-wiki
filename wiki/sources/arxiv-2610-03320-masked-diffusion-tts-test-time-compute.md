---
title: "Refinement buys intelligibility, search buys identity — test-time compute in masked-diffusion TTS (arXiv:2610.03320)"
type: source
tags: [paper, tts, voice-cloning, test-time-compute, scaling, watch]
keywords: [masked diffusion TTS, test-time compute, best-of-K, speaker verification, zero-shot TTS, Mimi codec, SoundStorm, scaling surface, intelligibility, identity]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-05-daily.md
  - concepts/best-of-k-speaker-verified-tts.md
  - concepts/persona-audio-stack.md
maturity: draft
read_status: skimmed
created: 2026-10-06
updated: 2026-10-06
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-05-daily.md @concepts/best-of-k-speaker-verified-tts.md @concepts/persona-audio-stack.md

## Raw Concept

- **Title**: Refinement Buys Intelligibility, Search Buys Identity: What Test-Time Compute Buys in Masked-Diffusion TTS
- **Type**: arXiv:2610.03320 (tensorViz; Nityanand Mathur et al.) — NeurIPS 2026 workshop (Diffusion Language Models)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.03320
- **Retrieved**: 2026-10-06

## Narrative

**What it actually is.** Zero-shot TTS — cross-sentence synthesis from a 3-second prompt plus text through a masked-diffusion codec LM. **It is a scaling study, not a new SOTA model.**

**The finding, stated plainly.** Inference-time refinement buys intelligibility far more than it buys speaker identity. On the paper's measurements, going from T=1 to T=16 closes **86.2%** of the reachable intelligibility range but only **46.4%** of the identity range — a 1.86x asymmetry. The ratio attenuates with training (1.84x / 1.36x / 1.23x at 30k / 90k / 180k steps), so more training narrows the gap that refinement alone cannot close.

**Search beats refinement on identity.** Best-of-K search at matched compute moves identity where refinement cannot: best-of-8 gains +0.0365 SIM over T=16 (at +0.0425 WER). Four independent speaker-encoder families confirm the win (64.6–79.0% per-item win rates).

**Two other operator-relevant numbers.** **62% of the remaining identity gap is the codec, not the model** — so swapping the codec caps how much any sampling change can buy. And **3 seconds is the optimal prompt length**; longer prompts hurt. Training compute is the single biggest identity lever (+0.0827 SIM from 30k to 90k steps).

**Method.** A bidirectional non-causal pre-LN Transformer over Mimi codec tokens (12.5 Hz, first 8 residual codebooks, 2048 entries), SoundStorm coarse-to-fine masking, cross-entropy on masked cells. An eSpeak phoneme prefix plus the 3s prompt stay visible; no speaker encoder and no CFG. A frozen MaskGIT confidence sampler runs at NFE=8T. The grid is 15 configs x 3 seeds, 30k steps, 2,000 h Emilia-EN, for 162.5 GPU-hours total. Models are 19–133M non-embedding parameters.

**Phase-0 (2026-10-06).** Released material is a harness, 45 run records, a 75-point surface and fit/bootstrap code, under HF handles `nityanandmathur/aspect-d` and `.../aspect-d-masked-diffusion-tts`. **No licence stated**, and the paper does not explicitly say the trained weights ship. Models are small and under-trained, English-only. **Verdict: WATCH-thin.** The models are not a replacement for the wiki's Layer-1 TTS stack, but `@concepts/best-of-k-speaker-verified-tts.md` — the best-of-K speaker-verified reranking heuristic — is directly usable.

## Snippets

[Source: https://arxiv.org/abs/2610.03320 (retrieved 2026-10-06) — refinement closes 86.2% of the intelligibility range vs 46.4% of identity.]
