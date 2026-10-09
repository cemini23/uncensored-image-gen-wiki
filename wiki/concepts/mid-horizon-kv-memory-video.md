---
title: Mid-horizon KV memory for streaming video (archive banks)
type: concept
tags: [video-generation, memory, streaming, kv-cache, technique]
keywords: [mid-horizon forgetting, archive bank, similarity eviction, bank-aware RoPE, KV cache partitioning, sink tokens, leave-and-return, streaming video, Rolling Forcing]
related:
  - sources/arxiv-2610-11756-memory-forcing.md
  - concepts/latent-spatial-memory-video-world-models.md
  - concepts/implicit-memory-retrieval-video-world-models.md
  - concepts/autoregressive-video-foresight-training.md
  - sweeps/2026-10-09-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
created: 2026-10-09
updated: 2026-10-09
---

## Relations

@sources/arxiv-2610-11756-memory-forcing.md @concepts/latent-spatial-memory-video-world-models.md @concepts/implicit-memory-retrieval-video-world-models.md @concepts/autoregressive-video-foresight-training.md @sweeps/2026-10-09-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

The question this page answers: in a streaming video model, why does an object that leaves the frame and comes back get rendered wrong — and can that be fixed inside the cache you already have? Synthesized from arXiv:2610.11756 (Memory Forcing).

## Narrative

**The failure, named.** Few-step streaming (causal) video diffusion attends to two things: the opening frames — a **sink** that anchors style and content — and a **rolling window** of recent frames, typically a FIFO. Everything else is unreachable. Once an event scrolls out of that window its keys are evicted, so **it can never be attended to again**. The paper calls this **mid-horizon forgetting**, and it produces a specific symptom: a subject that leaves and returns, or a scene that cuts away and comes back, is regenerated inconsistently because the model has no access to what it produced before.

Note the distinction from the wiki's other memory entries. `@concepts/latent-spatial-memory-video-world-models.md` and `@concepts/implicit-memory-retrieval-video-world-models.md` keep memory in **explicit spatial modules** — a maintained map or store of scene content. This approach keeps memory **inside the KV cache itself**, with no side store and no added module.

**The technique.** Partition the cache into three banks instead of two: **sink**, **archive**, **working**.
- When *working* fills, an eviction rule moves the chunk **least similar to the incoming event** into *archive*, rather than dropping it.
- When *archive* fills, drop oldest-first.
- Total cache size is unchanged — archive is carved out of the budget, not added to it.

**The subtle part is positional encoding.** Old events carry absolute temporal indices that lie **outside the range the model was trained on**, so naive re-attention is out of distribution and the model misbehaves. The fix is to store **raw keys** and re-assign a temporal index at every attention ("bank-aware RoPE"). The best assignment reported is interpolated: sink at position 0, archive spread across the interval, working near the present. Getting this wrong is the difference between the mechanism working and it producing garbage.

**Reported effect.** At 1.3B it leads at 15/30/60 s and shows the smallest quality drop from 5 s to 60 s among methods reporting all four lengths. At 5B the VBench total falls only 2.31 points, against 6.19 for Rolling Forcing and 22.56 for another baseline.

**Operator caveats.** Two are important. First, the headline **leave-and-return retention is demonstrated qualitatively in figures, not scored in a table** — so treat the claim as unquantified rather than measured. Second, this is a **training-based** change: it rides on Rolling Forcing's rolling-window joint denoising plus DMD distillation, trained on 32 A800s. Weights were not released at ingest. There is no drop-in version of this for an existing pipeline.

**Where the idea does transfer.** The **evaluation** half is more portable than the mechanism: "leave and return" is a general consistency test for any long-horizon generator, and it applies whether or not the model uses a KV cache. Delta-from-short-to-long-horizon is likewise a reusable stability score. Recorded as a possible Basgiath round-trip check — walk away, come back, is the terrain still the same place — since none of the three existing Basgiath briefs cover that case.

## Snippets

[Source: https://arxiv.org/abs/2610.11756 (retrieved 2026-10-09) — cache partitioned into sink / archive / working; raw keys stored and temporal index re-assigned per attention.]
