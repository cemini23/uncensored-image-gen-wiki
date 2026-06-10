---
title: JAVEdit (Tencent Youtu / ZJU)
type: entity
tags: [model, video-editing, audio-visual, instruction, ltx]
keywords: [JAVEdit, LTX-2.3 LoRA, joint audio-visual editing, JAVEdit-100k, JAVEditBench]
related:
  - sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md
  - concepts/joint-audio-visual-instruction-editing.md
  - entities/models/ltx-2.md
  - concepts/persona-audio-stack.md
  - concepts/sync-audio-video-customization.md
  - entities/lipsync/latentsync.md
  - sources/arxiv-2606-08260-tide-unified-video-editing.md
  - concepts/task-isolated-unified-video-editing.md
  - entities/models/tide.md
maturity: draft
created: 2026-06-06
updated: 2026-06-10
---

## Relations

@sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md @concepts/joint-audio-visual-instruction-editing.md @entities/models/ltx-2.md @concepts/persona-audio-stack.md

## Raw Concept

Entity stub from 2026-06-06 ingest — JAVEdit baseline on LTX-2.3.

## Narrative

**JAVEdit** — LoRA finetune on **LTX-2.3** for instruction-guided joint audio-visual editing. Trained on **JAVEdit-100k** (~103K human-centric triplets). Evaluated on **JAVEditBench**.

**Release status:** code + dataset + weights promised at ingest `[NEEDS VERIFICATION 2026-06-06]`. GitHub: RyanChenYN/JAVEdit.

**Persona ops:** candidate to replace cascaded voice + video + lipsync post when open weights land; verify LTX-2.3 Community License + NSFW policy before build-track adoption.

## Snippets

(See @sources/arxiv-2606-03168-javedit-joint-audio-visual-editing.md)

## Dead Ends

None until weights verified — if license blocks commercial NSFW, remains research reference only.
