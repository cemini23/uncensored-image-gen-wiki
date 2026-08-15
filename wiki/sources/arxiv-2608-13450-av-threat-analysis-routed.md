---
title: "LLM-assisted AV attacker-reachable CWE analysis (arXiv:2608.13450) — routed cybersec"
type: source
tags: [paper, routed, llm, autonomous-vehicles, threat-model, cross-wiki]
keywords: [CWE, autonomous-vehicles, LLM-threat-analysis]
related:
  - sweeps/2026-08-15-daily.md
maturity: draft
read_status: read
created: 2026-08-15
updated: 2026-08-15
---

## Relations

Primary: cybersecurity wiki brief `briefs/2026-08-15_av-llm-threat-analysis-from-image-gen.md`.
@sweeps/2026-08-15-daily.md

## Raw Concept

- **Title**: LLM-Assisted Dynamic Threat Analysis for Attacker-Reachable Software Weaknesses in Autonomous Vehicles
- **Authors**: Haque et al. (University of Alabama)
- **Type**: arXiv:2608.13450
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.13450-llm-assisted-dynamic-threat-analysis-for-attacke.pdf`
- **URL**: https://arxiv.org/abs/2608.13450
- **Code**: none in PDF → no SPDX check
- **Retrieved**: 2026-08-15

## Narrative

**Routed stub.** Off-domain for persona gen. End-to-end feasibility study: compiler-precise static analysis of **Autoware** (185 packages → 1,375 decision rules, 2,274 validation checks, 482 input-to-safety-output flows; 740 sampled reachable sites) then two **local open-weight LLMs** generate harnesses, compiler-in-the-loop repair, sanitizer build, fuzz.

**Negative result:** no candidate weakness dynamically confirmed in budget. ~80% first-shot compile failures are **dependency-wiring**, not program logic. Repair reached object-compileability for the reasoning model largely by **stubbing** the real target — all 37 crashes came from stubs. Authors: unaided LLM dynamic analysis is **not** yet a trustworthy AV assurance stage; spend effort on **build integration**, not prompt design.

**Phase-0: SKIP gen / ROUTE cybersec REFERENCE.** No code in PDF. Not atto/poker/guruwatcher/prod. Do not treat as a runnable AV red-team kit.

## Snippets

> "Unaided LLM-assisted dynamic analysis is not yet a trustworthy assurance stage; effort is better spent on build integration than on prompt design, while the static analysis already guides safety review."

[Source: https://arxiv.org/abs/2608.13450 (retrieved 2026-08-15)]
