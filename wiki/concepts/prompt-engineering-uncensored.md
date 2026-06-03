---
title: Prompt Engineering for Uncensored Image Generation
type: concept
tags: [prompting, uncensored, prompt-engineering, sd-xl, flux, z-image, pony, danbooru, t5-encoder, clipl]
keywords: [prompt engineering, uncensored generation, Danbooru tags, T5 encoder, CLIP-L, dual encoder, negative prompts, CFG scale, two-pass workflow]
related:
  - sources/uncensored-image-generation-survey.md
  - sources/synthetic-character-consistency-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/de-censoring-techniques.md
  - concepts/model-selection-workflow.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/character-dna-templates.md
  - entities/models/pony-v6.md
  - entities/models/pony-v7.md
  - entities/models/illustrious-xl.md
  - entities/models/noobai-xl.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - entities/models/z-image-turbo.md
  - entities/models/qwen-image-2512.md
  - entities/models/sdxl-fine-tunes.md
  - entities/hardware/gpu-guide.md
  - concepts/two-pass-generation-workflow.md
  - concepts/visual-to-visual-generation.md
  - concepts/pluralistic-safety-alignment.md
  - concepts/cross-modal-jailbreak-dsr.md
  - sources/arxiv-2606-00369-geo-cultural-safety-alignment.md
  - sources/arxiv-2606-01837-dsr-cross-modal-jailbreak.md
  - sources/arxiv-visual-to-visual-generation-2605-12271.md
maturity: validated
created: 2026-05-09
updated: 2026-06-01
---

## Relations

@sources/uncensored-image-generation-survey.md
@sources/synthetic-character-consistency-survey.md
@concepts/censorship-tier-taxonomy.md
@concepts/de-censoring-techniques.md
@concepts/model-selection-workflow.md
@concepts/reference-plus-lora-stacking.md
@concepts/two-pass-generation-workflow.md
@concepts/character-dna-templates.md
@entities/models/pony-v6.md
@entities/models/pony-v7.md
@entities/models/illustrious-xl.md
@entities/models/noobai-xl.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@entities/models/z-image-turbo.md
@entities/models/qwen-image-2512.md
@entities/models/sdxl-fine-tunes.md
@entities/hardware/gpu-guide.md

## Raw Concept

Practical guide to writing prompts that produce clear, accurate uncensored images across the major model families in the 2026 local generation ecosystem. Synthesised from community consensus across Reddit (r/comfyui, r/StableDiffusion), CivitAI forums, GitHub repos, and model documentation.

## Narrative

### Why prompt engineering differs by model family

The 2026 uncensored model landscape splits into three distinct prompting paradigms:

| Family | Models | Prompt style | Encoder |
|--------|--------|-------------|---------|
| **Danbooru-tag** | Pony V6, Illustrious XL, NoobAI-XL | Comma-separated tags, quality prefixes mandatory | CLIP (SDXL-era) |
| **Dual-encoder** | FLUX.1 Dev, FLUX.2 Klein | Separate CLIP-L keywords + T5 natural-language sentences | CLIP-L + T5-XXL |
| **DiT-native** | Z-Image Turbo, Qwen-Image, ERNIE-Image | Single natural-language prompt, no tags | T5 or equivalent |

**Critical rule: do not mix paradigms.** Using Danbooru tags on a FLUX model or natural-language prose on Pony V6 produces semantically incoherent results. Match your prompt style to your model's training data.

---

### 1. Danbooru-tag models (Pony V6, Illustrious, NoobAI)

#### Score tags (Pony V6 — mandatory)

Pony V6 uses a quality-ranking prefix baked into training. Omitting it collapses output quality by ~40%. The required prefix:

```
score_9, score_8_up, score_7_up
```

- `score_8_up` is a training-artifact tag (the intended tag was `score_8` but the dataset uses the longer form).
- Minimum practical prefix: `score_9, score_8_up, score_7_up`. Adding `score_6_up` and `score_5_up` further constrains to high-quality outputs.

Illustrious XL does **not** use score tags — use the `rating:` tags instead.

#### Source tags

After score tags, specify the art style:

```
source_anime      # anime-style
source_pony       # pony-specific style
source_cartoon    # cartoon / western animation
source_furry      # anthropomorphic
```

#### Rating tags (NSFW control)

