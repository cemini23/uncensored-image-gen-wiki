---
title: "Synthetic Character Consistency Survey (May 2026)"
type: source
tags: [survey, persona-consistency, lora-training, identity-adapters, video-consistency, deep-research, t2i, t2v]
keywords: [Character DNA, PuLID, IP-Adapter, InstantID, ConsistentID, CharaConsist, InfiniteYou, PhotoMaker, FLUX Redux, FLUX.2 Klein, Kohya, ai-toolkit, OneTrainer, FluxGym, Musubi Tuner, Wan 2.2, HunyuanVideo, LTX, FLUX.1, FLUX.2, Pony V7, Illustrious XL, NoobAI XL, Z-Image, Qwen-Image, PimEyes, FaceCheck, LoRA, LoCon, LoHA, LoKr, DoRA, LyCORIS, Mickmumpitz Consistent Character Creator]
related:
  - concepts/persona-consistency-methods.md
  - concepts/lora-taxonomy.md
  - entities/adapters/ip-adapter.md
  - entities/adapters/pulid.md
  - entities/adapters/instantid.md
  - entities/adapters/consistentid.md
  - entities/adapters/infinite-you.md
  - entities/adapters/photomaker-v2.md
  - entities/training-tools/kohya-sd-scripts.md
  - entities/training-tools/ai-toolkit.md
  - entities/training-tools/onetrainer.md
  - entities/training-tools/kohya-ss-gui.md
  - entities/training-tools/musubi-tuner.md
  - entities/training-tools/fluxgym.md
  - entities/adapters/characonsist.md
  - entities/adapters/flux-redux.md
  - entities/adapters/flux-kontext.md
  - entities/adapters/flux2-klein-9b-faceswap.md
  - concepts/character-dna-templates.md
  - concepts/likeness-collision-verification.md
  - concepts/reference-plus-lora-stacking.md
  - entities/models/flux.md
  - entities/models/flux-1-dev.md
  - entities/models/flux-2-klein.md
  - sources/video-generation-survey-2026.md
  - concepts/multi-angle-dataset-prep.md
  - concepts/video-identity-inheritance.md
  - sources/persona-monetization-2026.md
  - sources/persona-ops-stack-2026.md
  - concepts/model-selection-workflow.md
  - entities/hardware/gpu-guide.md
  - entities/marketplaces/civitai.md
  - entities/uis/comfyui.md
maturity: validated
created: 2026-05-06
updated: 2026-05-07
read_status: deep-read
---

## Relations

@concepts/persona-consistency-methods.md
@concepts/lora-taxonomy.md
@entities/adapters/ip-adapter.md
@entities/adapters/pulid.md
@entities/adapters/instantid.md
@entities/adapters/consistentid.md
@entities/adapters/infinite-you.md
@entities/adapters/photomaker-v2.md
@entities/training-tools/kohya-sd-scripts.md
@entities/training-tools/ai-toolkit.md
@entities/training-tools/onetrainer.md
@entities/training-tools/kohya-ss-gui.md
@entities/training-tools/musubi-tuner.md
@entities/training-tools/fluxgym.md
@entities/adapters/characonsist.md
@entities/adapters/flux-redux.md
@entities/adapters/flux-kontext.md
@entities/adapters/flux2-klein-9b-faceswap.md
@concepts/character-dna-templates.md
@concepts/likeness-collision-verification.md
@concepts/reference-plus-lora-stacking.md
@entities/models/flux.md
@entities/models/flux-1-dev.md
@entities/models/flux-2-klein.md
@sources/video-generation-survey-2026.md
@concepts/multi-angle-dataset-prep.md
@concepts/video-identity-inheritance.md
@sources/persona-monetization-2026.md
@sources/persona-ops-stack-2026.md

## Raw Concept

- **Original title**: Synthetic Character Consistency Survey
- **Type**: deep-research output (claude.ai / Gemini / DeepSeek synthesis)
- **Location**: `research to be indexed/processed/Synthetic Character Consistency Survey.docx` (33 KB)
- **Retrieved**: 2026-05-06 (file mtime; back-fill into wiki done 2026-05-06)
- **Date on file**: May 2026
- **Read status**: deep-read (full 239-line brief @ `briefs/persona-consistency.md`)
- **Companion deliverable**: [briefs/persona-consistency.md](../../briefs/persona-consistency.md) — polished synthesis of this docx, ready-to-paste into ComfyUI/claude.ai workflows

