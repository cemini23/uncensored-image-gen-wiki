---
title: "FlowLOB: controllable LOB generation with flow matching (arXiv:2608.13096) — routed guruwatcher"
type: source
tags: [paper, routed, finance, limit-order-book, flow-matching, cross-wiki, research-only]
keywords: [FlowLOB, limit order book, flow matching, generative simulation, HKEX, tick-relative, microstructure, zero-shot transfer, counterfactual]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-14-daily.md
maturity: draft
read_status: read
created: 2026-08-14
updated: 2026-08-14
---

## Relations

Primary: GuruWatcher research brief `briefs/2026-08-14_flowlob-lob-generation-research.md` (in `../GuruWatcher`). Dedup stub for image-gen digest.
@concepts/federated-daily-research-digest.md @sweeps/2026-08-14-daily.md

## Raw Concept

- **Title**: FlowLOB: Efficient and Controllable Limit Order Book Generation with Flow Matching
- **Authors**: Zhuohan Wang et al.
- **Type**: arXiv:2608.13096 [q-fin.TR]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.13096-flowlob-efficient-and-controllable-limit-order-b.pdf`
- **URL**: https://arxiv.org/abs/2608.13096
- **Retrieved**: 2026-08-14
- **Code**: none in PDF → no SPDX check

## Narrative

**Routed stub (guruwatcher) — research/microstructure, NOT order-routing.** Conditional **flow-matching** generator of limit-order-book trajectories, trained on multiple **HKEX** symbols at 3 sampling frequencies (0.1s / 1s / 10s) in tick-relative representation; transfers zero-shot to unseen instruments. Head-to-head vs diffusion (identical data/architecture/budget, same fixed-step ODE solvers): **flow matching hits best quality at only 10 ODE-solver steps**, diffusion needs many more NFE. Counterfactual controllability validated with a distributional test (does shifting a scenario condition move the generated statistic toward the real tail regime?). Both realism + control transfer zero-shot on a held-out symbol.

**Image-gen relevance:** none (finance). Routed to GuruWatcher because LOB *simulation* is the reference tool for stress-testing microstructure/parameter watches — but per the GuruWatcher `skip_brief_if` ("order-routing / live execution bots — alert-only"), this is **wiki/research-only**: no order routing, no LIVE trading, no cemini-prod SCP.

**Phase-0: SKIP gen-install / ROUTE guruwatcher research-only.** No code in PDF → no SPDX. Not atto / poker / prod.

## Snippets

> "Flow matching attains its best quality with only 10 ODE-solver steps, whereas diffusion needs many more function evaluations to approach the same fidelity."

_[Source: arxiv-2608.13096, abstract]_
