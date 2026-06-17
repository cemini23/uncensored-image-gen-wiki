---
title: "CausalMotion — VLM keyframe/trajectory guidance for training-free video (arXiv:2606.14317)"
type: source
tags: [paper, video-generation, physics, vlm, training-free, ltx]
keywords: [CausalMotion, keyframe reasoning, trajectory guidance, PhyGenBench, VBench, training-free, LTX-Video, Grounded SAM2, Shanghai AI Lab]
related:
  - sources/arxiv-proprio-physics-video-2605-28230.md
  - concepts/vlm-guided-physical-video-generation.md
  - entities/models/causalmotion.md
  - concepts/video-generation-physical-executability.md
  - entities/models/ltx-2.md
  - concepts/world-models-video-generation.md
  - sources/video-generation-survey-2026.md
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-06-17-daily.md
maturity: draft
read_status: read
created: 2026-06-17
updated: 2026-06-17
---

## Relations

@concepts/vlm-guided-physical-video-generation.md @entities/models/causalmotion.md @concepts/video-generation-physical-executability.md @entities/models/ltx-2.md

## Raw Concept

- **Title**: CausalMotion: Structured Physical Reasoning as Keyframe and Trajectory Guidance for Training-Free Video Generation
- **Authors**: Sihan Zhuang, Xinyuan Chen, Tianfan Xue, Yaohui Wang (ShanghaiTech, Shanghai AI Lab, CUHK)
- **Type**: arXiv:2606.14317
- **Location**: `raw-sources/arxiv-2606.14317-causalmotion-structured-physical-reasoning-as-ke.pdf`
- **URL**: https://arxiv.org/abs/2606.14317 · https://zhuangsh0713.github.io/CausalMotion/ · https://github.com/zhuangsh0713/CausalMotion
- **Retrieved**: 2026-06-17
- **Read status**: read (abstract + three-stage pipeline)

## Narrative

**Problem:** Video diffusion models learn physics implicitly from data; long-horizon causal dynamics (deflation, melting stages, contact) often fail with missing intermediate states or teleporting objects.

**CausalMotion** decouples **reasoning** from **generation** at inference time — no finetuning:

| Stage | Mechanism |
|-------|-----------|
| Keyframe reasoning | VLM chain-of-thought decomposes prompt → causally ordered key states + T2I keyframes |
| Trajectory planning | Grounded SAM2 boxes + VLM physical state vectors `[x,y,w,h,vx,vy,c]` → dense trajectories |
| Trajectory-guided synthesis | Soft-mask latent updates guide **LTX-Video** denoising |

**Claims [TENTATIVE]:** PhyGenBench avg **0.65** (+67% vs baseline); VBench quality **82.52%** (paper: beats LTX-Video 80.57%, Wan2.1 76.21%).

**Repo:** `zhuangsh0713/CausalMotion` — Python package + submodules `Grounded-SAM-2`, `LTX-Video`. No LICENSE file at Phase-0 audit.

### Workspace relevance

Inference-time physics uplift for **any** pretrained T2V backbone that exposes latent guidance hooks — complements Proprio/YoCausal eval cluster (@concepts/video-generation-physical-executability.md). Not persona-specific; useful for action/physics reels where Wan/LTX alone hallucinate state jumps.

## Snippets

> "Our key idea is to decouple reasoning from generation by leveraging a vision-language model to decompose a text prompt into a sequence of causally consistent keyframes and object-centric motion trajectories."

> "Operating at inference time, it remains lightweight while improving temporal coherence and physical plausibility."

## Dead Ends

Depends on **LTX-Video** submodule — inherits BFL weight licensing for LTX checkpoints. Heavy stack (VLM + SAM2 + LTX) vs single-pass Wan Turbo for persona clips.
