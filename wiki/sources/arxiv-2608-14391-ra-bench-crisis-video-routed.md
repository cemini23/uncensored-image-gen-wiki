---
title: "RA-Bench: AI-generated crisis video detection (arXiv:2608.14391) — routed cybersec"
type: source
tags: [paper, routed, deepfake, video, detection, cross-wiki]
keywords: [RA-Bench, crisis video, LastMile, detector OOD, 17886 clips]
related:
  - concepts/generative-ai-era-deepfake-landscape.md
  - sweeps/2026-08-17-daily.md
maturity: draft
read_status: read
created: 2026-08-17
updated: 2026-08-17
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

Primary: cybersecurity wiki brief `briefs/2026-08-17_ra-bench-crisis-video-from-image-gen.md`.
@concepts/generative-ai-era-deepfake-landscape.md @sweeps/2026-08-17-daily.md

## Raw Concept

- **Title**: Can We Defend Against AI-Generated Video Attacks on Real-World Crisis Events? A Systematic Evaluation of Detectors, Generators and Social Dissemination
- **Authors**: Shuo Liang, Yixing Ma, Pengfei Zhou, et al.
- **Type**: arXiv:2608.14391 [cs.CV]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.14391-can-we-defend-against-ai-generated-video-attacks.pdf`
- **URL**: https://arxiv.org/abs/2608.14391
- **Code**: `24029100313/RA-Bench` — **license:null / no LICENSE file** → no SPDX. Dataset HF `liangshuo0111/RA-Bench` **93.8 GB** — do not clone.
- **Retrieved**: 2026-08-17

## Narrative

**Routed stub.** Detection-eval paper, not a generator. RA-Bench: **17,886** videos = 1,830 real anchors across 10 social-risk categories + 16,056 generated clips from **four open-source + five closed-source** generators (nine total). Three eval axes: detector generalization, what makes generated clips hard, and human/social **LastMile** dissemination. Headline for persona ops: generators already beat last-mile detectors — social recompression / re-upload further weakens detection [TENTATIVE, single source]. Detection OOD bullet only on `@concepts/generative-ai-era-deepfake-landscape.md`. No exploit payloads, no evasion recipes.

**Phase-0: SKIP gen / ROUTE cybersec.** No SPDX on the repo. 93.8 GB dataset is not a local adopt. Image-gen local wire: none (`wont_wire`).

## Snippets

> "RA-Bench contains 17,886 videos, comprising 1,830 real-video anchors across 10 social-risk categories and 16,056 generated clips from four open-source and five closed-source generators."

[Source: arxiv-2608.14391, abstract]
