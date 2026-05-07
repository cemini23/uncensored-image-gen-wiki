---
title: LoRA / LyCORIS taxonomy (LoCon, LoHA, LoKr, DoRA)
type: concept
tags: [lora, lycoris, parameter-efficient-finetuning, training, character-isolation]
keywords: [LoRA, LoCon, LoHA, LoKr, DoRA, LyCORIS, low-rank adaptation, factor=4, magnitude direction decomposition, kronecker product, hadamard product]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/ai-toolkit.md
  - entities/training-tools/onetrainer.md
  - entities/training-tools/kohya-ss-gui.md
  - entities/training-tools/musubi-tuner.md
  - entities/training-tools/fluxgym.md
  - concepts/reference-plus-lora-stacking.md
  - concepts/censorship-tier-taxonomy.md
  - entities/models/pony-v6.md
  - entities/models/pony-v7.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - concepts/de-censoring-techniques.md
  - entities/models/z-image-turbo.md
  - entities/models/qwen-image-2512.md
  - entities/models/sdxl-fine-tunes.md
  - entities/models/pixart-sigma.md
maturity: validated
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@entities/training-tools/kohya-sd-scripts.md
@entities/training-tools/ai-toolkit.md
@entities/training-tools/onetrainer.md
@entities/training-tools/kohya-ss-gui.md
@entities/training-tools/musubi-tuner.md
@entities/training-tools/fluxgym.md
@concepts/reference-plus-lora-stacking.md
@concepts/censorship-tier-taxonomy.md
@entities/models/pony-v6.md
@entities/models/pony-v7.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@concepts/de-censoring-techniques.md
@entities/models/z-image-turbo.md
@entities/models/qwen-image-2512.md
@entities/models/sdxl-fine-tunes.md
@entities/models/pixart-sigma.md

## Raw Concept

Concept page mapping the LoRA / LyCORIS variant family. The 2026 community has converged on specific variants for specific tasks; this page is the reference for "which variant for which job, and why".

## Narrative

### What a LoRA actually is

A **LoRA** ("Low-Rank Adaptation") is a parameter-efficient fine-tuning method: instead of updating the full weight matrix `W` of a transformer/UNet layer, train two small matrices `A` (rank `r` × in_dim) and `B` (out_dim × `r`) and add `B·A` to `W` at inference. With `r=16` or `r=32`, this is 1-3 % the parameter count of the full layer but recovers most of the fine-tuning capacity. Original LoRA paper: Hu et al. 2021.

