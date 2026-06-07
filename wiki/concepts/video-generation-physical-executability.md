---
title: Video generation physical executability (Dream.exe)
type: concept
tags: [concept, video-generation, benchmark, world-model, physics, robotics, evaluation]
keywords: [Dream.exe, physical executability, video-to-execution, world model hypothesis, robot manipulation benchmark, simulation grounding]
related:
  - sources/arxiv-2606-04811-dream-exe-robot-executability.md
  - concepts/world-models-video-generation.md
  - sources/arxiv-yocausal-world-model-benchmark-2605-30346.md
  - sources/arxiv-proprio-physics-video-2605-28230.md
  - sources/arxiv-2603-18639-orthophys-physics-video.md
  - sources/video-generation-survey-2026.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/ltx-2.md
maturity: draft
created: 2026-06-07
updated: 2026-06-07
---

## Relations

@sources/arxiv-2606-04811-dream-exe-robot-executability.md @concepts/world-models-video-generation.md @sources/arxiv-yocausal-world-model-benchmark-2605-30346.md @entities/models/wan-2-2.md

## Raw Concept

Concept from 2026-06-07 ingest — arXiv:2606.04811 Dream.exe.

## Narrative

**Gap in standard eval:** VBench / aesthetic scores measure how videos *look*, not whether implied motion could succeed in reality. A robot arm passing through a table scores like a valid grasp.

**Dream.exe criterion:** generated manipulation video → extracted 3D trajectory → **simulator execution success** as primary metric. Three tracks: visual QA, trajectory fidelity, closed-loop physics sim.

**Implication for world models:** internet-scale video generators (Wan, Hunyuan, LTX, closed APIs) may already encode **executable** physics — but **visual leadership ≠ physical leadership**. Persona/video operators should treat flashy I2V as untrusted for contact-heavy motion until executability-style probes exist for their domain.

**Wiki physics cluster:** YoCausal (causal understanding), Proprio (physics scoring at inference), OrthoPhys (multi-view plausibility) — Dream.exe adds **action grounding** via robot sim.

## Snippets

(See @sources/arxiv-2606-04811-dream-exe-robot-executability.md)

## Dead Ends

Robot-manipulation-specific — not a lipsync/persona quality metric. No local benchmark runner at ingest.
