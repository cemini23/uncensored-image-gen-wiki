---
title: ""CORNAV — robot navigation on construction sites (arXiv:2610.03622) — SKIP""
type: source
tags: [paper, robotics, navigation, out-of-domain, skip]
keywords: [CORNAV, robot navigation, construction site, scene graph, CAD blueprint, OSHA, A star planning, Unitree]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-05-daily.md
maturity: draft
read_status: skimmed
created: 2026-10-06
updated: 2026-10-06
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-05-daily.md

## Raw Concept

- **Title**: CORNAV: Construction-Aware Reasoning for Robot Navigation on Active Worksites
- **Type**: arXiv:2610.03622 (University of California, Irvine; Parastoo Ali Pour et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2610.03622-cornav-construction-aware-reasoning-for-robot-na.pdf (archived 2026-10-06)
- **URL**: https://arxiv.org/abs/2610.03622
- **Retrieved**: 2026-10-06

## Narrative

**What it does.** Grounds language queries for a mobile robot on a live construction site using 2D CAD blueprints plus an open-vocabulary 3D scene graph, converts project schedules into time-varying navigation constraints, and escalates hazardous work zones. No Building Information Model required.

**Results.** Blueprint grounding raises task success from 13.0% to 72.2% over semantic retrieval alone; zero hard-zone violations across 89 trials. Evaluated on a Unitree Go2 and G1 humanoid.

**Why SKIP.** Purely robotics and planning — no generative model of any kind. CLIP is discriminative, the GPT-4o module is a rule classifier, and the planner is classical A*. No diffusion policy, no video world model, no generative scene synthesis, and no simulation hook (real robots, recorded sensor data). No sibling wiki covers construction robotics. No Basgiath hook — the add-on needs world-gen and asset pipelines, not site-navigation planning.

## Snippets

[Source: https://arxiv.org/abs/2610.03622 (retrieved 2026-10-06)]