For diffusion models the convention since SDXL has been **rank 16-32 with `alpha = rank`**. For DiT architectures (FLUX, Z-Image, Qwen-Image) rank 16-32 is also standard, with the same `alpha = rank` convention; Z-Image specifically responds well to `alpha = rank/2` ([r/StableDiffusion: Z-IMAGE Training Issues](https://www.reddit.com/r/StableDiffusion/comments/1qwc4t0/thoughts_and_solutions_on_zimage_training_issues/)).

### LyCORIS — the family

[LyCORIS](https://github.com/KohakuBlueleaf/LyCORIS) (Lora beYond Conventional methods, Other Rank adaptation Implementations for Stable diffusion) is the umbrella package collecting LoRA variants. The 2026 catalogue:

| Variant | Math | Strength | When to use |
|---|---|---|---|
| **LoRA** (baseline) | `W += B·A` (rank-r additive) | Universal fallback | Default for character work pre-2025 |
| **LoCon** | LoRA on conv layers + linear | Stronger style transfer | Style LoRAs; mild boost on character |
| **LoHA** | Hadamard product of two low-rank decomps | Higher capacity at same params | Art-style fine-tuning, mid-rank |
| **LoKr** | Kronecker product of two factor matrices | Fewer params, sharper isolation | **2026 character-isolation default** |
| **DoRA** | LoRA + magnitude-direction decomposition (NVIDIA) | Better fit on small data | Character — but overfits anatomy |
| **GLoRA** | Generalized — combines LoRA with prompt-tuning vectors | Niche, limited adoption | Rare in 2026 character workflows |
| **Diag-OFT / BOFT** | Orthogonal fine-tuning (rotation-only) | Parameter-extremely-efficient | Style preservation, less character fit |

### LoKr (factor=4) — 2026 character-isolation consensus

LoKr expresses the weight delta as `W += A ⊗ B` where ⊗ is the Kronecker product. With `factor=4`, the two Kronecker factors are size `(d/4)^2` and `4^2`, giving the same parameter count as a rank-16 LoRA but a **structurally different update**. The community claim — corroborated across [r/StableDiffusion: LoRa vs. LoKr, It's amazing](https://www.reddit.com/r/StableDiffusion/comments/1pvdxs5/lora_vs_lokr_its_amazing/) and [r/StableDiffusion: Any new discoveries about training](https://www.reddit.com/r/StableDiffusion/comments/1k5l1hv/any_new_discoveries_about_training_i_dont_see/) — is that LoKr at factor=4 produces sharper character isolation: less style-bleed into other concepts, less catastrophic-forgetting on adjacent prompts.

[TENTATIVE] Mechanism likely: the Kronecker structure constrains the update to a more localised subspace than rank-r additive, so the update is forced to be "about the persona" rather than "about the persona and tangentially everything else the persona images contained".

### DoRA — promising on paper, mixed in practice

[DoRA](https://developer.nvidia.com/blog/introducing-dora-a-high-performing-alternative-to-lora-for-fine-tuning/) (NVIDIA, 2024) decomposes the LoRA update into separate **magnitude** (per-output-channel scalar) and **direction** (low-rank rotation). The decomposition lets the update modify a layer's overall response strength independently from its directional preferences, closing some of the gap to full-rank fine-tuning.

[CONFIRMED] Community result on character LoRA work: DoRA tends to overfit anatomy ([r/StableDiffusion thread](https://www.reddit.com/r/StableDiffusion/comments/1o5t7z0/why_are_we_still_training_lora_and_not_moved_to/)). The community has not adopted DoRA as default for character work despite the strong NVIDIA write-up.

[TENTATIVE] DoRA still wins on style LoRAs and concept LoRAs where the direction-and-magnitude separation matches the task. The mismatch with character-LoRA is that magnitude shifts on output channels can amplify training-set anatomical biases (specific lighting on specific skin areas, etc.) into the generation.

### Optimiser — recipe by base

[CONFIRMED] (cross-corroborated across [Reddit optimiser thread](https://www.reddit.com/r/StableDiffusion/comments/17mk1hs/8bit_adam_vs_adafactor_vs_prodigy_which_optimizer/), [ostris/ai-toolkit issue #134](https://github.com/ostris/ai-toolkit/issues/134))

| Base | Optimiser | LR | Notes |
|---|---|---|---|
| SDXL / Pony / Illustrious / NoobAI | AdamW8bit OR Prodigy | 1e-4 (AdamW); auto (Prodigy) | Both work; Prodigy auto-tunes LR |
| FLUX.1 Dev / Schnell | **AdamW8bit only** | 5e-5 | **Prodigy underestimates LR — fails** |
| FLUX.2 Dev / Klein 9B | AdamW8bit | 5e-5 | Same DiT-family caveat |
| Z-Image Turbo | AdamW8bit | 5e-5 | half-rank alpha (`alpha=rank/2`) |
| Qwen-Image | AdamW8bit | 5e-5 | Standard DiT rules |
| 8 GB VRAM (any base) | Adafactor + LoRA+ | base × 1, target_lr_factor 16 | The "stretch" config — slower but feasible |

LoRA+ ([Hayou et al. 2024](https://arxiv.org/abs/2402.12354)) is the convention of training the `B` matrix at a higher LR than `A`. Combined with Adafactor it lets 8 GB VRAM machines train FLUX LoRAs at the cost of throughput.

### Rank / dataset / steps — character LoRA

[CONFIRMED]

| Dataset size | Rank | Steps | Comment |
|---|---|---|---|
| 15-25 | 16 | 1500-2000 | Floor — works on most bases |
| 25-40 | 16 | 2000-2500 | Sweet spot lower bound |
| 40-80 | 16-32 | 2500-3500 | Sweet spot upper bound |
| 80-120 | 32 | 3500 | Diminishing returns begin |
| 120-200 | 32 | 4000+ | Watch for clothing/background overfit |
| 200+ | — | — | Stop. Curate down to 80 best images. |

For multi-angle datasets (Section 4 of @sources/synthetic-character-consistency-survey.md), the best 40-60 frames from a Wan 2.2 I2V extraction or Mickmumpitz 3.8 96-angle output is the modal recipe.

### LyCORIS in trainers — support matrix

[CONFIRMED]

| Trainer | LoRA | LoCon | LoHA | LoKr | DoRA |
|---|---|---|---|---|---|
| @entities/training-tools/kohya-sd-scripts.md | yes | yes | yes | yes | yes |
| @entities/training-tools/ai-toolkit.md | yes | partial | partial | yes | yes |
| @entities/training-tools/onetrainer.md | yes | yes | yes | yes | yes |
| FluxGym | yes | no | no | no | partial |
| Musubi Tuner | yes | no | no | partial | no |

Kohya sd-scripts is the most LyCORIS-complete trainer; OneTrainer matches it with a GUI. ai-toolkit prioritises FLUX/Wan first-class with rank/DoRA support but thinner on the older variants.

## Snippets

> "I tested LoKr factor=4 against my usual rank-32 LoRA on the same dataset — the LoKr is sharper on the character and the prompt-faithfulness on adjacent concepts is noticeably better. The LoRA bleeds my persona into things like 'a chair' or 'a car'; the LoKr doesn't."
> — community user, [r/StableDiffusion: LoRa vs. LoKr](https://www.reddit.com/r/StableDiffusion/comments/1pvdxs5/lora_vs_lokr_its_amazing/) (paraphrased)

> "Why are we still training LoRA and not moved to DoRA? Because DoRA overfits anatomy on character training and you end up with a model that knows your persona's *exact* skin tone in your dataset's *exact* lighting, and refuses to generalise."
> — paraphrased thread consensus, [r/StableDiffusion](https://www.reddit.com/r/StableDiffusion/comments/1o5t7z0/why_are_we_still_training_lora_and_not_moved_to/)

## Dead Ends

- **Prodigy on FLUX/DiT** [RETRACTED]. Prodigy's LR auto-tuning underestimates on transformer-block diffusion ([ostris issue #134](https://github.com/ostris/ai-toolkit/issues/134)). The character never learns. Default to AdamW8bit @ 5e-5 for FLUX/Z-Image/Qwen-Image.
- **rank=64+ for character work** [RETRACTED]. Bigger isn't better — past rank 32 the LoRA starts memorising clothing and background as identity attributes, reducing prompt-faithfulness on new compositions. Stick to 16-32.
- **DoRA as universal LoRA upgrade** [TENTATIVE-RETRACTED]. NVIDIA's write-up is honest about the gains but the gains do not generalise to character-LoRA; community has not adopted. Keep DoRA in the toolkit for style-only or concept-only LoRAs.
