---
title: "MSAVBench — multi-shot audio-video evaluation (arXiv:2605.20183)"
type: source
tags: [paper, benchmark, audio-video, multi-shot, evaluation, wan, ltx, seedance]
keywords: [MSAVBench, multi-shot audio-video, MSAV, VBench, AVGen-Bench, shot segmentation, rubric scoring, agentic evaluation, lip sync, narrative coherence, Seedance, Wan2.7, LTX-2.3, HunyuanFoley]
related:
  - concepts/multi-shot-audio-video-evaluation.md
  - concepts/sync-audio-video-customization.md
  - concepts/persona-audio-stack.md
  - concepts/seam-stitching-strategies.md
  - entities/models/ltx-2.md
  - entities/models/wan-2-2.md
  - entities/models/seedance-2.md
  - entities/lipsync/latentsync.md
  - entities/models/foley-omni.md
  - sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
  - concepts/joint-audio-visual-instruction-editing.md
  - entities/models/omnicustom.md
  - sources/arxiv-2606-03672-foley-omni.md
  - sources/video-generation-survey-2026.md
maturity: draft
read_status: read
created: 2026-06-08
updated: 2026-06-08
---

## Relations

@concepts/multi-shot-audio-video-evaluation.md @concepts/sync-audio-video-customization.md @concepts/persona-audio-stack.md @entities/models/ltx-2.md @entities/models/wan-2-2.md @entities/models/seedance-2.md

## Raw Concept

- **Title**: MSAVBench: Towards Comprehensive and Reliable Evaluation of Multi-Shot Audio-Video Generation
- **Authors**: Yujie Wei, Yujin Han, Zhekai Chen, Yongming Li, et al. (Fudan, HKU, Tongyi Lab/Alibaba, ZJU, PKU)
- **Type**: arXiv:2605.20183v3
- **Location**: `raw-sources/arxiv-2605.20183-msavbench-towards-comprehensive-and-reliable-eva.pdf`
- **URL**: https://arxiv.org/abs/2605.20183 · https://github.com/ali-vilab/MSAVBench
- **Retrieved**: 2026-06-08
- **Read status**: read (abstract + data design + eval framework + main results + failure analysis)

## Narrative

First benchmark dedicated to **multi-shot audio-video (MSAV)** generation — cinematic narratives with 2–15 shots, synchronized dialogue/foley/music, reference conditioning, and cinematic language (shot scale, camera angle, transitions).

### Dataset (286 prompts, 2198 shots)

Four design axes: **video** (theme/style/subject/scene/lighting), **audio** (source/emotion/language/multi-speaker), **shot** (scale/angle/transitions), **reference** (image/audio/scene). Avg **7.7 shots/prompt** (max 15); **6 languages**; realistic + counterfactual/non-realistic cross-combos; 68 character refs + 65 paired audio clips + 32 scene images.

### Evaluation suite (20 metrics → 11 dimensions)

| Level | Examples |
|-------|----------|
| Global | Narrative coherence, lip sync, sound attribution, A/V sync, visual quality |
| Cross-shot | Layout consistency, visual consistency (5 sub-metrics), music consistency, speaker timbre |
| Intra-shot | Layout-text alignment, camera adherence, audio quality, OCR, WER |
| Reference | Subject fidelity (DINO/face), voice fidelity |

**Hybrid framework:** TransNet V2 shot boundaries + VLM self-correction (≤2 rounds); expert models (LR-ASD, SortFormer, StableSyncNet, Demucs, FireRedASR, etc.); **instance-wise rubrics** for subjective dims; **tool-grounded agentic scoring** for layout-text. Overall Spearman ρ=**0.915** vs human experts (vs 0.600 direct VLM scoring on narrative).

### Main findings (19 models)

1. **Closed >> open** on MSAV overall — Seedance-2.0 leads; no native open MSAV model yet.
2. **Modular TI2AV helps open weights** — LTX-2.3 with Wan2.7-Image storyboard priors (~75 overall on 1–4 shots) rivals closed T2V systems; beats video-first + HunyuanFoley dubbing.
3. **Director-level control weak everywhere** — layout alignment, camera params, multi-speaker timbre lag unimodal quality.
4. **Post-hoc dubbing fails MSAV** — Wan2.2+HunyuanFoley, LongLive+HunyuanFoley, ShotStream+HunyuanFoley collapse on WER/lip-sync vs unified architectures; LongLive drops **24.5%** from 1–4 to 11–15 shots vs Kling's 3.5%.
5. **Reference-to-AV:** visual identity preservation harder than voice cloning (DreamID-Omni trails Wan-R2V on Img-DINO but near-par on voice sim).

### Workspace relevance

Diagnostic for **persona multi-shot reels** (@concepts/persona-audio-stack.md): validates that Fish-Speech + LatentSync + seam-stitch is structurally similar to the failing "video-first, dub later" stack. LTX-2.3 TI2AV is the strongest open-weight MSAV path surveyed `[TENTATIVE]` — aligns with @entities/models/ltx-2.md native-A/V positioning. Seedance-2.0 remains closed benchmark ceiling → @entities/models/seedance-2.md.

## Snippets

> "The common 'video-first, post-hoc dubbing' paradigm is insufficient for complex multi-shot audio-video generation, highlighting the need for unified audio-video architectures."

> "Our overall score achieves a high ρs of 0.915, confirming strong alignment with human judgments."

> "LTX-2.3 in TI2A V mode effectively boosts open-source performance to rival closed systems."

## Dead Ends

Not a generation model — eval harness only. Closed-model scores (Seedance, Kling, Wan2.7-T2V, HappyHorse) are reference baselines, not local deploy targets for uncensored persona ops. HunyuanFoley evaluated as dubbing add-on, not as standalone wiki entity (no dedicated page yet).
