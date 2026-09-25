---
title: "EditVoice (arXiv:2609.29889)"
type: source
tags: [paper, tts, voice, watch]
keywords: [zero-shot TTS, non-autoregressive, speech editing, edit flows, variable length]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/persona-audio-stack.md
  - sweeps/2026-09-25-daily.md
  - entities/voice-models/editvoice.md
maturity: draft
read_status: deep-read
created: 2026-09-25
updated: 2026-09-25
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @concepts/persona-audio-stack.md @sweeps/2026-09-25-daily.md @entities/voice-models/editvoice.md

## Raw Concept

- **Title**: EditVoice: Variable-Length Non-Autoregressive Zero-Shot TTS and Speech Editing with Edit Flows
- **Type**: arXiv:2609.29889
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/ (archived 2026-09-25)
- **URL**: https://arxiv.org/abs/2609.29889
- **Retrieved**: 2026-09-25

## Narrative

EditVoice (authors incl. Qingyang Hong) is **NAR zero-shot TTS + text-based speech editing** without fixing output length before sampling. Core mechanism: **Edit Flows** — parallel updates via **insert / delete / substitute** on speech tokens so **content and duration co-evolve**.

**Training:** random-span **speech infilling** on **~10k h GigaSpeech** unifies ZS-TTS and localized edits; supports **prefix or suffix** reference prompt placement at inference. **Complementary Prompt Sampling (CPS)** merges complementary Edit-Flow predictions from both placements.

**Inference tricks:** edits **recorded and model-generated** speech beyond training corpus (training-free **post-generation refinement**). Benchmarks: **Seed-TTS Eval EN**, **LibriSpeech-PC** (ZS-TTS), **RealEdit** (editing). Demo: https://dhy02.github.io/editvoice-demo/

Persona ops angle: patch mis-read lines or insert ad-lib clauses without full Fish-Speech re-roll. Phase-0: **no SPDX repo** — **no clone**. Image-gen Phase-1: **none**.


## Snippets

- "EditVoice … uses Edit Flows to jointly update speech content and sequence length through insertions, deletions, and substitutions." [Source: arXiv 2609.29889]
- "Complementary Prompt Sampling (CPS) to leverage the complementary Edit Flow predictions induced by the two prompt placements." [Source: arXiv HTML 2609.29889 §3.2]
- "Trained on 10K h of GigaSpeech … competitive zero-shot TTS … on Seed-TTS Eval EN and LibriSpeech-PC and speech editing … on RealEdit." [Source: arXiv HTML 2609.29889 abstract]
- Audio samples: https://dhy02.github.io/editvoice-demo/ [Source: arXiv comments 2609.29889]
