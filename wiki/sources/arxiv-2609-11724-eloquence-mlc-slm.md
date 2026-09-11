---
title: "Eloquence MLC-SLM submission (arXiv:2609.11724)"
type: source
tags: [paper, speech, benchmark, watch]
keywords: [speech-llm, MCQA, Voxtral, multilingual]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-11-daily.md
  - concepts/persona-audio-stack.md
maturity: draft
read_status: skimmed
created: 2026-09-11
updated: 2026-09-11
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-11-daily.md @concepts/persona-audio-stack.md

## Raw Concept

- **Title**: The Eloquence submission for Task 2 of the Interspeech 2026 MLC-SLM challenge
- **Type**: arXiv:2609.11724 [cs.CL]
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/
- **URL**: https://arxiv.org/abs/2609.11724
- **Code**: none found
- **Retrieved**: 2026-09-11

## Narrative

The paper describes the Eloquence team entry for Task 2 of the second MLC-SLM challenge. The task is multilingual multiple-choice question answering over real conversational speech in 21 languages. The team tests three systems: LoRA fine-tuning of Voxtral-Mini-3B, in-context learning on a frozen Voxtral-24B, and a training-free retrieval system with a voice-anchored memory. The work is a speech-understanding benchmark entry, so it gives context on speech-LLM limits but no model, code, or weights for this wiki. Image-gen Phase-1: none.

## Snippets

> Second, we apply multimodal in-context learning (ICL) to the frozen Voxtral-24B model to correct a strong label bias, reaching 0.81, our best result. [Source: arxiv-2609.11724]