```
rating:safe           # no explicit content
rating:questionable   # suggestive / soft-NSFW
rating:explicit       # full NSFW
```

#### Full positive prompt structure

```
score_9, score_8_up, score_7_up, source_anime, 1girl, rating:explicit, [subject], [clothing/state], [pose], [environment], [lighting], masterpiece, best quality
```

**Example:**
```
score_9, score_8_up, score_7_up, source_anime, 1girl, rating:explicit, long red hair, green eyes, school uniform, sitting on bed, dim bedroom lighting, detailed face, masterpiece
```

#### Negative prompt for Danbooru models

```
score_1, score_2, score_3, worst_quality, low_quality, bad_anatomy, bad_hands, extra_fingers, fused_fingers, missing_fingers, extra_limbs, bad_face, blurry, jpeg_artifacts
```

**Model-specific notes:**
- **Pony V6:** Requires the score prefix. Missing it → garbled or low-quality output.
- **Illustrious XL:** Does **not** accept score tags. Uses `rating:safe/questionable/explicit` + natural-language tags. Supports both tags and short natural-language phrases.
- **NoobAI-XL:** Uses Danbooru + e621 tags. V-Prediction architecture handles natural language slightly better than pure Danbooru models.

---

### 2. Dual-encoder models (FLUX.1 Dev, FLUX.2 Klein)

FLUX models have **two text encoders** that serve fundamentally different purposes. This is the most misunderstood aspect of FLUX prompting.

#### CLIP-L (77-token limit)

- **Function:** Keyword-based visual descriptors — "tags" loosely similar to SD-era prompting
- **Format:** Comma-separated phrases, no full sentences
- **Controls:** Overall visual style, medium, broad descriptors

#### T5-XXL (up to 512 tokens)

- **Function:** Full natural-language understanding — grammar, relationships, spatial layout, complex scenes
- **Format:** Grammatically correct sentences
- **Controls:** Precise composition, actions, interactions between objects/characters

#### The critical rule: **Write SEPARATE prompts for each encoder**

From community testing across r/FluxAI and Forge Discussion #1182:

> "Flux's general domain knowledge dropped by 50%–75% when Clip-L and T5XXL were given the same prompt, regardless of that prompt's format or contents."

**Correct approach:**

```
CLIP-L:  "anime girl, red fox ears, blue kimono, gold stars, red ribbon in hair, stone hallway, ruins, eerie lighting"

T5-XXL:  "An anime girl with red fox ears is wearing a blue kimono with gold stars and a red ribbon in her hair. She stands in a crumbling stone hallway lit by an eerie green glow."
```

**Wrong approach (do not do this):**

```
CLIP-L:  "An anime girl with red fox ears wearing a blue kimono..."  ← full sentences in CLIP
T5-XXL:  "An anime girl with red fox ears wearing a blue kimono..."  ← copy-pasted identical text
```

#### NSFW prompting on FLUX base models

Base FLUX Dev is safety-aligned and will produce **black screens** or **clothed versions** of explicit prompts. To generate uncensored content:

