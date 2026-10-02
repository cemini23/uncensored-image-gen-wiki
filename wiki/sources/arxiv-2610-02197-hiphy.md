---
title: "HiPhy — hierarchical alignment for multi-principle physical video (arXiv:2610.02197)"
type: source
tags: [paper, video-generation, physics, grpo, reward-modeling, watch]
keywords: [HiPhy, hierarchical alignment, multi-principle, physical plausibility, GRPO, prompt policy, stage tree, MultiPhyBench, VideoPhy2, Qualcomm]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-02-daily.md
  - concepts/grpo-i2v-post-training.md
  - concepts/video-generation-physical-executability.md
maturity: draft
read_status: skimmed
created: 2026-10-02
updated: 2026-10-02
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-02-daily.md @concepts/grpo-i2v-post-training.md @concepts/video-generation-physical-executability.md

## Raw Concept

- **Title**: HiPhy: Hierarchical Alignment for Physically-Plausible Multi-Principle Video Generation
- **Type**: arXiv:2610.02197 (Virginia Tech + Qualcomm AI Research; Tahira Kazimi et al.) — NeurIPS 2026
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.02197-hiphy-hierarchical-alignment-for-physically-plau.pdf (archived 2026-10-02)
- **URL**: https://arxiv.org/abs/2610.02197
- **Retrieved**: 2026-10-02

## Narrative

**What is new.** Prior physical-plausibility work in this wiki (FracGen, Dream.exe, VLM-guided physical generation) supervises **one principle per clip**. HiPhy targets the **compositional** case: several physical principles active at once in one scene. It decomposes each principle into temporally ordered sub-stages and scores their chronological progression as an independent reward stream, so a compound scene stops dropping a principle or collapsing its dynamics into a static snapshot.

**Method.** The T2V backbone stays **frozen**; only a prompt policy is trained, with GRPO (50 SFT iterations then about 2000 GRPO iterations). A VLM extracts a stage tree from the generated video; Hungarian assignment aligns it to a reference tree level by level; node similarity is 0.5·SBERT cosine plus 0.5·VLM stage-judge. The reward is the mean of alignment, completeness and ordering per principle, plus a global stream (HPSv2, VideoPhy2 physics judge, semantic alignment). Per-stream normalisation and 1/sqrt(n) rescaling stop high-principle-count prompts from dominating the gradient.

**Results.** VideoPhy2 physics-common 88.6 vs Wan2.1 49.1, semantic-adherence 79.2 vs 43.6. PhyWorldBench 74.9 vs 47.7 and 76.3 vs 40.9. On the new MultiPhyBench 76.7 / 68.85 vs Wan 53.0 / 35.0. Human study 3.89 / 4.13 vs 3.07 / 2.90. Inference overhead is only +2.4s over base Wan, against +170s for PhyT2V and +175s for PnP.

**Phase-0 (2026-10-02).** Backbones are Wan2.1 (open) and VEO3 (black-box); policy is Qwen2.5-7B-Instruct and the judge is Qwen2.5-VL-7B. The paper says data, code and checkpoints **will** be shared publicly — **not yet released, no licence stated**. Training used two H200 GPUs, so the reward stack is heavy for a 24GB card. **Verdict: WATCH-thin** — no code yet and H200-scale training, but the multi-principle hierarchical-reward idea is genuinely new and reusable. Relates to `@concepts/grpo-i2v-post-training.md` and `@concepts/video-generation-physical-executability.md`.

## Snippets

[Source: https://arxiv.org/abs/2610.02197 (retrieved 2026-10-02)]
