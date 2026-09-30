---
title: "RGOR — reference-grounded oral refinement for audio-driven portrait animation (arXiv:2609.38019)"
type: source
tags: [paper, lipsync, evaluation, watch]
keywords: [RGOR, Beyond Lip Sync, oral refinement, LatentSync leakage, NeRSemble, benchmark leakage, reference-grounded]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-30-daily.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/complexsync.md
maturity: draft
read_status: skimmed
created: 2026-09-30
updated: 2026-09-30
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-30-daily.md @entities/lipsync/latentsync.md @entities/lipsync/complexsync.md

## Raw Concept

- **Title**: Beyond Lip Sync: Reference-Grounded Oral Refinement for Audio-Driven Portrait Animation
- **Type**: arXiv:2609.38019 (UC Irvine; Bangxun Tang, single author)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2609.38019-beyond-lip-sync-reference-grounded-oral-refineme.pdf (pending egress archive — SSH denied in session)
- **URL**: https://arxiv.org/abs/2609.38019
- **Retrieved**: 2026-09-30

## Narrative

**Method.** Audio-driven lipsync that aims to render *the specific person's* lips and teeth instead of an averaged mouth. It builds on LatentSync-1.6 (3D UNet, 512x512, F=16 windows, Whisper cross-attention, frozen VAE) and adds four changes: scattered enrollment references taken one per output frame from a teeth-scored bank; four full-resolution HD mouth patches that bypass the VAE through a reference encoder plus gated attention adapters; a reference-contrastive paired judge (ResNet-18 over grey high-passed oral crops, with other people's real mouths as negatives); and a Dice shape term from a frozen SegFormer face parser. Inference runs 20 steps with overlapping windows fused.

**Results.** On held-out NeRSemble (50 identities, 100 clips) it reports the best oral LPIPS 0.297 and DISTS 0.163, against LatentSync-1.6 (0.334 / 0.234) and Wav2Lip (0.473 / 0.340). It fails on fast head turns and low-resolution enrollment, and it loses to LatentSync on out-of-distribution HDTF. Training used 4x RTX 5090 32GB, fp16, 1,750 updates, peak 21.2 GiB per GPU.

**The actionable finding is the leak, not the model.** The paper reports that the *released* inference code of Wav2Lip, LatentSync and MuseTalk all references the frame being edited. That inflates their paired scores. Corrected numbers for LatentSync are LPIPS 0.334 to 0.262 and DISTS 0.234 to 0.189. An operator who compares local lipsync models must not trust the published paired metrics.

**Phase-0 (2026-09-30).** No repository, no weights, no licence — the paper lists citations only. Trained solely on NeRSemble studio faces. **Not buildable locally.** Tracked because the evaluation caveat changes how the existing lipsync entity pages should be read.

## Snippets

[Source: https://arxiv.org/abs/2609.38019 (retrieved 2026-09-30)]
