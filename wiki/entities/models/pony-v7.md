---
title: Pony Diffusion V7 (AuraFlow)
type: entity
tags: [model, auraflow, pony, dit, danbooru, lora-base, t5-encoder, completely-uncensored]
keywords: [Pony V7, Pony Diffusion, AstraliteHeart, AuraFlow, T5 text encoder, 1536x1536 native, GGUF Q4, NSFW, Danbooru]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/prompt-engineering-uncensored.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/lora-taxonomy.md
  - concepts/character-dna-templates.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/persona-consistency-methods.md
  - entities/models/pony-v6.md
  - entities/models/illustrious-xl.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/ai-toolkit.md
  - concepts/de-censoring-techniques.md
  - concepts/model-selection-workflow.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/uncensored-image-generation-survey.md
@concepts/censorship-tier-taxonomy.md
@concepts/lora-taxonomy.md
@concepts/character-dna-templates.md
@concepts/reference-plus-lora-stacking.md
@concepts/persona-consistency-methods.md
@entities/models/pony-v6.md
@entities/models/illustrious-xl.md
@entities/training-tools/kohya-sd-scripts.md
@entities/training-tools/ai-toolkit.md
@concepts/de-censoring-techniques.md
@concepts/model-selection-workflow.md
@concepts/prompt-engineering-uncensored.md

## Raw Concept

The successor to @entities/models/pony-v6.md, released early 2026 by AstraliteHeart on the **AuraFlow** architecture (deliberately bypassing Stability's SD3 line). Currently in deployment phase; community migration from V6 still gating on adapter / LoRA-conversion tooling. Back-filled from @sources/uncensored-image-generation-survey.md §1.1.

## Narrative

### What it is

**Pony Diffusion V7** — successor model from AstraliteHeart (PurpleSmart.ai). Built on **AuraFlow** (a flow-matching DiT, not SDXL or SD3.5). T5 text encoder. Native generation up to **1536×1536**. Tier: **Completely Uncensored** — preserved despite the T5-encoder shift via deliberate mature-captioning effort during pre-training.

The architectural break from SDXL is intentional: V7 was built to skip Stability's SD3 line entirely (which had Strict-tier alignment issues and CivitAI's takedown enforcement loop). AuraFlow gives V7 the prompt-comprehension and resolution scaling of a modern DiT while keeping the aesthetic / NSFW orientation of the Pony lineage.

### Why creators use it (or expect to)

[TENTATIVE] (community deployment phase, May 2026):

