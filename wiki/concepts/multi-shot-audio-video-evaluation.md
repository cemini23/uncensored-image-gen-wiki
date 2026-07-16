---
title: Multi-shot audio-video evaluation (MSAVBench)
type: concept
tags: [benchmark, audio-video, multi-shot, evaluation, cinematic, lipsync, narrative]
keywords: [MSAV, MSAVBench, multi-shot audio-video, VBench, AVGen-Bench, ViStoryBench, narrative coherence, lip synchronization, shot segmentation, video-first dubbing, unified AV architecture, director-level control]
related:
  - sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md
  - concepts/sync-audio-video-customization.md
  - concepts/joint-audio-visual-instruction-editing.md
  - concepts/persona-audio-stack.md
  - concepts/seam-stitching-strategies.md
  - entities/models/ltx-2.md
  - entities/models/wan-2-2.md
  - entities/models/seedance-2.md
  - entities/lipsync/latentsync.md
  - entities/models/omnicustom.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
  - sources/arxiv-2606-03672-foley-omni.md
  - sources/arxiv-2607-13527-vgif-score-video-instruction-eval.md
  - entities/benchmarks/vgif-score.md
maturity: draft
created: 2026-06-08
updated: 2026-07-16
---

## Relations

@sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md @concepts/sync-audio-video-customization.md @concepts/persona-audio-stack.md @concepts/seam-stitching-strategies.md @entities/models/ltx-2.md @entities/models/wan-2-2.md @entities/models/seedance-2.md @entities/benchmarks/vgif-score.md

## Raw Concept

Ingest 2026-06-08 from MSAVBench paper — defines the evaluation layer for **multi-shot audio-video (MSAV)** generation beyond single-clip VBench / AVGen-Bench.

## Narrative

**MSAV** = 2–15 shot cinematic sequences with synchronized speech, foley, and music — the production format persona reels, short-form ads, and storyboards actually need. Prior benchmarks split the problem: VBench/EvalCrafter (silent single-shot), AVGen-Bench (single-shot A/V), ViStoryBench/MSVBench (multi-shot video, weak audio).

### What MSAVBench adds

| Gap in prior benches | MSAVBench response |
|----------------------|-------------------|
| No joint multi-shot + audio | 286 prompts, avg 7.7 shots, 20 metrics across global/cross-shot/intra-shot/reference |
| Rigid shot segmentation | Agentic VLM self-correction on TransNet V2 boundaries |
| Unreliable VLM scalar scores | Rubrics (multiple-choice) + tool-grounded evidence for layout/narrative |
| Ignores cinematic language | Shot scale, camera angle, transitions, multilingual dialogue |

Human alignment: **Spearman ρ 0.915** overall `[CONFIRMED]` [Source: arxiv-2605-20183].

### Implications for local persona/video ops

**1. Unified A/V beats post-hoc dubbing on MSAV.** Pipelines that generate silent/multi-shot video then add HunyuanFoley/MMAudio/LatentSync score far below native joint models — especially on lip-sync, WER, and cross-shot timbre. This is empirical support for LTX-2 / OmniCustom / JAVEdit tiers over Wan-only + Fish-Speech + LatentSync for **multi-cut dialogue reels** `[TENTATIVE]`.

**2. Open weights can close gap via modularity, not monolith.** LTX-2.3 TI2AV (storyboard images from Wan2.7-Image + per-shot A/V gen) nears closed T2V scores — relevant when full native MSAV weights don't exist locally.

**3. Seam-stitching + MSAV are orthogonal failure modes.** LongLive+RAG addresses latent drift across shots; MSAVBench shows dubbing-after-stitch still breaks dialogue across hard cuts. Long-form persona work may need **joint A/V per segment** before stitch, not silent stitch-then-dub.

**4. "Director-level" metrics separate leaders.** Layout-text alignment, camera adherence, and subject-count compliance discriminate Seedance/Kling from pixel-pretty but uncontrollable open models — useful when evaluating prompt recipes for persona scenes.

### Model-selection cheat sheet (MSAVBench overall, approximate)

| Tier | Examples | Notes |
|------|----------|-------|
| Closed SOTA | Seedance-2.0, Wan2.7-T2V, Kling-V3 | Benchmark ceiling; not local uncensored track |
| Open modular | LTX-2.3 TI2AV | Best open MSAV path in paper |
| Open dub-after-video | Wan2.2+HunyuanFoley, LongLive+HunyuanFoley | High WER/lip-sync penalty; collapses at 11–15 shots |
| Native open A/V research | JavisDiT++ | Unified but lower overall than modular LTX path |

→ @entities/models/ltx-2.md · @concepts/persona-audio-stack.md · @concepts/seam-stitching-strategies.md

## Snippets

> "Evaluating such frontier models remains a fundamental challenge… existing benchmarks are limited in scope and data diversity, and rely on rigid evaluation pipelines."

> "Modular 'image + audio-video' pipeline decoupling per-shot keyframe synthesis from audio-video generation (e.g., LTX-2.3 in TI2AV mode) effectively boosts open-source performance to rival closed systems."

## Dead Ends

MSAVBench code evaluates **generated** MSAV outputs — it does not ship a generator. Using it locally requires running candidate models first (heavy GPU). Closed-model leaderboard rows are not reproducible on laptop-only stack without API spend.
