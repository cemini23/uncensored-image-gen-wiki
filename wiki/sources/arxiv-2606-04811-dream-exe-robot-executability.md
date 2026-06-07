---
title: "Dream.exe — video-to-robot executability benchmark (arXiv:2606.04811)"
type: source
tags: [paper, video-generation, benchmark, world-model, robotics, physics, evaluation]
keywords: [Dream.exe, physical executability, robot manipulation, video-to-execution, RoboCasa365, world model hypothesis, VBench, Show Lab, NUS]
related:
  - concepts/video-generation-physical-executability.md
  - concepts/world-models-video-generation.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
  - sources/arxiv-proprio-physics-video-2605-28230.md
  - sources/arxiv-2603-18639-orthophys-physics-video.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/ltx-2.md
maturity: draft
read_status: read
created: 2026-06-07
updated: 2026-06-07
---

## Relations

@concepts/video-generation-physical-executability.md @concepts/world-models-video-generation.md @sources/arxiv-yocausal-world-model-benchmark-2605-30346.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: Dream.exe: Can Video Generation Models Dream Executable Robot Manipulation?
- **Authors**: Rui Zhao, Kaiming Yang, Jifeng Zhu, Siyang Chen, Ziqi Wang, Weijia Wu, Kevin Qinghong Lin, Heng Wang, Mike Zheng Shou (Show Lab NUS, Oxford, Tencent)
- **Type**: arXiv:2606.04811
- **Location**: `raw-sources/arxiv-2606.04811-1-introduction.pdf`
- **URL**: https://arxiv.org/abs/2606.04811 · https://github.com/showlab/Dream.exe
- **Retrieved**: 2026-06-07
- **Read status**: read (abstract + benchmark design)

## Narrative

Tests whether **video generation models encode physically executable motion** — not just perceptual quality. **Dream.exe** pipeline: scene image + task text → generated manipulation video → **video-to-trajectory** lift (monocular depth + camera params + gripper timing) → **physics-simulator execution** (RoboCasa365 / robosuite).

**Benchmark:** 101 curated manipulation episodes, three difficulty levels (atomic / multi-object / composite). **8 models** evaluated — closed API (Kling, Veo, SeedDance), open (Wan, HunyuanVideo, CogVideoX, LTX), robot-specific policy.

**Findings [TENTATIVE]:**

1. Several general video models achieve **measurable execution success** — internet-scale priors encode real physics
2. **Visual quality ≠ executability** — VBench leaders often fail simulation; modest visual scores can yield valid trajectories
3. Robot-specific policy does **not** consistently beat general generators on diverse tasks/viewpoints

Complements perceptual physics benchmarks (VideoPhy, PhyGenBench) by **closing the loop** with robot control — closest wiki peer is YoCausal (@sources/arxiv-yocausal-world-model-benchmark-2605-30346.md) on causality, not manipulation execution.

### Workspace relevance

Research-layer **world-model validation** for Wan/Hunyuan/LTX persona stacks — does generated motion imply real physics? Not a build-track tool for persona ops; informs whether long-horizon I2V clips are structurally plausible before lipsync/mux.

## Snippets

> "If a model has internalized the physical laws governing a manipulation task, the trajectory implied by its generated video should produce task success when executed by a robot."

> "Visual quality is a poor predictor of executability."

## Dead Ends

Robot manipulation focus — no direct ComfyUI integration for persona video. Off-topic for voice/audio pipeline.
