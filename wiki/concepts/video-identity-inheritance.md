---
related:
  - sources/ai-creator-operations-blueprint.md
  - sources/ai-persona-launch-strategy-analysis.md
  - sources/video-generation-survey-2026.md
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - concepts/multi-angle-dataset-prep.md
  - concepts/seam-stitching-strategies.md
  - entities/adapters/pulid.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/seedance-2.md
  - entities/models/qwen-image-2512.md
  - entities/models/z-image-turbo.md
  - entities/models/flux-2-klein.md
  - sources/headsup-3d-gaussian-head.md
  - entities/persona-ops/personalive.md
  - entities/models/openrouter-video.md
  - entities/uis/comfyui.md
  - concepts/persona-audio-stack.md
  - entities/lipsync/latentsync.md
  - entities/lipsync/musetalk.md
  - entities/lipsync/sadtalker.md
  - entities/lipsync/liveportrait.md
  - concepts/2026-05-13_gracia-ai-volumetric-video.md
  - concepts/grpo-i2v-post-training.md
  - concepts/sync-audio-video-customization.md
  - sources/arxiv-tagrpo-i2v-grpo-2601-05729.md
  - sources/arxiv-omnicustom-sync-audio-video-2602-12304.md
  - entities/models/omnicustom.md
  - concepts/autoregressive-video-foresight-training.md
  - sources/arxiv-2606-03971-video-mirai-autoregressive-foresight.md
  - sources/arxiv-2606-08514-omnitryon-video-try-on.md
  - concepts/video-try-on-anything.md
  - entities/models/omnitryon.md
  - sources/arxiv-2606-13872-avatar-v-video-reference-avatar.md
  - concepts/video-reference-avatar-generation.md
  - entities/models/avatar-v.md
  - sources/arxiv-2506-08797-hunyuanvideo-homa.md
  - concepts/hunyuanvideo-homa-weak-hoi-video.md
  - sweeps/2026-07-11-daily.md
  - sources/arxiv-2606-14667-memento-long-video-subject-reconstruction.md
  - concepts/subject-reconstruction-long-video-memory.md
  - entities/models/memento.md
  - sources/arxiv-2606-13768-cineorchestra-entity-centric-cinematic-video.md
  - concepts/entity-centric-cinematic-video-conditioning.md
  - concepts/lightweight-video-history-embeddings.md
  - sources/arxiv-2512-23851-tinyhistory-lightweight-video-history.md
  - sources/arxiv-2607-01869-qwerty-query-warped-video-motion-control.md
  - concepts/query-warped-video-motion-control.md
  - sources/hf-flux2-klein-9b-matchingpose.md
  - entities/adapters/flux2-klein-matchingpose.md
  - sources/arxiv-2607-07173-spara-dcal-subject-driven-personalization.md
  - concepts/stage-aware-lora-distribution-calibrated-selection.md
  - sources/arxiv-2607-14976-d2df-one-step-video-object-removal.md
  - entities/models/d2df.md
  - concepts/one-step-video-object-removal.md
  - sweeps/2026-07-17-daily.md
  - sources/arxiv-2607-18217-homie-video-personalization.md
  - entities/models/homie.md
  - sweeps/2026-07-21-daily.md
title: Video identity inheritance (I2V from static master)
type: concept
tags: [persona-consistency, i2v, identity-inheritance, video-workflow, clip-vision-encoder, master-image]
keywords: [i2v, image-to-video, identity-inheritance, master-image, clip-vision-encoder, raw-pixel-initialization, pulid-anchor, airt-machine, seedance, kling, wan, hunyuan, persona-consistency]
maturity: draft
created: 2026-05-07
updated: 2026-07-21
---


## Relations

@sources/ai-creator-operations-blueprint.md @sources/ai-persona-launch-strategy-analysis.md @sources/video-generation-survey-2026.md @sources/synthetic-character-consistency-survey.md @concepts/persona-consistency-methods.md @concepts/multi-angle-dataset-prep.md @concepts/seam-stitching-strategies.md @entities/adapters/pulid.md @entities/models/wan-2-2.md @entities/models/hunyuanvideo-1-5.md @entities/models/seedance-2.md @entities/models/qwen-image-2512.md @entities/models/z-image-turbo.md @entities/models/flux-2-klein.md @sources/headsup-3d-gaussian-head.md
@entities/models/openrouter-video.md
@entities/uis/comfyui.md

@concepts/persona-audio-stack.md
@entities/lipsync/latentsync.md @entities/lipsync/musetalk.md @entities/lipsync/sadtalker.md @entities/lipsync/liveportrait.md
@concepts/2026-05-13_gracia-ai-volumetric-video.md — volumetric video, an adjacent generative-media surface
@concepts/query-warped-video-motion-control.md @entities/adapters/flux2-klein-matchingpose.md

## Raw Concept

Page prompted by the May 2026 video survey ingest. Video identity inheritance is the fourth axis of the persona-consistency taxonomy — propagating a single static persona master image into temporally-coherent video clips while preserving facial geometry across motion. The non-negotiable cornerstone of AI-influencer / narrative-filmmaking workflows in 2026.

Synthesized from @sources/video-generation-survey-2026.md.

## Narrative

### The two-step rule

Generating consistent recurring digital persona via **pure text prompts** is mathematically prohibitive — every seed produces slightly different facial structure due to diffusion's probabilistic / hallucinatory nature. T2V is for environmental B-roll only.

For persona work, the canonical 2026 pipeline is two-step:

1. **Generate static master image** — high-fidelity persona portrait via FLUX.2 / Qwen-Image-2512 / Z-Image Turbo with character LoRA + PuLID II anchor. → @entities/models/flux-2-klein.md @entities/models/qwen-image-2512.md @entities/models/z-image-turbo.md @entities/adapters/pulid.md
2. **Inject master into video model's initial latent state** — I2V mode passes the master through the model's encoding pathway as the seed for temporal diffusion.

[CONFIRMED] [Source: Video Generation Models Survey 2026.docx p.5]

### CLIP Vision encoder vs raw pixel initialization

A critical architectural choice in ComfyUI workflows: pass the master image through the **CLIP Vision encoder**, **not** as raw pixel initialization. [CONFIRMED]

| Path | What happens | Outcome |
|------|--------------|---------|
| **Raw pixel init** | Master image is treated as the literal first frame; subsequent frames diffuse from it | Pixel-level fidelity to first frame, but the video model lacks the anatomical depth signal → drift on rotation, expression change, occlusion |
| **CLIP Vision encoder** | Master is passed through CLIP Vision; deep semantic + 3D structural face features extracted; encoded representation seeds the I2V latent | Video model understands the anatomical depth of the character before animating → identity holds across motion |

The CLIP Vision encoder pattern is what enables identity preservation across dynamic action — it's the difference between "first frame looks right then drifts" and "the persona persists." [Source: Video Generation Models Survey 2026.docx p.5]

### Identity-preservation leadership (May 2026)

| Model | I2V identity rate | Notes |
|-------|-------------------|-------|
| **Seedance 2.0** (closed) | Industry-leading consistency preservation | Multi-input (9 images + 3 video + 3 audio); benchmark reference. → @entities/models/seedance-2.md |
| **Kling 3.0** (closed) | Top-tier I2V ELO | Closest open peer to Seedance. PG-13 alignment posture |
| **Wan 2.2** (open, 16 GB+) | Strong with abliterated TE + LoRA stack | Mickmumpitz 96-angle pipeline anchors here. → @entities/models/wan-2-2.md |
| **HunyuanVideo 1.5** (open, 16 GB+) | SSTA-accelerated; LoRA-tuneable | `nsfwsks` trigger; explicit Musubi Tuner support. → @entities/models/hunyuanvideo-1-5.md |
| **CogVideoX 1.5** (open, 7 GB INT8) | Cheapest local I2V | 768p / 10s ceiling |

### AIrt MAchIne — automated I2V prompt orchestration

ComfyUI workflow template that integrates an LLM to:
1. Analyze the static master image (semantic content, scene context, persona attributes)
2. Generate a sequence of optimized text prompts that guide the I2V model (Kling 3.0 / Wan 2.2)
3. Drive the I2V model with the prompt sequence to produce coherent motion

This bridges the gap between static reference and temporal diffusion — the LLM acts as a director / prompt-author for the video model. Two ComfyUI templates exist (full version and API version). [CONFIRMED] [Source: Video Generation Models Survey 2026.docx p.5, citing comfy.org/workflows/templates_mjm_airt_machIne-fa9731c2000f + templates_mjm_airt_machine_api-5d0cbc370579]

### Failure modes

- **Skipping CLIP Vision encoder** → drift on first rotation
- **Using a master image with bad lighting / pose for I2V** → all generated motion inherits the awkwardness; treat the master like a key cinematography frame
- **Master with PuLID II strength too high (>0.55)** → master locks identity rigidly; I2V refuses meaningful pose change
- **Master with PuLID II strength too low (<0.35)** → identity drifts across video clip even with CLIP Vision encoder
- **Wan 2.2 base model on NSFW master** → master frame is preserved but downstream frames artifact (anatomy scrubbed) → use abliterated text encoder + NSFW LoRA stack on Wan, or generate master on FLUX/Qwen and let identity ride through the I2V's CLIP Vision pathway

### 2026-07-04 pose/motion control additions

**MatchingPose** (@entities/adapters/flux2-klein-matchingpose.md) belongs before I2V: use it to generate clean FLUX.2 Klein master frames in repeatable mannequin-derived poses. **QWERTY** (@concepts/query-warped-video-motion-control.md) belongs inside I2V: once code ships, it should let Wan/CogVideoX follow object/camera motion with early-step query guidance while preserving the master-frame identity.

## Snippets

> "Generating a consistent, recurring digital persona across multiple videos using purely text prompts is mathematically prohibitive due to the probabilistic, hallucinatory nature of diffusion networks; the model will invariably generate a slightly different facial structure with every seed."
[Source: Video Generation Models Survey 2026.docx p.5, citing reddit.com/r/comfyui/comments/1s746sw]

> "I2V is the non-negotiable cornerstone of AI influencer generation and narrative filmmaking. The methodology requires a two-step process: First, generating a high-fidelity static master image of the character using advanced image models (e.g., Flux 2 or Qwen) integrated with highly specific character LoRAs. Second, injecting this static master image into the video model's initial latent state."
[Source: Video Generation Models Survey 2026.docx p.5]

> "A critical architectural pattern is passing the initial static image through a CLIP Vision encoder rather than simply using it as a raw pixel initialization. The CLIP Vision encoder extracts deep semantic features and 3D structural data from the face, ensuring the subsequent video model understands the anatomical depth of the character before animating it."
[Source: Video Generation Models Survey 2026.docx p.5]

## Dead Ends

- **Pure T2V for persona consistency**: mathematically impossible. Always anchor with I2V.
- **Raw-pixel I2V initialization** (skipping CLIP Vision encoder): identity drift on first rotation. Always route through CLIP Vision.
