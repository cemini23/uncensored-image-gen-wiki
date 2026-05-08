---
title: Anima (Circlestone Labs / Comfy Org)
type: entity
tags: [model, dit, anima, circlestone-labs, comfy-org, qwen3-encoder, anime, unbound, 8gb-vram, 2b]
keywords: [Anima, Circlestone Labs, Comfy Org, Cosmos-Predict, 2B DiT, Qwen3-0.6B encoder, WTF tier, Unbound, anime, SDXL replacement, 2026 anime model]
related:
  - sources/uncensored-image-generation-survey.md
  - concepts/censorship-tier-taxonomy.md
  - concepts/de-censoring-techniques.md
  - entities/models/pony-v6.md
  - entities/models/illustrious-xl.md
  - entities/models/noobai-xl.md
  - concepts/model-selection-workflow.md
  - entities/hardware/gpu-guide.md
  - entities/uis/comfyui.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/uncensored-image-generation-survey.md
@concepts/censorship-tier-taxonomy.md
@concepts/de-censoring-techniques.md
@entities/models/pony-v6.md
@entities/models/illustrious-xl.md
@entities/models/noobai-xl.md

## Raw Concept

Entity page for **Anima**, the **Unbound-tier** ("WTF") anime model — the canonical example of a base model so uncurated that it tends to *generate* explicit content even when not asked. Released early 2026 by **Circlestone Labs** in collaboration with **Comfy Org**. Back-filled from @sources/uncensored-image-generation-survey.md §1.

## Narrative

### What it is

