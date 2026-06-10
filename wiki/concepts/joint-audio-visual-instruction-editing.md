---
title: Joint audio-visual instruction editing (JAVEdit)
type: concept
tags: [concept, video-editing, audio-visual, instruction, persona-ops]
keywords: [JAVEdit, joint AV editing, instruction editing, speech editing, background editing, agent curation]
related:
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
  - entities/models/javedit.md
  - concepts/sync-audio-video-customization.md
  - concepts/persona-audio-stack.md
  - concepts/mllm-video-translation.md
  - entities/models/ltx-2.md
  - entities/lipsync/latentsync.md
  - sources/arxiv-2606-03672-foley-omni.md
  - concepts/multi-shot-audio-video-evaluation.md
  - sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - concepts/task-isolated-unified-video-editing.md
  - entities/models/tide.md
maturity: draft
created: 2026-06-06
updated: 2026-06-10
---

## Relations

@sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md @concepts/sync-audio-video-customization.md @concepts/persona-audio-stack.md @entities/models/ltx-2.md

## Raw Concept

Concept from 2026-06-06 ingest — arXiv:2606.03168 JAVEdit.

## Narrative

**Task:** natural-language instruction edits **both** video and audio jointly while preserving off-instruction content.

**Five edit categories (human-centric):**

| Category | Visual | Audio |
|----------|--------|-------|
| Subject edit | Appearance change | Matching voice timbre/style |
| Background edit | Scene swap | Ambient sound swap |
| Subject removal | Person erased | Voice removed |
| Subject addition | Person inserted | Voice added |
| Speech edit | Lip motion updated | New spoken content (same speaker) |

**Data:** JAVEdit-100k with agent-in-the-loop QC; **model:** LTX-2.3 LoRA baseline.

**vs persona stack today:** replaces sequential Fish-Speech → Wan I2V → LatentSync → FFmpeg with one instruction-conditioned pass when weights mature. Sits between OmniCustom (reference-driven customization) and Foley-Omni (soundtrack generation) on the AV axis.

## Snippets

(See @sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md)
