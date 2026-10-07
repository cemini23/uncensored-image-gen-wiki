---
title: "BASA — backend-agnostic sparse attention via SDPA only (arXiv:2610.08772)"
type: source
tags: [paper, diffusion-transformer, sparse-attention, acceleration, video-generation, watch]
keywords: [BASA, shifted local-window attention, SDPA, backend-agnostic, no custom kernel, FLUX, Wan2.1, high-resolution, sparse attention, LoRA distillation]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-07-daily.md
  - concepts/sparse-attention-without-custom-kernels.md
  - concepts/input-stable-sparse-attention-video.md
  - entities/models/wan-2-2.md
maturity: draft
read_status: skimmed
created: 2026-10-08
updated: 2026-10-08
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-07-daily.md @concepts/sparse-attention-without-custom-kernels.md @concepts/input-stable-sparse-attention-video.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: Backend-Agnostic Sparse Attention for Fast High-Resolution Visual Generation
- **Type**: arXiv:2610.08772 (SJTU + Fudan + HKU; Liao Ma et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.08772-backend-agnostic-sparse-attention-for-fast-high.pdf (archived 2026-10-08)
- **URL**: https://arxiv.org/abs/2610.08772
- **Retrieved**: 2026-10-08

## Narrative

**The novelty is the "backend-agnostic" claim, and it mostly holds.** BASA replaces DiT visual self-attention with **shifted local-window attention that needs no custom sparse kernels** — only standard Q/K/V projections and PyTorch **SDPA**. Competitors in this lane depend on FlexAttention (CLEAR) or Triton (STA), which is what makes them hard to drop into an arbitrary inference stack. Window offsets vary across layers *and* denoising steps, so tokens separated by one partition interact under the next, which removes the grid artifacts a fixed window produces while keeping the computation dense-executable. A pooled global K/V memory is appended on the K/V side only (query length is unchanged), and video adds content-adaptive true-window routing.

**What "backend-agnostic" does not mean.** It means no custom kernel and no framework lock-in — it does **not** mean hardware portability. All experiments ran on a single **NVIDIA A100-80GB**, with no AMD, Apple or vendor-portability claim. That distinction matters for anyone reading the title optimistically.

**It is also a training method.** Adaptation is required, not optional: rank-128 LoRA dense-teacher distillation with flow-matching, prediction and attention losses, teacher discarded at inference. So it is not purely training-free, unlike some entries in this lane.

**Results.** FLUX 1024 to 2048: FID 20.97, CLIP-I 97.60, DINO 95.95 at a **2.443x measured speedup** (90.1% of the theoretical 2.713x), beating Swin (FID 34.10) and STA (24.02); CLEAR reaches only 1.629x. FLUX attention latency falls 21.67 to about 9 ms. Wan2.1-1.3B at 832x480 to 1664x960: 90% sparsity gives a **4.52x speedup** at 112.84 ms, with VBench subject-consistency 95.98 vs 96.43 and image quality 67.02 vs 65.22.

**Phase-0 (2026-10-08).** **No GitHub or HF URL, no weights, and no licence stated.** Base models are FLUX.1-dev and Wan2.1-T2V-1.3B. All adaptation training ran on one A100-80GB.

**Verdict: WATCH-full** — kernel-free SDPA-only sparsity is the most portable design in this lane and would suit ComfyUI well (`@concepts/sparse-attention-without-custom-kernels.md`). But no weights ship and the LoRA adaptation needs an 80GB card, so it is **not runnable on a 24GB machine today**. Basgiath hook is indirect at best — Minecraft Bedrock's 16x16 to 32x32 tile art gains nothing from ultra-resolution attention sparsity.

## Snippets

[Source: https://arxiv.org/abs/2610.08772 (retrieved 2026-10-08) — Wan2.1 4.52x speedup at 90% sparsity with VBench quality preserved.]
