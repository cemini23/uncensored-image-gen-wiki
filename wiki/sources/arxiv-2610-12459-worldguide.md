---
title: "WorldGuide — goal-directed video world model for procedural tasks (arXiv:2610.12459)"
type: source
tags: [paper, world-model, planning, closed-loop, video-generation, watch]
keywords: [WorldGuide, goal-directed, procedural task execution, closed loop, termination token, ContextPlanner, HunyuanVideo, Qwen2.5-VL, hierarchical visual memory, WorldGuide Bench]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-09-daily.md
  - concepts/world-models-video-generation.md
  - entities/models/hunyuanvideo-1-5.md
maturity: draft
read_status: skimmed
created: 2026-10-09
updated: 2026-10-09
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-09-daily.md @concepts/world-models-video-generation.md @entities/models/hunyuanvideo-1-5.md

## Raw Concept

- **Title**: WorldGuide: Goal-Directed Video World Model for Procedural Task Execution
- **Type**: arXiv:2610.12459 (MBZUAI; Ankan Deria, Komal Kumar, Hisham Cholakkal, Fahad Shahbaz Khan, Salman Khan)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.12459
- **Retrieved**: 2026-10-09

## Narrative

**What it actually is.** It generates, plans **and** acts, in a closed loop. Given an initial image and a goal, it predicts an atomic action, renders a short video clip of that action, inspects the generated outcome, and picks the next action — or emits a completion token `Task Completed` and stops.

**Method.** Base video generator is a **HunyuanVideo-1.5** (8.3B) DiT "Executor"; the planner is a fine-tuned **Qwen2.5-VL-7B** that predicts the next action or DONE from the goal, the generated visual state, and the recent clip-action pairs. A hierarchical visual memory coerces older latents spatially to bound token cost. New dataset: WorldGuide Bench, about 59K step-annotated videos across 245 tasks.

**Results.** Task success 33.33% on WorldGuide Bench against 29.90% for MiniMax-H3 — **and H3 is given reference plans while WorldGuide is not**. The ablations isolate what matters: closing the loop lifts success from 11.71% to 33.33%, and **visual feedback alone lifts it from 14.72% to 33.33%**. Memory adds a further 5.77 to 17.91 points. It takes the highest aesthetic and consistency scores on its own bench while trading some imaging quality on another.

**The transferable pattern.** Three things together: a planner grounded in the **generated** visual state (not in latent space, and not a frozen pretrained executor), an executor trained on the **same** atomic-action demonstrations, and an explicit **learned termination** signal. The DONE token is the cleanest piece — a generator that decides when a goal has been reached rather than running to a fixed horizon.

**Phase-0 (2026-10-09).** GitHub `mbzuai-oryx/WorldGuide` is linked but **no weights or checkpoints** are stated, and the dataset release is "planned" as source IDs and timestamps rather than videos. **No licence stated.** Trained on 8 nodes x 8 AMD MI210 for 7 days.

**Verdict: WATCH-thin.** Both components are locally runnable in principle (HunyuanVideo-1.5 and Qwen2.5-VL-7B fit a 4090 with quantisation) and the hierarchical memory compression is the reusable bit for long-context world models, but this is a paper-only artifact with no weights. See `@concepts/world-models-video-generation.md` and `@entities/models/hunyuanvideo-1-5.md`.

**Basgiath hook — none direct.** "Procedural task execution" here means craft and cooking **procedure video**, not procedural **world** generation — the wrong axis. The only export is the DONE-token termination idea, which maps loosely onto a test bench that decides its own completion, but there is no world-structure generation to reuse.

## Snippets

[Source: https://arxiv.org/abs/2610.12459 (retrieved 2026-10-09) — visual feedback alone lifts task success 14.72% → 33.33%.]
