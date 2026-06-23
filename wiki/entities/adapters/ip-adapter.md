---
title: IP-Adapter (family — base, Plus, FaceID, FaceID-Plus-V2, FaceID-Portrait)
type: entity
tags: [adapter, identity-injection, image-prompt, tencent, ip-adapter, sdxl, sd15]
keywords: [IP-Adapter, IP-Adapter Plus, IP-Adapter FaceID, FaceID Plus V2, FaceID Portrait, FaceID SDXL, h94, Tencent ARC, CLIP vision encoder, holistic embedding, image prompt adapter]
related:
  - sources/synthetic-character-consistency-survey.md
  - sources/ai-content-factory-workflow-design.md
  - sources/mac-studio-ai-content-factory-design.md
  - concepts/persona-consistency-methods.md
  - entities/adapters/pulid.md
  - entities/adapters/instantid.md
  - entities/adapters/consistentid.md
  - entities/adapters/infinite-you.md
  - entities/adapters/photomaker-v2.md
  - entities/adapters/characonsist.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - concepts/reference-plus-lora-stacking.md
  - entities/models/pony-v6.md
  - entities/models/illustrious-xl.md
  - concepts/model-selection-workflow.md
  - entities/uis/comfyui.md
  - sources/arxiv-2606-20971-unity-attention-flow-conditioning.md
  - concepts/universal-composite-diffusion-conditioning.md
  - entities/models/unity.md
maturity: draft
created: 2026-05-06
updated: 2026-06-23
---

## Relations

@sources/synthetic-character-consistency-survey.md
@sources/mac-studio-ai-content-factory-design.md
@sources/ai-content-factory-workflow-design.md
@concepts/persona-consistency-methods.md
@entities/adapters/pulid.md
@entities/adapters/instantid.md
@entities/adapters/consistentid.md
@entities/adapters/infinite-you.md
@entities/adapters/photomaker-v2.md
@entities/adapters/characonsist.md
@entities/adapters/flux2-klein-9b-faceswap.md
@concepts/reference-plus-lora-stacking.md
@entities/models/pony-v6.md
@entities/models/illustrious-xl.md
@concepts/model-selection-workflow.md

## Raw Concept

Entity stub created during back-fill of @sources/synthetic-character-consistency-survey.md (the "Synthetic Character Consistency Survey" docx → `briefs/persona-consistency.md`). IP-Adapter is the foundational identity-injection adapter family from 2023-2024; subsequent adapters (PuLID, InstantID, ConsistentID) build on or compete against its design.

## Narrative

### What it is

