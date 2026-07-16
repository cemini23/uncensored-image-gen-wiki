---
title: SANA-WM (NVIDIA)
type: entity
tags: [model, video, world-model, camera-control, linear-attention, nvidia, efficient-inference, diffusion-transformer]
keywords: [SANA-WM, world model, minute-scale video, 720p, 2.6B, 6-DoF camera control, hybrid linear attention, Gated DeltaNet, GDN, dual-branch camera control, UCPE, Plucker mixing, two-stage refiner, LTX2 tokenizer, NVFP4, RTX 5090, distilled autoregressive, chunk-causal, bidirectional generator]
related:
  - sources/sana-wm-minute-scale-world-model.md
  - concepts/world-models-video-generation.md
  - concepts/camera-controlled-video-generation.md
  - concepts/hybrid-linear-attention.md
  - entities/models/sana.md
  - entities/models/ltx-2.md
  - sources/arxiv-optiworld-optimal-control-video-world-2606-00499.md
  - sources/arxiv-2605-31336-decmem-world-generation.md
  - entities/models/decmem.md
  - entities/models/metaworld.md
  - sources/arxiv-metaworld-video-world-model-2606.02753-2026-06-05.md
  - entities/models/prisma-world.md
  - sources/arxiv-2606-09507-prisma-world-multi-agent-video.md
  - sources/arxiv-2606-09828-mirage-latent-spatial-memory.md
  - entities/models/mirage.md
  - concepts/latent-spatial-memory-video-world-models.md
  - sources/arxiv-2606-13376-moverse-panoramic-gaussian-world.md
  - concepts/panoramic-gaussian-video-world-models.md
  - entities/models/moverse.md
  - sources/arxiv-2606-16533-kairos-native-world-model-stack.md
  - entities/models/kairos.md
  - concepts/physical-ai-native-world-model-stacks.md
  - entities/models/moworld.md
  - sources/arxiv-2607-06216-moworld-flash-world-model.md
  - sweeps/2026-07-13-daily.md
  - sources/arxiv-2607-14076-interactive-world-models-game-engines.md
maturity: validated
created: 2026-05-16
updated: 2026-07-16
---

## Relations

@sources/sana-wm-minute-scale-world-model.md @concepts/world-models-video-generation.md @concepts/camera-controlled-video-generation.md @concepts/hybrid-linear-attention.md @entities/models/sana.md @entities/models/ltx-2.md @entities/models/metaworld.md @entities/models/decmem.md @sources/arxiv-2607-14076-interactive-world-models-game-engines.md

## Raw Concept

Page prompted by the cross-wiki ingest of the NVIDIA paper "SANA-WM: Efficient Minute-Scale World Modeling with Hybrid Linear Diffusion Transformer" (arXiv:2605.15178v1), routed from the OSINT workspace inbox 2026-05-16. Synthesized from @sources/sana-wm-minute-scale-world-model.md.

## Narrative

### What it is

SANA-WM is an open-source, 2.6B-parameter video **world model** from NVIDIA — a diffusion transformer **natively trained for one-minute generation**. Given a first frame, a text prompt, and a 6-DoF camera trajectory, it synthesizes a high-fidelity 720p minute-scale video that follows the camera motion while preserving scene identity. It extends the SANA linear-DiT lineage (→ @entities/models/sana.md) from text-to-image into camera-controlled world modeling. [CONFIRMED] [Source: 2605.15178v1.pdf]

### Architecture — four core designs

- **Hybrid Linear Attention** — frame-wise Gated DeltaNet (GDN) blocks interleaved with periodic softmax-attention layers; GDN gives memory-efficient recurrent context aggregation, periodic softmax restores exact long-range recall. → @concepts/hybrid-linear-attention.md
- **Dual-Branch Camera Control** — dual-rate conditioning: a latent-rate UCPE branch for global trajectory structure + a raw-frame Plücker mixing branch that restores fine camera motion inside each temporal VAE stride; preserves 6-DoF accuracy despite aggressive video compression. → @concepts/camera-controlled-video-generation.md
- **Two-Stage Generation Pipeline** — a long-video refiner operates on stage-1 outputs, correcting structural artifacts and sharpening detail across the full minute.
- **Robust Annotation Pipeline** — recovers metric-scale 6-DoF camera poses from public videos via pose/geometry estimators; yields ~213K filtered clips with metric-scale pose annotation.

[CONFIRMED] [Source: 2605.15178v1.pdf]

### Efficiency profile

| Metric | Value |
|--------|-------|
| Parameters | 2.6B |
| Training data | ~213K public video clips |
| Training cost | 15 days on 64 H100 GPUs |
| Inference | 60s clip on a single GPU |
| Distilled variant | single RTX 5090, NVFP4 quantization — 60s 720p clip in 34s |
| Throughput vs baselines | up to 36× higher |
| Video tokenizer | high-compression LTX2 tokenizer (→ @entities/models/ltx-2.md) |

[CONFIRMED] [Source: 2605.15178v1.pdf]

### Inference variants

Three single-GPU variants ship: a **bidirectional generator** (offline, highest quality); a **chunk-causal autoregressive generator** (sequential rollout — the interactive/streaming mode); and a **few-step distilled autoregressive generator** (fast deployment, the RTX 5090 / NVFP4 path).

### Open questions

[NEEDS VERIFICATION 2026-05-16]

- Weights / code release status and license (paper claims "open-source" — confirm on Hugging Face / GitHub).
- Local runtime feasibility outside the RTX 5090 NVFP4 path — Apple Silicon, lower-VRAM NVIDIA cards.
- Censorship / NSFW posture — not addressed by the paper; the model is camera-driven world simulation, not persona-portrait generation, so build-track relevance is research-layer.
- ComfyUI support — none noted at ingest time.

## Snippets

> "We present SANA-WM, an efficient open-source video world model natively trained for one-minute generation. SANA-WM can synthesize high-fidelity 720p minute-scale videos with precise 6-DoF camera control, achieving visual quality comparable to industrial baselines such as LingBot-World and HY-WorldPlay, while being substantially more efficient."
[Source: 2605.15178v1.pdf — abstract (retrieved 2026-05-16)]