- **Native 1536×1536** without iterative upscaling — eliminates the Ultimate SD Upscale step from the workflow, reducing an entire generation pass.
- **T5 encoder = natural-language prompting**. Score-tag system carried forward but supplemented with prose. Prompts like "An anime portrait of a young woman with red hair standing in a forest, photorealistic lighting, score_9, masterpiece" now work.
- **GGUF Q4 quantization** brings 8 GB VRAM into reach despite the larger parameter count (parameter count not stated explicitly in survey but implied to be larger than V6's 2.6B).
- **Improved spatial relationships and lighting**. Survey claims "vastly improved prompt comprehension regarding spatial relationships, and enhanced rendering of extreme lighting conditions without color degradation."

### Limits

[TENTATIVE]:

- **Existing Pony V6 LoRAs do NOT carry to V7** — different base architecture (SDXL → AuraFlow). The community's vast V6 LoRA library is effectively orphaned. A LoRA-conversion tool may or may not ship; **`[NEEDS VERIFICATION 2026-05-06]`**.
- **Adapter ecosystem is sparse** — IP-Adapter / InstantID / PhotoMaker are SDXL-tied. PuLID is FLUX-tied. There is no AuraFlow adapter ecosystem yet of comparable depth; persona-consistency workflows on V7 will rely on LoRA training rather than adapter injection until the gap is filled.
- **Score-tag system carries forward but its semantics may have shifted** under the T5 encoder. Untested.

### Weights release status

[CONFIRMED 2026-05-06] **Weights are released.** Resolves the survey's internal citation 7 vs 8 contradiction in favour of citation 7. As of May 2026:

- **Hugging Face**: `purplesmartai/pony-v7-base` ([huggingface.co/purplesmartai/pony-v7-base](https://huggingface.co/purplesmartai/pony-v7-base)) — both Diffusers and Safetensors formats.
- **CivitAI**: [civitai.com/models/1901521/pony-v7-base](https://civitai.com/models/1901521/pony-v7-base).
- **License**: Apache 2 with restrictions (commercial use permitted with conditions).
- **Parameter count**: 7B (AuraFlow-based, 7-billion-parameter vision model).
- **GGUF quantization**: GGUF quants are available for lower-VRAM workflows.
- AstraliteHeart has confirmed work on V7.1 follow-up + Qwen-based V8 (editing) is in prep stage.

Citation 8 (Reddit "won't be released") was pre-release confusion — the post predates the actual public weight drop. For the current state of the V7 ecosystem, see the **`offlinecreator.com` 2026 guide** ([offlinecreator.com/how-to-run-pony-diffusion-locally](https://offlinecreator.com/how-to-run-pony-diffusion-locally)) and Apatero's **Pony V7 guide** ([apatero.com/blog/pony-v7-complete-guide](https://apatero.com/blog/pony-v7-complete-guide-auraflow-character-generation-2025)). Tooling is younger than V6's; quality tags are weaker; V7.1 is in development.

### Role in 2026 production stack (projected)

[TENTATIVE]:

- **Default for stylized character work that needs higher resolution + better prompt adherence** than V6 can provide — assuming weights ship and LoRA tooling matures.
- **Will compete with @entities/models/illustrious-xl.md / NoobAI-XL on the anime axis**, but with better natural-language prompting and native high-res.
- **Persona-consistency workflows** will likely shift to V7 LoRA training via @entities/training-tools/kohya-sd-scripts.md (sd-scripts AuraFlow support tracking) or @entities/training-tools/ai-toolkit.md (which has shown willingness to support new architectures quickly). Until the conversion pipeline is clear, persona-ops risk-tolerance shops should stay on V6.

### Captioning conventions

[TENTATIVE]:

```
score_9, score_8_up, [natural-language description of subject and scene], rating:explicit
```

The score-prefix is preserved; everything between can be either tags (V6 style) or prose (V7 native). Mixed forms are reportedly accepted. Confirm with first-touch when weights are out.

### Workspace TODO

- ~~Weights-release status~~ — **resolved [CONFIRMED 2026-05-06]**: weights released at `purplesmartai/pony-v7-base` on Hugging Face + CivitAI 1901521; Apache 2 (with restrictions); 7B params; GGUF quants available.
- Confirm V6 → V7 LoRA migration story (community tool? official support? not happening?). Likely answer: not happening — LoRAs must be re-trained on AuraFlow.
- Confirm adapter ecosystem availability (IP-Adapter for AuraFlow? PuLID-AuraFlow port?). Survey-time gap stands as of May 2026.
- Confirm GGUF Q4 inference path performance per UI (ComfyUI, Forge, SwarmUI) — GGUF is available, UI compatibility tracking still appropriate.

## Snippets

### Architectural break from SDXL

> "Bypassing Stability AI's SD3 line entirely, V7 is built upon the AuraFlow architecture. This architectural leap offers native generation up to 1536x1536 resolution, vastly improved prompt comprehension regarding spatial relationships, and enhanced rendering of extreme lighting conditions without color degradation."

— @sources/uncensored-image-generation-survey.md §1.1

### Why uncensored despite T5 encoder

> "Despite adopting a T5 text encoder—which the community historically feared would limit NSFW capabilities due to its natural language focus—the developers conducted extensive mature-captioning improvements to maintain complete anatomical flexibility."

— @sources/uncensored-image-generation-survey.md §1.1

### Quantization path

> "The model is highly optimized, capable of running via 8-bit inference or down to 4-bit GGUF quantization for users with severe VRAM constraints."

— @sources/uncensored-image-generation-survey.md §1.1

## Dead Ends

- **Assuming SDXL-era V6 LoRAs will work** — they will not, base architecture differs. The community is in transition; budget for re-training key persona LoRAs from scratch on V7 if migrating.
- ~~**Assuming V7 weights are public**~~ [RETRACTED 2026-05-06] — V7 weights ARE public as of May 2026 at `purplesmartai/pony-v7-base` on HF + CivitAI 1901521. The survey's citation 8 (Reddit "won't be released") was pre-release confusion. Workflows can commit.