**Anima** — next-generation **lightweight anime model** by Circlestone Labs and Comfy Org. **2B-parameter DiT** modified from **Cosmos-Predict** (NVIDIA's world-model architecture). Released early 2026 as a replacement for aging SDXL anime workflows.

Architecture highlights:

- **2B DiT base** — exceptionally fast and lightweight for a DiT-class model.
- **Cosmos-Predict modification** — inherits world-model spatial reasoning from NVIDIA's Cosmos research lineage.
- **Qwen3-0.6B text encoder** — native LLM encoder (rather than CLIP). Users prompt with **targeted natural-language programming concepts** rather than tag soup.
- **8 GB VRAM compatible** — fits comfortably on the 8 GB tier without aggressive quantization.

### Why creators use it

[CONFIRMED, source @sources/uncensored-image-generation-survey.md §1]:

- **DiT quality on the 8 GB tier** — the 2B DiT base lets 8 GB users access modern DiT prompt-adherence and spatial coherence without dropping back to SDXL Pony / Illustrious for hardware reasons.
- **Effortlessly explicit by default** — the community tier label is **"WTF" / "Unbound"**: the model generates explicit content with no apparent safety alignment in either training data or post-training. Often *over-generates* explicit content even on neutral prompts.
- **Speed on consumer hardware** — 2B params + DiT efficiency = sub-second generation on midrange GPUs.
- **Natural-language prompting** — Qwen3 encoder rewards prose over tag-soup; closer to FLUX/Z-Image prompting style than Pony's score_9 tag system.

### Why creators avoid it

[TENTATIVE]:

- **The "WTF" problem cuts both ways**: when explicit anatomy isn't wanted, Anima needs **negative prompts** to suppress it, which adds prompt-engineering overhead absent from more aligned models.
- **Anime-aesthetic lock-in** — Anima is an anime model. For photorealistic persona work, @entities/models/z-image-turbo.md or @entities/models/flux-1-dev.md are better matched.
- **Newer than the SDXL anime canon** — community LoRAs and adapter ecosystem are still being built. SDXL anime LoRAs (Pony / Illustrious / NoobAI ecosystem) do not transfer to Anima's DiT architecture.
- **`[NEEDS VERIFICATION 2026-05-06]`**: confirm Cosmos-Predict modification details and licensing chain — NVIDIA Cosmos has its own license terms that may flow downstream.

### Censorship tier

**Unbound / "WTF"** — the only model in the wiki currently at this tier. See @concepts/censorship-tier-taxonomy.md for the framework. The de-censoring conversation is *inverted* compared to other models: instead of removing safety alignment, the question is whether the user wants to *add* tasteful negative prompts to suppress explicit generation when not desired.

No de-censoring techniques apply (see @concepts/de-censoring-techniques.md decision tree — "Unbound: None needed").

### Hardware profile

[CONFIRMED]:

- **FP16 / BF16**: ~4 GB VRAM (2B parameters × 2 bytes/param).
- **8 GB-tier compatible** at 1024×1024 with batch size 1.
- **Sub-second inference** on consumer GPUs — survey claims "exceptionally fast."

### Role in 2026 production stack

[CONFIRMED]:

- **8 GB anime-aesthetic DiT slot** — when the user wants modern DiT quality but is on 8 GB hardware and wants anime aesthetic specifically. Pony V6 / Illustrious / NoobAI cover the SDXL anime tier; Anima covers the DiT anime tier at the same VRAM cost.
- **Persona-consistency potential**: Anima with a character LoRA trained on its DiT base could be a strong choice for anime persona work that wants modern prompting (natural language). LoRA training tooling status `[NEEDS VERIFICATION 2026-05-06]`.
- **Stylistic NSFW work** where the "Unbound" tier is the *feature* — explicit anime content generates without coercion.

### Workspace TODO

- ~~Anima Hugging Face / Comfy Org release page~~ — **resolved [CONFIRMED 2026-05-06]**: canonical at `circlestone-labs/Anima` ([huggingface.co/circlestone-labs/Anima](https://huggingface.co/circlestone-labs/Anima)). Status: **Preview** (`anima-preview.safetensors`, 3.89 GB, sha256 `41fa7b78...`). Created 2026-02-02; updated 2026-02-15. Multiple CivitAI mirrors: [civitai.com/models/2458426/anima-official](https://civitai.com/models/2458426/anima-official) (Anima Official preview3-base) and [civitai.com/models/2359125/anima](https://civitai.com/models/2359125/anima). Community fine-tune **AnimaYume** at [civitai.com/models/2385278/animayume](https://civitai.com/models/2385278/animayume). Anima preview workflow at [civitai.com/models/2426853/anima-preview-workflow](https://civitai.com/models/2426853/anima-preview-workflow). FP16 patch (`ModelComputeDtype` node) at [civitai.com/models/2356447](https://civitai.com/models/2356447) — speeds RTX 2080 Super from 4 minutes to 38s at 832×1216. Status: **Preview, not full release** — full trained version still pending as of May 2026.
- **`[NEEDS VERIFICATION 2026-05-06]`**: ai-toolkit / OneTrainer / Kohya support for Anima LoRA training. Sub-sweep C target.
- **`[NEEDS VERIFICATION 2026-05-06]`**: Cosmos-Predict licensing chain — does NVIDIA's Cosmos license flow downstream to Anima derivatives?
- Compare Anima vs Pony V6 head-to-head on a fixed anime-prompt set; document the DiT-vs-U-Net quality gap at the 8 GB tier.
- Document negative-prompt patterns for Anima — the community workflow for reining in over-explicit defaults.

## Snippets

### Anima as Unbound-tier example

> "Anima is a next-generation, lightweight anime model designed to replace aging SDXL workflows. With only 2 billion parameters (2B DiT modified from Cosmos-Predict), it is exceptionally fast and requires minimal VRAM, fitting comfortably on 8GB GPUs. It utilizes the Qwen3-0.6B text encoder, allowing users to prompt using targeted natural language programming concepts rather than relying solely on keyword tags. Its censorship status is effectively non-existent; the community labels it as 'WTF' or 'Unbound,' noting its tendency to generate explicit content effortlessly."

— @sources/uncensored-image-generation-survey.md §1
