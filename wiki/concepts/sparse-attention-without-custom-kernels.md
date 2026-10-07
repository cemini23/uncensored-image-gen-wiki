---
title: Sparse attention without custom kernels (SDPA-only window sparsity)
type: concept
tags: [diffusion-transformer, sparse-attention, acceleration, technique]
keywords: [backend-agnostic, SDPA, shifted local window, no custom kernel, FlexAttention, Triton, grid artifacts, BASA, DiT acceleration, ComfyUI portability]
related:
  - sources/arxiv-2610-08772-basa-sparse-attention.md
  - concepts/input-stable-sparse-attention-video.md
  - concepts/budget-aware-diffusion-caching.md
  - entities/models/wan-2-2.md
  - sweeps/2026-10-07-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
created: 2026-10-08
updated: 2026-10-08
---

## Relations

@sources/arxiv-2610-08772-basa-sparse-attention.md @concepts/input-stable-sparse-attention-video.md @concepts/budget-aware-diffusion-caching.md @entities/models/wan-2-2.md @sweeps/2026-10-07-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

The question this page answers: sparse attention makes diffusion transformers much faster, so why is it rarely in a local inference stack — and can it be done without compiling a custom kernel? Synthesized from arXiv:2610.08772 (BASA) and the wiki's existing sparse-attention entries.

## Narrative

**The adoption problem is the kernel, not the method.** The wiki tracks several sparse-attention designs for video DiTs (`@concepts/input-stable-sparse-attention-video.md` and neighbours). Their reported speedups are real, but the implementations lean on specialised attention backends — FlexAttention in one case, Triton kernels in another. Those are exactly what makes a method awkward to drop into an arbitrary inference stack: they need a specific PyTorch version, a working compiler, and often a specific GPU generation. So a good method stays on the shelf.

**The technique.** Get the sparsity from **computation structure** rather than from a kernel. Replace full visual self-attention with **shifted local-window attention** — ordinary Q/K/V projections fed to stock `scaled_dot_product_attention`. The shift is what makes it work: the window offset changes across layers *and* across denoising steps, so tokens that one partition separates are neighbours under the next. A fixed window leaves hard seams where attention never crosses; shifting dissolves them while keeping every individual operation dense and regular.

Two refinements in the reference design: a pooled global K/V memory appended **on the K/V side only** (so query length, and therefore the output shape, is unchanged), and content-adaptive window routing for video.

**What "backend-agnostic" honestly means.** It means **no custom kernel and no framework lock-in**. It does **not** mean hardware-portable — the source paper ran everything on a single A100-80GB and makes no AMD, Apple or cross-vendor claim. Read the phrase carefully before assuming it runs anywhere.

**It is not training-free.** The reference implementation requires rank-128 LoRA distillation from a dense teacher (teacher discarded at inference). So unlike a pure caching method such as `@concepts/budget-aware-diffusion-caching.md`, there is an adaptation step before the speedup is available.

**Reported results.** On FLUX at 1024 to 2048: FID 20.97 with a **2.443x measured speedup** against a 2.713x theoretical ceiling, beating Swin (FID 34.10) and the Triton-based STA (24.02). On Wan2.1-1.3B at 832x480 to 1664x960, 90% sparsity gives a **4.52x speedup** at 112.84 ms with VBench subject-consistency 95.98 vs 96.43 and image quality 67.02 vs 65.22 — quality essentially held.

**Why this matters for a local operator.** A design that needs only SDPA is the version most likely to survive contact with a ComfyUI or Diffusers install, because there is nothing to compile. That portability is the contribution, more than the speedup numbers.

**Operator caveats.** **No weights, no repository and no licence** were released with the source paper — the LoRA adaptation would have to be reproduced, and that ran on an 80GB card, so it is **not a 24GB workflow today** even though inference afterwards might be. The adaptation is also per-backbone, so a new base model means a new distillation run. And the theoretical ceiling was defined for a specific window configuration; treat the 90%-of-theoretical figure as configuration-dependent rather than general.

## Snippets

[Source: https://arxiv.org/abs/2610.08772 (retrieved 2026-10-08) — 2.443x on FLUX at 90.1% of the theoretical ceiling, using SDPA only.]
