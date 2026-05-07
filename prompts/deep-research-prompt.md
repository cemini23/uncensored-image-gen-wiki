# Deep Research Prompt — Uncensored Local Image Generation

Run this in deep research mode (Exa deep_researcher_start or equivalent). Supplement with GitHub links you have.

---

Comprehensive survey of **uncensored local image generation models** as of May 2026. Focus on models that can run on consumer GPUs (8–24 GB VRAM) without cloud dependencies. Uncensored means: no safety filter refusing NSFW, artistic nudity, gore, or politically sensitive prompts — the model outputs what you ask for.

## 1. Models — catalog the major players

For each model, give me: full name, base architecture (SDXL, SD3, Flux, etc.), release date, VRAM requirements at FP16 and at popular quantizations, what it's best at, and whether it's truly uncensored or requires a "de-censor" LoRA/patch.

Must cover:
- **Pony Diffusion V6 XL** (AstraliteHeart) — the dominant uncensored general-purpose model. What's the latest version? Any V7 news?
- **Illustrious XL** — anime-focused uncensored
- **NoobAI XL** — community darling, what variants exist?
- **Flux.1** (Black Forest Labs) — Schnell vs Dev vs Pro for uncensored use. Can it be de-censored?
- **SD3.5 Large / Medium** (Stability AI) — censorship status, community reaction, de-censor options
- **SDXL 1.0 base + major fine-tunes** — which fine-tunes remove censorship best?
- **HunyuanVideo / HunyuanDiT** — any uncensored fine-tunes?
- **Playground v2.5 / v3** — censorship stance
- **Kwai Kolors** — any uncensored variants?
- **PixArt-α / PixArt-Σ** — censorship level
- **Any new entries since Jan 2026** — what's emerged in the last 5 months?

## 2. Key GitHub repositories

For each: stars, last commit date, license, and what it does.

Cover:
- ComfyUI (comfyanonymous/ComfyUI)
- Automatic1111 stable-diffusion-webui
- Forge WebUI (lllyasviel/stable-diffusion-webui-forge)
- InvokeAI
- SwarmUI
- Kohya's sd-scripts (LoRA training)
- bmaltais/kohya_ss (GUI for Kohya)
- cubiq/ComfyUI_IPAdapter_plus
- Any essential ComfyUI custom nodes for uncensored workflows

## 3. Community platforms and discovery

- CivitAI — how to search/download effectively, API availability
- Hugging Face — key orgs/creators to follow for uncensored models
- TensorArt — worth using?
- Any Discord servers or subreddits that are central hubs

## 4. De-censoring techniques (when the base model is censored)

- LoRA-based de-censoring — popular ones, how they work
- Weight merging / model surgery — common recipes
- Prompt engineering tricks to bypass filters
- Which models CANNOT be effectively de-censored (architectural censorship)

## 5. Hardware and performance

- Minimum viable GPU for SDXL-class models (8 GB? 12 GB?)
- Apple Silicon (M1/M2/M3/M4) viability — MPS vs CoreML vs Draw Things
- Quantization landscape — GGUF, NF4, FP8 — which tooling supports what?
- Multi-GPU setups — worth it for image gen?
- Cloud GPU fallback options (RunPod, Vast.ai, etc.) if local isn't enough

## 6. Workflow essentials

- ComfyUI vs Forge vs A1111 — which to start with in 2026?
- Essential LoRAs for quality-of-life (detail boosters, hand fixers, etc.)
- ControlNet for uncensored models — what works?
- Upscaling pipeline (Hires.fix, Ultimate SD Upscale, etc.)
- Prompt format differences between models (Danbooru tags vs natural language)

## 7. Legal and safety context

- NSFW generation legality by jurisdiction (US, EU, UK, Japan)
- Model license restrictions on commercial use
- CivitAI / Hugging Face content policies — what's at risk of takedown?
- Any pending legislation affecting local image generation (EU AI Act, US state laws)?

---

Output format: structured report with clear sections. Prioritize actionable information — model names, GitHub URLs, VRAM numbers, license flags. I need to make decisions about what to install and run locally.
