---
title: "ViRDM (arXiv:2609.28923)"
type: source
tags: [paper, video, watch]
keywords: [few-step, causal video, distribution matching, distillation, streaming]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/world-models-video-generation.md
  - concepts/context-matched-video-distillation.md
  - sweeps/2026-09-25-daily.md
  - entities/models/virdm.md
maturity: draft
read_status: deep-read
created: 2026-09-25
updated: 2026-09-25
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @concepts/world-models-video-generation.md @concepts/context-matched-video-distillation.md @sweeps/2026-09-25-daily.md @entities/models/virdm.md

## Raw Concept

- **Title**: ViRDM: Taming Representation Distribution Matching for Few-Step Causal Video Generation
- **Type**: arXiv:2609.28923
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/ (archived 2026-09-25)
- **URL**: https://arxiv.org/abs/2609.28923
- **Retrieved**: 2026-09-25

## Narrative

ViRDM (Northeastern + **Adobe Research**) post-trains **few-step causal (AR) video** generators using **Representation Distribution Matching (RDM)** instead of **DMD** (teacher + online critic). Goal: **generator-only** distillation for streaming/low-latency video.

**Barriers addressed:** (1) memory-intractable RDM gradient through long rollouts → **stochastic clean-exit truncation**, **lightweight VAE decoder**, **staged vector–Jacobian products**; (2) video-specific optimization vs image RDM; (3) static RDM under-specifies **temporal dynamics** → optional **flow-based dynamics regularizer** (weight **5e-4** in released configs).

**Results [TENTATIVE]:** ~**20** generator updates → **84.87 VBench**, +**0.36** vs prior best few-step causal baseline; ~**16 A100·h** training in paper claim. Extends to fewer-step causal and bidirectional variants (§4.4–4.5).

**Phase-0:** GitHub **`neu-vi/ViRDM`** — **Apache-2.0 CONFIRMED**, ~**306 KB** tree — **GO clone (code + configs only; no weight download by default)**. Project: https://neu-vi.github.io/ViRDM/ Image-gen Phase-1: **none**.


## Snippets

- "ViRDM turns three-network distillation into generator-only post-training, reducing GPU memory use and training time." [Source: arXiv HTML 2609.28923]
- "With only 20 generator updates, the complete recipe reaches 84.87 on the official VBench evaluation." [TENTATIVE] [Source: arXiv HTML / HF papers 2609.28923]
- "Stochastic exits … staged VJPs avoid co-resident backward graphs." [Source: arXiv HTML §3.3]
- Code: https://github.com/neu-vi/ViRDM (Apache-2.0) · Page: https://neu-vi.github.io/ViRDM/ [Source: GitHub + HF (retrieved 2026-09-25)]
