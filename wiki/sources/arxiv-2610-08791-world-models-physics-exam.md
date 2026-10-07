---
title: "World Models' Last Exam in Physics — measurement-based video physics benchmark (arXiv:2610.08791)"
type: source
tags: [paper, benchmark, physics, world-model, video-generation, watch]
keywords: [World Models Last Exam, physics benchmark, measurement-based, reference-free, physical consistency, SAM2, CoTracker3, photometry, Seedance, Wan2.2, task suite]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-07-daily.md
  - concepts/video-generation-physical-executability.md
  - concepts/world-models-video-generation.md
  - entities/models/wan-2-2.md
maturity: draft
read_status: skimmed
created: 2026-10-08
updated: 2026-10-08
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-07-daily.md @concepts/video-generation-physical-executability.md @concepts/world-models-video-generation.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: World Models' Last Exam in Physics
- **Type**: arXiv:2610.08791 (Navers Lab / Einsia.AI + Peking University + Tsinghua; Mingju Gao et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.08791-world-models-last-exam-in-physics.pdf (archived 2026-10-08)
- **URL**: https://arxiv.org/abs/2610.08791
- **Retrieved**: 2026-10-08

## Narrative

**What it is.** A physics-consistency benchmark for **video generation models** — not a model and not an LLM reasoning test. 40 controlled tasks across nine physical families: mechanics, rolling and friction, pendulums, optics, hydrostatics, phase change, electromagnetism, granular flow, surface tension.

**Why it is genuinely new versus this wiki's lineage.** Existing physics evaluations in this lane judge by reference video or by asking a VLM whether the physics looks right (VideoPhy2, PhyWorldBench), or test a single narrow domain (Principia, mechanics only). This one is **reference-free and measurement-based**: it extracts physical observables from the generated video programmatically and checks them against the governing law. `@concepts/video-generation-physical-executability.md` tracks several such attempts; this is the first that spans nine domains without a VLM doing the judging.

**How it works.** Each task pairs stated assumptions, a GPT-Image-2.5 first frame, a prompt, and measurable criteria. Prompts are chosen so unknown scale factors cancel — a projectile with H/R = 1/4, the period ratio of two pendulums, the rolling condition v = omega-R. A 27B VLM screens for temporal consistency and observability (a C >= 80 gate), then independent extractors using SAM2, CoTracker3, ROI photometry and geometry fitting recover trajectories, periods, ray angles and liquid levels, mapping residuals to a score of 0.15·consistency + 0.85·physics. Eight I2V models x 40 tasks x 4 seeds gives 1,280 videos.

**Results.** The best model, **Seedance-2.5, scores 57.76/100**. Then MiniMax-H3 54.89, Cosmos3-Super 42.46, VBVR-Wan2.2 37.79, Wan2.2-A14B 35.66, LingBot 32.25, Hunyuan-1.5 31.97, CogVideoX-1.5-5B 18.81. Melting ice is near-solved by none — every model scores zero on it. As a validity check the evaluator scores 97.5 on synthetic reference videos. Human agreement with within-task ranking is 51.58%, against 43.40% for direct VLM judging and 56.60% human-to-human, so the automated ranking is defensible though not human-equivalent.

**Phase-0 (2026-10-08).** **No repository, dataset or licence is stated**, and the project homepage returned 404 at read time. It is a benchmark (task set plus evaluator) whose release status is unconfirmed — do not plan around it.

**Verdict: WATCH-full.** It is the strongest entry in this wiki's physics-benchmark line, the generated videos come from Wan2.2 and CogVideoX-class models an operator actually runs, and the evaluator stack is 24GB-friendly (only the 27B screener needs care). The task design is copyable even if the release never lands — see the Basgiath harness brief at `../dragon-rider-map/briefs/2026-10-08_physics-exam-harness-pattern.md`.

## Snippets

[Source: https://arxiv.org/abs/2610.08791 (retrieved 2026-10-08) — best model 57.76/100; all models score zero on melting ice.]
