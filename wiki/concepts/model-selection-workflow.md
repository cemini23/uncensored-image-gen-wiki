---
title: Model Selection & Workflow Builder (by Hardware & Goals)
type: concept
tags: [model-selection, workflow, hardware-matching, goal-alignment, decision-tree, quickstart]
keywords: [which model, what hardware, workflow recommendation, model comparison, decision guide, beginner workflow]
related:
  - concepts/censorship-tier-taxonomy.md
  - concepts/persona-consistency-methods.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/prompt-engineering-uncensored.md
  - concepts/two-pass-generation-workflow.md
  - concepts/lora-taxonomy.md
  - concepts/persona-ops-stack.md
  - entities/hardware/gpu-guide.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/pony-v6.md
  - entities/models/pony-v7.md
  - entities/models/illustrious-xl.md
  - entities/models/noobai-xl.md
  - entities/models/sdxl-fine-tunes.md
  - entities/models/anima.md
  - entities/models/z-image-turbo.md
  - entities/models/qwen-image-2512.md
  - entities/models/wan-2-2.md
  - entities/models/hunyuanvideo-1-5.md
  - entities/models/cogvideox-1-5.md
  - entities/adapters/pulid.md
  - entities/adapters/ip-adapter.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/ai-toolkit.md
  - entities/training-tools/fluxgym.md
  - entities/training-tools/musubi-tuner.md
  - entities/persona-ops/sillytavern.md
  - entities/persona-ops/fish-speech.md
  - entities/persona-ops/n8n.md
  - entities/persona-ops/postiz.md
  - entities/uis/comfyui.md
  - sources/uncensored-image-generation-survey.md
  - sources/synthetic-character-consistency-survey.md
  - runbooks/beginner-guide-to-persona.md
  - runbooks/day-1-checklist-for-friend.md
  - runbooks/runpod-comfyui-setup.md
  - concepts/persona-audio-stack.md
  - entities/voice-models/cosyvoice2.md
  - entities/voice-models/kokoro.md
  - entities/voice-models/indextts-2.md
  - entities/voice-models/chatterbox.md
maturity: validated
created: 2026-05-08
updated: 2026-05-13
---

## Relations

@concepts/censorship-tier-taxonomy.md
@concepts/persona-consistency-methods.md
@concepts/reference-plus-lora-stacking.md
@concepts/lora-taxonomy.md
@concepts/persona-ops-stack.md
@entities/hardware/gpu-guide.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/models/pony-v6.md
@entities/models/pony-v7.md
@entities/models/illustrious-xl.md
@entities/models/noobai-xl.md
@entities/models/sdxl-fine-tunes.md
@entities/models/anima.md
@entities/models/z-image-turbo.md
@entities/models/qwen-image-2512.md
@entities/models/wan-2-2.md
@entities/models/hunyuanvideo-1-5.md
@entities/models/cogvideox-1-5.md
@entities/adapters/pulid.md
@entities/adapters/ip-adapter.md
@entities/adapters/flux2-klein-9b-faceswap.md
@entities/training-tools/kohya-sd-scripts.md
@entities/training-tools/ai-toolkit.md
@entities/training-tools/fluxgym.md
@entities/training-tools/musubi-tuner.md
@entities/persona-ops/sillytavern.md
@entities/persona-ops/fish-speech.md
@entities/persona-ops/n8n.md
@entities/persona-ops/postiz.md
@entities/uis/comfyui.md
@sources/uncensored-image-generation-survey.md
@sources/synthetic-character-consistency-survey.md
@concepts/prompt-engineering-uncensored.md
@concepts/two-pass-generation-workflow.md
@runbooks/runpod-comfyui-setup.md
@concepts/persona-audio-stack.md
@entities/voice-models/cosyvoice2.md @entities/voice-models/kokoro.md @entities/voice-models/indextts-2.md @entities/voice-models/chatterbox.md

## Raw Concept

Decision-support page that maps a user's **hardware** and **creative goals** to a concrete model stack, image-generation workflow, and optional video/DM pipeline. Replaces the need to read every individual model page before choosing a starting point.

## Narrative

Decision-support workflow that maps **hardware tier + creative goal + persona/no-persona** to a concrete model stack and generation loop. Five canonical 2026 starter stacks (Anime Creator, Photoreal Starter, Full Explicit Production, Mac-Only Creator, Budget Cloud Experimenter) cover the modal cases; the universal 7-step generation loop and decision matrix at the end handle the rest. *Pick your hardware tier → pick your goal → get a recommended stack → start generating.*

### Step 1 — What hardware are you running?

