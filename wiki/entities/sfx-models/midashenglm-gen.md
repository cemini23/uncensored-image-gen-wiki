---
title: MiDashengLM-Gen — unified audio scene generation (Xiaomi)
type: entity
tags: [text-to-audio, sfx, music, speech, unified, flow-matching, watch]
keywords: [MiDashengLM-Gen, Xiaomi, Dasheng, audio-scene, mixed-audio, autoregressive, flow-matching, text-to-audio]
related:
  - sources/arxiv-2608-11804-midashenglm-gen.md
  - concepts/unified-audio-text-llm-no-text-regression.md
  - entities/sfx-models/stable-audio-open.md
  - concepts/persona-audio-stack.md
maturity: draft
created: 2026-08-13
updated: 2026-08-13
wire_status: deferred
phase0_verdict: WATCH
---

## Relations

@sources/arxiv-2608-11804-midashenglm-gen.md @concepts/unified-audio-text-llm-no-text-regression.md @entities/sfx-models/stable-audio-open.md @concepts/persona-audio-stack.md

## Raw Concept

Phase-0 from arXiv:2608.11804. End-to-end unified text-to-audio-scene: pre-trained LLM + audio tokenizer backbone, per-token conditional flow matching for autoregressive variable-length mixed-audio (speech + music + SFX).

## Narrative

| Field | Value |
|-------|-------|
| Org | MiLM Plus, Xiaomi + SJTU X-LANCE |
| Method | LLM sequence modeling + continuous flow-based latents (768-dim, 25 Hz); learned stop head; audio-text alignment pre-training |
| Tasks | Unified TTA scene gen (speech/music/SFX); multilingual |
| Results | Seed-TTS WER 12.15% → 2.79% (TTS ≈ 1.24%); competitive MECAT |
| Code | github.com/xiaomi-research/midashenglm-gen — **Apache-2.0** ✅, 302 KB |
| Weights | HF `mispeech/midashenglm-gen` ≈ **11 GB** (3 shards) — above 500 MB local-adopt threshold |
| Phase-0 | **GO (code) / WATCH (full stack)** |
| Phase-1 | Image-gen local wire: none (`deferred`) |

Code is clean and tiny (infer.py/models/pyproject + uv.lock) but unusable without the 11 GB weights + GPU. Distinctive: best-in-class speech intelligibility for a unified TTA — relevant to persona audio-scene work if weights ever get quantized / distilled to laptop scale. Keep on watch vs Stable Audio Open / ACE-Step / AudioLDM.

## Snippets

_(none)_
