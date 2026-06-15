---
title: "Synthetic Media Compute Economics (GPU Costs, Unit Economics, Margin Optimization)"
type: concept
tags: [compute-economics, gpu-pricing, cost-per-image, cost-per-video, profit-margin, cloud-gpu, inference-cost, synthetic-media]
keywords: [GPU pricing, RTX 4090, A100, H100, cost-per-image, cost-per-video-minute, 90% margin, FLUX, Open-Sora, SVD-XT, cloud GPU rental, JarvisLabs, Lambda Labs]
related:
  - sources/synthetic-media-ip-financial-roadmap.md
  - entities/hardware/gpu-guide.md
  - entities/models/flux-1-dev.md
  - entities/models/open-sora.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/cogvideox-1-5.md
  - concepts/persona-monetization-models.md
  - sources/arxiv-2606-06060-recache-diffusion-caching.md
  - concepts/budget-aware-diffusion-caching.md
  - sources/arxiv-2606-13496-budcache-diffusion-caching.md
maturity: draft
created: 2026-05-08
updated: 2026-06-15
---

## Relations

@sources/synthetic-media-ip-financial-roadmap.md
@entities/hardware/gpu-guide.md
@entities/models/flux-1-dev.md
@entities/models/open-sora.md
@entities/models/wan-2-2.md
@entities/models/hunyuanvideo-1-5.md
@entities/models/cogvideox-1-5.md
@concepts/persona-monetization-models.md

## Raw Concept

Question: What are the exact unit economics of AI-generated image and video production, and how do they interact with the 90% gross profit margin target for synthetic media businesses?

Synthesized from: @sources/synthetic-media-ip-financial-roadmap.md (entire Section 2).

## Narrative

### Image Generation Unit Economics

**Reference hardware:** NVIDIA RTX 4090 (24GB VRAM) on cloud at ~$0.59/hr (JarvisLabs)

**Reference model:** FLUX.1 Dev (Diffusion Transformer / DiT architecture)

| Metric | Value |
|--------|-------|
| GPU hourly cost | $0.59 |
| Images per hour (conservative) | 120 |
| **Cost per image** | **$0.005** |
| Min price per image (90% margin) | **$0.05** |
| Typical PPV fan sale price | $10–$40 |
| Achievable gross margin | **99.9%+** |

**Key insight:** The cost constraint in image generation is **not computational** — it is the human capital required for prompt engineering and workflow curation.

### Video Generation Unit Economics

**Reference hardware:** NVIDIA A100 (80GB) on cloud at ~$1.48/hr (Lambda Labs)

| Metric | Open-Weight (SVD-XT / Open-Sora 2.0) | Commercial API (Veo 3.1 / Sora 2) |
|--------|--------------------------------------|-------------------------------------|
| Cost per minute of compute | $0.024 | ~$30.00 |
| Compute time per 1 min output | ~20 min | N/A (API) |
| **Production cost per 1 min video** | **$0.48** | **$30.00** |
| Min selling price (90% margin) | **$4.80** | **$300.00** |
| B2B feasibility | Excellent | Good |
| DTC fan monetization viability | **Viable** | **Not viable** |

**Critical conclusion:** To achieve the 90% margin directive for direct-to-consumer content, agencies **must entirely eschew commercial APIs** and deploy open-weight models (Open-Sora 2.0, SVD-XT) on scalable cloud GPUs.

### Hidden Infrastructure Costs

- **Idle hardware burn**: An H100 instance running idle accrues **>$100/day** in wasted OPEX
- **Mitigation**: Implement automated shut-down protocols for non-urgent rendering
- **Spot pricing**: A100 spot instances can drop to ~$0.45/hr, pushing margins beyond 95%

### Margin Architecture Summary

```
Image path:
  $0.005 production → $0.05 min price → 90% margin floor
  PPV sales at $10-40 → 99.9% actual margins

Video path (open-weight):
  $0.48 production → $4.80 min price → 90% margin floor
  B2B at $1,000-5,000/min → exceptional margins

Video path (commercial API):
  $30.00 production → $300.00 min price → 90% margin floor
  NOT viable for DTC fan monetization
```

## Connection to Existing Wiki Pages

- **@entities/hardware/gpu-guide.md**: Provides the broader GPU tier context (8/16/24 GB tiers, quantization, Apple Silicon). This page adds the **business economics** layer on top.
- **@entities/models/flux-1-dev.md**: The reference model for image cost calculations.
- **@entities/models/open-sora.md**: The reference model for open-weight video cost calculations.
- **@entities/models/wan-2-2.md**: Alternative open-weight video model at similar cost tier.
- **@entities/models/hunyuanvideo-1-5.md**: Alternative open-weight video model at similar cost tier.
- **@entities/models/cogvideox-1-5.md**: Lowest-VRAM open-weight video model; cheapest local video entry.
- **@concepts/persona-monetization-models.md**: Uses these cost figures in the ROI math section ($200-400/mo software/API budgets).

## Snippets

> "Modern, high-fidelity AI image generation has shifted away from early, low-memory architectures toward advanced diffusion models, such as FLUX.1 Dev, which utilize a Diffusion Transformer (DiT) architecture."
> — Roadmap Section 2.1

> "Cost per Image: $0.0049 (effectively $0.005)... the absolute minimum Price-per-Image threshold is $0.05."
> — Roadmap Section 2.1

> "If the agency utilizes commercial APIs at a cost of $30.00 per minute, achieving a 90% gross margin requires selling that video content to clients or fans for $300.00 per minute... it is completely unsustainable for direct-to-consumer fan monetization."
> — Roadmap Section 2.2

> "if the agency utilizes proprietary cloud compute (A100/H100) at an internal production cost of $0.48 per minute of video, the Price-per-Minute-of-Video threshold required to maintain a 90% margin drops to just $4.80."
> — Roadmap Section 2.2

> "Leaving an H100 instance running idle can accrue over $100 per day in wasted operational expenditure."
> — Roadmap Section 2.2