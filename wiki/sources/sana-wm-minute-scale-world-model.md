---
title: "SANA-WM: Efficient Minute-Scale World Modeling with Hybrid Linear Diffusion Transformer (NVIDIA, May 2026)"
type: source
tags: [paper, world-model, video-generation, camera-control, linear-attention, nvidia, efficient-inference, cross-wiki]
keywords: [SANA-WM, world model, minute-scale video, 720p, 6-DoF camera control, hybrid linear attention, Gated DeltaNet, GDN, softmax attention, dual-branch camera control, UCPE, Plucker mixing, two-stage refiner, long-video refiner, LTX2 tokenizer, NVFP4, RTX 5090, distillation, autoregressive generator, chunk-causal, Nano Banana Pro, action-controllable]
related:
  - entities/models/sana-wm.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - concepts/hybrid-linear-attention.md
  - entities/models/ltx-2.md
  - entities/models/sana.md
  - sources/video-generation-survey-2026.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
  - sources/arxiv-2605-31336-decmem-world-generation.md
  - entities/models/metaworld.md
  - sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md
maturity: validated
read_status: deep-read
created: 2026-05-16
updated: 2026-06-05
---

## Relations

@entities/models/sana-wm.md @concepts/world-models-video-generation.md @concepts/camera-controlled-video-generation.md @concepts/hybrid-linear-attention.md @entities/models/ltx-2.md @entities/models/sana.md @sources/video-generation-survey-2026.md

## Raw Concept

- **Title**: SANA-WM: Efficient Minute-Scale World Modeling with Hybrid Linear Diffusion Transformer
- **Authors**: Haoyi Zhu, Haozhe Liu, Yuyang Zhao, Tian Ye, Junsong Chen, Jincheng Yu, Tong He, Song Han, Enze Xie (NVIDIA)
- **Type**: Academic preprint — arXiv:2605.15178v1, 14 May 2026
- **Location**: `cemini-librarian:/opt/cemini-bulk/research/2605.15178v1.pdf`
- **Retrieved**: 2026-05-16 (cross-wiki routing from OSINT inbox)
- **Read status**: deep-read (abstract + introduction fully read; method/results sections paraphrased from abstract claims)

Routed from OSINT workspace inbox 2026-05-16; off-topic for OSINT, primary fit image-gen. No OSINT backlink (no OSINT page exists for it). The paper is a video / world-model generation work and belongs to the image-gen wiki's video-gen track. It sits adjacent to the existing video-generation survey but introduces a distinct page family: **interactive world models** (camera-controllable, minute-scale, action-following video synthesis) rather than the prompt-to-clip T2V/I2V models the survey catalogs.

## Narrative

### What SANA-WM is

SANA-WM is an efficient, open-source **video world model** — a 2.6B-parameter diffusion transformer **natively trained for one-minute generation**. Given a first frame, a text prompt, and a 6-DoF camera trajectory, it synthesizes a high-fidelity 720p minute-scale video that follows the input camera motion while preserving scene identity. NVIDIA positions it as matching the visual quality of industrial baselines (LingBot-World, HY-WorldPlay) at substantially higher efficiency. It extends the SANA linear-DiT lineage (→ @entities/models/sana.md) from text-to-image into the camera-controlled world-modeling regime.

The defining contrast with the 2026 T2V/I2V landscape (→ @sources/video-generation-survey-2026.md): mainstream video models cap at 5–10s clips and degrade structurally past native context length, and they are *prompt-conditioned* rather than *action-conditioned*. SANA-WM is trained natively at the one-minute horizon and accepts an explicit 6-DoF camera trajectory as a control signal — making it a **world model** (an explorable, action-controllable environment) rather than a clip generator.

### Four core designs

**1. Hybrid Linear Attention.** Frame-wise Gated DeltaNet (GDN) blocks are interleaved with periodic softmax-attention layers. The GDN blocks give memory-efficient recurrent context aggregation across the long (minute-scale) sequence; the periodic softmax layers provide exact long-range recall that pure linear attention loses. This hybrid is what makes minute-scale context tractable without the quadratic memory blow-up of full attention. → @concepts/hybrid-linear-attention.md