## Narrative

### What this survey covers

A 2026-state synthesis of the **end-to-end pipeline for synthetic-persona consistency** in adult-aligned image and video generation. Six functional sections:

1. **Synthesis & bootstrap** — generating a novel face that won't collide with a real person. Character DNA / XML-tag prompting, celebrity-blend seeds, Nano Banana Pro 4K bootstrap, latent-space face mixing, [PimEyes](https://pimeyes.com/en) (2.1B-face index) + [FaceCheck.ID](https://facecheck.id/) verification at the threshold "zero hits above 70 % similarity across 1 000+ images".
2. **Character LoRA training** — base-specific recipes across SDXL/Pony/Illustrious/NoobAI, FLUX.1, Z-Image Turbo, Qwen-Image. Trainer ecosystem (Kohya, ai-toolkit, OneTrainer, FluxGym, Musubi Tuner). Dataset size floors (15-25 minimum, 40-80 sweet spot). Rank/alpha/optimiser specifics and the documented Prodigy → AdamW8bit migration on FLUX/DiT.
3. **Reference-based identity injection** — IP-Adapter family, InstantID, PuLID-FLUX, ConsistentID, CharaConsist (ICCV 2025), InfiniteYou (ByteDance, ICCV 2025 Highlight), PhotoMaker V2, FLUX.1 Redux, FLUX.2 Klein 9B face-swap. The "reference + LoRA stack" is the modal 2026 production pattern.
4. **Multi-angle dataset generation** — Wan 2.2 I2V frame extraction, FLUX Kontext Character Turnaround Sheet LoRA, Mickmumpitz Consistent Character Creator 3.8 (Qwen-Image-Edit-2511 driving 96-angle turnarounds via explicit azimuth/elevation queries), VNCCS workflow.
5. **Carrying consistency into video** — Wan 2.2 I2V as the modal choice (Apache-2.0 weights, strong 5-8 sec frame-1 carry), Wan 2.2 Stand-in with YOLO+DWPose biometric protection, Wan 2.7 R2V multi-reference grids, HunyuanVideo character LoRAs (NSFW-permissive pretraining), LTX-2.3, First-and-Last-Frame interpolation as the drift mitigation. Dual-LoRA pattern for MoE bases.
6. **Failure modes** — face drift over batch (seed pinning), recursive-prompting attribute bleed, body inconsistency (separate face/body LoRAs), PuLID skin-tone drift, **NSFW anatomy degradation under reference adapters** (semantic conflict on clothed-reference + nude-prompt), hair/clothing copy-paste, long-session text-encoder drift, cross-platform LoRA non-transferability.

### Why this is the canonical persona-consistency reference for this workspace

- **Uncensored-first framing**: the survey treats SFW and NSFW as a unified pipeline; identifies which adapters/LoRAs degrade on explicit anatomy and which mitigations work (two-pass inpaint, NSFW-trained LoRA + low-strength reference adapter, base swap to NoobAI/Z-Image/Lustify).
- **Hardware-aware throughout**: VRAM tables for every training and inference path, 8-12-16-24 GB tier breakouts, Apple-Silicon caveats. Critical for this MacBook Pro workspace.
- **2026 ecosystem state**: incorporates Pony V7 abandonment / NoobAI XL ascendance, FLUX.2 Klein 9B face-swap pattern, Wan 2.2 Stand-in release, Mickmumpitz 3.8 96-angle pipeline. Dated April-May 2026.
- **Cited primary sources**: 30+ citations to Reddit threads, GitHub issues, RunComfy workflows, model cards. Provenance is auditable.

### Five canonical synthesis methods (Section 1)

