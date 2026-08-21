---
title: "AV multi-agent orchestration CARLA (arXiv:2608.20129) — skip driving"
type: source
tags: [paper, skip, driving, multi-agent, carla]
keywords: [CARLA, PPO, PID, LLM orchestrator, autonomous driving]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-08-21-daily.md
maturity: draft
read_status: read
created: 2026-08-21
updated: 2026-08-21
phase0_verdict: SKIP
wire_status: wont_wire
---

## Relations

@sweeps/2026-08-21-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: Multi-Agent Orchestration with the Common-Sense Reasoning Capabilities of LLMs for Autonomous Driving
- **Authors**: Mehdi Azarafza, Faezeh Pasandideh, Ali Ehteshami Bejnordi, Stefan Henkler, Achim Rettberg (Hamm-Lippstadt)
- **Type**: arXiv:2608.20129 [cs.MA]
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.20129-multi-agent-orchestration-with-the-common-sense.pdf`
- **URL**: https://arxiv.org/abs/2608.20129
- **Retrieved**: 2026-08-21

## Narrative

**Phase-0: SKIP driving.** Hybrid CARLA stack: orchestrator coordinates PPO RL + PID; LLM common-sense iteratively refines the RL reward. Off-domain for persona gen. Not a game-dev ROUTE (CARLA AV ≠ robot/game world-model). Image-gen `wont_wire`.

## Snippets

> "This system uses an orchestrator to coordinate PPO-trained reinforcement learning and PID control, with LLM common-sense reasoning applied throughout the framework."

[Source: arxiv-2608.20129, abstract]
