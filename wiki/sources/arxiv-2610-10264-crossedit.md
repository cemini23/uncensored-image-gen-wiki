---
title: "CrossEdit — omni-modal audio-visual editing (arXiv:2610.10264)"
type: source
tags: [paper, audio-visual, editing, dubbing, watch]
keywords: [CrossEdit, omni-modal editing, audio-visual editing, mixture of experts, DiT, CrossEditBench, AV-FES, Adobe, lip-sync, zero-shot]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-08-daily.md
  - concepts/joint-audio-visual-instruction-editing.md
maturity: draft
read_status: skimmed
created: 2026-10-09
updated: 2026-10-09
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-08-daily.md @concepts/joint-audio-visual-instruction-editing.md

## Raw Concept

- **Title**: CrossEdit: Cross-Modal Training Enables Rich Audio-Visual Editing
- **Type**: arXiv:2610.10264 (Adobe Research + CMU; William Chen, Prem Seetharaman, Ke Chen, Oriol Nieto et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.10264-crossedit-cross-modal-training-enables-rich-audi.pdf (archived 2026-10-09)
- **URL**: https://arxiv.org/abs/2610.10264
- **Retrieved**: 2026-10-09

## Narrative

**What it does.** One omni-modal model edits **image, audio and video together** from free-form instructions, and does it **zero-shot** on real movie scenes. The claim is that complex instruction-following learned in one modality transfers to the others.

**Method.** A DiT mixture-of-experts backbone (3B active, 12B total) trained with flow matching, using pretrained audio and visual VAEs and Qwen3-VL semantic embeddings. Three data sources teach editing: mined lip-synced speech pairs, synthetic audio edit pairs, and audio-visual masked reconstruction. At inference the model must **decide for itself** which modalities to edit and what to keep in sync — that autonomy is the interesting part.

**Results.** Best AV-FES 0.30, against 0.23 for MiniMax H3 (33B) and 0.20 for InstructAV2AV. The human ablation is the revealing one: base 0.26, then **+audio data 0.35**, then **+AV masked reconstruction 0.43** — so the audio-visual reconstruction objective contributes more than the audio pairs. Lip-synced speech reaches WER 10.9 and speaker similarity 88.5.

**Phase-0 (2026-10-09).** The authors state plainly that they will **not open-source code or checkpoints**, citing deepfake risk; the base checkpoint is internal. Only CrossEditBench (100 annotated movie clips) and the judge prompts are promised. Training was about 2.5 days on 64 H100s.

**Verdict: WATCH-thin.** On-topic for joint AV editing (`@concepts/joint-audio-visual-instruction-editing.md`), and the deliberate non-release is a responsible call rather than a gap. But a 12B omni-modal model is past 24 GB and the checkpoint is unavailable, so the reusable parts are the **benchmark and the AV-FES metric**, not the model. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.10264 (retrieved 2026-10-09) — AV-FES 0.30 vs 0.23 MiniMax H3 33B; authors decline to release checkpoints citing deepfake risk.]
