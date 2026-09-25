---
title: "WanPE (arXiv:2609.30221)"
type: source
tags: [paper, video, prompt, watch]
keywords: [Wan, prompt enhancement, cinematic, text-to-video, screenplay]
related:
  - concepts/federated-daily-research-digest.md
  - concepts/model-selection-workflow.md
  - sweeps/2026-09-25-daily.md
  - entities/models/wanpe.md
  - entities/models/wan-2-2.md
  - runbooks/runpod-unified-gen-stack.md
maturity: draft
read_status: deep-read
created: 2026-09-25
updated: 2026-09-25
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @concepts/model-selection-workflow.md @sweeps/2026-09-25-daily.md @entities/models/wanpe.md @entities/models/wan-2-2.md @runbooks/runpod-unified-gen-stack.md

## Raw Concept

- **Title**: WanPE: Towards Cinematic Prompt Enhancement for Modern Text-to-Video Generation
- **Type**: arXiv:2609.30221
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/ (archived 2026-09-25)
- **URL**: https://arxiv.org/abs/2609.30221
- **Retrieved**: 2026-09-25

## Narrative

WanPE (Alibaba Wan Team + Nanjing/Fudan/Tsinghua) treats **long-form T2V** as screenplay-first planning: user intent → **director-level cinematic prompt** (multi-shot actions, camera, lighting, sound) → downstream generator (paper highlights **Wan3.0**).

**Method:** (1) dual objectives formalized in §2.1; (2) **video-grounded reverse construction** — captions/plans derived from ~**1.05M** real videos (hierarchical, category-adaptive); (3) **SC-GRPO** (semantic-consistency GRPO) to keep expansions faithful to user intent. **WanPEval** human bench: **5–30s**, varied granularity, ~**11k** blind pairwise judgments.

**Scale:** models from **4B → 397B**; largest variant is a **cloud training artifact**, not a RunPod 4090 director. For local stacks, watch **small WanPE** checkpoints or distill patterns into SmolLM/Qwen expanders (@runbooks/runpod-unified-gen-stack.md).

**Results [TENTATIVE]:** WanPE-397B + Wan3.0 reported **+10.66–18.84** human-preference points vs raw prompts at 5–15s and **+50.86** at 30s on WanPEval; competitive with Seedance 2.5 at 30s in paper tables.

Phase-0: **no SPDX public weights repo** at deep-read — **no clone**. Image-gen Phase-1: **none**.


## Snippets

- "We present WanPE, a 397B-parameter prompt enhancement model trained on 1.05M real-world videos to master director-level cinematic planning." [Source: https://arxiv.org/abs/2609.30221 (retrieved 2026-09-25)]
- "We curate WanPEval, a human-annotated testbed covering durations from 5 to 30 seconds … approximately 11K blind pairwise assessments." [Source: arXiv HTML 2609.30221]
- "WanPE first formalizes these dual objectives … learns coherent cinematic planning through video-grounded reverse construction … strengthens semantic fidelity with SC-GRPO." [Source: arXiv HTML 2609.30221 §2]
- Project page / eval: arXiv HTML + HF papers page; no laptop weights. [TENTATIVE]
