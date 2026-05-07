---
title: "HeadsUp — Large-Scale 3D Gaussian Head Reconstruction (Apple, May 2026)"
type: source
tags: [3d-gaussian-splatting, head-reconstruction, multi-view, feed-forward, identity-generation, blendshape-animation, apple, research-future]
keywords: [HeadsUp, 3DGS, 3D Gaussian Splatting, multi-view capture, UV-parameterized Gaussians, neutral head template, feed-forward reconstruction, Avat3r, Pippo, Ava-256, Internal10K, text-driven identity generation, blendshape-driven latent animation, novel-identity generation, expression blendshapes, latent diffusion, DiT, Apple, Frankfurt plane, encoder-decoder transformer, spherical harmonics]
related:
  - concepts/multi-angle-dataset-prep.md
  - concepts/persona-consistency-methods.md
  - concepts/video-identity-inheritance.md
maturity: draft
created: 2026-05-07
updated: 2026-05-07
read_status: skimmed
---

## Relations

@concepts/multi-angle-dataset-prep.md
@concepts/persona-consistency-methods.md
@concepts/video-identity-inheritance.md

## Raw Concept

- **Title:** Large-Scale High-Quality 3D Gaussian Head Reconstruction from Multi-View Captures
- **Authors:** Evangelos Ntavelis, Sean Wu, Mohamad Shahbazi, Fabio Maninchedda, Dmitry Kostiaev, Artem Sevastopolsky, Vittorio Megaro, Trevor Phillips, Alejandro Blumentals, Shridhar Ravikumar, Mehak Gupta, Reinhard Knothe, Jeronimo Bayer, Matthias Vestner, Simon Schaefer, Thomas Etterlin, Christian Zimmermann, Mathias Deschler, Peter Kaufmann, Stefan Brugger, Sebastian Martin, Brian Amberg, Tom Runia (Apple)
- **Type:** Academic preprint — arXiv:2605.04035v1 [cs.CV] 5 May 2026, 34 pages
- **Location:** `raw-sources/Large-Scale High-Quality 3D Gaussian Head Reconstruction from Multi-View Captures.pdf`
- **Retrieved:** 2026-05-07 (W2 inbox triage)
- **Read status:** skimmed (sections 1–4.6 + conclusion; supplementary not read)

Source ingested as a research-layer reference during W2 inbox triage 2026-05-07. Build-track relevance is bounded by the multi-camera capture-rig requirement and the closed Apple internal dataset; the page exists to anchor the *novel-identity-generation* and *blendshape-animation* downstream applications as a research-future bridge to identity synthesis from latent codes — territory adjacent to multi-angle dataset prep + video identity inheritance but not yet build-track-deployable.

## Narrative

### What HeadsUp is

A feed-forward 3D Gaussian Splatting head-reconstruction model. Given a small number of calibrated multi-view RGB images (the paper sweeps N=1, 2, 4, 6, 8, 16) the model outputs a UV-parameterized set of 3D Gaussians anchored to a neutral head template, in a single forward pass — no per-subject test-time optimization, unlike per-instance NeRF / 3DGS fits.

The architecture decouples the number of output Gaussians from the number and resolution of input views, which is what lets the model scale gracefully with dense / high-resolution input rigs. Foreground (head) and background (capture rig) are modeled separately; the foreground Gaussians sit on a canonical mesh aligned to the Frankfurt plane.

### Why an Apple paper appears in this wiki

Apple-authored, 20+ contributors, trained on a closed 10,000-subject internal dataset (16 calibrated cameras, 1000×750). Public reproducibility is bounded by the Internal10K being closed, but Ava-256 (256 subjects, 80 cameras, 4 TB) numbers are also reported.

Build-track hooks (the only reason this is in the wiki):

- **Text-driven novel identity generation.** A latent diffusion (DiT) trained on precomputed HeadsUp latents Z can generate identities that don't exist in the training set (verified via face-similarity nearest-neighbor analysis). This is a research-future bridge to "synthesize a fresh persona from text + decode to 3D" — adjacent to the multi-angle-dataset-prep workflow but at the latent-3D level rather than image level. → @concepts/multi-angle-dataset-prep.md
- **Blendshape-driven latent animation.** A transformer F_θ predicts target-expression latents Ẑ_b = F_θ(Z_n, b) given a neutral latent and a blendshape coefficient vector. This is the cleanest research demonstration to date of identity-preserving expression control entirely in latent space — adjacent to the I2V / video-identity-inheritance workflow. → @concepts/video-identity-inheritance.md
- **Feed-forward reconstruction without per-subject optimization.** A scaling demonstration that 3D head models can be amortized across thousands of identities. The persona-consistency taxonomy currently centers on 2D adapters (PuLID, IP-Adapter, InstantID) + multi-angle dataset prep; a future axis "3D-latent-anchored consistency" would inherit from this work. → @concepts/persona-consistency-methods.md

### Method snapshot