| Method | When to use | Cost | Failure mode |
|---|---|---|---|
| Character DNA / XML-tag prompt | Quick generation, tag-trained bases (SDXL/Pony/Illustrious/NoobAI) | Free | Drift between sessions; no latent persistence |
| Celebrity blend seed | Photorealism with controlled base | Free | NCII risk if blend tilts; mandatory PimEyes sweep |
| Nano Banana Pro / Imagen 4 high-res bootstrap | Single-shot 4K master image | API cost | Cloud dependency; not local |
| Latent face-mixing nodes | Local, full-control, repeatable | Free | Requires ComfyUI plumbing |
| Existing face-search LoRA + heavy denoise | Photorealistic distortion of target persona | Free | Tag-cluster prone; less controllable |

### LoRA training — base-specific 2026 recipes (Section 2)

[CONFIRMED] (cross-corroborated across community sources)

| Base | Trainer | Rank/alpha | Optimiser | LR | Steps | VRAM (8-bit) | Time (3090 reference) |
|---|---|---|---|---|---|---|---|
| SDXL/Pony/Illustrious/NoobAI | Kohya sd-scripts | 16-32 / =rank | AdamW8bit or Prodigy | 1e-4 (AdamW) | 1500-3000 | 12 GB | 1-2 h |
| FLUX.1 dev | ai-toolkit / Kohya | 16-32 / =rank | AdamW8bit *only* | 5e-5 | 2000-3000 | 16-24 GB | 2-4 h |
| Z-Image Turbo | ai-toolkit | 8-16 / =rank/2 | AdamW8bit | 5e-5 | 2000 | 8-12 GB | 1.5-3 h |
| Qwen-Image | Musubi Tuner / ai-toolkit | 16-32 / =rank | AdamW8bit | 5e-5 | 2500 | 16-24 GB | 2-4 h |
| FLUX.2 dev | ai-toolkit | 16-32 / =rank | AdamW8bit | 5e-5 | 3500 | 80 GB (H100) | ~3 h |
| FLUX.2 Klein 9B | ai-toolkit | 16-32 / =rank | AdamW8bit | 5e-5 | 1500-2500 | 16 GB (4060 Ti) | ~30 min |