1. **NSFW LoRA** — community fine-tunes that strip safety alignment (most common approach)
2. **Fully uncensored checkpoint** — e.g., Fluxed Up (CivitAI model 847101)
3. **T5XXL-Unchained** — community project extending the T5 tokenizer with NSFW vocabulary for better concept encoding ([GitHub: Kaoru8/T5XXL-Unchained](https://github.com/Kaoru8/T5XXL-Unchained))

**Prompting technique for NSFW FLUX:**
- Use T5-XXL for the explicit scene description in natural language
- Use CLIP-L for compositional tags
- Parenthesised emphasis on key elements: `(detailed anatomy)`, `(explicit nudity)`
- Evocative language in CLIP-L; clinical/erotic terms reserved for T5 only

#### CFG scale for FLUX

- **FLUX.1 Dev:** 3.0–4.0 (community standard: 3.5)
- **FLUX.2 Klein:** 3.0–4.0 (4 inference steps; overcooking happens easily above 4.5)
- Higher CFG (>5) causes distortion, especially faces and hands

---

### 3. DiT-native models (Z-Image Turbo, Qwen-Image, ERNIE-Image)

These use a fundamentally different architecture: text and image tokens are processed together in a single stream, with **distribution matching distillation** replacing classifier-free guidance.

#### The Z-Image rule: CFG 0.0

Official recommendation is `guidance_scale = 0.0`. Negative prompts are **functionally ignored** at this setting.

> "Put ALL constraints in the positive prompt — negative prompts are not meaningful at CFG 0."

#### Prompting best practices

- **Be extremely specific** — vague terms like "beautiful" or "nice" provide zero useful signal
- **Include style directives explicitly** — the model will not infer them (e.g., write "photorealistic" or "anime style" rather than assuming)
- **Natural language only** — full sentences, descriptive paragraphs
- **All negative content must be stated positively** — "without clothing" rather than "no clothing" (negative framing confuses some DiT models at CFG 0)

#### Steps guidance

- **4 steps:** Fast brainstorming — rough composition
- **8 steps:** Recommended default — best quality/speed trade-off
- **12 steps:** Marginal quality increase — sharpest text rendering

#### CFG for Z-Image

- **1.0–1.5:** Useful for some workflows; provides mild guidance
- **≥2.0:** Dramatically increases generation time (~10 min vs ~1 min) with minimal quality benefit
- **0.0:** Official recommendation; relies entirely on prompt quality

---

### 4. Negative prompt strategies by model family

#### Universal anatomy negatives (all SDXL/DiT models)

```
bad anatomy, bad proportions, deformed, disfigured, ugly, disgusting,
extra limbs, missing limbs, floating limbs, extra hands, extra fingers,
fused fingers, too many fingers, missing fingers, mutated hands,
bad hands, poorly drawn hands, poorly drawn face, bad face,
cloned face, fused face, worst face, extra eyes, long neck,
gross proportions, malformed limbs
```

#### Quality/artifact negatives

```
worst quality, low quality, blurry, jpeg artifacts, watermark,
text, logo, signature, duplicate, monochrome
```

#### Content exclusion negatives

```
more than 2 nipples, futa, pregnancy, lactation  (if unwanted)
cartoon, anime, 3d render, cgi  (for photorealism)
photo, realistic  (for stylized/anime)
```

#### Model-specific guidance

| Model | Negative approach |
|-------|------------------|
| **Pony/Illustrious/NoobAI** | Danbooru-style: `score_1, score_2, score_3, worst_quality, bad_anime_anatomy, bad_hands` |
| **FLUX.1** | Limited native negative support — rely on positive clarity. Use weighted: `(worst quality:1.3), (blurry:1.2)` |
| **Z-Image** | Negatives largely ignored at CFG 0 — all guidance through positive prompt |
| **Qwen-Image** | Supports standard negatives but architecture handles them differently than SDXL |

**Key insight:** "Using too many anatomy negatives removes realism. Be targeted, not exhaustive." — GensGPT 2026 guide

---

### 5. CFG scale quick reference

| Model | SFW CFG | NSFW CFG | Notes |
|-------|---------|----------|-------|
| **SDXL base** | 7–9 | 5–7 | Higher → artifacts |
| **Pony V6** | 5–7 | 4–6 | Lower for anatomy-heavy content |
| **FLUX.1 Dev** | 3–4 | 3–3.5 | Rectified flow needs less guidance |
| **FLUX.2 Klein** | 3–4 | 3 | 4-step distilled; overcook easily |
| **Z-Image Turbo** | 0.0 | 0.0–1.5 | CFG >1.5 ≈10× slower |
| **Qwen-Image** | 3–5 | 3–4 | Layout reasoning benefits from moderate CFG |

**NSFW-specific note:** Explicit anatomy is more sensitive to over-guidance. Lower CFG lets the model's trained knowledge fill in details naturally rather than forcing the prompt structure too aggressively.

---

### 6. Common failure modes and prompt-level fixes

| Failure | Cause | Prompt fix |
|---------|-------|------------|
| **Extra/fused fingers** | Model attention misses detail | Add: `detailed hands, five fingers each, visible palms` + negative `bad_hands, extra_fingers, fused_fingers` |
| **Floating limbs** | Composition ambiguity | Specify attachment: `arms at sides`, `legs on ground` |
| **Face corruption** | Face-vs-body conflict | Lower IP-Adapter weight; add `symmetrical face, detailed eyes` |
| **Black screen (FLUX)** | Safety filter triggering | Use NSFW LoRA or uncensored checkpoint |
| **Clothed output on NSFW prompt** | Model safety override | Same as above — base FLUX/Z-Image Turbo safety will block |
| **Repetitive seed outputs** | Low model entropy | Vary seed; add `varied composition` or change minor details |
| **Style mismatch (Pony tags on FLUX)** | Wrong paradigm | Switch to natural language for FLUX; tags only for SDXL |
| **Prompt too long for CLIP** | Token overflow on T5-XXL | CLIP-L: ≤77 tokens; T5-XXL: ≤512 tokens |

---

### 7. Practical workflow integration

For the **reference + LoRA stacking** pipeline (see @concepts/reference-plus-lora-stacking.md):

1. Write your **Character DNA** anchor (see @concepts/character-dna-templates.md)
2. Translate it to the **model-appropriate format** (tags vs. prose)
3. Add scene-specific description per generation
4. Apply NSFW LoRA at 0.85 + identity adapter at 0.45
5. Use CFG values per the table above
6. Two-pass refine if anatomy is off (denoise 0.35–0.55)

The prompt is the **cheap test before committing to training** — if you can't get the right output with good prompting + adapters, a LoRA won't fix it either.

## Snippets

### Pony V6 prompt template

```
score_9, score_8_up, score_7_up, source_anime, [trigger], [physical description], [clothing], [pose], [environment], [lighting], masterpiece, best quality
```
Negative: `score_1, score_2, score_3, worst_quality, low_quality, bad_anatomy, bad_hands`

### FLUX.1 Dev prompt template

CLIP-L: `keyword, phrase, comma-separated, visual, descriptors`
T5-XXL: `Full natural language sentence describing the scene, character, and composition in detail.`

### Z-Image Turbo prompt template

```
A photorealistic portrait of [character name], [detailed physical description], [clothing/state], [pose], [environment], [lighting], [style]. All constraints described positively.
```

## Sources

- CivitAI — Score Tag Syntax: https://civitai.com/articles/8547/prompting-for-score-or-source-or-rating-or-prompt-syntax
- CivitAI — Illustrious Prompt Guide: https://civitai.com/articles/23210/arctenoxs-simple-prompt-guide-for-illustrious
- Stable Diffusion Art — Pony Prompt Tags: https://stable-diffusion-art.com/pony-diffusion-prompt-tags/
- Forge Discussion #1182 (dual-encoder testing): https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/1182
- Medium — FLUX.1 Encoders: https://medium.com/@lbq999/flux-1-dev-encoders-and-token-limitations-8631c179eaad
- Reddit r/FluxAI — FLUX prompting: https://www.reddit.com/r/FluxAI/comments/1fxd6ow/
- GLBGPT — Flux NSFW Guide: https://www.glbgpt.com/hub/how-to-use-flux-to-generate-nsfw/
- fal.ai — Z-Image Turbo Guide: https://fal.ai/learn/devs/z-image-turbo-prompt-guide
- GitHub Gist — Z-Image Turbo: https://gist.github.com/illuminatianon/c42f8e57f1e3ebf037dd58043da9de32
- apatero — CFG Scale Guide: https://apatero.com/blog/cfg-scale-explained-complete-guide-2025
- GPUStack — Recommended Parameters: https://docs.gpustack.ai/0.4/tutorials/recommended-parameters-for-image-generation-models/
- GensGPT — Negative Prompts 2026: https://www.gensgpt.com/blog/mastering-negative-prompts-ai-image-generation-2026
- AIarty — 200+ Negative Prompts: https://www.aiarty.com/stable-diffusion-prompts/stable-diffusion-negative-prompt.htm
- BetterWaifu — NSFW Nudify Tutorial: https://betterwaifu.com/blog/stable-diffusion-nudify
- ComfyUI Wiki — Img2Img: https://comfyui-wiki.com/en/workflows/img2img
- GitHub — T5XXL-Unchained: https://github.com/Kaoru8/T5XXL-Unchained
- RedRTA — T2I vs I2I: https://redrta.org/text-to-image-vs-image-to-image/
- CivitAI — Pony V6 model page: https://civitai.com/models/257749/pony-diffusion-v6-xl
- HuggingFace — Z-Image-Turbo discussions: https://huggingface.co/Tongyi-MAI/Z-Image-Turbo/discussions/8
- r/comfyui — NSFW I2I workflows: https://www.reddit.com/r/comfyui/comments/1qxy10f/
- r/comfyui — Best local uncensored model: https://www.reddit.com/r/comfyui/comments/1qh8i3n/