---
title: "Grounding character identity in video captioning and QA (arXiv:2610.10163)"
type: source
tags: [paper, video-understanding, identity, captions, watch]
keywords: [identity-aware captioning, face gallery matching, InsightFace, DeepSORT, person QA, LoRA fine-tune, Qwen, LSMDC, likeness matching, benchmark]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-08-daily.md
  - concepts/likeness-collision-verification.md
  - concepts/multi-angle-dataset-prep.md
maturity: draft
read_status: skimmed
created: 2026-10-09
updated: 2026-10-09
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-08-daily.md @concepts/likeness-collision-verification.md @concepts/multi-angle-dataset-prep.md

## Raw Concept

- **Title**: Beyond Anonymous Captions: Grounding Character Identity in Video Captioning and Question Answering
- **Type**: arXiv:2610.10163 (Télécom SudParis / Institut Polytechnique de Paris + Moments Lab Research; Anas Filali Razzouki et al.)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.10163
- **Retrieved**: 2026-10-09

## Narrative

**What it is.** Identity-aware **video understanding**, not generation. It matches faces detected in movie clips to actor reference galleries, tracks characters across frames, and feeds identity-linked boxes into general video MLLMs. It ships a manually verified benchmark (750 clips, 3,000 questions) plus LoRA fine-tunes of Qwen at 2B/4B/8B.

**The pipeline, which is the transferable part.** InsightFace face embeddings plus a DeepSORT-style tracker, matched against a reference gallery capped at 50 images per identity and filtered to 5, accepting a match above a confidence threshold. Then shot detection, frame sampling, and caption generation.

**Results.** Grounding helps substantially: QA overall rises 53.87 to 68.90 (2B), 62.57 to 79.73 (4B), and 59.77 to **88.53** (8B). The best grounding representation is feature-vector plus frame-level caption together. The fine-tuned 8B reaches 93.20, beating Qwen3-VL-235B (86.10), Gemini 2.5 Flash (82.63) and Claude Sonnet 4.6 (76.10), while trailing GPT-5.6 Sol (97.07).

**Phase-0 (2026-10-09).** Repository `github.com/momentslab/beyond-anonymous-captions` ships the benchmark, 32K training clips, code and checkpoints. **No licence is stated in the paper** — which matters here, because the released assets are **movie clips carrying real actors' biometric faces**, and the authors themselves flag privacy and consent limits.

**Verdict: WATCH-thin.** Be clear about what it is: **video understanding of existing movie characters**, not a method for generating a consistent persona. The transferable fragment is the **face-gallery plus track-embedding match with a confidence threshold**, which is genuinely reusable for likeness-collision checks and multi-angle dataset triangulation (`@concepts/likeness-collision-verification.md`, `@concepts/multi-angle-dataset-prep.md`). But the artifact is copyright- and consent-restricted, so it is not shippable into a persona pipeline. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.10163 (retrieved 2026-10-09) — grounded QA 59.77 → 88.53 on the 8B model.]
