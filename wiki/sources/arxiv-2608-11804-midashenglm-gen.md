---
title: "MiDashengLM-Gen: LLM-driven autoregressive flow matching for audio scenes (arXiv:2608.11804)"
type: source
tags: [paper, audio, tta, music, sfx, speech, unified, flow-matching, watch]
keywords: [MiDashengLM-Gen, Xiaomi, Dasheng, audio-scene, mixed-audio, autoregressive, flow-matching, text-to-audio, seed-tts]
related:
  - entities/sfx-models/midashenglm-gen.md
  - concepts/unified-audio-text-llm-no-text-regression.md
  - entities/sfx-models/stable-audio-open.md
  - concepts/persona-audio-stack.md
  - sweeps/2026-08-13-daily.md
maturity: draft
read_status: read
created: 2026-08-13
updated: 2026-08-13
---

## Relations

@entities/sfx-models/midashenglm-gen.md @concepts/unified-audio-text-llm-no-text-regression.md @entities/sfx-models/stable-audio-open.md @concepts/persona-audio-stack.md @sweeps/2026-08-13-daily.md

## Raw Concept

- **Title**: MiDashengLM-Gen: Unified Audio Scene Generation via LLM-Driven Autoregressive Flow Matching
- **Authors**: Xingwei Sun, Heinrich Dinkel, Gang Li, et al. (MiLM Plus, Xiaomi Inc.; X-LANCE Lab, SJTU)
- **Type**: arXiv:2608.11804 [eess.AS] — technical report, early work
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.11804-midashenglm-gen-unified-audio-scene-generation-v.pdf`
- **URL**: https://arxiv.org/abs/2608.11804
- **Code**: https://github.com/xiaomi-research/midashenglm-gen
- **Weights**: https://huggingface.co/mispeech/midashenglm-gen (3 safetensors shards ≈ 11 GB)
- **Demo**: https://xingws.github.io/midashenglm-gen-demo/
- **Retrieved**: 2026-08-13

## Narrative

End-to-end unified text-to-audio-scene generation: pre-trained LLM + audio tokenizer backbone with per-token conditional flow matching, autoregressive variable-length output over 768-dim semantic-acoustic latents (25 Hz). On Seed-TTS benchmark English WER drops 12.15% → 2.79% (dedicated TTS ≈ 1.24%); competitive on MECAT. Extends to multilingual.

**Phase-0: GO (code) / WATCH (local stack).** Repo `xiaomi-research/midashenglm-gen` is Apache-2.0 ✅, tiny (302 KB code: infer.py / models / pyproject.toml, uv.lock). Weights on HF ≈ **11 GB** — above the 500 MB local-adopt threshold and needs GPU (audio-gen DiT-scale). So: code is clean and adoptable, full model is not laptop-local today. Follow-ups: check VRAM for Mac MPS (unlikely), 16 kHz output ceiling vs CosyVoice/ACE-Step, NSFW posture of mixed-scene generation. Phase-1: `deferred`.

## Snippets

> "MiDashengLM-Gen represents a first approach for general text-to-audio generation with one end-to-end trained model."

_[Source: arxiv-2608.11804, abstract]_
