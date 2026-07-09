---
title: "MobileWan — mobile Wan2.2 video diffusion (arXiv:2607.06173)"
type: source
tags: [paper, video-generation, wan, mobile, distillation, compression]
keywords: [MobileWan, Wan2.2, Qualcomm, recurrence distillation, head pruning, chunk-wise autoregressive, Snapdragon, on-device]
related:
  - concepts/mobile-wan-chunkwise-video-distillation.md
  - entities/models/wan-2-2.md
  - concepts/one-step-autoregressive-video-distillation.md
  - concepts/input-stable-sparse-attention-video.md
  - sweeps/2026-07-09-daily.md
maturity: draft
read_status: read
created: 2026-07-09
updated: 2026-07-09
---

## Relations

@concepts/mobile-wan-chunkwise-video-distillation.md @entities/models/wan-2-2.md @concepts/one-step-autoregressive-video-distillation.md @concepts/input-stable-sparse-attention-video.md

## Raw Concept

- **Title**: MobileWan: Closing the Quality Gap for Mobile Video Diffusion
- **Authors**: Qualcomm AI Research (Ghafoorian, Korzhenkov, Karjauv, Lelekas, Fathima, et al.)
- **Type**: arXiv:2607.06173
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2607.06173-mobilewan-closing-the-quality-gap-for-mobile-vid.pdf`
- **URL**: https://arxiv.org/abs/2607.06173 · project: https://qualcomm-ai-research.github.io/mobilewan
- **Retrieved**: 2026-07-09
- **Read status**: read (abstract, method overview, deployment claims)

## Narrative

**MobileWan** distills **Wan2.2-5B** into an on-device system for Snapdragon 8 Gen 5 NPU class hardware. It combines:

| Technique | Role |
|-----------|------|
| Recurrence distillation | Chunk-wise autoregressive generation; constant-memory attention; RNN-like inference |
| Causal linear attention | Temporal coherence across chunks without full quadratic attention |
| Learnable head pruning | Binary per-head gates + noise-biased sparsity objective |
| Step distillation + VAE decode optimization | Latency reduction |

Reported result: **5 s @ 480×832, 16 FPS, ~20 s end-to-end** on a commercial phone; **VBench 83.79**; user study preferred MobileWan over Neodragon 80% of the time.

Authors state models and training recipes **will be released**; no public weights or GitHub at ingest.

### Workspace relevance

David's stack is **laptop + RunPod CUDA**, not mobile NPU — do not plan persona video on MobileWan today. The paper matters as a **Wan2.2 compression/distillation signal**: recurrence + head-pruning may port to server-side few-step Wan serving later.

Phase-0: **WATCH** — Qualcomm research page only; no license, no weights, no ComfyUI path. Re-audit when weights drop.

## Snippets

> "Starting from Wan2.2-5B, we rely on a recurrence distillation framework that converts video generation into a chunk-wise autoregressive process with constant-memory attention computation."

> "MobileWan becomes the first 5B-scale video diffusion model deployable on a commercial mobile device."

> "To foster further research on mobile video diffusion, we will release our models and training recipes."

## Dead Ends

- **Immediate persona rollout on phone**: NPU-only deployment; unrelated to ComfyUI/Wan local GPU path.
- **Assuming open weights**: release is promised, not shipped at ingest.
