---
title: "AAD-1 — one-step autoregressive I2V distillation (arXiv:2606.03972)"
type: source
tags: [paper, video-generation, autoregressive, distillation, i2v, one-step, wan]
keywords: [AAD-1, asymmetric adversarial distillation, one-step, autoregressive video, bidirectional discriminator, DMD warmup, Self-Forcing, motion collapse, Wan 2.1, VBench]
related:
  - concepts/one-step-autoregressive-video-distillation.md
  - concepts/autoregressive-video-foresight-training.md
  - concepts/grpo-i2v-post-training.md
  - concepts/seam-stitching-strategies.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - sources/arxiv-2606-06060-recache-diffusion-caching.md
  - concepts/budget-aware-diffusion-caching.md
maturity: draft
read_status: read
created: 2026-06-06
updated: 2026-06-06
---

## Relations

@concepts/one-step-autoregressive-video-distillation.md @concepts/autoregressive-video-foresight-training.md @concepts/seam-stitching-strategies.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: AAD-1: Asymmetric Adversarial Distillation for One-Step Autoregressive Video Generation
- **Authors**: Haobo Li, Yanhong Zeng, Yunhong Lu, Jiapeng Zhu, Hao Ouyang, Qiuyu Wang, Ka Leong Cheng, Yujun Shen, Zhipeng Zhang
- **Type**: arXiv:2606.03972
- **Location**: `raw-sources/arxiv-2606.03972-aad-1-asymmetric-adversarial-distillation-for-on.pdf`
- **URL**: https://arxiv.org/abs/2606.03972
- **Retrieved**: 2026-06-06
- **Read status**: read (abstract + intro + method overview)

## Narrative

Targets **one-step autoregressive image-to-video** for streaming / world-model use cases. Prior AR video distillation (APT2-class) uses **symmetric causal discriminators** with frame-wise logits — insensitive to gradual **motion collapse** (video freezes on first frame). Cold-start adversarial training is unstable under self-rollout.

**AAD-1 contributions:**

1. **Asymmetric architecture** — causal generator (KV-cache AR sampling preserved) vs **bidirectional discriminator** scoring the **full spatiotemporal volume** with one holistic realism logit. Detects long-range drift and static-video failure modes.
2. **Phased training** — Stage I: ODE init via Diffusion Forcing on Wan 2.1 T2V teacher trajectories with block-causal attention; Stage II: Self-Forcing **DMD warmup** (real/fake score matching on student rollouts); Stage III: asymmetric GAN refinement.

Built on **public Wan 2.1** backbone (contrasts with closed APT2). Claims SOTA **one-step** AR I2V on VBench for visual quality + motion fidelity `[TENTATIVE]`.

### Workspace relevance

Enables **real-time / low-latency** persona I2V streaming on Wan lineage — one denoise step per chunk lowers cost for chained clips (@concepts/seam-stitching-strategies.md). Complements training-only fixes (Video-Mirai foresight, TAGRPO GRPO) as an **inference-speed** axis. Weights release not confirmed `[NEEDS VERIFICATION 2026-06-06]`.

## Snippets

> "A causal discriminator evaluating frame t can only attend to contexts up to block t−1 without future information, causing inherent insensitivity to accumulated temporal degradation."

> "The discriminator attends bidirectionally over the full spatiotemporal volume and produces a single realism score for the entire sequence."

## Dead Ends

Not a de-censoring or identity-consistency method — speed/distillation only. No ComfyUI node at ingest.
