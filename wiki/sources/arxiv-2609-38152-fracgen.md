---
title: "FracGen — physics-informed stretch-and-tear video generation (arXiv:2609.38152)"
type: source
tags: [paper, video-generation, physics, wan, watch]
keywords: [FracGen, FracSim, fracture, Material Point Method, physics-informed, Wan 2.1, height-concatenated latents, constitutive loss]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-09-30-daily.md
  - concepts/video-generation-physical-executability.md
  - entities/models/wan-2-2.md
maturity: draft
read_status: skimmed
created: 2026-09-30
updated: 2026-09-30
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-09-30-daily.md @concepts/video-generation-physical-executability.md @entities/models/wan-2-2.md

## Raw Concept

- **Title**: FracGen: Learning How Objects Stretch and Tear with Physics-Informed Video Generation
- **Type**: arXiv:2609.38152 (Johns Hopkins University; Trong-Tung Nguyen et al.)
- **Location**: cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2609.38152-fracgen-learning-how-objects-stretch-and-tear-wi.pdf (pending egress archive — SSH denied in session)
- **URL**: https://arxiv.org/abs/2609.38152
- **Retrieved**: 2026-09-30

## Narrative

**Goal.** Generate a controllable stretch-to-tear fracture video from one intact-object image plus physics conditions. It is presented as the first video model to predict the RGB fracture clip *and* dense physical fields together, so the fracture dynamics stay inspectable without a test-time simulator.

**Method, two parts.** **FracSim** adds a continuum damage model to a Material Point Method simulator (built on PhysGaussian / 3DGS) and renders pixel-aligned "FracPhys" maps — flow, strain, stress, damage — at no extra render cost. **FracGen** then takes a Wan 2.1-1.3B-Control backbone and height-concatenates the RGB latent with four physics-map latents into one extended latent, adapting the DiT with LoRA on q/k/v/o and the FFN. Physics conditions (applied loading as moving Gaussian blobs, material E and nu, fracture lambda_onset and lambda_crit) are channel-concatenated. Training runs in three stages with a latent constitutive loss that couples strain to stress through the Lame parameters, gated by the damage latent.

**Results.** FVD 266.17 versus ForcePrompting-FT 933.21, PhyCo-FT 832.12 and CogVideoX-5B-I2V-FT 1533.21; LPIPS 0.15; PSNR 21.19. Ablations confirm that joint prediction and the constitutive loss each help. Training used 4 GPUs on 81-frame clips over a 4,212-sample set from 10 objects.

**Phase-0 (2026-09-30).** **No code and no weights** — project page only (fracgen.github.io), no licence stated. Scope is tensile fracture only; brittle and impact fracture are out of scope, and producing training data needs a full 3DGS + MPM simulation pipeline. **Not a usable local tool.** Tracked for one transferable idea: the Wan LoRA plus height-concatenated physics-map latent is an architecture pattern that carries over to other physics-conditioned video work.

## Snippets

[Source: https://arxiv.org/abs/2609.38152 (retrieved 2026-09-30)]