[IP-Adapter](https://github.com/tencent-ailab/IP-Adapter) ("Image Prompt Adapter") is a family of small adapter networks from **Tencent ARC + the h94 fork** that inject image features into Stable Diffusion's cross-attention layers as a *parallel* conditioning stream alongside text. The key trick: image features come from a **CLIP vision encoder**, projected into the same dimensionality as the text-conditioning stream, then summed in cross-attention.

This makes IP-Adapter compatible with any SD 1.5 / SDXL backbone *without retraining the backbone* — only the adapter is trained. It is the modal "image-prompt" adapter for SDXL workflows.

### The family — what they actually do

| Variant | Encoder | Designed for | Strength | NSFW alignment |
|---|---|---|---|---|
| **IP-Adapter (base)** | OpenCLIP-G | Style + composition reference | Holistic — copies clothing, hair, pose | Mostly SFW pretraining |
| **IP-Adapter Plus** | DINO-V2 / OpenCLIP-bigG | Stronger style transfer | Higher fidelity | SFW |
| **IP-Adapter FaceID** | InsightFace + projection | Face identity only | High fidelity, face-only | **SFW-trained, degrades on explicit anatomy** |
| **IP-Adapter FaceID-Plus-V2** | InsightFace + CLIP fallback | Face identity + slight composition carry | Best face fidelity in family | SFW |
| **IP-Adapter FaceID-Portrait** | InsightFace, multi-image | Portraits, multi-reference averaging | Most stable face identity | SFW |
| **IP-Adapter SDXL variants** | Same family, retargeted | SDXL backbones | As above for SDXL | SFW |

[Source: [h94/IP-Adapter-FaceID model card](https://huggingface.co/h94/IP-Adapter-FaceID), [github.com/tencent-ailab/IP-Adapter](https://github.com/tencent-ailab/IP-Adapter)]

### Why it works (and why it sometimes doesn't)

The "image prompt" framing is powerful for non-face references — style, composition, mood — because the CLIP-vision embedding captures them in a holistic way that text struggles to match. For *face* identity specifically, the family pivots to InsightFace embeddings (`FaceID*` variants), which are tighter face-fingerprint vectors.

**Failure mode (NSFW)**: clothed-reference + nude-prompt produces "alien anatomy" — fused limbs, mucosal-fabric merging, hand collapse. Mechanism: the holistic CLIP-vision embedding forces clothing geometry onto the underlying body. Documented at [r/comfyui: Models/LoRAs for NSFW I2I](https://www.reddit.com/r/comfyui/comments/1qjca2i/modelsloras_for_nsfw_i2i_generation_clothing/), [arXiv 2504.05838](https://arxiv.org/html/2504.05838v1). FaceID variants are slightly less affected because their embedding is face-only, but the underlying SFW pretraining still degrades explicit anatomy when the adapter weight is high.

**IP-Adapter-FaceID Biometric Pipeline** (from Mac Studio Content Factory Design):

The specialized FaceID integration uses **InsightFace's buffalo_l model** (detection size 640×640) to extract a `normed_embedding` from a tightly cropped reference portrait. This embedding is converted into a PyTorch tensor (`faceid_embeds`) and injected directly into the generation pipeline, bypassing standard CLIP limitations entirely.

**IP-Adapter FaceID-Plus** combines pure biometric Face ID embeddings with CLIP image embeddings — the biometric component locks facial geometry while the CLIP component preserves facial structure and lighting context. This dual-signal approach provides the most robust facial consistency available without training.

**Failure mode (hair / clothing carry-over)**: even FaceID-Plus-V2 will copy hairstyle from the reference image when the prompt asks for a different one. Production fix: lower the adapter weight to 0.4-0.5 and pair with a hair-specific Hyper LoRA, or run a Kontext edit pass after.

### Role in 2026 production stack

[CONFIRMED] IP-Adapter FaceID-Plus-V2 is the modal SDXL face adapter; it has been displaced on FLUX/SDXL-photoreal by @entities/adapters/pulid.md. The 2026 production pattern is to use IP-Adapter at 0.4-0.5 strength alongside a character LoRA at 0.85, *not* as a standalone identity solution.

For non-face style references — outfits, mood boards, compositional anchors — the base IP-Adapter / IP-Adapter Plus is still the go-to and remains uncontested.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- VRAM tier per variant (FaceID-Plus-V2 should be similar to base; verify on a 12 GB SDXL setup).
- ~~InsightFace dependency conflicts with ComfyUI Manager on Apple Silicon~~ — **resolved [CONFIRMED 2026-05-07]**: InsightFace installs cleanly on macOS via `pip install insightface onnxruntime` and ComfyUI Manager picks it up correctly. The remaining caveat is upstream maintenance posture: **`cubiq/ComfyUI_IPAdapter_plus`** entered "maintenance only" mode 2025-04-14 — bug fixes only, no new IP-Adapter variant adoption. The repo is functional on MPS but its long-term-support story is capped.
- Whether [h94](https://github.com/cubiq) has shipped a FLUX-specific IP-Adapter port; the canonical FLUX path is currently @entities/adapters/pulid.md (PuLID-FLUX) rather than IP-Adapter.

## Snippets

> "IP-Adapter FaceID was originally trained on largely-SFW data; its embedding space has thin coverage of explicit anatomy and explicit poses, producing soft melted genital geometry, hand-merging, and missing nipple/areola detail when used at high strength on NSFW prompts."
> — @sources/synthetic-character-consistency-survey.md §6, NSFW failure mode

> "IP-Adapter family adapters map holistic representations using CLIP vision encoders. If the creator provides a clothed reference and prompts for explicit output, the adapter experiences severe semantic conflict — it tries to forcefully map the geometric folds of the clothing onto the underlying anatomy, producing 'alien anatomy,' fused limbs, or mucosal tissue merging with fabric textures."
> — @sources/synthetic-character-consistency-survey.md §6, mechanism explanation
