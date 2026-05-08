---
title: Z-Image Turbo & Zeta Chroma (Alibaba Tongyi MAI / Lodestone Rock)
type: entity
tags: [model, dit, s3-dit, z-image, zeta-chroma, alibaba, tongyi-mai, lodestone-rock, completely-uncensored, photorealism, 6b, 8-step-distill, eastern-vanguard]
keywords: [Z-Image, Z-Image Turbo, Zeta Chroma, Alibaba, Tongyi MAI, S3-DiT, Scalable Single-Stream Diffusion Transformer, 6B, 8-step distillation, photorealism, completely uncensored, Lodestone Rock, pixel-space DiT]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/de-censoring-techniques.md
  - concepts/lora-taxonomy.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/qwen-image-2512.md
  - entities/models/ernie-image.md
  - entities/models/kwai-kolors.md
  - sources/video-generation-survey-2026.md
  - concepts/video-identity-inheritance.md
  - runbooks/zimage-setup-runbook.md
  - concepts/model-selection-workflow.md
  - entities/uis/comfyui.md
maturity: validated
created: 2026-05-06
updated: 2026-05-07
---

## Relations

@sources/uncensored-image-generation-survey.md
@concepts/censorship-tier-taxonomy.md
@concepts/de-censoring-techniques.md
@concepts/lora-taxonomy.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/models/qwen-image-2512.md
@entities/models/ernie-image.md
@entities/models/kwai-kolors.md
@sources/video-generation-survey-2026.md
@concepts/video-identity-inheritance.md

## Raw Concept

Entity page for **Z-Image Turbo** and its community derivative **Zeta Chroma** — the **Eastern Vanguard photorealism leader** of late 2025 / 2026. Z-Image is Alibaba Tongyi MAI's S3-DiT 6B model: completely uncensored at base, 8-step distilled (sub-second on 12-16 GB VRAM), and the survey's pick for "premier local model for photorealism." Back-filled from @sources/uncensored-image-generation-survey.md §1.

## Narrative

### What it is — Z-Image Turbo

**Z-Image Turbo** — released **late 2025** by **Alibaba's Tongyi MAI lab**. Architecture: novel **Scalable Single-Stream Diffusion Transformer (S3-DiT)** that processes text, visual semantic tokens, and VAE tokens in a **single concatenated sequence** — distinct from MMDiT (which processes text and image streams in parallel before merging) and standard DiT (which processes only image tokens with text as cross-attention).

Architecture highlights:

- **6B parameters** — the sweet-spot scale for 12-16 GB consumer hardware in FP8.
- **Single-stream sequence** — text + visual semantic tokens + VAE tokens concatenated. Lower attention overhead per token than dual-stream MMDiT; simpler training objective.
- **8-step distillation** — Z-Image Turbo distills the full denoising trajectory to 8 steps. Result: **generation in mere seconds** on standard consumer GPUs.
- **12–16 GB VRAM target** — comfortable on RTX 4060 Ti 16 GB / 4070 Ti.
- **Completely Uncensored** out of the box. No refusal mechanisms, no latent anatomical gaps.

### What it is — Zeta Chroma

**Zeta Chroma** — community derivative by **Lodestone Rock**. Shifts the S3-DiT architecture into **pixel space** (rather than VAE-latent space) to expand artistic and stylistic versatility. Active development as of May 2026.

The pixel-space shift is significant: VAE-latent diffusion has been the modal architecture since SD 1.5 because of compute economics, but for some aesthetic targets (highly detailed line work, stylized illustration) the VAE introduces detail loss that pixel-space sidesteps.

### Why creators use Z-Image Turbo

[CONFIRMED, source @sources/uncensored-image-generation-survey.md §1]:

- **Premier photorealism** — universally acclaimed as the local-model photorealism leader. Survey: *"premier local model for photorealism and general uncensored generation."*
- **Sub-second generation on consumer GPUs** — the 8-step distillation collapses workflow latency below the threshold where users iterate sequentially. Z-Image Turbo enables *interactive* prompt iteration.
- **Completely Uncensored at base** — no LoRA injection or merging required for explicit anatomy. The latent space contains the structures; the safety alignment is absent.
- **6B-parameter sweet spot** — fits 12-16 GB VRAM in FP8 cleanly; cheaper to fine-tune than FLUX.1 Dev (12B).
- **Eastern Vanguard architectural lineage** — [CONFIRMED 2026-05-06]: **Apache 2.0** confirmed via canonical Hugging Face repo `Tongyi-MAI/Z-Image-Turbo` ([huggingface.co/Tongyi-MAI/Z-Image-Turbo](https://huggingface.co/Tongyi-MAI/Z-Image-Turbo)). Bilingual EN/CN. 8-step at CFG 1.0 (guidance must be 0 for Turbo). 8GB VRAM compatible. Commercial use unrestricted — clean licensing posture vs FLUX.1 Dev's BFL Non-Commercial.

### Why creators avoid it

[TENTATIVE]:

- **Less mature LoRA ecosystem than FLUX.1 Dev** — released later; community fine-tunes / character LoRAs / de-censoring LoRAs (irrelevant for Z-Image but useful for stylistic control) still accumulating.
- **8-step distillation may produce subtle artifacts** at very high CFG / fine-detail prompts; Turbo trades some quality for speed.
- **Persona-consistency adapter availability** — PuLID / InfiniteYou / Redux / Kontext are FLUX-native. Z-Image-port status of the persona-stack adapters is **`[NEEDS VERIFICATION 2026-05-06]`**. If creators need persona consistency on Z-Image, the path may currently be character-LoRA only.
- **Alpha-tuning specifics** — survey notes Z-Image specifically responds well to `alpha = rank/2` ([r/StableDiffusion: Z-IMAGE Training Issues](https://www.reddit.com/r/StableDiffusion/comments/1qwc4t0/thoughts_and_solutions_on_zimage_training_issues/)). See @concepts/lora-taxonomy.md.

### Censorship tier

**Completely Uncensored** at base. See @concepts/censorship-tier-taxonomy.md. No de-censoring techniques required (see @concepts/de-censoring-techniques.md decision tree — "Completely Uncensored: None needed").

This is one of the survey's strongest examples of the **Eastern lab vs Western alignment-restrictive** dichotomy: where FLUX.1 Dev is Minimal-tier and BFL is non-commercial-licensed, Z-Image is Completely Uncensored at base and ships with a more permissive license posture.

### Hardware profile

[CONFIRMED]:

| Precision | VRAM (estimate) | Notes |
|---|---|---|
| FP16 / BF16 | ~12 GB | 6B params × 2 bytes/param + overhead |
| FP8 | ~6-7 GB | 12-16 GB-tier sweet spot for full quality |
| GGUF Q8 | ~6 GB | Visually identical to FP16 |
| GGUF Q4 | ~4 GB | 8 GB-tier fallback; some detail loss |

8-step distillation means most generation parameters that work on FLUX.1 Dev (28-50 steps) are wrong on Z-Image Turbo. Configure samplers for 8-step distilled output specifically.

### Role in 2026 production stack

[CONFIRMED]:

- **Default photorealism base** when the workflow is on Eastern-Vanguard / Completely-Uncensored / 12-16 GB-tier hardware.
- **The frequently-recommended alternative to FLUX.1 Dev** for users who want comparable DiT quality without FLUX.1 Dev's licensing or alignment concerns.
- **LoRA training base** — alpha = rank/2 is the documented Z-Image-specific tuning quirk; otherwise per-base recipe similar to FLUX.1 Dev (AdamW8bit, 5e-5).
- **Zeta Chroma** is the option when the workflow needs pixel-space-DiT detail (line art, stylized illustration); Z-Image Turbo for everything else.

### Captioning conventions

[TENTATIVE]:

Natural-language prose, similar to FLUX.1 Dev. Z-Image's S3-DiT single-stream architecture means the text encoder's output and image tokens are concatenated, so prompt structure matters more than tag-style: short clear sentences with explicit attribute order beat keyword soup.

### Workspace TODO

- ~~Z-Image Turbo Hugging Face release page; canonical model hash; current version~~ — **resolved [CONFIRMED 2026-05-06]**: canonical at `Tongyi-MAI/Z-Image-Turbo`. GGUF quants at `unsloth/Z-Image-Turbo-GGUF`; 8-bit at `mzbac/Z-Image-Turbo-8bit`; AIO bundle at `SeeSee21/Z-Image-Turbo-AIO` (combines photoreal + anime variants in FP8/FP16/BF16). Multiple community mirrors (qs2026, srcphag, exolabs, mrfakename) all carry identical weights.
- ~~Z-Image license terms~~ — **resolved [CONFIRMED 2026-05-06]**: Apache 2.0 (per HF model card and SeeSee21 AIO bundle metadata). Commercial use unrestricted.
- **`[NEEDS VERIFICATION 2026-05-06]`**: persona-consistency adapter availability (PuLID II / InfiniteYou / Redux Z-Image port status). Sub-sweep C target.
- **`[NEEDS VERIFICATION 2026-05-06]`**: Zeta Chroma release status — survey says "active development." Lodestone Rock pixel-space derivative.
- Compare Z-Image Turbo vs FLUX.2 Klein 9B head-to-head on a fixed photoreal-prompt set; document quality and speed tradeoffs.
- Compare Z-Image Turbo vs FLUX.1 Dev for NSFW anatomy out-of-the-box (Z-Image should win cleanly per the tier classification but verify).

## Snippets

### Z-Image Turbo positioning

> "Released in late 2025 by Alibaba's Tongyi MAI lab, Z-Image is universally acclaimed as the premier local model for photorealism and general uncensored generation. Utilizing a novel Scalable Single-Stream Diffusion Transformer (S3-DiT), it processes text, visual semantic tokens, and VAE tokens in a single concatenated sequence, creating a highly efficient 6-billion parameter architecture. Z-Image Turbo distills this generation process to just 8 steps, achieving generation times of mere seconds on standard consumer GPUs (requiring 12–16GB VRAM). The model is completely uncensored out of the box, handling explicit concepts without any refusal mechanisms or latent anatomical gaps."

— @sources/uncensored-image-generation-survey.md §1

### Zeta Chroma derivative

> "A community derivative, Zeta Chroma (authored by Lodestone Rock), shifts the S3-DiT architecture into pixel space to further expand its artistic and stylistic versatility, though it remains in active development."

— @sources/uncensored-image-generation-survey.md §1