| Tier | Hardware Examples | GPU VRAM | Notes |
|------|------------------|----------|-------|
| **1 — Starter** | RTX 4060 8 GB, M1/M2 MacBook 16 GB unified | 8 GB | SDXL only, no FLUX.1 Dev natively, no video gen |
| **2 — Sweet Spot** | RTX 4060 Ti 16 GB / 4070 Ti / 5060 Ti, M3/M4 MacBook Pro 36-48 GB | 12–16 GB | Full FLUX.2 Klein pipeline + SDXL + starter video |
| **3 — Frontier** | RTX 4090 / 5090, M4/M5 Mac Studio 64 GB+ | 24+ GB | Everything including native video, multi-ControlNet |
| **Cloud** | RunPod / Vast.ai RTX 4090, Modal/Replicate | Per-hour | Burst for training or anything your local rig can't handle |

#### Quick hardware check
- **< 8 GB VRAM** → stop here. Buy more GPU or use cloud. The modern NSFW/local stack needs 8 GB minimum.
- **Apple Silicon (M1/M2 16 GB)** → you can run SDXL models via [Draw Things](https://drawthings.ai/) but FLUX and video gen are limited. See @entities/hardware/gpu-guide.md §Apple Silicon.
- **Apple Silicon (M3/M4 36+ GB)** → excellent for image gen via Draw Things or ComfyUI MPS. Video gen still needs cloud burst.

---

### Step 2 — What's your creative goal?

Answer these three questions:

#### A. What style of content?

| Style | Best base models | Why |
|-------|-----------------|-----|
| **Anime / stylized / hentai** | Pony V6, Illustrious XL, NoobAI-XL | SDXL fine-tunes trained on Danbooru; native anime aesthetic; completely uncensored out of the box |
| **Photorealistic SFW / soft-NSFW** | FLUX.1 Dev, Z-Image Turbo | High-fidelity faces and skin; minimal censorship tier; works with identity adapters |
| **Photorealistic explicit** | NoobAI-XL, Lustify, Chroma1-HD, FLUX.2 Klein 9B | NSFW-trained bases that handle anatomy without mode collapse; need adapter stack for face fidelity |
| **Artistic / painterly / fashion** | FLUX.1 Dev, FLUX.2 Klein | Strong composition and lighting from DiT architecture; good for non-photographic aesthetics |

#### B. Do you need video?

| Need | Model | VRAM required | Notes |
|------|-------|---------------|-------|
| **No, images only** | skip this | — | Most cost-effective starting point |
| **Short clips (< 8 sec), NSFW** | Wan 2.2 5B TI2V dense | 16 GB | Community NSFW LoRAs available; I2V from polished still |
| **10-30 sec SFW clips** | HunyuanVideo 1.5 step-distilled | 16-24 GB | SSTA attention for 10s @ 720p; community `nsfwsks` NSFW trigger |
| **4K + lipsync** | LTX-2 | 24-48 GB | Single-pass audio+video; joints & foley; free for <$10M revenue |
| **Budget entry** | CogVideoX 1.5 INT8 | 7-16 GB | Cheapest local video; 768p/10s via torchao quantization |

#### C. Are you building an AI persona (recurring character, not just one-off images)?

| Persona? | Implication |
|-----------|-------------|
| **Yes — I want a consistent character** | You need the full [persona consistency pipeline](persona-consistency-methods.md): character DNA → multi-angle dataset → parallel LoRAs → reference+LoRA stacking → likeness verification |
| **No — I just want good images** | Skip LoRA training. Use the model directly with good prompting. See [Prompting Tips](#prompting-tips) below |

---

### Step 3 — Your Recommended Stack

Based on your answers above, here are the **five canonical starter stacks** for May 2026:

---

#### Stack 1 — "Anime Creator" (Stylized, 8+ GB, No Video)

**For:** Anime/hentai art, character design, no video needed, any GPU with 8+ GB.

| Component | Model / Tool | Why |
|-----------|-------------|-----|
| **Image model** | Pony V6 XL (or NoobAI-XL for variety) | Completely uncensored SDXL fine-tune; 8 GB VRAM; score_9 tag system for easy prompting |
| **UI** | [ComfyUI](uis/comfyui.md) | Node-graph workflow; extensible; dominant local UI |
| **Prompting** | Character DNA XML tags | Structured prompting; per-base conventions in [character-dna-templates.md](concepts/character-dna-templates.md) |
| **Workflow** | Direct generation, no LoRA needed to start | Use tags from the Character DNA spec; iterate on prompts |

**Upgrade path:** Add IP-Adapter FaceID-Plus-V2 for face consistency → train character LoRA when ready → add Wan 2.2 5B for video clips.

---

#### Stack 2 — "Photoreal Starter" (SFW/Soft-NSFW, 12+ GB, Optional Video)

**For:** Photorealistic portraits, soft-NSFW content, someone who wants the best image quality at moderate VRAM.

| Component | Model / Tool | Why |
|-----------|-------------|-----|
| **Image model** | FLUX.1 Dev (GGUF Q8 or Nunchaku INT4) | Reference-quality FLUX pipeline; 12+ GB with quantization |
| **Face adapter** | PuLID II | Best face fidelity for FLUX ecosystem; 0.45-0.55 strength |
| **NSFW LoRA** (optional) | Chroma1-HD or FLUX.2 Klein 9B face-swap | For explicit content without anatomy degradation |
| **UI** | ComfyUI | Full FLUX node support |
| **Video** (optional) | Wan 2.2 5B I2V (16 GB) or CogVideoX 1.5 INT8 (8 GB) | I2V from polished stills |

**Key recipe:** FLUX.1 Dev at 0.85 NSFW LoRA + PuLID at 0.45. See [reference-plus-lora-stacking](concepts/reference-plus-lora-stacking.md).

---

#### Stack 3 — "Full Explicit Production" (16+ GB, Video)

**For:** Adult AI persona operator. NSFW images + video clips + DM automation. The "Aitana Lopez archetype" stack.

| Component | Model / Tool | Why |
|-----------|-------------|-----|
| **Image backbone** | FLUX.1 Dev (primary) + NoobAI-XL (explicit fallback) | FLUX for SFW polish; NoobAI for explicit anatomy without adapter conflict |
| **Face adapter** | PuLID II (FLUX) / IP-Adapter FaceID-Plus-V2 (SDXL) | Dual-adapter strategy per [reference-plus-lora-stacking](concepts/reference-plus-lora-stacking.md) |
| **Video model** | Wan 2.2 5B (local) or HunyuanVideo 1.5 step-distilled (if 24 GB) | Community NSFW LoRAs; I2V conditioning |
| **DM + Voice** | SillyTavern + Qwen 3 13B Q4 + Fish-Speech S2 Pro | Local NSFW-safe LLM + zero-shot voice clone |
| **Orchestration** | n8n + Postiz | Self-hosted workflow + scheduling |
| **Training** | Kohya sd-scripts or ai-toolkit (for FLUX) | Parallel LoRAs per base |

This is the **modal 2026 build-track stack** described in the [persona end-to-end runbook](briefs/2026-05-07_persona-end-to-end-runbook.md).

---

#### Stack 4 — "Mac-Only Creator" (M3/M4 Pro, 36+ GB unified)

**For:** Creators who want a quiet, portable, low-power workflow. Image generation on Mac; video and training via cloud burst.

| Component | Model / Tool | Why |
|-----------|-------------|-----|
| **Image model (local)** | Draw Things (CoreML) with any SDXL/FLUX model | Native Apple Silicon acceleration; ~3-5 sec/iteration |
| **Image model (ComfyUI MPS)** | Pony V6 or Z-Image Turbo | Fallback when Draw Things doesn't support a specific node |
| **Video** | Cloud: Wan 2.2 on RunPod Vast.ai | Video gen is CUDA-native; not viable on MPS |
| **Training** | Cloud: ai-toolkit on Modal/Replicate | Mac training is 10-30× slower; rent H100 for LoRA jobs |
| **UI** | ComfyUI (MPS mode) or Draw Things | Both have active Mac support |

**See:** @entities/hardware/gpu-guide.md §Apple Silicon for MPS caveats.

---

#### Stack 5 — "Budget Cloud Experimenter" (Any hardware, pay-per-use)

**For:** Trying things out before buying GPU, or need burst capacity for training/video.

| Component | Service | Approximate Cost |
|-----------|---------|-----------------|
| **Inference** | Fal.ai / RunPod / Replicate | $0.01-0.10 per image |
| **Training** | Modal / Replicate (H100) | ~$1-3/hr for FLUX LoRA training |
| **Video** | Vast.ai RTX 4090 | ~$0.15-0.30/hr |
| **Orchestration** | n8n cloud ($20/mo) or local | Free self-hosted |

→ See @entities/hardware/gpu-guide.md §Cloud GPU fallbacks for pricing details.

---

### Step 4 — The Generation Workflow (Universal)

Regardless of which stack you choose, the **generation loop** is the same:

```
┌─────────────────────────────────────────────┐
│  1. CHARACTER DNA                           │
│     Write or load your <character> XML tags │
│                                              │
│  2. PROMPT                                  │
│     Structured prompt per base conventions   │
│     (Danbooru tags for SDXL/Pony)           │
│     (Natural language for FLUX/Z-Image)      │
│                                              │
│  3. FIRST PASS                              │
│     Generate at your chosen base + settings │
│     NSFW LoRA @ 0.85 if applicable          │
│                                              │
│  4. IDENTITY CHECK (persona builds only)    │
│     Identity adapter @ 0.40-0.55            │
│     OR face-swap pass (FLUX.2 Klein 9B)     │
│                                              │
│  5. REFINEMENT                              │
│     Optional: img2img denoise 0.15-0.25     │
│     ColorMatch / ColorPeel for skin tone    │
│                                              │
│  6. OUTPUT & REVIEW                         │
│     Save with metadata tags                 │
│     Flag for LoRA retraining if needed      │
│                                              │
│  7. FOR VIDEO STACKS:                       │
│     I2V conditioning → video gen → seam     │
│     stitch if >8 sec                         │
└─────────────────────────────────────────────┘
```

#### Prompting Tips

| Base | Prompt Style | Example |
|------|-------------|---------|
| **Pony V6 / Illustrious / NoobAI** | Danbooru tags. `[trigger]` first. Pony needs `score_9, score_8_up, source_<medium>`. | `keira1234, score_9, 1girl, solo, bikini, beach, golden hour, masterpiece` |
| **FLUX.1 / FLUX.2 / Z-Image / Pony V7** | 1-3 natural language sentences. Embed trigger as fictional name. | `A photorealistic portrait of keira1234, a 24-year-old woman with green eyes and auburn hair, on a Mediterranean balcony at sunset.` |
| **Qwen-Image** | Natural language with layout reasoning. Excels at complex scenes and text rendering. | `On the left, keira1234 sits at a café table; on the right, a golden retriever. Text on the coffee cup reads "Monday".` |

**Negative prompts** (all bases): `low quality, blurry, deformed, extra fingers, bad anatomy, watermark, text`

**CFG scale:** 7-8 is the modern default for FLUX/SDXL. Higher = more prompt adherence but less creativity.

---

### Step 5 — When to Upgrade or Switch

| Current Pain Point | Fix |
|-------------------|-----|
| **Out of VRAM at 1024×1024** | Drop to 768×768; use Nunchaku INT4; or upgrade GPU |
| **Face doesn't match across generations** | Add identity adapter (PuLID/InstantID); or train LoRA on more images |
| **Anatomy breaks with reference adapter** | Lower adapter strength (< 0.5); use two-pass; switch to NoobAI for explicit |
| **Image quality "good enough" but want more detail** | Move from 8-bit quant to FP16 (needs more VRAM); or switch to FLUX.1 Dev from SDXL |
| **Want video** | Add Wan 2.2 5B (16 GB) or CogVideoX 1.5 INT8 (8 GB). Start with I2V from your best stills |
| **Want DM automation** | Add SillyTavern + local LLM + Fish-Speech → n8n orchestration |
| **Training is too slow** | Rent cloud H100 via Modal/Replicate; dataset prep stays local |

---

### Cross-Cutting Decision Matrix

Quick-reference for the three most common trade-off decisions:

| Decision | Option A | Option B | Choose A when... | Choose B when... |
|----------|----------|----------|-------------------|-------------------|
| **Base for NSFW work** | NoobAI-XL / Lustify (SDXL) | FLUX.2 Klein 9B or Chroma1-HD (FLUX) | You want maximum anatomy accuracy + tag control | You want photorealism + face fidelity via PuLID |
| **Identity method** | Character LoRA (trained) | Identity adapter (runtime, no training) | You generate thousands of images (amortizes training cost) | You're prototyping or rarely generate |
| **Video approach** | Wan 2.2 (community NSFW LoRA) | HunyuanVideo 1.5 (native quality) | You need NSFW content + 16 GB VRAM | You have 24+ GB and want best quality |

---

## Sources & Further Reading

- [Uncensored AI Image Generation Survey](sources/uncensored-image-generation-survey.md) — full model landscape with censorship tiers
- [Synthetic Character Consistency Survey](sources/synthetic-character-consistency-survey.md) — the canonical persona pipeline
- [Reference + LoRA Stacking](reference-plus-lora-stacking.md) — detailed stacking recipes
- [Persona Consistency Methods](persona-consistency-methods.md) — four axes of consistency
- [Persona End-to-End Runbook](briefs/2026-05-07_persona-end-to-end-runbook.md) — 10-phase operator playbook
- [Hardware Guide](entities/hardware/gpu-guide.md) — VRAM tiers, quantization, Apple Silicon