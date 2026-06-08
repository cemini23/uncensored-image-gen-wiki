---
title: OmniCustom (sync audio-video customization model)
type: entity
tags: [model, audio-video, customization, dit, research]
keywords: [OmniCustom, OVI, reference LoRA, sync AV, OmniCustom-1M, zero-shot]
related:
  - sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
  - concepts/sync-audio-video-customization.md
  - concepts/persona-audio-stack.md
  - concepts/video-identity-inheritance.md
  - entities/models/wan-2-2.md
  - entities/lipsync/latentsync.md
  - concepts/multi-shot-audio-video-evaluation.md
  - sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md
maturity: draft
created: 2026-06-01
updated: 2026-06-08
phase_0_verdict: CONDITIONAL-GO
phase_0_date: 2026-06-05
provenance:
  stub: true
---

## Relations

@sources/arxiv-omnicustom-sync-audio-video-2602-12304.md @concepts/sync-audio-video-customization.md @concepts/persona-audio-stack.md @concepts/video-identity-inheritance.md @entities/lipsync/latentsync.md

## Raw Concept

Phase-0 audit 2026-06-05 — `OmniCustom-project/OmniCustom` + arXiv:2602.12304.

## Narrative

Sync audio-video customization on **OVI** backbone: reference image + reference audio + text → identity-locked video + timbre-matched speech + optional SFX.

### Phase-0 audit [CONFIRMED 2026-06-05]

| Check | Result |
|-------|--------|
| Repo | github.com/OmniCustom-project/OmniCustom — 422★, inference code + weights Feb 2026 |
| VRAM | **80 GB single GPU** peak per README |
| Stack | OVI + Wan2.2-TI2V-5B + MMAudio + InsightFace + NaturalSpeech3 facodec deps |
| vs persona stack | Replaces Fish-Speech → Wan → LatentSync → FFmpeg mux in **one pass** — if hardware allows |
| ComfyUI | None — CLI `inference.sh` only |
| MPS | CUDA + flash-attn; not laptop-viable |

**Verdict: CONDITIONAL-GO** — **cloud-burst research track only** on this workspace until sub-24GB quant path appears.

## Dead Ends

Local 4090/ Mac Studio deployment at stated 80 GB requirement.
