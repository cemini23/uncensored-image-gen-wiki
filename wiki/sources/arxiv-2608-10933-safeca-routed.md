---
title: "SafeCA — cross-attention localization + regulation for T2V jailbreak defense (arXiv:2608.10933) — routed cybersec"
type: source
tags: [paper, routed, security, t2v, jailbreak-defense, cross-wiki, video-safety]
keywords: [SafeCA, cross-attention, T2V jailbreak, attention masking, energy normalization, semantic-space adapter, token suppression]
related:
  - concepts/representation-space-video-safety-steering.md
  - concepts/cross-model-safety-steering.md
  - concepts/pluralistic-safety-alignment.md
  - entities/models/wan-2-2.md
  - sweeps/2026-08-13-daily.md
  - concepts/federated-daily-research-digest.md
maturity: draft
read_status: read
created: 2026-08-13
updated: 2026-08-13
---

## Relations

Primary: cybersecurity wiki brief `briefs/2026-08-13_safeca-t2v-jailbreak-defense-from-image-gen.md`. Dedup stub for image-gen digest.
@concepts/representation-space-video-safety-steering.md @concepts/cross-model-safety-steering.md @concepts/pluralistic-safety-alignment.md @entities/models/wan-2-2.md @sweeps/2026-08-13-daily.md @concepts/federated-daily-research-digest.md

## Raw Concept

- **Title**: SafeCA: Safe Cross-Attention Localization and Regulation for Text-to-Video Jailbreak Defense
- **Authors**: Siyuan Liang, Yupeng Qiu, Junfeng Fang, Rong-Cheng Tu, Jiaxing Huang, Dacheng Tao (NTU / NUS)
- **Type**: arXiv:2608.10933 (10 pp)
- **Location**: `cemini-egress-fi:/opt/cemini-bulk/research/image-gen/arxiv-2608.10933-safeca-safe-cross-attention-localization-and-reg.pdf`
- **URL**: https://arxiv.org/abs/2608.10933
- **Code**: none released in PDF
- **Retrieved**: 2026-08-13

## Narrative

**Routed stub (cybersec) + T2V safety touchpoint.** Feature-level T2V jailbreak defense. Key finding: clean vs jailbreak samples are **linearly separable in cross-attention space**, with a cumulative separation effect that grows through the diffusion process. SafeCA (1) localizes defensive regions/values via attention stability analysis from clean prompts in a single inference, (2) mitigates anomalous activations with attention masking + energy normalization and a lightweight semantic-space adapter, and (3) back-propagates feature anomaly signals to suppress malicious input cue tokens. ~20% jailbreak-SR reduction on mainstream T2V models at +0.1 s overhead with good text-video semantic consistency.

**Image-gen relevance:** joins `@concepts/representation-space-video-safety-steering.md` (REINS/SPCA family) as a **cross-attention-space** defense for open T2V (Wan / CogVideoX / HunyuanVideo-class). Unlike input filtering/reconstruction, it's architecture-level and deployable in commercial models. Same steering-family relevance for uncensored-video ops: safety structure is detectable in attention, not just latents.

**Phase-0: SKIP gen-install / ROUTE cybersec REFERENCE.** No runnable code in PDF; no SPDX to check. Not atto / poker / guruwatcher / prod.

## Snippets

> "SafeCA provides an architecture-level, deployable protection paradigm for T2V generation models... reduces jailbreak success rate by about 20% on mainstream T2V models." [Source: arXiv:2608.10933 Abstract]
