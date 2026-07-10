---
title: Two-Pass & Multi-Pass Image Refinement Workflow
type: concept
tags: [two-pass, img2img, refinement, workflow, t2i, i2i, nsfw, anatomy-fix, upscaling, generation-pipeline]
keywords: [two-pass, img2img, refinement, denoise strength, workflow, composition pass, detail pass, anatomy fix, ColorMatch, upscaling]
related:
  - sources/uncensored-image-generation-survey.md
  - sources/synthetic-character-consistency-survey.md
  - concepts/prompt-engineering-uncensored.md
  - concepts/model-selection-workflow.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/character-dna-templates.md
  - concepts/de-censoring-techniques.md
  - entities/models/pony-v6.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/z-image-turbo.md
  - entities/models/sdxl-fine-tunes.md
  - entities/uis/comfyui.md
  - entities/uis/forge.md
  - entities/hardware/gpu-guide.md
  - sources/arxiv-2606-01362-albedoedit-video-editing.md
  - concepts/albedo-guided-instance-video-editing.md
  - entities/models/albedoedit.md
  - entities/custom-nodes/impact-pack.md
  - entities/custom-nodes/bmab.md
  - sources/arxiv-2606-09250-litevsr-frozen-dit-vsr.md
  - concepts/frozen-dit-video-super-resolution.md
  - sources/arxiv-2606-11751-anchoredit-multi-turn-editing.md
  - concepts/causal-multi-turn-image-editing.md
  - entities/adapters/flux-kontext.md
  - entities/custom-nodes/comfyui-angelo.md
maturity: validated
created: 2026-05-09
updated: 2026-06-15
---

## Relations

@sources/uncensored-image-generation-survey.md
@sources/synthetic-character-consistency-survey.md
@concepts/prompt-engineering-uncensored.md
@concepts/model-selection-workflow.md
@concepts/reference-plus-lora-stacking.md
@concepts/prompt-engineering-uncensored.md
@concepts/character-dna-templates.md
@concepts/de-censoring-techniques.md
@entities/models/pony-v6.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/models/z-image-turbo.md
@entities/models/sdxl-fine-tunes.md
@entities/uis/comfyui.md
@entities/uis/forge.md
@entities/hardware/gpu-guide.md
@entities/custom-nodes/impact-pack.md @entities/custom-nodes/bmab.md

## Raw Concept

The standard 2026 production technique for generating high-quality uncensored images is a **multi-pass pipeline**: a fast first pass locks composition and pose, then one or more refinement passes fix anatomy, detail, and realism. This replaces the old single-prompt-and-pray approach.

## Narrative

### Why multi-pass beats single-shot

Single-pass generation tries to solve **everything at once** — composition, pose, anatomy, detail, lighting, and style. The result is a compromise: the model spreads its attention budget across all goals and drops the ones it's weakest at (typically hands, fingers, and anatomically complex poses).

Multi-pass separates concerns:

| Pass | Goal | What it optimises for |
|------|------|----------------------|
| **Pass 1 (T2I)** | Composition + pose + content | Getting the scene right; hands roughly correct; subject in-frame |
| **Pass 2 (I2I)** | Realism + anatomical detail | Fixing hands, smoothing skin, improving lighting |
| **Pass 3 (optional)** | Inpainting problem areas | Eyes, fingers, specific body parts |
| **Pass 4 (optional)** | Upscaling | 2×–4× resolution increase |

### Pass 1 — Text-to-Image (Composition Pass)

**Purpose:** Establish pose, composition, clothing state, and approximate content.

**Settings:**
- **Model:** Use the model best at understanding the desired content type
  - SDXL/Pony/Illustrious — best for explicit anatomy understanding (Danbooru-trained)
  - FLUX.1 Dev — best for composition, lighting, and natural-language understanding
  - Z-Image Turbo — fast iteration for brainstorming
- **Resolution:** Native or slightly below (e.g., 768×1024 for SDXL, 768×768 for FLUX)
- **Steps:** 20–30 (SDXL), 20–28 (FLUX), 4–8 (Klein/Z-Image)
- **CFG:** Moderate (see [Prompt Engineering](prompt-engineering-uncensored.md) tables)
- **NSFW LoRA:** At target strength (typically 0.85) if using base FLUX
- **Denoising:** N/A (pure T2I)

**Output expectation:** The pose and composition should be correct. Anatomy may have minor errors (extra fingers, slightly warped hands). Lighting and skin texture will be rough. Do **not** expect a finished image.

### Pass 2 — Image-to-Image (Detail Pass)

**Purpose:** Fix anatomy, improve realism, add skin/texture/finishing detail without destroying the composition from Pass 1.

**Critical setting: Denoising Strength**

| Denoise | Effect | Use when |
|---------|--------|----------|
| **0.15–0.25** | Light refinement — preserves original closely | Only minor fixes needed (skin tone, lighting) |
| **0.35–0.50** | Moderate refinement — fixes anatomy while keeping pose | **Default starting point** for NSFW refinement |
| **0.55–0.70** | Aggressive — significant changes to body shape/pose | Major anatomy corrections; risk of losing composition |
| **>0.70** | Near-total regeneration | Essentially a new generation; use T2I instead |

**Recommended: 0.40 for NSFW content** — enough to fix hands/anatomy without destroying the pose locked in Pass 1.

**Model selection for refinement:**

| Base model (Pass 1) | Refinement model (Pass 2) | Why |
|---------------------|--------------------------|-----|
| **Pony V6 / Illustrious** | Juggernaut XL, RealVisXL, or FLUX.1 Dev + NSFW LoRA | Upgrade from stylized to photorealistic |
| **FLUX.1 Dev** | FLUX.1 Dev (same model, different settings) | Keep consistency; use ColorMatch |
| **Any SDXL** | Z-Image Turbo | Photorealistic detail boost |
| **NoobAI-XL** | Juggernaut XL or Chroma1-HD | Photorealistic refinement of anime base |