**Critical**: Prodigy fails on FLUX/DiT bases — community-confirmed underestimation of LR ([ostris/ai-toolkit issue #134](https://github.com/ostris/ai-toolkit/issues/134)). Use AdamW8bit for FLUX, Prodigy only for SDXL-family.

### LyCORIS variant taxonomy (@concepts/lora-taxonomy.md)

- **LoRA** (baseline) — additive low-rank update.
- **LoCon** — adds conv-layer adaptation; better style transfer, mild character-isolation gain.
- **LoHA** — Hadamard product; higher capacity at same param count; popular for art-style.
- **LoKr** (factor=4) — Kronecker product; **2026 community consensus for character-isolation specifically** ([r/StableDiffusion: LoRa vs. LoKr](https://www.reddit.com/r/StableDiffusion/comments/1pvdxs5/lora_vs_lokr_its_amazing/)).
- **DoRA** — magnitude-direction decomposed LoRA ([NVIDIA Technical Blog](https://developer.nvidia.com/blog/introducing-dora-a-high-performing-alternative-to-lora-for-fine-tuning/)). Mixed community results — overfits anatomy on character work ([r/StableDiffusion thread](https://www.reddit.com/r/StableDiffusion/comments/1o5t7z0/why_are_we_still_training_lora_and_not_moved_to/)). Not the default in 2026.

### Identity-adapter taxonomy (Section 3)

| Adapter | Backbone | Strength | Failure mode |
|---|---|---|---|
| @entities/adapters/ip-adapter.md (base/Plus) | SDXL/SD1.5 | Style + composition reference | Holistic — copies clothing/hair |
| IP-Adapter FaceID / FaceID-Plus-V2 / FaceID-Portrait | SDXL | Strong face fidelity | Trained mostly on SFW — degrades on explicit |
| @entities/adapters/pulid.md (PuLID, PuLID-FLUX, PuLID II) | SD1.5/SDXL/FLUX | Highest face fidelity | Skin-tone drift, "model pollution" |
| @entities/adapters/instantid.md | SDXL | Most colour-stable | Lower fidelity than PuLID |
| @entities/adapters/consistentid.md | SDXL | Multi-image, fine-grained | TPAMI 2026; new, less battle-tested |
| CharaConsist | FLUX/SDXL | Training-free | ICCV 2025; setup complexity |
| @entities/adapters/infinite-you.md | FLUX | Multi-aspect identity | ByteDance, ICCV 2025 Highlight |
| @entities/adapters/photomaker-v2.md | SDXL | Aging / styling preservation | TencentARC; older |

### NSFW-specific failure mode (Section 6)

[CONFIRMED] [Source: arxiv 2504.05838, [r/comfyui clothed-reference thread](https://www.reddit.com/r/comfyui/comments/1qjca2i/modelsloras_for_nsfw_i2i_generation_clothing/)]

IP-Adapter family (and PuLID inherits some of this) was trained mostly on SFW data; embedding space has thin coverage of explicit anatomy. Result: clothed-reference + nude-prompt produces "alien anatomy" — fused limbs, mucosal-fabric merging, hand collapse. The mechanism is **semantic conflict**: the holistic CLIP-vision representation forces clothing geometry onto the underlying body.

Four documented mitigations:
1. NSFW-trained character LoRA at 0.85 + reference adapter at 0.45 (LoRA carries anatomy, adapter nudges identity).
2. Two-pass: explicit composition without reference, then face-only inpaint with PuLID at high strength.
3. Multi-pass with FLUX.2 Klein 9B face-swap mapping identity onto clean explicit geometry.
4. Switch base to NoobAI XL / Z-Image Turbo / Lustify (NSFW-retentive pretraining).

### Likeness-collision verification protocol

[CONFIRMED]

- Primary sweep: [PimEyes](https://pimeyes.com/en) — 2.1B-face index, paid; recommended threshold "zero hits above 70 % similarity across ≥1 000 generations". [Bellingcat Toolkit reference](https://bellingcat.gitbook.io/toolkit/more/all-tools/pimeyes).
- Secondary: [FaceCheck.ID](https://facecheck.id/) and [AI Face Search](https://aifacesearch.com/) — different indexes, free tiers; redundancy reduces false-negative risk.
- NCII compliance framing: [ATIXA: When the Image Isn't Real](https://www.atixa.org/blog/when-the-image-isnt-real-addressing-ai-generated-explicit-photos/).

### Practical relevance for this workspace

[CONFIRMED] (cross-checked vs `briefs/persona-consistency.md` content)

- The full pipeline is **deployable on a 16 GB consumer GPU + modest cloud rental** for high-VRAM phases. A MacBook Pro is sufficient for inference on quantised FLUX.1/Z-Image/SDXL with a character LoRA + PuLID; training requires either an eGPU or short cloud rental (RunPod 4090).
- The **modal 2026 production loop**: bootstrap face dataset → train base-specific character LoRAs → use PuLID/InstantID at low strength for stabilisation → multi-angle data via Wan I2V → identity into video via I2V conditioning → patch failures inline with two-pass inpaint + colour-locked refinement.
- The **unsolved problem** is not consistency itself (reduced to a recipe) but the **cost-per-asset of maintaining parallel LoRAs** across the rapidly-evolving image-and-video bases. Treat the face dataset as the canonical asset; treat LoRAs as cheap, expendable derivatives.

### Tools and models referenced (truncated; full list in brief)

Bases: Pony V6/V7 (abandoned-as-of-2026), Illustrious XL, NoobAI XL (V-Prediction), Anima, Z-Image Turbo, Zeta Chroma, Qwen-Image-2511 / 2512, Qwen-Image-Edit-2511, ERNIE-Image, FLUX.1 Dev/Schnell/Pro, FLUX.2 Dev/Pro/Klein 9B/4B, SDXL fine-tunes (Juggernaut, Lustify, BigAsp, Cyberrealistic), SD3.5, Chroma1-HD, FLUX-UNCENSORED-Merged.

Video: Wan 2.2 (high-noise + low-noise MoE), Wan 2.2-Animate (Stand-in mode), Wan 2.7 R2V, HunyuanVideo 1.5, LTX-2.3, Mochi 1, CogVideoX, Open-Sora 2.0.

Trainers: @entities/training-tools/kohya-sd-scripts.md, @entities/training-tools/ai-toolkit.md, @entities/training-tools/onetrainer.md, FluxGym, Musubi Tuner, Diffusion-Pipe-UI, Replicate ostris trainer.

Adapters: @entities/adapters/ip-adapter.md, @entities/adapters/pulid.md, @entities/adapters/instantid.md, @entities/adapters/consistentid.md, @entities/adapters/infinite-you.md, @entities/adapters/photomaker-v2.md, FLUX.1 Redux, FLUX.1 Kontext, FLUX.2 Klein 9B face-swap.

Workflow nodes: ComfyUI_OmniConsistency, Hyper LoRA, Wan SVI 2 Pro FLF, HunyuanVideo Lora Block Edit, ColorPeel / Color Me Correctly, Perturbed Attention Guidance.

## Snippets

> "Treat the persona's face dataset as the canonical asset; treat the LoRAs as cheap derivatives. Production workflow is to maintain parallel LoRAs per base: one FLUX LoRA for SFW polish, one Pony V7 LoRA for explicit, one Wan 2.2 video LoRA for clips."
> — Section 6, distilled production loop. [Source: briefs/persona-consistency.md (retrieved 2026-05-06)]

> "PuLID followed by a refining pass for skin tone is probably the highest quality."
> — Reddit community consensus, 2025. [Source: r/StableDiffusion: "Is InstantID + Canny still the best method in 2025"]

> "Strict workflow isolation with a multi-pass pipeline. The base model first generates the target explicit anatomy as a blank, faceless template using standard text prompts only. Then the persona's facial identity is mapped onto the geometry post-generation via highly targeted face-swap (FLUX.2 Klein 9B or FaceID nodes) plus regional ControlNets."
> — Section 6, NSFW failure-mode mitigation #3. [Source: YouTube: ComfyUI Face Swap 2026: Flux Klein 9B]

> "Dataset size floor 15-25 minimum, 40-80 sweet spot. Beyond ~120 images, returns diminish for character work; beyond 200 the LoRA tends to overfit clothing or background."
> — Section 2, dataset sizing consensus. [Source: briefs/persona-consistency.md §2]

> "The pipeline is mature enough that creators with a 16 GB consumer GPU plus modest cloud credit can publish a multi-month persona feed without identity collapse — the core unsolved problem is no longer consistency itself, but the cost-per-asset of maintaining parallel LoRAs across the rapidly-evolving image and video bases."
> — Section 6, closing statement. [Source: briefs/persona-consistency.md]

## Dead Ends

- **Naive single-pass clothed-reference + nude-prompt with IP-Adapter** [RETRACTED]. Produces "alien anatomy" — fused limbs, fabric-merged genitalia. Mechanism: IP-Adapter's holistic CLIP-vision embedding forces clothing geometry onto the body. Lesson: identity adapters need either NSFW-pretrained reference data or compositional-first multi-pass workflows.
- **Single character LoRA trained for cross-base use** [RETRACTED]. A FLUX-trained persona LoRA does not transfer to Pony V7 or Z-Image — latent spaces are too different. Lesson: maintain parallel LoRAs per base; treat face-dataset as canonical, LoRAs as expendable.
- **Prodigy optimiser on FLUX/DiT** [RETRACTED]. Documented LR underestimation in [ostris/ai-toolkit issue #134](https://github.com/ostris/ai-toolkit/issues/134). Default to AdamW8bit @ 5e-5 for FLUX. Prodigy still works for SDXL-family.
- **DoRA as default for character LoRA** [TENTATIVE-RETRACTED]. Promising on paper (NVIDIA write-up); community reports overfit on anatomy when applied to character work. Use sparingly; LoKr (factor=4) is the 2026 default for character isolation.
- **Recursive prompting (output → next-scene reference)** [RETRACTED]. By the 5th-6th recursion, structural errors compound into total geometric drift ("attribute bleed"). Mitigation: maintain an immutable "Character Bible" anchor set; reference the original master seed for every generation, never a downstream output.
