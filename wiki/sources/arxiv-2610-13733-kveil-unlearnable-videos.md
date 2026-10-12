---
title: "KVeil — unlearnable videos against I2V personalization (arXiv:2610.13733)"
type: source
tags: [paper, privacy, anti-personalization, adversarial, video, wan, watch]
keywords: [KVeil, unlearnable videos, anti-personalization, reference capacity collapse, V-capacity loss, K-attract, EOT, LoRA protection, face protection, LETHE, ECCV 2026]
related:
  - concepts/federated-daily-research-digest.md
  - sweeps/2026-10-12-daily.md
  - sources/arxiv-privacy-cross-image-anti-personalization-2504-12747.md
  - entities/models/wan-2-2.md
  - concepts/likeness-collision-verification.md
maturity: draft
read_status: skimmed
created: 2026-10-12
updated: 2026-10-12
phase0_verdict: WATCH
wire_status: deferred
---

## Relations

@concepts/federated-daily-research-digest.md @sweeps/2026-10-12-daily.md @sources/arxiv-privacy-cross-image-anti-personalization-2504-12747.md @entities/models/wan-2-2.md @concepts/likeness-collision-verification.md

## Raw Concept

- **Title**: KVeil: First-Place Solution to ECCV 2026 LifeGenIP Challenge on Unlearnable Videos
- **Type**: arXiv:2610.13733 (Nanyang Technological University; Boheng Li, Yiming Li)
- **Location**: `research to be indexed/` — pending egress archive
- **URL**: https://arxiv.org/abs/2610.13733
- **Retrieved**: 2026-10-12

## Narrative

**It is defensive.** KVeil adds **imperceptible perturbations** to facial videos so that unauthorised video personalization — reference-based image-to-video, and LoRA fine-tuning — cannot reproduce the subject's identity. It took first place in both phases of the ECCV 2026 LifeGenIP challenge.

**This is the video analogue of a page the wiki already keeps.** `@sources/arxiv-privacy-cross-image-anti-personalization-2504-12747.md` (CAP) is the group-level adversarial defence against multi-image DreamBooth and LoRA personalization in the **image** domain. KVeil is the same family with an image-to-video and video-LoRA target. That parallel is the reason to ingest it here.

**Method.** Built on the authors' LETHE. Phase one attacks reference-based personalization with **Reference Capacity Collapse** — a V-capacity loss that collapses the spatial diversity of reference Value tokens in Wan2.2's self-attention, plus a K-attract loss keeping future Queries retrieving from that degraded region, plus VAE-latent disruption and motion-guided EOT over unknown frames, prompts and transforms. Phase two splits face from background: a structure-aligned perturbation toward a synthetic target identity on the face, and white-box disruption on the background.

**Results.** Phase one leaderboard **77.72, first place**. Phase two: a protective reference raises Wan2.2 face score from 16.79 to **82.66**, with 34.40 against an unseen HunyuanVideo-1.5 and 51.09 under 1,500-step Wan LoRA fine-tuning.

**Phase-0 (2026-10-12).** Code ships at `github.com/AntigoneRandy/KVeil` under **Apache-2.0** — a clean licence. It is white-box against **Wan2.2-TI2V-5B** via diffusers, and pulls in InsightFace (buffalo_l / antelopev2), ai-toolkit, facenet-pytorch and SigLIP2. Transfer is evaluated against Kling 3.0, HunyuanVideo-1.5 and LTX-2. Compute is not stated; it needs white-box gradients through a 5B I2V model, run per video (90 iterations phase one, 200 phase two), on Linux/CUDA.

**Routing — and why it stays here.** It is tempting to send a "deepfake" paper to cybersec, but **KVeil does not evade moderation or IP detection**. The perturbation targets the *generator*, not a classifier. It belongs beside the existing anti-personalization entry in this wiki, not in the detection lane. **Verdict: WATCH-thin.** It protects videos that are being released; it changes nothing about the local generation stack an operator runs.

**One cross-thread observation worth keeping.** Its "V-capacity collapse" attacks the same DiT value stream that `@sources/arxiv-2610-13941-sfg-semantic-feedback-guidance.md` reads from the generation side — the attack and the interpretability work are looking at the same internal signal. Also relevant to `@concepts/likeness-collision-verification.md`, since both concern how much identity a released artifact leaks. No Basgiath hook.

## Snippets

[Source: https://arxiv.org/abs/2610.13733 (retrieved 2026-10-12) — Wan2.2 face score 16.79 → 82.66 under protection; Apache-2.0 code.]
