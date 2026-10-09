---
title: "SRSP — speech-rewarded style planning for conversational TTS (arXiv:2610.11461)"
type: source
tags: [paper, tts, style-control, reinforcement-learning, watch]
keywords: [SRSP, style planner, GRPO, speech reward, frozen TTS likelihood, CosyVoice3, Qwen3.5, conversational TTS, CLAPScore, reward design]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-09-daily.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/cosyvoice2.md
maturity: draft
read_status: skimmed
created: 2026-10-09
updated: 2026-10-09
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-09-daily.md @concepts/persona-audio-stack.md @entities/voice-models/cosyvoice2.md

## Raw Concept

- **Title**: Beyond Speech Captions: Speech-Rewarded Style Planning for Conversational Text-to-Speech
- **Type**: arXiv:2610.11461 (Institute of Science Tokyo + others; Shiao Zhu et al.)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.11461
- **Retrieved**: 2026-10-09

## Narrative

**Clarifying the title.** "Speech-rewarded style planning" is **TTS style control** — not a reward model for speech, and not audio style transfer. A text-based *style planner* maps dialogue history plus response text to a natural-language style instruction for a downstream TTS model.

**Method.** The planner is Qwen3.5-9B with a rank-16 LoRA, trained with **GRPO**. The reward is the twist: it is the **teacher-forced likelihood of the target speech tokens under a frozen TTS model** (Fun-CosyVoice3-0.5B). In other words, the planner is rewarded for producing instructions that make the *actual synthesiser* likely to emit the right speech — not for a proxy like textual similarity.

**Why that matters.** The paper's finding is that **speech-text alignment weakly predicts downstream acoustic similarity** — a planner optimised for CLAPScore is optimising the wrong thing. Rewarding through the downstream model directly is the fix. That is a transferable reward-design lesson for any pipeline that plans in text and synthesises in another modality.

**Results.** It beats both the base LLM and privileged target-audio captioners (Audio Flamingo Next, Qwen3-Omni) on speech-to-speech, emotion cosine and MCD-DTW, across test-in and test-out, with 38 of 40 paired comparisons significant. Ground-truth speech is still preferred by the LLM judge. **No human listening test**, which the authors acknowledge.

**Phase-0 (2026-10-09).** **No code and no weights.** Requires the ISCSLP 2026 CoT-TTS corpus, Qwen3.5-9B and Fun-CosyVoice3. A 9B planner plus a 277-hour corpus plus GRPO makes this multi-GPU.

**Verdict: WATCH-thin.** The wiki's first *style-instruction planner*, and a different mechanism from the activation-steering entries — this is RL over text planning, no steering at all. The portable asset is the **reward trick**: use a frozen downstream synthesiser's token likelihood as the RL objective. It relates to `@entities/voice-models/cosyvoice2.md` via Fun-CosyVoice3. But CosyVoice3 already accepts natural-language style instructions, so most of the value is the method, not the artifact. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.11461 (retrieved 2026-10-09) — CLAPScore weakly predicts downstream acoustic similarity.]
