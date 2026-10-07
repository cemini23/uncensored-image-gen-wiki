---
title: "Pronunciation-oriented RL for Japanese TTS via kana-domain rewards (arXiv:2610.07575)"
type: source
tags: [paper, tts, reinforcement-learning, pronunciation, japanese, watch]
keywords: [pronunciation RL, kanji reading, polyphony, kana domain, GRPO, Kana-Whisper, ASR reward, Sarashina2.2-TTS, Japanese TTS, CER]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-07-daily.md
  - concepts/persona-audio-stack.md
  - concepts/asr-roundtrip-tts-eval-limits.md
maturity: draft
read_status: skimmed
created: 2026-10-08
updated: 2026-10-08
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-07-daily.md @concepts/persona-audio-stack.md @concepts/asr-roundtrip-tts-eval-limits.md

## Raw Concept

- **Title**: Pronunciation-Oriented Reinforcement Learning for Japanese Text-to-Speech with Kana-Domain ASR Rewards
- **Type**: arXiv:2610.07575 (SB Intuitions Corp., Tokyo; Shiao Zhu, Lianbo Liu et al.)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.07575
- **Retrieved**: 2026-10-08

## Narrative

**The problem it targets.** Japanese **kanji polyphony** — choosing the correct reading of a character from context. The paper's insight is that **orthographic error rate is a poor proxy for this**, because several distinct readings collapse to the same kanji and one pronunciation can map to several valid orthographic forms. So the RL reward is computed in the **kana domain** instead, where the connection to pronunciation is direct.

**Method.** GRPO post-training applied to the **speech-token-generating autoregressive model** — the acoustic/language policy — with decoder and vocoder frozen. Base model is **Sarashina2.2-TTS**, a 0.5B LM. The reward is 1 − tanh(alpha·CER), where the kana comparison transcribes generated audio with **Kana-Whisper** (a Whisper fine-tuned to emit katakana) and compares against the reference reading; the baseline uses Whisper large-v3-turbo orthographically. Training used 129,965 utterances, 4,362 kanji-reading pairs over 2,129 distinct kanji, with G=16 completions and KL regularisation.

**Results.** Kana-CER on target kanji falls **9.65% to 7.17%** — a 25.7% relative reduction over the orthographic reward — while orthographic CER stays comparable (4.10 vs 4.15%). It also converges far faster: **4k steps versus 18k**. An independent wav2vec2-hiragana evaluator confirms the trend, and speaker similarity and objective quality are unchanged.

**Notable failure mode.** Without KL regularisation the kana objective **doubles output length**, which is exactly the kind of reward-hacking that makes an RL-TTS result unusable in production; the paper reports that KL suppresses it. Worth remembering as a general caution when reading RL speech results.

**Phase-0 (2026-10-08).** A benchmark repository exists at `github.com/sbintuitions/Joyo-Kanji-Yomi-Benchmark`, but the **TTS model and RL pipeline ship as neither code nor weights** — the base Sarashina2.2-TTS is not released. **No licence is stated.** Training used eight GPUs; VRAM is not stated.

**Verdict: WATCH-thin.** The transferable idea is conceptual: **compute the ASR reward in a domain where the metric matches the property you care about**, rather than in an orthographic proxy that blurs it. That generalises to any TTS evaluation, and it sits alongside `@concepts/asr-roundtrip-tts-eval-limits.md`. The implementation is not reusable locally — Japanese-only, needs reference pronunciations, and depends on a proprietary base model. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.07575 (retrieved 2026-10-08) — kana CER 9.65% to 7.17%, converging in 4k steps vs 18k.]
