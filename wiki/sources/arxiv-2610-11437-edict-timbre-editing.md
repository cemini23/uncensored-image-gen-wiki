---
title: "EDICT — global timbre editing + local instruction control for TTS (arXiv:2610.11437)"
type: source
tags: [paper, tts, voice-editing, instruction-control, watch]
keywords: [EDICT, timbre editing, local instruction control, KV cache rebuild, Qwen3-TTS, CosyVoice2, WavLM reward, DPO, IntraTTS-Bench, segment control]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-09-daily.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/cosyvoice2.md
  - entities/voice-models/qwen3-tts.md
maturity: draft
read_status: skimmed
created: 2026-10-09
updated: 2026-10-09
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-09-daily.md @concepts/persona-audio-stack.md @entities/voice-models/cosyvoice2.md @entities/voice-models/qwen3-tts.md

## Raw Concept

- **Title**: Edit Who Speaks, Control How They Speak: Global Timbre Editing and Local Instruction Control for TTS
- **Type**: arXiv:2610.11437 (National University of Singapore + LIGHTSPEED + NTU; Junchuan Zhao et al.)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.11437
- **Retrieved**: 2026-10-09

## Narrative

**Title correction worth recording.** Despite "Edit Who Speaks", this is **not** multi-speaker dialogue editing or dubbing. It is **single-speaker TTS** where "who" means voice *identity/timbre* and "how" means prosody and delivery. Filed to prevent a future re-triage believing it is a dubbing paper.

**What it does.** Two capabilities in one framework. **Global timbre editing** modifies a source voice via a relative instruction across nine attributes (gender, age, pitch, brightness, vocal weight, resonance, roughness, breathiness, nasality). **Local instruction control** applies per-segment delivery without the control leaking across the utterance.

**Method.** A trainable editor initialised from Qwen3-TTS-Base (SFT then reward-weighted DPO with a WavLM speaker-cosine reward) produces an edited codec reference from the source codec plus a global instruction. That reference anchors a **frozen** TTS backbone — Qwen3-TTS-VoiceDesign or CosyVoice 2. The interesting mechanism is at segment boundaries: the backbone **rebuilds its KV cache** from the first S tokens plus the recent K, so a new instruction takes effect without control leakage from the previous segment. Training used about 1M synthesised pairs at 24 kHz.

**Results.** On IntraTTS-Bench with Qwen3-TTS-VD, EDICT-Stage II reaches segment accuracy 82.30 / emotion 83.60 / transition 82.00, against 74.25 / 74.02 / 78.03 for TED-TTS. Joint control gives speaker similarity 0.788 (WavLM) and 0.609 (ERes2Net). With 19 listeners it was the top instruction-following system at Stage I.

**Phase-0 (2026-10-09).** **Nothing ships** — no GitHub or HF repository, only a demo page, no licence, and code, weights and dataset all appear unreleased. The strong results depend on the **Qwen3-TTS-VoiceDesign vendor checkpoint**.

**Verdict: WATCH-thin.** It is on-domain for the voice lane and **CosyVoice 2 is a backbone this wiki already tracks** (`@entities/voice-models/cosyvoice2.md`, `@entities/voice-models/qwen3-tts.md`). The transferable idea is the **KV-cache rebuild for time-varying control within one utterance** — a clean solution to control leakage, and relevant to any pipeline that wants a persona's delivery to change mid-clip. But nothing is runnable today. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.11437 (retrieved 2026-10-09) — KV cache rebuilt from first S + recent K tokens at each segment boundary.]
