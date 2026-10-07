---
title: "LipDA — lipsync forgery detection and attribution (arXiv:2610.08417) — routed cybersec"
type: source
tags: [paper, lipsync, forensics, deepfake-detection, routed, out-of-domain]
keywords: [LipDA, lipsync forensics, deepfake detection, source attribution, lip-pose coupling, head pose, LipSync-A dataset, LatentSync, generator fingerprint, ICML 2026]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-07-daily.md
  - entities/lipsync/latentsync.md
maturity: draft
read_status: skimmed
created: 2026-10-08
updated: 2026-10-08
phase0_verdict: ROUTE
wire_status: routed
route_target: "@cybersecurity-wiki"
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-07-daily.md @entities/lipsync/latentsync.md

## Raw Concept

- **Title**: Ariadne's Thread of LipSync: Unraveling Forgeries via Inconsistency between Lip Motions and Head Poses
- **Type**: arXiv:2610.08417 (USTC + SJTU + PKU + NTU; Tianyi She et al.) — ICML 2026
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.08417
- **Retrieved**: 2026-10-08

## Narrative

**What it is.** LipDA, a unified **lipsync detection and source-attribution** framework. It exploits the biological coupling between lip motion and head pose that lipsync generators break, and ships **LipSync-A** — 15 generators, 7 architectures, 16,000 labelled forged videos.

**Method.** Stage one for detection: a lip-ROI ResNet encoder and a 6-DoF head-pose landmark encoder are aligned by a margin contrastive loss (real pairs pulled together, fake pairs repelled). Stage two for attribution: an audio-visual cross-attention module plus a temporal CNN/Bi-LSTM over keypoints capture per-generator fingerprints, using MediaPipe landmarks.

**Results.** Detection AUC **99.42** on LipSync-A, 99.82 on AVLips, 97.50 on TalkHeadBench — about 8 points over SpeechForensics. Attribution reaches 97.5% accuracy and 93.9 F1, over 12 points above TALL. It generalises to unseen generators (Sonic 87.8, KDTalker 84.6, OmniSync 95.5 accuracy) and to Celeb-DF at 92.76.

**Phase-0 (2026-10-08).** Code and the LipSync-A dataset are at `github.com/AnsonShe/LipDA`. **No licence is stated**, and while about 270 samples come from commercial APIs, the paper does not describe the dataset as controlled-access — verify terms before use.

**The finding that matters for this wiki (kept as a footnote, not a page rationale).** All 15 tracked generators leak a forensically detectable lip-pose fingerprint, and **none survives attribution above 97% AUC** — LatentSync specifically is correctly attributed 97.5% of the time. This parallels the RGOR finding (`@sources/arxiv-2609-38019-rgor-beyond-lip-sync.md`) that released lipsync evaluation code leaks the target frame. Two gaps worth noting: **ComplexSync and FlowAct-R2, both tracked in this wiki, are absent from the LipSync-A generator set**, so their forensic robustness is untested here. Note also that LipDA's own attribution leans on generator leakage, so its high numbers should be read as "fingerprints are distinctive", not "forgeries are detectable in the wild".

**Why it routes out.** It is a **detector and attribution method** — defensive security work. Image-gen keeps this record plus the evaluation-resource note above. **Verdict: ROUTE to `@cybersecurity-wiki`.** Image-gen Phase-1: none. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.08417 (retrieved 2026-10-08) — detection AUC 99.42; attribution 97.5% accuracy across 15 generators.]
