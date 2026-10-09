---
title: "Memory Forcing — attendable mid-horizon history for streaming video (arXiv:2610.11756)"
type: source
tags: [paper, video-generation, memory, streaming, kv-cache, wan, watch]
keywords: [Memory Forcing, mid-horizon forgetting, KV cache, archive bank, bank-aware RoPE, similarity eviction, rolling forcing, DMD, streaming video, leave-and-return]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-09-daily.md
  - concepts/mid-horizon-kv-memory-video.md
  - concepts/latent-spatial-memory-video-world-models.md
  - concepts/autoregressive-video-foresight-training.md
  - entities/models/wan-2-2.md
maturity: draft
read_status: skimmed
created: 2026-10-09
updated: 2026-10-09
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-09-daily.md @concepts/mid-horizon-kv-memory-video.md @concepts/latent-spatial-memory-video-world-models.md @concepts/autoregressive-video-foresight-training.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: Memory Forcing: Attendable Mid-Horizon History for Streaming Video Generation
- **Type**: arXiv:2610.11756 (Nanjing University + Tsinghua + Kling Team, Kuaishou + Shanghai AI Lab; Jiaming Zhang, Xinyu Wang et al.) — ICLR 2027 submission
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.11756-memory-forcing-attendable-mid-horizon-history-fo.pdf (archived 2026-10-09)
- **URL**: https://arxiv.org/abs/2610.11756
- **Retrieved**: 2026-10-09

## Narrative

**The failure it names: mid-horizon forgetting.** Few-step streaming (causal) video diffusion keeps only two things attendable in its KV cache — the opening frames (a "sink") and a recent FIFO window (the "working" set). Once an event scrolls out of that FIFO it is **unreachable forever**. A subject that leaves the frame and returns, or a scene that cuts away and comes back, cannot be re-attended because its keys are gone.

**The fix.** Add a third cache region that retains mid-horizon events **without enlarging the cache and without a side store**. The KV cache is partitioned into **sink / archive / working** banks. When *working* fills, an eviction rule moves the chunk least similar to the incoming event into *archive*; when archive fills, it drops oldest-first. The subtle part is positional encoding: the absolute temporal indices of old events drift outside the range the model was trained on, so **Bank-aware RoPE** stores raw keys and re-assigns a temporal index at every attention. The best assignment is interpolated — sink at 0, archive spread across [0,1], working near the present.

**Results.** At 1.3B it tops the table at 15/30/60 s and shows the smallest 5 s to 60 s drop among methods reporting all four lengths. At Wan2.2 5B, VBench total falls only 84.24 to 81.93 (a delta of −2.31, the best shown), against −6.19 for Rolling Forcing and −22.56 for InfinityStar. **The leave-and-return retention claim is shown qualitatively in figures, not as a scored table** — treat it as unquantified.

**Phase-0 (2026-10-09).** **Weights are not shipped** — the paper says they "will be released after the paper is accepted", with no repository URL and no licence. Base models are **Wan2.1-T2V-1.3B** (main) and **Wan2.2 5B** (scaling). It is **training-based**: DMD distillation plus CausalForcing AR/ODE conversion for the 5B. Training was 1,000 steps at batch 32 on **32x A800 80 GB**.

**Verdict: WATCH-full** — genuinely new against the world-model memory lineage (`@concepts/latent-spatial-memory-video-world-models.md` keeps *explicit* memory modules; this keeps memory *inside* the KV cache), though it is an incremental advance on Rolling Forcing rather than a new paradigm, and the H100-class training plus pending weights mean it is not reproducible today. See `@concepts/mid-horizon-kv-memory-video.md`.

**Basgiath hook — on the metric, not the code.** **Leave-and-return retrieval** is precisely the world-gen round-trip test: walk away, come back, is the terrain still the same place? That is a check the existing Basgiath briefs do not cover, and it needs no KV-cache mechanism to be useful. The delta from short to long horizon is also a reusable long-horizon consistency score. Recorded for a possible fourth Basgiath brief; not written this session.

## Snippets

[Source: https://arxiv.org/abs/2610.11756 (retrieved 2026-10-09) — VBench delta −2.31 at 5B vs −6.19 Rolling Forcing.]