- Encoder-decoder transformer; cross-attention image encoder → compact 2D latent → ResNet decoder predicts UV maps for foreground + background Gaussians.
- Foreground Gaussians anchored to neutral head template in canonical coords (Frankfurt plane).
- Background Gaussians anchored to a sphere fitted to the capture rig.
- Each Gaussian: position μ, scale s, quaternion q, opacity α, spherical harmonic color (degree L=1).
- Two-stage training: (1) 2× downscaled, 900K steps, batch 64, 10 input views; (2) full-resolution finetune, 200K steps, batch 32, 16 input views.
- Losses: L1 + LPIPS + perceptual discriminator (activated after 240K steps) + position-tracking regularization + silhouette mask + total variation.
- Region-specific losses (eyes, mouth) added in stage 2.
- Hardware: 16× H100 GPUs, ~10 days, bfloat16, Adam lr=2×10⁻⁴.

### Comparisons

- Significantly beats Avat3r (DUSt3R + Sapiens features pipeline) on PSNR / SSIM / LPIPS / AKD / CSIM with **>1 OOM fewer Gaussians**.
- Avat3r capped at N=6 input views due to memory; HeadsUp scales to N=16 cleanly.
- Distinguishing claim vs. prior work: (1) fully feed-forward, (2) supports monocular through dense multi-view, (3) no strict parametric face model dependency (handles accessories + expressions naturally), (4) state-of-the-art photorealism + identity recognizability.

### Build-track applicability — what it does NOT solve today

- Capture rig requirement: all training data needed multi-camera calibrated rigs (16 or 80 cameras). Consumer persona operators don't have this.
- Apple Internal10K dataset is closed — will not be released.
- 16× H100 × 10 days training cost is consumer-prohibitive; reproduction would require a comparable rig.
- The single-view inference path (N=1) shows blurry results, identity drift, and fails on text on clothing — the method needs density to shine.
- Per-subject novel capture still needs the multi-camera setup; the feed-forward framing is amortization across many subjects, not zero-shot from a single phone photo.

→ Build-track operators in 2026 still route through 2D-adapter stacks (PuLID + LoRA) for persona consistency. HeadsUp is filed for the 2027–2028 horizon when feed-forward 3D-head models from arbitrary captures become feasible.

## Snippets

> "We propose HeadsUp, a scalable feed-forward method for reconstructing high-quality 3D Gaussian heads from large-scale multi-camera setups. Our method employs an efficient encoder-decoder architecture that compresses input views into a compact latent representation. This latent representation is then decoded into a set of UV-parameterized 3D Gaussians anchored to a neutral head template. This UV representation decouples the number of 3D Gaussians from the number and resolution of input images, enabling training with many high-resolution input views. We train and evaluate our model on an internal dataset with more than 10 000 subjects, which is an order of magnitude larger than existing multi-view human head datasets."
[Source: arXiv:2605.04035 p.1 (retrieved 2026-05-07)]

> "Our compact, yet information-rich latent space enables a range of downstream applications, such as novel identity generation. To show this, we train a text-conditioned DiT on a large dataset of latents Z precomputed from our base model. At inference time, we sample latents and decode them into Gaussians using our frozen decoder. ... Based on face-similarity analysis, we have confirmed these identities do not appear in the training set."
[Source: arXiv:2605.04035 p.14 (retrieved 2026-05-07)]

> "We showcase facial animation controlled by expression blendshapes, operating entirely within our latent space. Given triplets (Z_n, Z_b, b) of a neutral latent Z_n, expression latent Z_b of the same subject and the corresponding blendshape coefficients b, we train a transformer F_θ to predict the target expression latent Ẑ_b = F_θ(Z_n, b) with supervised losses on the latents."
[Source: arXiv:2605.04035 p.14 (retrieved 2026-05-07)]

> "Our internal dataset contains over 10 000 unique participants recorded in a head-focused rig with 16 calibrated RGB cameras. The images are of the resolution 1000×750. ... The internal dataset will not be publicly released."
[Source: arXiv:2605.04035 p.9 (retrieved 2026-05-07)]

> "Training with the Adam optimizer with a learning rate of 2×10⁻⁴ converges in approximately 10 days on 16 H100 GPUs with bfloat16 precision."
[Source: arXiv:2605.04035 p.9 (retrieved 2026-05-07)]

## Dead Ends

- **Single-view inference** (N=1) yields blurry reconstructions + identity drift + texture failures (Fig. 6). The method is not a viable single-photo → 3D-persona pipeline; it requires multi-view density to deliver its quality claims.
- **Reproducing the headline numbers** is gated by the closed Apple Internal10K dataset and 16× H100 × 10 days of compute. Public-dataset (Ava-256) numbers are useful for relative comparison but not for matching the paper's identity-generalization claims.
- **No public code release noted** in the body of the paper at this skim depth — supplementary not yet read; flag if reproduction or open weights surface in a future update.

[NEEDS VERIFICATION 2026-05-07] — code/weight release status, alternative open-source feed-forward 3DGS-head baselines (e.g. Pippo, Avat3r reimplementation availability) for build-track-relevant downstream experimentation.
