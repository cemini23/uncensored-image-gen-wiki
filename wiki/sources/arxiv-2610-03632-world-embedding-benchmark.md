---
title: "World Embedding Benchmark — physical information in video embeddings (arXiv:2610.03632)"
type: source
tags: [paper, benchmark, world-model, video, embeddings, watch]
keywords: [World Embedding Benchmark, video embeddings, physical alignment, recoverability, JEPA, V-JEPA2, LCO-Embedding, physics adaptation, RAG for video, MiniMax-H3]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-05-daily.md
  - concepts/world-models-video-generation.md
maturity: draft
read_status: skimmed
created: 2026-10-06
updated: 2026-10-06
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-05-daily.md @concepts/world-models-video-generation.md

## Raw Concept

- **Title**: World Embedding Benchmark
- **Type**: arXiv:2610.03632 (University of Manchester + HK PolyU + SUFE; Yiqi Liu et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.03632-world-embedding-benchmark.pdf (archived 2026-10-06)
- **URL**: https://arxiv.org/abs/2610.03632
- **Retrieved**: 2026-10-06

## Narrative

**What it measures.** How much physical information **video embeddings** carry. It separates two questions that are easy to conflate: cross-modal *alignment* (does the embedding sit near the right text?) and *recoverability* (can a probe read quantitative physical values out of it?). The motivation is the use of video generative models as world models.

**Data.** 8,000 controlled simulation cases from 80 families across fluid mechanics, solid mechanics, dynamics, and optics/electromagnetism. Each case pairs a rendered video with simulation-derived physical annotations. Three tasks: text-video retrieval, physical-property regression via a linear probe on frozen embeddings, and video-description pair classification.

**Results.** Pretrained embeddings are weak — retrieval R@10 of 0.6–7.4, within-family pair classification near chance (47–53%), cross-family 66–86%. Prompted MLLMs do better (59–61% within-family, 91–92% cross-family). Continual contrastive "physics adaptation" lifts retrieval to 18.6–21.0 and cross-family to 98.2–98.4%, but **degrades regression** (nRMSE 2.89–3.95 against ~2.0) — a clean alignment-versus-recoverability trade-off. V-JEPA2, which has no text tower, gives the best regression (0.94–1.02). Retrieval-augmented generation with MiniMax-H3 raises average fidelity from 0.60 to 0.66.

**Environments (a correction worth recording).** **No Minecraft and no Habitat.** The simulators are OpenFOAM (fluid), FEniCSx/DOLFINx (solid FEM), Project Chrono plus analytical ODEs (dynamics), and HCIPy + Mitsuba 3 + Meep FDTD (optics/EM). Anyone expecting a game-world benchmark should look elsewhere.

**Phase-0 (2026-10-06).** Dataset and benchmark are released at `github.com/World-Representation-Lab/World-Embedding-Benchmark` and on HF under the same org. **No licence stated.** LCO-Embedding 3B/7B can run locally; MiniMax-H3 is cloud. Compute is not stated.

**Verdict: WATCH-thin.** It fits the wiki's world-model fidelity track (`@concepts/world-models-video-generation.md`) and the one actionable finding is the RAG result — retrieve physics references to raise generated-video fidelity. But it evaluates physics-simulation embeddings only, ships no local generation model, and provides **no Basgiath hook** (none of the Bedrock add-on's needs — NBT/LevelDB, container lifecycle, MCP automation, XUID identity, Blockbench art — appear).

## Snippets

[Source: https://arxiv.org/abs/2610.03632 (retrieved 2026-10-06) — physics adaptation lifts cross-family alignment to 98.2–98.4% but degrades regression.]
