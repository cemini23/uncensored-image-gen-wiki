---
title: InstantID
type: entity
tags: [adapter, identity-injection, instantid, sdxl, instantx]
keywords: [InstantID, InstantX, ZeroShot identity, ID-Net, ControlNet face, arxiv 2401.07519, face landmark, image prompt]
related:
  - sources/synthetic-character-consistency-survey.md
  - concepts/persona-consistency-methods.md
  - entities/adapters/ip-adapter.md
  - entities/adapters/pulid.md
  - entities/adapters/consistentid.md
  - entities/adapters/characonsist.md
  - concepts/reference-plus-lora-stacking.md
  - entities/models/pony-v6.md
maturity: draft
created: 2026-05-06
updated: 2026-05-06
---

## Relations

@sources/synthetic-character-consistency-survey.md
@concepts/persona-consistency-methods.md
@entities/adapters/ip-adapter.md
@entities/adapters/pulid.md
@entities/adapters/consistentid.md
@entities/adapters/characonsist.md
@concepts/reference-plus-lora-stacking.md
@entities/models/pony-v6.md

## Raw Concept

Entity stub created during back-fill of @sources/synthetic-character-consistency-survey.md. InstantID is the colour-stable / ControlNet-shaped alternative to PuLID for SDXL identity injection.

## Narrative

### What it is

**InstantID** — zero-shot identity-preserving generation method from **InstantX**. Released early 2024 ([arXiv 2401.07519](https://arxiv.org/abs/2401.07519), [github.com/InstantID/InstantID](https://github.com/InstantID/InstantID)). Unlike IP-Adapter (cross-attention image-prompt) and PuLID (cross-attention identity-token), InstantID combines **two parallel signals**:

1. An **ID-Net** (face-feature branch) that emits an identity embedding via InsightFace.
2. An **IdentityNet** (a ControlNet variant) conditioned on **face landmarks** for spatial control.

This dual mechanism — embedding + landmark — is why InstantID has different colour-and-pose behaviour than PuLID.

### Why creators use it

[CONFIRMED]

- **More colour-stable than PuLID.** InstantID's identity-embedding stream is decoupled from the source image's lighting, so generations skew less toward the reference's warm/cool tone. The trade-off is lower face-fidelity than PuLID.
- **Pose control via face-landmark ControlNet** — works well alongside other ControlNets (Canny, OpenPose, depth) for tightly-framed portrait compositions.
- **Better than PuLID on stylised bases** (anime, illustrative SDXL fine-tunes) because the landmark control lets the base model lean into its native style without the holistic-image embedding dragging it back to photorealism.

### Limits

[CONFIRMED]

- **Lower face-fidelity than PuLID** on photorealistic FLUX/SDXL workflows. The 2026 community framing is "InstantID for stable, PuLID for fidelity".
- **SDXL only** as of 2026-05 release status. No FLUX-native port (FLUX path is PuLID-Flux II / @entities/adapters/pulid.md).
- **NSFW alignment** — same SFW-pretraining issue as IP-Adapter family. Expect similar failure on clothed-reference + nude-prompt; mitigation pattern is identical (NSFW LoRA + low-strength adapter, or two-pass inpaint).
- **InsightFace dependency** — same Apple-Silicon caveats as PuLID.

### Role in 2026 production stack

[CONFIRMED]

- **InstantID + Canny ControlNet** is a long-standing community recipe for tightly-controlled portraits ([r/StableDiffusion: Is InstantID + Canny still the best method in 2025](https://www.reddit.com/r/StableDiffusion/comments/1p22zbb/is_instantid_canny_still_the_best_method_in_2025/)). Still relevant in 2026 for pose-locked SDXL persona work.
- **For mixed style / persona work** — InstantID is the better choice when the persona's base is an anime or illustrative SDXL fine-tune (Pony V6 / Illustrious / NoobAI). PuLID drags toward photorealism; InstantID respects the base style.
- **Multi-LoRA stacking** — InstantID composes cleanly with multiple character LoRAs because its landmark control is structural, not stylistic.

### Workspace TODO

[NEEDS VERIFICATION 2026-05-06]

- Whether the InstantX team has shipped a FLUX-native port. If yes, this changes the FLUX adapter landscape (currently a near-monoculture of PuLID II).
- ~~Apple Silicon viability — same InsightFace caveat as PuLID; needs testing on M-series~~ — **resolved [CONFIRMED 2026-05-07]**: InstantID (cubiq port) runs on M-series via the same MPS path as PuLID, but **fp32 only** — fp16 hits the PyTorch MPS LayerNormKernelImpl-fp16 issue documented in @entities/adapters/pulid.md. Set `PYTORCH_ENABLE_MPS_FALLBACK=1` and use the fp32 base; expect 3-5× NVIDIA latency. InsightFace dependency installs cleanly via `pip install insightface onnxruntime` (same path as the PuLID resolution).
- VRAM cost on SDXL with FP8 — community claim ~9-10 GB peak; verify against current ComfyUI builds.
- Whether @entities/adapters/consistentid.md (TPAMI 2026) has displaced InstantID for landmark-style identity work in the 2026 community.

## Snippets

> "InstantID is more colour-stable than PuLID; FaceID is the most colour-stable but loses identity fastest."
> — @sources/synthetic-character-consistency-survey.md §6, lighting and skin-tone shifts

> "InstantID + Canny ControlNet is still the modal recipe for tightly-framed photorealistic portraits where the pose has to lock to a reference."
> — paraphrased from [r/StableDiffusion: InstantID + Canny in 2025](https://www.reddit.com/r/StableDiffusion/comments/1p22zbb/is_instantid_canny_still_the_best_method_in_2025/)