**Enable color correction** during I2I to prevent color shift from the original. Some workflows prefer to save both the pre-correction and post-correction versions and pick the better one.

### Pass 3 — Targeted Inpainting (Optional)

**Purpose:** Fix specific problem areas without touching the rest of the image.

**Workflow in ComfyUI:**
1. Use a **mask** to select the problem area (hands, face, specific body part)
2. Run a focused **inpaint** pass with:
   - Higher denoise (0.5–0.7) on the masked region only
   - Targeted positive prompt: `"detailed anatomically correct hands with five fingers, palms visible"`
   - Negative prompt: `"bad anatomy, bad hands, extra fingers, fused fingers, deformed fingers"`
3. Composite back into the full image

**ADetailer** (in A1111/Forge) automates face detection + inpainting. ComfyUI equivalent: face segmentation model + inpaint node.

### Pass 4 — Upscaling (Optional)

**Purpose:** Increase resolution for final output.

**Methods:**
- **Latent upscaler** (ComfyUI built-in): upscale in latent space before final VAE decode — fast, coherent
- **4× model upscaler** (e.g., RealESRGAN, UltraSharp): post-generation pixel-space upscale — sharper but may introduce artifacts
- **Hires fix** (A1111/Forge): tiled upscaler — good for very large outputs

Typical pipeline: generate at 1024×1024 → latent upscale to 2048×2048 → light I2I refinement at high resolution.

### The Full Pipeline Visualised

```
┌─────────────────────────────────────────────────────────────────┐
│  PASS 1: T2I                                                      │
│  Model: Pony V6 / FLUX.1 Dev / Z-Image                           │
│  NSFW LoRA @ 0.85 (if base model needs it)                       │
│  Identity adapter @ 0.40-0.55 (if persona work)                  │
│  Output: rough composition, correct pose, approximate anatomy    │
│                                                                      │
│  ──── color correction ────▶                                      │
│                                                                      │
│  PASS 2: I2I Refinement                                           │
│  Model: photorealistic model or same model                        │
│  Denoise: 0.35–0.50 (NSFW) / 0.25–0.35 (SFW)                     │
│  Focus: anatomy, skin, lighting, texture                          │
│  Output: clean, detailed, anatomically correct                    │
│                                                                      │
│  ──── optional ────▶                                              │
│                                                                      │
│  PASS 3: Targeted Inpainting                                      │
│  Mask: hands / face / specific area                                │
│  Denoise: 0.5–0.7 on masked region only                           │
│  Output: localized fixes without disturbing rest of image         │
│                                                                      │
│  ──── optional ────▶                                              │
│                                                                      │
│  PASS 4: Upscaling                                                │
│  Method: latent upscale → tiled hrfix → final VAE decode          │
│  Output: final resolution image, ready for use                    │
└─────────────────────────────────────────────────────────────────┘
```

### Practical Tips

1. **Lock your seed from Pass 1** when doing I2I refinement for reproducible results
2. **Don't skip ColorMatch** when using two different models across passes (e.g., Pony → Juggernaut)
3. **Batch your passes** — generate 4–8 compositions in Pass 1, pick the 2–3 best, refine only those in Pass 2
4. **Save every pass** — you may want to go back to a Pass 1 result if Pass 2 over-refined
5. **Monitor for "plastic skin"** — over-refinement with high denoise on NSFW content produces a waxy, artificial look. If this happens, reduce denoise by 0.1 on the next batch.

### Model-Specific Notes

**FLUX + NSFW LoRA pipeline:**
- Pass 1: FLUX.1 Dev + NSFW LoRA @ 0.85, CFG 3.5, 28 steps
- Pass 2: Same FLUX.1 Dev (reload without LoRA), denoise 0.45, 30 steps — clean up LoRA artifacts
- This "LoRA-on-then-off" technique preserves the NSFW composition while smoothing LoRA-specific artefacts

**Pony V6 → Juggernaut XL pipeline:**
- Pass 1: Pony V6 with full score-tag prefix, CFG 6, 30 steps
- Pass 2: Juggernaut XL, img2img, denoise 0.40, CFG 7, 40 steps
- Key: enable "ADetailer" or at minimum add `detailed face, detailed hands` to the I2I prompt

**Z-Image Turbo (single-pass or two-pass):**
- Z-Image at 8 steps is already good enough for many use cases
- For refinement: re-run at 12 steps with a subtly refined prompt, or do a light I2I at denoise 0.30
- At CFG 0.0 the refinement is entirely prompt-driven — write a more detailed prompt, don't just increase steps

### Sources

- Reddit r/comfyui — NSFW I2I workflow discussion: https://www.reddit.com/r/comfyui/comments/1qxy10f/
- Reddit r/comfyui — Best local uncensored model (community consensus): https://www.reddit.com/r/comfyui/comments/1qh8i3n/
- BetterWaifu — NSFW Nudify Tutorial (two-pass workflow): https://betterwaifu.com/blog/stable-diffusion-nudify
- RedRTA — T2I vs I2I comparison: https://redrta.org/text-to-image-vs-image-to-image/
- ComfyUI Wiki — Img2Img workflows: https://comfyui-wiki.com/en/workflows/img2img
- Forge Wiki — Hires fix and img2img: https://github.com/lllyasviel/stable-diffusion-webui-forge
- NextDiffusion — Z-Image Turbo ComfyUI setup: https://www.nextdiffusion.ai/tutorials/z-image-turbo-fast-uncensored-image-generation-comfyui