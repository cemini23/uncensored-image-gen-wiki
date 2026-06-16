---
title: "FoleyGenEx — unified controllable video-to-audio (arXiv:2606.14049)"
type: source
tags: [paper, audio, foley, video-to-audio, vta, kling, multimodal]
keywords: [FoleyGenEx, VTA, MMAudio, MultiFoley, MMDiT, flow matching, adverb augmentation, audio-controlled VTA, foley extension, Kuaishou Kling]
related:
  - concepts/unified-controllable-video-to-audio.md
  - entities/models/foleygenex.md
  - concepts/persona-audio-stack.md
  - entities/models/foley-omni.md
  - sources/arxiv-2606-03672-foley-omni.md
  - entities/sfx-models/stable-audio-open.md
  - entities/models/ltx-2.md
  - sources/arxiv-2605-20183-msavbench-multi-shot-audio-video.md
  - sweeps/2026-06-16-daily.md
maturity: draft
read_status: read
created: 2026-06-16
updated: 2026-06-16
---

## Relations

@concepts/unified-controllable-video-to-audio.md @entities/models/foleygenex.md @concepts/persona-audio-stack.md @entities/models/foley-omni.md

## Raw Concept

- **Title**: FoleyGenEx: Unified Video-to-Audio Generation with Multi-Modal Control, Temporal Alignment, and Semantic Precision
- **Authors**: Shiyao Wang, Xijuan Zeng, Hui Wang et al. (Nankai + Kuaishou Kling Team)
- **Type**: arXiv:2606.14049
- **Location**: `raw-sources/arxiv-2606.14049-foleygenex-unified-video-to-audio-generation-wit.pdf`
- **URL**: https://arxiv.org/abs/2606.14049 · https://foleygenex.github.io/FoleyGenEx · https://github.com/FoleyGenEx/FoleyGenEx
- **Retrieved**: 2026-06-16
- **Read status**: read (abstract + framework)

## Narrative

**Problem:** Prior VTA methods trade off **temporal sync** (MMAudio-class) vs **multi-modal control + reference audio** (MultiFoley-class).

**FoleyGenEx** unifies five tasks in one flow-matching MMDiT framework:

| Task | Conditioning |
|------|----------------|
| TTA | Text |
| VTA | Video semantics + Synchformer sync |
| TC-VTA | Text + video sync (decoupled semantics — e.g. "lion roar" on cat video) |
| AC-VTA | Reference audio timbre/events + sync |
| Foley extension (FE) | Extend existing audio segment on new video |

**Innovations:** Multi-modal dynamic masking (train/infer parity); adverb-based LLM+DSP augmentation (speed/volume/distance cues); masked MSE on audio latents.

**Eval:** AudioCaps, VGGSound, Greatest Hits — competitive sync + control vs MMAudio / MultiFoley / FoleyCrafter `[TENTATIVE]`.

### Workspace relevance

Potential upgrade path for **persona video foley mux** (@concepts/persona-audio-stack.md) when silent Wan/LTX clips need synced SFX+ambience with reference-audio style transfer. Complements unified V2ST @entities/models/foley-omni.md (speech+SFX+music joint) — FoleyGenEx emphasizes **controllable VTA task unification**.

## Snippets

> "FoleyGenEx fills this gap via three core innovations: a conditional injection mechanism for audio-controlled VTA and Foley extension, a multi-modal dynamic masking strategy preserving training synchronization, and an adverb-based data augmentation algorithm."

## Dead Ends

Kling-team lineage — weights license unknown; repo has 0 stars at audit `[NEEDS VERIFICATION 2026-06-16]`. Not a voice-clone replacement for Fish-Speech DM notes.