**2. Dual-Branch Camera Control.** Camera conditioning is applied at two rates to survive aggressive temporal VAE compression:
- a **latent-rate UCPE branch** captures global trajectory structure at the compressed latent resolution;
- a **raw-frame Plücker mixing branch** restores fine camera motion *inside* each temporal VAE stride (the frames a single latent token compresses over).

Together they preserve 6-DoF control accuracy that would otherwise be lost when many raw frames collapse into one latent token. → @concepts/camera-controlled-video-generation.md

**3. Two-Stage Generation Pipeline.** A long-video refiner runs on stage-1 outputs, correcting structural artifacts and sharpening detail across the full minute. The first stage produces a coherent minute-scale draft; the second stage is a dedicated refiner that operates over the whole sequence.

**4. Robust Annotation Pipeline.** SANA-WM recovers accurate **metric-scale** 6-DoF camera poses from public videos using pose/geometry estimators, yielding ~213K filtered video clips with metric-scale pose annotation. The metric scale matters: camera control needs poses in consistent real-world units, not arbitrary scale.

### Efficiency story

The efficiency claims are the headline. SANA-WM is trained on only ~213K public video clips, in **15 days on 64 H100 GPUs**, and generates each 60-second clip on a **single GPU**. A distilled variant deploys on a **single RTX 5090 with NVFP4 quantization**, denoising a 60s 720p clip in **34 seconds** — up to **36× higher generation throughput** versus baselines. It uses a high-compression LTX2 tokenizer (→ @entities/models/ltx-2.md) as the video latent codec.

Three single-GPU inference variants ship:
- **Bidirectional generator** — offline, highest quality;
- **Chunk-causal autoregressive generator** — sequential rollout (the interactive/streaming mode);
- **Few-step distilled autoregressive generator** — fast deployment (the RTX 5090 / NVFP4 path).

### Benchmark

The task setup is **camera-controlled world modeling**: first frame + text + 6-DoF camera trajectory → one-minute 720p video that follows the input motion while preserving scene identity. To evaluate, NVIDIA built a one-minute world-model benchmark: 80 initial scenes (generated by Nano Banana Pro) spanning four scene types, each paired with two revisit trajectories. The benchmark measures action-following accuracy, visual quality, and efficiency.

### Contributions (as stated)

(i) a natively one-minute-trained 720p action-controllable world model with accessible training/inference cost; (ii) an efficiency-oriented architecture combining high-compression video latents, hybrid GDN/softmax long-context modeling, and dual-branch camera control; (iii) a long-video second-stage refiner; (iv) a robust data annotation and evaluation pipeline.

### Workspace relevance

For the persona/video track this is a research-layer reference, not yet a build-track tool — but it is the most concrete 2026 demonstration that minute-scale, single-GPU, camera-controllable video is feasible at consumer hardware (RTX 5090, 34s/clip). It is filed alongside the video survey as the entry point for an "interactive world model" page family distinct from the prompt-to-clip T2V/I2V models.

## Snippets

> "We present SANA-WM, an efficient open-source video world model natively trained for one-minute generation. SANA-WM can synthesize high-fidelity 720p minute-scale videos with precise 6-DoF camera control, achieving visual quality comparable to industrial baselines such as LingBot-World and HY-WorldPlay, while being substantially more efficient."
[Source: 2605.15178v1.pdf — abstract (retrieved 2026-05-16)]

> "Trained on only ~213K public video clips with 15 days on 64 H100 GPUs, SANA-WM generates each 60-second clip on a single GPU; its distilled variant deploys on a single RTX 5090 with NVFP4 quantization, denoising a 60s 720p clip in 34 seconds — up to 36x higher generation throughput than baselines."
[Source: 2605.15178v1.pdf — abstract (retrieved 2026-05-16)]

## Dead Ends

- **Pure linear attention for minute-scale context**: would lose exact long-range recall — the reason SANA-WM keeps periodic softmax-attention layers in the hybrid rather than going fully linear. The hybrid GDN/softmax design is the corrective.
- **Single-rate (latent-only) camera conditioning**: aggressive temporal VAE compression destroys fine camera motion within each VAE stride. SANA-WM's dual-branch design (latent-rate UCPE + raw-frame Plücker mixing) exists specifically to recover what single-rate conditioning loses.
