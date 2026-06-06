---
title: "JAVEdit — joint audio-visual instruction editing (arXiv:2606.03168)"
type: source
tags: [paper, video-editing, audio-visual, instruction, dataset, ltx, lipsync]
keywords: [JAVEdit, JAVEdit-100k, JAVEditBench, joint audio-visual editing, agent-in-the-loop, LTX-2.3, LatentSync, SAM-Audio, speech editing]
related:
  - concepts/joint-audio-visual-instruction-editing.md
  - entities/models/javedit.md
  - concepts/sync-audio-video-customization.md
  - concepts/persona-audio-stack.md
  - entities/models/ltx-2.md
  - entities/lipsync/latentsync.md
  - entities/persona-ops/fish-speech.md
  - sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
  - concepts/mllm-video-translation.md
  - sources/arxiv-2606-03672-foley-omni.md
maturity: draft
read_status: read
created: 2026-06-06
updated: 2026-06-06
---

## Relations

@concepts/joint-audio-visual-instruction-editing.md @entities/models/javedit.md @concepts/sync-audio-video-customization.md @concepts/persona-audio-stack.md @entities/models/ltx-2.md

## Raw Concept

- **Title**: JAVEdit: Joint Audio-Visual Instruction-Guided Video Editing with Agentic Data Curation
- **Authors**: Yinan Chen, Chuming Lin, Zhennan Chen, Yuxiang Zeng, et al. (ZJU, Tencent Youtu Lab, NUS)
- **Type**: arXiv:2606.03168
- **Location**: `raw-sources/arxiv-2606.03168-javedit-joint-audio-visual-instruction-guided-vi.pdf`
- **URL**: https://arxiv.org/abs/2606.03168 · https://github.com/RyanChenYN/JAVEdit · https://huggingface.co/datasets/Coraxor/JAVEdit-100k
- **Retrieved**: 2026-06-06
- **Read status**: read (abstract + dataset + pipeline sections)

## Narrative

First large-scale **instruction-guided joint audio-visual editing** benchmark + baseline. Prior datasets (InsViE-1M, Ditto, OpenVE-3M) are visual-only; AVEdit/AVIEdit lack natural language instructions.

**JAVEdit-100k (~103K triplets):** human-centric videos; five categories — subject editing (appearance + voice), background editing (scene + ambient), subject removal/addition (shared reversed pipeline), speech editing (new dialogue + lipsync). Built via four automated pipelines + **agent-in-the-loop** QC (Qwen3-Omni checks). Audio separated with SAM-Audio into voice/music/ambient streams. SyncNet (LatentSync lineage) filters A/V misalignment.

**JAVEditBench:** curated eval with cross-modal metrics (AV sync, instruction compliance, fidelity).

**JAVEdit model:** LoRA finetune on **LTX-2.3** from JAVEdit-100k. Beats sequential visual-then-audio baselines; **+26% relative** AV synchrony vs strongest sequential alternative on bench `[TENTATIVE]`. Weights + data + code promised public.

### Workspace relevance

Direct upgrade path for **persona post-edit** — change outfit/background/dialogue in one pass vs Fish-Speech + LatentSync + FFmpeg cascade (@concepts/persona-audio-stack.md). Extends OmniCustom customization tier (@concepts/sync-audio-video-customization.md) with **natural-language instructions**. Watch LTX-2.3 VRAM + license for NSFW persona ops `[NEEDS VERIFICATION 2026-06-06]`.

## Snippets

> "Given a source video V with audio A and instruction I, produce edited (V′, A′) that executes specified modifications while preserving all content unrelated to the instruction."

> "JAVEdit outperforms all baselines on five of six metrics, with a 26% relative gain in audio-visual synchrony over the strongest sequential alternative."

## Dead Ends

Human-centric focus — not general object/scene editing like AlbedoEdit. Training pipelines use HunyuanImage/Wan2.2-Animate internally for data synth, not shipped as editor.
